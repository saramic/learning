use std::env;

use http_body_util::{BodyExt, Empty};
use hyper::Request;
use hyper_util::client::legacy::{connect::HttpConnector, Client};
use tokio::io::{self, AsyncWriteExt as _};

type Result<T> = std::result::Result<T, Box<dyn std::error::Error + Send + Sync>>;

#[tokio::main]
async fn main() -> Result<()> {
    let url = match env::args().nth(1) {
        Some(url) => url,
        None => {
            println!("Usage: client <url>");
            return Ok(());
        }
    };

    let client = Client::builder(hyper_util::rt::TokioExecutor::new()).build(HttpConnector::new());

    let req = Request::builder()
        .uri(url.parse::<hyper::Uri>().unwrap())
        .body(Empty::<bytes::Bytes>::new())?;

    let mut res = client.request(req).await?;

    println!("Response: {}", res.status());
    println!("Headers: {:?}\n", res.headers());

    while let Some(next) = res.frame().await {
        let frame = next?;
        if let Some(chunk) = frame.data_ref() {
            io::stdout().write_all(&chunk).await?;
        }
    }

    println!("\n\nDone!");

    Ok(())
}
