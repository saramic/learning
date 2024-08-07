use std::env;

use serde::{Deserialize, Serialize};
use serde_json::json;

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

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let api_layer_api_key = env::var("API_LAYER_API_KEY")
        .unwrap_or_else(|_| "missing ApiLayer API_LAYER_API_KEY".to_string());

    let mut body_text: Vec<String> = env::args().collect();
    body_text.remove(0);

    let client = reqwest::Client::new();
    let res = client
        .post("https://api.apilayer.com/bad_words?censor_character=*")
        .header("apikey", api_layer_api_key)
        .body(body_text.join(" "))
        .send()
        .await?;

    let status_code = res.status();
    let message = res.json::<BadWordsResponse>().await?;

    let response = json!({
        "StatusCode": status_code.as_str(),
        "Message": message
    });

    println!("{:#?}", response);

    Ok(())
}
