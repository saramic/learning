use indexmap::IndexMap;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::sync::Arc;
use tokio::sync::RwLock;
use warp::{http::Method, http::StatusCode, Filter};

mod error {
    use warp::{
        filters::{body::BodyDeserializeError, cors::CorsForbidden},
        http::StatusCode,
        reject::Reject,
        Rejection, Reply,
    };

    #[derive(Debug)]
    pub enum Error {
        ParseError(std::num::ParseIntError),
        MissingParameters,
        WrongIndex,
        QuestionNotFound,
        AnswerNotFound,
    }

    impl std::fmt::Display for Error {
        fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
            match *self {
                Error::ParseError(ref err) => {
                    write!(f, "Cannot parse parameter: {}", err)
                }
                Error::MissingParameters => write!(f, "Missing parameter"),
                Error::WrongIndex => write!(f, "Wrong index, start needs to be less than end"),
                Error::QuestionNotFound => write!(f, "Question not found"),
                Error::AnswerNotFound => write!(f, "Answer not found"),
            }
        }
    }

    impl Reject for Error {}

    pub async fn return_error(r: Rejection) -> Result<impl Reply, Rejection> {
        // println!("{:?}", r);
        if let Some(error) = r.find::<Error>() {
            Ok(warp::reply::with_status(
                error.to_string(),
                StatusCode::RANGE_NOT_SATISFIABLE,
            ))
        } else if let Some(error) = r.find::<CorsForbidden>() {
            Ok(warp::reply::with_status(
                error.to_string(),
                StatusCode::FORBIDDEN,
            ))
        } else if let Some(error) = r.find::<BodyDeserializeError>() {
            Ok(warp::reply::with_status(
                error.to_string(),
                StatusCode::UNPROCESSABLE_ENTITY,
            ))
        } else {
            Ok(warp::reply::with_status(
                "Route not found".to_string(),
                StatusCode::NOT_FOUND,
            ))
        }
    }
}

#[derive(Debug)]
struct Pagination {
    start: usize,
    end: usize,
}

fn extract_pagination(params: HashMap<String, String>) -> Result<Pagination, error::Error> {
    if params.contains_key("start") && params.contains_key("end") {
        let start = params
            .get("start")
            .unwrap()
            .parse::<usize>()
            .map_err(error::Error::ParseError)?;
        let end = params
            .get("end")
            .unwrap()
            .parse::<usize>()
            .map_err(error::Error::ParseError)?;

        match start.cmp(&end) {
            std::cmp::Ordering::Greater => return Err(error::Error::WrongIndex),
            _ => {
                return Ok(Pagination {
                    start: start,
                    end: end,
                })
            }
        }
    }

    Err(error::Error::MissingParameters)
}

#[derive(Clone)]
struct Store {
    questions: Arc<RwLock<IndexMap<QuestionId, Question>>>,
    answers: Arc<RwLock<HashMap<AnswerId, Answer>>>,
}

impl Store {
    fn new() -> Self {
        Store {
            questions: Arc::new(RwLock::new(Self::init())),
            answers: Arc::new(RwLock::new(HashMap::new())),
        }
    }

