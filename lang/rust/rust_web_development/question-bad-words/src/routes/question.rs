use std::env;

use std::collections::HashMap;
use tracing::{event, info, instrument, Level};
use warp::http::StatusCode;

use serde::{Deserialize, Serialize};

use crate::store::Store;
use crate::types::pagination::{extract_pagination, Pagination};
use crate::types::question::{NewQuestion, Question};
use handle_errors;

#[derive(Deserialize, Serialize, Debug, Clone)]
pub struct APIResponse {
    message: String,
}

#[derive(Deserialize, Serialize, Debug, Clone)]
struct BadWord {
    original: String,
    deviations: i64,
    info: i64,
    #[serde(rename = "replacedLen")]
    replaced_len: i64,
}

#[derive(Deserialize, Serialize, Debug, Clone)]
struct BadWordsResponse {
    content: String,
    bad_words_total: i64,
    bad_words_list: Vec<BadWord>,
    censored_content: String,
}

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
    // let api_ninjas_api_key = env::var("API_NINJAS_API_KEY")
    //     .unwrap_or_else(|_| "missing ApiLayer API_NINJAS_API_KEY".to_string());
    // let client = reqwest::Client::new();
    // let res = client
    //     .get(
    //         &(format!(
    //             "https://api.api-ninjas.com/v1/profanityfilter?text={}",
    //             new_question.content
    //         )),
    //     )
    //     .header("X-Api-Key", api_ninjas_api_key)
    //     .send()
    //     .await
    //     .map_err(|e| handle_errors::Error::ExternalAPIError(e))?;

    let api_layer_api_key = env::var("API_LAYER_API_KEY")
        .unwrap_or_else(|_| "missing ApiLayer API_LAYER_API_KEY".to_string());
    let client = reqwest::Client::new();
    let res = client
        .post("https://api.apilayer.com/bad_words?censor_character=*")
        .header("apikey", api_layer_api_key)
        .body(new_question.content.clone())
        .send()
        .await
        .map_err(|e| handle_errors::Error::ExternalAPIError(e))?;

    if !res.status().is_success() {
        if res.status().is_client_error() {
            let err = transform_error(res).await;
            return Err(warp::reject::custom(
                handle_errors::Error::ClientError(err),
            ));
        } else {
            let err = transform_error(res).await;
            return Err(warp::reject::custom(
                handle_errors::Error::ServerError(err),
            ));
        }
    }

    let res = res
        .json::<BadWordsResponse>()
        .await
        .map_err(|e| handle_errors::Error::ExternalAPIError(e))?;

    let content = res.censored_content;

    let question = NewQuestion {
        title: new_question.title,
        content,
        tags: new_question.tags,
    };

    match store.add_question(question).await {
        Ok(question) => Ok(warp::reply::json(&question)),
        Err(e) => Err(warp::reject::custom(e)),
    }
}

async fn transform_error(
    res: reqwest::Response,
) -> handle_errors::APILayerError {
    event!(Level::INFO, "{:#?}", res);
    handle_errors::APILayerError {
        status: res.status().as_u16(),
        message: res.json::<APIResponse>().await.unwrap().message,
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
