use std::env;

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
        .await?
        .text()
        .await?;

    println!("{:?}", res);

    Ok(())
}
