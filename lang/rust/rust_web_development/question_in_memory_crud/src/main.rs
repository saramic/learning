use warp::Filter;
use serde::Serialize;
use std::io::{Error, ErrorKind};
use std::str::FromStr;

#[derive(Debug, Serialize)]
struct Question {
    id: QuestionId,
    title: String,
    content: String,
    tags: Option<Vec<String>>
}

#[derive(Debug, Serialize)]
struct QuestionId(String);

impl FromStr for QuestionId {
    type Err = std::io::Error;

    fn from_str(id: &str) -> Result<Self, Self::Err> {
        match id.is_empty() {
            false => Ok(QuestionId(id.to_string())),
            true => Err(
                Error::new(ErrorKind::InvalidInput, "No id provided")
            ),
        }
    }
}

impl Question {
    fn new (
        id: QuestionId,
        title: String,
        content: String,
        tags: Option<Vec<String>>
    ) -> Self {
        Question {
            id,
            title,
            content,
            tags,
        }
    }
}

async fn get_questions() -> Result<impl warp::Reply, warp::Rejection> {
    let question = Question::new(
        QuestionId::from_str("1").expect("No id provided"),
        "Frist Question".to_string(),
        "Content of question".to_string(),
        Some(vec!("faq".to_string())),
    );

    Ok(warp::reply::json(
            &question
    ))
}

#[tokio::main]
async fn main() {
    let get_items = warp::get()
        .and(warp::path("questions"))
        .and(warp::path::end())
        .and_then(get_questions);

    let routes = get_items;

    warp::serve(routes)
        .run(([127, 0, 0, 1], 1337))
        .await;
}
