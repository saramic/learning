use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use warp::{
    filters::cors::CorsForbidden, http::Method, http::StatusCode, reject::Reject, Filter,
    Rejection, Reply,
};

#[derive(Clone, Deserialize)]
struct Store {
    questions: HashMap<QuestionId, Question>,
}

impl Store {
    fn new() -> Self {
        Store {
            questions: HashMap::new(),
        }
    }

    fn init(self) -> Self {
        let file = include_str!("../questions.json");
        serde_json::from_str(file).expect("can't read questions.json")
    }
}

#[derive(Clone, Deserialize, Debug, Serialize)]
struct Question {
    id: QuestionId,
    title: String,
    content: String,
    tags: Option<Vec<String>>,
}

#[derive(Deserialize, Debug, Serialize, Clone, PartialEq, Eq, Hash)]
struct QuestionId(String);

async fn get_questions(
    params: HashMap<String, String>,
    store: Store,
) -> Result<impl warp::Reply, warp::Rejection> {
    let mut start = 0;
    // can print out params
    println!("{:?}", params);
    // OR get them or NONE
    match params.get("start") {
        Some(start) => println!("{}", start),
        NONE => println!("No Start value"),
    }
    // OR only care about when params are added
    if let Some(n) = params.get("start") {
        println!("{}", n);
        println!("{:?}", n.parse::<usize>()); // parse returns Result so need Debug "{:?}"
        start = n.parse::<usize>().expect("Could not parse start");
    }

    println!("{}", start);

    let res: Vec<Question> = store.questions.values().cloned().collect();

    Ok(warp::reply::json(&res))
}

async fn return_error(r: Rejection) -> Result<impl Reply, Rejection> {
    // println!("{:?}", r);
    if let Some(error) = r.find::<CorsForbidden>() {
        Ok(warp::reply::with_status(
            error.to_string(),
            StatusCode::FORBIDDEN,
        ))
    } else {
        Ok(warp::reply::with_status(
            "Route not found".to_string(),
            StatusCode::NOT_FOUND,
        ))
    }
}

#[tokio::main]
async fn main() {
    let store = Store::new();
    let store_filter = warp::any().map(move || store.clone());

    let cors = warp::cors()
        .allow_any_origin()
        .allow_header("content-type")
        // .allow_header("not-in-the-request")
        .allow_methods(&[Method::PUT, Method::DELETE, Method::GET, Method::POST]);

    let get_items = warp::get()
        .and(warp::path("questions"))
        .and(warp::path::end())
        .and(warp::query())
        .and(store_filter)
        .and_then(get_questions)
        .recover(return_error);

    let routes = get_items.with(cors);

    warp::serve(routes).run(([127, 0, 0, 1], 1337)).await;
}
