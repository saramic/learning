use std::collections::HashMap;
use tracing::{event, info, instrument, Level};
use warp::http::StatusCode;

use crate::profanity::check_profanity;
use crate::store::Store;
use crate::types::pagination::{extract_pagination, Pagination};
use crate::types::question::{NewQuestion, Question};

#[instrument]
pub async fn get_questions(
    params: HashMap<String, String>,
    store: Store,
) -> Result<impl warp::Reply, warp::Rejection> {
    info!("Sart querying questions");
    event!(target: "question_bad_words", Level::INFO, "querying questions");
    let mut pagination = Pagination::default();

    if !params.is_empty() {
        event!(Level::INFO, pagination = true);
        pagination = extract_pagination(params)?;
    }

    match store
        .get_questions(pagination.limit, pagination.offset)
        .await
    {
        Ok(res) => Ok(warp::reply::json(&res)),
        Err(e) => Err(warp::reject::custom(e)),
    }
}

pub async fn get_question(
    id: i32,
    store: Store,
) -> Result<impl warp::Reply, warp::Rejection> {
    match store.get_question(id).await {
        Ok(res) => Ok(warp::reply::json(&res)),
        Err(e) => Err(warp::reject::custom(e)),
    }
}

pub async fn add_question(
    store: Store,
    new_question: NewQuestion,
) -> Result<impl warp::Reply, warp::Rejection> {
    let title = check_profanity(new_question.title);
    let content = check_profanity(new_question.content);

    let (title, content) = tokio::join!(title, content);

    if title.is_err() {
        return Err(warp::reject::custom(title.unwrap_err()));
    };

    if content.is_err() {
        return Err(warp::reject::custom(content.unwrap_err()));
    };

    let question = NewQuestion {
        title: title.unwrap(),
        content: content.unwrap(),
        tags: new_question.tags,
    };

    match store.add_question(question).await {
        Ok(question) => Ok(warp::reply::json(&question)),
        Err(e) => Err(warp::reject::custom(e)),
    }
}

pub async fn update_question(
    id: i32,
    store: Store,
    question: Question,
) -> Result<impl warp::Reply, warp::Rejection> {
    let title = tokio::spawn(check_profanity(question.title));
    let content = tokio::spawn(check_profanity(question.content));

    let (title, content) = (title.await.unwrap(), content.await.unwrap());

    if title.is_err() {
        return Err(warp::reject::custom(title.unwrap_err()));
    }

    if content.is_err() {
        return Err(warp::reject::custom(content.unwrap_err()));
    }

    let question = Question {
        id: question.id,
        title: title.unwrap(),
        content: content.unwrap(),
        tags: question.tags,
    };

    match store.update_question(question, id).await {
        Ok(res) => Ok(warp::reply::json(&res)),
        Err(e) => Err(warp::reject::custom(e)),
    }
}

pub async fn delete_question(
    id: i32,
    store: Store,
) -> Result<impl warp::Reply, warp::Rejection> {
    match store.delete_question(id).await {
        Ok(_) => Ok(warp::reply::with_status(
            format!("Question {} deleted", id),
            StatusCode::OK,
        )),
        Err(e) => Err(warp::reject::custom(e)),
    }
}
