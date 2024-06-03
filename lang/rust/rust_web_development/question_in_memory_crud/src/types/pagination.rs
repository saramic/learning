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
pub fn extract_pagination(params: HashMap<String, String>) -> Result<Pagination, Error> {
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
            _ => {
                return Ok(Pagination {
                    start: start,
                    end: end,
                })
            }
        }
    }

    Err(Error::MissingParameters)
}