    fn init() -> IndexMap<QuestionId, Question> {
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

#[derive(Serialize, Deserialize, Debug, Clone, PartialEq, Eq, Hash)]
struct AnswerId(String);

#[derive(Serialize, Deserialize, Debug, Clone)]
struct Answer {
    id: AnswerId,
    content: String,
    question_id: QuestionId,
}

async fn get_questions(
    params: HashMap<String, String>,
    store: Store,
) -> Result<impl warp::Reply, warp::Rejection> {
    if !params.is_empty() {
        let pagination = extract_pagination(params)?;
        let res: Vec<Question> = store.questions.read().await.values().cloned().collect();
        let res = &res[pagination.start..pagination.end];
        Ok(warp::reply::json(&res))
    } else {
        let res: Vec<Question> = store.questions.read().await.values().cloned().collect();
        Ok(warp::reply::json(&res))
    }
}

async fn get_question(id: String, store: Store) -> Result<impl warp::Reply, warp::Rejection> {
    match store.questions.read().await.get(&QuestionId(id)) {
        Some(q) => return Ok(warp::reply::json(q)),
        None => return Err(warp::reject::custom(error::Error::QuestionNotFound)),
    }
}

async fn add_question(
    store: Store,
    question: Question,
) -> Result<impl warp::Reply, warp::Rejection> {
    store
        .questions
        .write()
        .await
        .insert(question.id.clone(), question);

    Ok(warp::reply::with_status("Question added", StatusCode::OK))
}

async fn update_question(
    id: String,
    store: Store,
    question: Question,
) -> Result<impl warp::Reply, warp::Rejection> {
    match store.questions.write().await.get_mut(&QuestionId(id)) {
        Some(q) => *q = question,
        None => return Err(warp::reject::custom(error::Error::QuestionNotFound)),
    }

    Ok(warp::reply::with_status("Question updated", StatusCode::OK))
}

async fn delete_question(id: String, store: Store) -> Result<impl warp::Reply, warp::Rejection> {
    // warning: use of deprecated method `indexmap::IndexMap::<K, V, S>::remove`: `remove` disrupts
    //          the map order -- use `swap_remove` or `shift_remove` for explicit behavior.
    //          ...write().await.remove(&QuestionId(id))...
    // swap, faster as O(1) swapping last for the removed
    //          ...write().await.swap_remove(&QuestionId(id))...
    // shift across, probably what you want but O(n)
    match store.questions.write().await.shift_remove(&QuestionId(id)) {
        Some(_) => return Ok(warp::reply::with_status("Question deleted", StatusCode::OK)),
        None => return Err(warp::reject::custom(error::Error::QuestionNotFound)),
    }
}

async fn add_answer(
    store: Store,
    params: HashMap<String, String>,
) -> Result<impl warp::Reply, warp::Rejection> {
    let answer = Answer {
        // NOTE: get any passed in ID over suggested hardcoded number
        id: AnswerId(params.get("id").unwrap().to_string()),
        content: params.get("content").unwrap().to_string(),
        // NOTE: unsafe as not dealing with mssing QuestionId's
        question_id: QuestionId(params.get("questionId").unwrap().to_string()),
    };

    store
        .answers
        .write()
        .await
        .insert(answer.id.clone(), answer);

    // NOTE: tempoarary display answers in log
    println!("{:?}", store.answers);

    Ok(warp::reply::with_status("Answer added", StatusCode::OK))
}

async fn get_answers(
    question_id: String,
    store: Store,
) -> Result<impl warp::Reply, warp::Rejection> {
    let res: Vec<Answer> = store
        .answers
        .read()
        .await
        .values()
        .filter(|answer| answer.question_id == QuestionId(question_id.clone()))
        .cloned()
        .collect();
    match res.is_empty() {
        true => return Err(warp::reject::custom(error::Error::AnswerNotFound)),
        false => return Ok(warp::reply::json(&res)),
    }
}

#[tokio::main]
async fn main() {
    let store = Store::new();
    let store_filter = warp::any().map(move || store.clone());

    let cors = warp::cors()
        .allow_any_origin()
        .allow_header("content-type")
        .allow_methods(&[Method::PUT, Method::DELETE, Method::GET, Method::POST]);

    let get_questions = warp::get()
        .and(warp::path("questions"))
        .and(warp::path::end())
        .and(warp::query())
        .and(store_filter.clone())
        .and_then(get_questions);

    let get_question = warp::get()
        .and(warp::path("question"))
        .and(warp::path::param::<String>())
        .and(warp::path::end())
        .and(store_filter.clone())
        .and_then(get_question);

    let add_question = warp::post()
        .and(warp::path("questions"))
        .and(warp::path::end())
        .and(store_filter.clone())
        .and(warp::body::json())
        .and_then(add_question);

    let update_question = warp::put()
        .and(warp::path("questions"))
        .and(warp::path::param::<String>())
        .and(warp::path::end())
        .and(store_filter.clone())
        .and(warp::body::json())
        .and_then(update_question);

    let delete_question = warp::delete()
        .and(warp::path("questions"))
        .and(warp::path::param::<String>())
        .and(warp::path::end())
        .and(store_filter.clone())
        .and_then(delete_question);

    let add_answer = warp::post()
        .and(warp::path("answers"))
        .and(warp::path::end())
        .and(store_filter.clone())
        .and(warp::body::form())
        .and_then(add_answer);

    let get_answers = warp::get()
        .and(warp::path("questions"))
        .and(warp::path::param::<String>())
        .and(warp::path("answers"))
        .and(warp::path::end())
        .and(store_filter.clone())
        .and_then(get_answers);

    let routes = get_questions
        .or(get_question)
        .or(add_question)
        .or(update_question)
        .or(delete_question)
        .or(add_answer)
        .or(get_answers)
        .with(cors)
        .recover(error::return_error);

    warp::serve(routes).run(([127, 0, 0, 1], 1337)).await;
}
