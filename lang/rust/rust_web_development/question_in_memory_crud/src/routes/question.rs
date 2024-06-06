use handle_errors::Error;
use std::collections::HashMap;
use warp::http::StatusCode;

use crate::types::pagination::extract_pagination;
use crate::types::question::{Question, QuestionId};
use crate::Store;

pub async fn get_questions(
    params: HashMap<String, String>,
    store: Store,
    id: String,
) -> Result<impl warp::Reply, warp::Rejection> {
    log::info!("{} Sart querying questions", id);
    if !params.is_empty() {
        let pagination = extract_pagination(params)?;
        log::info!("{} Paginatino set {:?}", id, &pagination);
        let res: Vec<Question> =
            store.questions.read().await.values().cloned().collect();
        let res = &res[pagination.start..pagination.end];
        Ok(warp::reply::json(&res))
    } else {
        log::info!("{} No pagination used", id);
        let res: Vec<Question> =
            store.questions.read().await.values().cloned().collect();
        Ok(warp::reply::json(&res))
    }
}

pub async fn get_question(
    id: String,
    store: Store,
) -> Result<impl warp::Reply, warp::Rejection> {
    match store.questions.read().await.get(&QuestionId(id)) {
        Some(q) => Ok(warp::reply::json(q)),
        None => Err(warp::reject::custom(Error::QuestionNotFound)),
    }
}

pub async fn add_question(
    store: Store,
    question: Question,
) -> Result<impl warp::Reply, warp::Rejection> {
    store
        .questions
        .write()
        .await
        .insert(question.id.clone(), question);

    Ok(warp::reply::with_status("Question added", StatusCode::OK))
}

pub async fn update_question(
    id: String,
    store: Store,
    question: Question,
) -> Result<impl warp::Reply, warp::Rejection> {
    match store.questions.write().await.get_mut(&QuestionId(id)) {
        Some(q) => *q = question,
        None => return Err(warp::reject::custom(Error::QuestionNotFound)),
    }

    Ok(warp::reply::with_status("Question updated", StatusCode::OK))
}

pub async fn delete_question(
    id: String,
    store: Store,
) -> Result<impl warp::Reply, warp::Rejection> {
    match store.questions.write().await.shift_remove(&QuestionId(id)) {
        Some(_) => {
            Ok(warp::reply::with_status("Question deleted", StatusCode::OK))
        }
        None => Err(warp::reject::custom(Error::QuestionNotFound)),
    }
}
