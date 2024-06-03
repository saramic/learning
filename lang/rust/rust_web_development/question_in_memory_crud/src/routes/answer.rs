use handle_errors::Error;
use std::collections::HashMap;
use warp::http::StatusCode;

use crate::types::answer::{Answer, AnswerId};
use crate::types::question::QuestionId;
use crate::Store;

pub async fn add_answer(
    store: Store,
    params: HashMap<String, String>,
) -> Result<impl warp::Reply, warp::Rejection> {
    let answer = Answer {
        // NOTE: get any passed in ID over suggested hardcoded number
        id: AnswerId(params.get("id").unwrap().to_string()),
        content: params.get("content").unwrap().to_string(),
        // NOTE: unsafe as not dealing with mssing QuestionId's
        question_id: QuestionId(params.get("questionId").unwrap().to_string()),
    };

    store
        .answers
        .write()
        .await
        .insert(answer.id.clone(), answer);

    Ok(warp::reply::with_status("Answer added", StatusCode::OK))
}

pub async fn get_answers(
    question_id: String,
    store: Store,
) -> Result<impl warp::Reply, warp::Rejection> {
    let res: Vec<Answer> = store
        .answers
        .read()
        .await
        .values()
        .filter(|answer| answer.question_id == QuestionId(question_id.clone()))
        .cloned()
        .collect();
    match res.is_empty() {
        true => Err(warp::reject::custom(Error::AnswerNotFound)),
        false => Ok(warp::reply::json(&res)),
    }
}
