use aws_sdk_dynamodb::{model::AttributeValue, Client};
use lambda_http::{service_fn, Body, Error, Request, RequestExt, Response};
use std::env;

/// Main function
#[tokio::main]
async fn main() -> Result<(), Error> {
    // Initialize the AWS SDK for Rust
    let config = aws_config::load_from_env().await;
    let table_name = env::var("TABLE_NAME").expect("TABLE_NAME must be set");
    let dynamodb_client = Client::new(&config);

    // Register the Lambda handler
    //
    // We use a closure to pass the `dynamodb_client` and `table_name` as arguments
    // to the handler function.
    lambda_http::run(service_fn(|request: Request| {
        get_item(&dynamodb_client, &table_name, request)
    }))
    .await?;

    Ok(())
}

/// Get Item from DynamoDB
///
/// This function will run for every invoke of the Lambda function.
async fn get_item(
    client: &Client,
    table_name: &str,
    request: Request,
) -> Result<Response<Body>, Error> {
    // Extract path parameter from request
    let path_parameters = request.path_parameters();
    let id = match path_parameters.first("id") {
        Some(id) => id,
        None => return Ok(Response::builder().status(400).body("id is required".into())?),
    };

    // Get the item from DynamoDB table
    let res = client
        .get_item()
        .table_name(table_name)
        .key("id", AttributeValue::S(id.to_string()))
        .send()
        .await;

    // Return a response to the end-user
    match res {
        Ok(query_result) => {
            let payload = query_result.item().expect("Payload attribute should exist");
            Ok(Response::builder().status(200).body(payload["payload"].as_s().unwrap().to_string().into())?)
        },
        Err(_) => Ok(Response::builder().status(500).body("internal error".into())?),
    }
}
