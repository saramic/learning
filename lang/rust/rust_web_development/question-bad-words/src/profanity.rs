use handle_errors;
use serde::{Deserialize, Serialize};
use std::env;
use tracing::{event, Level};

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

pub async fn check_profanity(
    content: String,
) -> Result<String, handle_errors::Error> {
    // let api_ninjas_api_key = env::var("API_NINJAS_API_KEY")
    //     .unwrap_or_else(|_| "missing ApiLayer API_NINJAS_API_KEY".to_string());
    // let client = reqwest::Client::new();
    // let res = client
    //     .get(
    //         &(format!(
    //             "https://api.api-ninjas.com/v1/profanityfilter?text={}",
    //             content
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
        .body(content.clone())
        .send()
        .await
        .map_err(|e| handle_errors::Error::ExternalAPIError(e))?;

    if !res.status().is_success() {
        if res.status().is_client_error() {
            let err = transform_error(res).await;
            return Err(handle_errors::Error::ClientError(err));
        } else {
            let err = transform_error(res).await;
            return Err(handle_errors::Error::ServerError(err));
        }
    }

    match res.json::<BadWordsResponse>().await {
        Ok(res) => Ok(res.censored_content),
        Err(e) => Err(handle_errors::Error::ExternalAPIError(e)),
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
