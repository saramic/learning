use std::env;

use std::collections::HashMap;
use tracing::{event, info, instrument, Level};
use warp::http::StatusCode;

use crate::store::Store;
use crate::types::pagination::{extract_pagination, Pagination};
use crate::types::question::{NewQuestion, Question};

#[instrument]
pub async fn get_questions(
    params: HashMap<String, String>,
    store: Store,
) -> Result<impl warp::Reply, warp::Rejection> {
    info!("Sart querying questions");
    event!(target: "questoin_in_db_crud", Level::INFO, "querying questions");
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
    let api_ninjas_api_key = env::var("API_NINJAS_API_KEY")
        .unwrap_or_else(|_| "missing ApiLayer API_NINJAS_API_KEY".to_string());
    let client = reqwest::Client::new();
    let res = client
        .get(
            &(format!(
                "https://api.api-ninjas.com/v1/profanityfilter?text={}",
                new_question.content
            )),
        )
        .header("X-Api-Key", api_ninjas_api_key)
        .send()
        .await
        .map_err(|e| handle_errors::Error::ExternalAPIError(e))?;

    match res.error_for_status() {
        Ok(res) => {
            let res = res
                .text()
                .await
                .map_err(|e| handle_errors::Error::ExternalAPIError(e))?;

            println!("{}", res);

            match store.add_question(new_question).await {
                Ok(_) => Ok(warp::reply::with_status(
                    "Question added",
                    StatusCode::OK,
                )),
                Err(e) => Err(warp::reject::custom(e)),
            }
        }
        Err(err) => Err(warp::reject::custom(
            handle_errors::Error::ExternalAPIError(err),
        )),
    }
}

pub async fn update_question(
    id: i32,
    store: Store,
    question: Question,
) -> Result<impl warp::Reply, warp::Rejection> {
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
