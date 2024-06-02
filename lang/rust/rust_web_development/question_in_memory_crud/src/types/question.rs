use serde::{Deserialize, Serialize};

#[derive(Clone, Deserialize, Debug, Serialize)]
pub struct Question {
    pub id: QuestionId,
    title: String,
    content: String,
    tags: Option<Vec<String>>,
}

#[derive(Deserialize, Debug, Serialize, Clone, PartialEq, Eq, Hash)]
pub struct QuestionId(pub String);
