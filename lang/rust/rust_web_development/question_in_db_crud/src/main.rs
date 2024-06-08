use handle_errors::return_error;
use tracing_subscriber::fmt::format::FmtSpan;
use warp::{http::Method, Filter};

mod routes;
mod store;
mod types;

#[tokio::main]
async fn main() {
    let log_filter = std::env::var("RUST_LOG").unwrap_or_else(|_| {
        "handle_errors=warn,question_in_db_crud=info,warp=error".to_owned()
    });

    // creds could be added "postgres://username:password@localhost:5432/rustwebdev"
    let store = store::Store::new("postgres://localhost:5432/rustwebdev").await;

    sqlx::migrate!()
        .run(&store.clone().connection)
        .await
        .expect("Cannot run migration");

    let store_filter = warp::any().map(move || store.clone());

    tracing_subscriber::fmt()
        // use above filter to deterime which traces to record
        .with_env_filter(log_filter)
        // record even on each span close to get timing
        .with_span_events(FmtSpan::CLOSE)
        .init();

    let cors = warp::cors()
        .allow_any_origin()
        .allow_header("content-type")
        .allow_methods(&[
            Method::PUT,
            Method::DELETE,
            Method::GET,
            Method::POST,
        ]);

    let get_questions = warp::get()
        .and(warp::path("questions"))
        .and(warp::path::end())
        .and(warp::query())
        .and(store_filter.clone())
        .and_then(routes::question::get_questions)
        .with(warp::trace(|info| {
            tracing::info_span!(
                "get_questions request",
                method = %info.method(),
                path = %info.path(),
                id = %uuid::Uuid::new_v4(),
            )
        }));

    let get_question = warp::get()
        .and(warp::path("question"))
        .and(warp::path::param::<i32>())
        .and(warp::path::end())
        .and(store_filter.clone())
        .and_then(routes::question::get_question);

    let add_question = warp::post()
        .and(warp::path("questions"))
        .and(warp::path::end())
        .and(store_filter.clone())
        .and(warp::body::json())
        .and_then(routes::question::add_question);

    let update_question = warp::put()
        .and(warp::path("questions"))
        .and(warp::path::param::<i32>())
        .and(warp::path::end())
        .and(store_filter.clone())
        .and(warp::body::json())
        .and_then(routes::question::update_question);

    let delete_question = warp::delete()
        .and(warp::path("questions"))
        .and(warp::path::param::<i32>())
        .and(warp::path::end())
        .and(store_filter.clone())
        .and_then(routes::question::delete_question);

    let add_answer = warp::post()
        .and(warp::path("answers"))
        .and(warp::path::end())
        .and(store_filter.clone())
        .and(warp::body::form()) // TODO: form ONLY, allow OR JSON
        .and_then(routes::answer::add_answer);

    let get_answers = warp::get()
        .and(warp::path("questions"))
        .and(warp::path::param::<i32>())
        .and(warp::path("answers"))
        .and(warp::path::end())
        .and(store_filter.clone())
        .and_then(routes::answer::get_answers);

    let routes = get_questions
        .or(get_question)
        .or(add_question)
        .or(update_question)
        .or(delete_question)
        .or(add_answer)
        .or(get_answers)
        .with(cors)
        .with(warp::trace::request())
        .recover(return_error);

    warp::serve(routes).run(([127, 0, 0, 1], 1337)).await;
}
