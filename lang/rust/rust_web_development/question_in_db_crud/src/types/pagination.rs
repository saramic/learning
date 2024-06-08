use handle_errors::Error;
use std::collections::HashMap;

/// Pagination struct that is getting extracted from query params
#[derive(Debug)]
pub struct Pagination {
    /// The indes of the first item that has to be returned
    pub start: usize,
    /// The index of the last itme that has to be returned
    pub end: usize,
}

/// Extract query parameters from the `/questions` route
/// # Example query
/// GET requests to this route can have a paginatino attached so we just return the questions we
/// need
/// `/questions?start=1&end=10`
/// # Example usage
/// ```rust
/// let mut query = HasMap::new();
/// query.insert("start".to_string(), "1".to_string());
/// query.insert("end".to_string(), "1".to_string());
/// let p = types::pagination::extract_pagination(query).unwrap();
/// assert_eq!(p.start, 1);
/// assert_eq!(p.end, 10);
/// ```
pub fn extract_pagination(
    params: HashMap<String, String>,
) -> Result<Pagination, Error> {
    // Could be improved in the future
    if params.contains_key("start") && params.contains_key("end") {
        // Takes the "start" parameter in the query and tries to convert it to a number
        let start = params
            .get("start")
            .unwrap()
            .parse::<usize>()
            .map_err(Error::ParseError)?;
        // Takes the "end" parameter in the query and tries to convert it to a number
        let end = params
            .get("end")
            .unwrap()
            .parse::<usize>()
            .map_err(Error::ParseError)?;

        match start.cmp(&end) {
            std::cmp::Ordering::Greater => return Err(Error::WrongIndex),
            _ => return Ok(Pagination { start, end }),
        }
    }

    Err(Error::MissingParameters)
}
