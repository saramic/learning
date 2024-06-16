use warp::http::StatusCode;

use crate::store::Store;
use crate::types::account::Account;

pub async fn register(
    store: Store,
    account: Account,
) -> Result<impl warp::Reply, warp::Rejection> {
    match store.add_account(account).await {
        Ok(_) => Ok(warp::reply::with_status("Account added", StatusCode::OK)),
        Err(e) => Err(warp::reject::custom(e)),
    }
}
