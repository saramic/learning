use std::collections::HashMap;
use tracing::{event, info, instrument, Level};
use warp::http::StatusCode;

use crate::profanity::check_profanity;
use crate::store::Store;
use crate::types::account::Session;
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
    session: Session,
    store: Store,
    new_question: NewQuestion,
) -> Result<impl warp::Reply, warp::Rejection> {
    let account_id = session.account_id;
    // let title = check_profanity(new_question.title);
    // let content = check_profanity(new_question.content);
    let title = new_question.title;
    let content = new_question.content;

    // let (title, content) = tokio::join!(title, content);

    // if title.is_err() {
    //     return Err(warp::reject::custom(title.unwrap_err()));
    // };

    // if content.is_err() {
    //     return Err(warp::reject::custom(content.unwrap_err()));
    // };

    let question = NewQuestion {
        // title: title.unwrap(),
        // content: content.unwrap(),
        title: title,
        content: content,
        tags: new_question.tags,
    };

    match store.add_question(question, account_id).await {
        Ok(question) => Ok(warp::reply::json(&question)),
        Err(e) => Err(warp::reject::custom(e)),
    }
}

pub async fn update_question(
    id: i32,
    session: Session,
    store: Store,
    question: Question,
) -> Result<impl warp::Reply, warp::Rejection> {
    let account_id = session.account_id;
    if store.is_question_owner(id, &account_id).await? {
        // let title = tokio::spawn(check_profanity(question.title));
        // let content = tokio::spawn(check_profanity(question.content));
        let title = question.title;
        let content = question.content;

        // let (title, content) = (title.await.unwrap(), content.await.unwrap());

        // if title.is_err() {
        //     return Err(warp::reject::custom(title.unwrap_err()));
        // }

        // if content.is_err() {
        //     return Err(warp::reject::custom(content.unwrap_err()));
        // }

        let question = Question {
            id: question.id,
            // title: title.unwrap(),
            // content: content.unwrap(),
            title: title,
            content: content,
            tags: question.tags,
        };

        match store.update_question(question, id, account_id).await {
            Ok(res) => Ok(warp::reply::json(&res)),
            Err(e) => Err(warp::reject::custom(e)),
        }
    } else {
        Err(warp::reject::custom(handle_errors::Error::Unauthorized))
    }
}

pub async fn delete_question(
    id: i32,
    session: Session,
    store: Store,
) -> Result<impl warp::Reply, warp::Rejection> {
    let account_id = session.account_id;
    if store.is_question_owner(id, &account_id).await? {
        match store.delete_question(id, account_id).await {
            Ok(_) => Ok(warp::reply::with_status(
                format!("Question {} deleted", id),
                StatusCode::OK,
            )),
            Err(e) => Err(warp::reject::custom(e)),
        }
    } else {
        Err(warp::reject::custom(handle_errors::Error::Unauthorized))
    }
}
