#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let client = reqwest::Client::new();
    let res = client
        .post("http://httpbin.org/post")
        .body("the exact body is sent")
        .send()
        .await?
        .text()
        .await?;

    println!("{:?}", res);

    Ok(())
}
