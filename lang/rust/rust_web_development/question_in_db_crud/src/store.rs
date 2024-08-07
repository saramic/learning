use sqlx::sqlite::{SqlitePool, SqlitePoolOptions, SqliteRow};
use sqlx::Row;

use crate::types::{
    answer::{Answer, AnswerId, NewAnswer},
    question::{NewQuestion, Question, QuestionId},
};
use handle_errors::Error;

#[derive(Debug, Clone)]
pub struct Store {
    pub connection: SqlitePool,
}

impl Store {
    pub async fn new(db_url: &str) -> Self {
        let db_pool = match SqlitePoolOptions::new()
            .max_connections(5)
            .connect(db_url)
            .await
        {
            Ok(pool) => pool,
            Err(e) => panic!("Couldn't establish DB connection: {}", e),
        };

        Store {
            connection: db_pool,
        }
    }

    pub async fn get_questions(
        &self,
        limit: Option<i32>,
        offset: i32,
    ) -> Result<Vec<Question>, Error> {
        match sqlx::query("SELECT * FROM questions LIMIT $1 OFFSET $2")
            .bind(limit)
            .bind(offset)
            .map(|row: SqliteRow| {
                let tags: Option<Vec<String>> =
                    serde_json::from_str(row.get("tags"))
                        .unwrap_or_else(|_| Some(vec![]));
                Question {
                    id: QuestionId(row.get("id")),
                    title: row.get("title"),
                    content: row.get("content"),
                    tags,
                }
            })
            .fetch_all(&self.connection)
            .await
        {
            Ok(questions) => Ok(questions),
            Err(e) => {
                tracing::event!(tracing::Level::ERROR, "{:?}", e);
                Err(Error::DatabaseQueryError)
            }
        }
    }

    pub async fn get_question(&self, id: i32) -> Result<Vec<Question>, Error> {
        match sqlx::query("SELECT * FROM questions WHERE id = $1")
            .bind(id)
            .map(|row: SqliteRow| {
                let tags: Option<Vec<String>> =
                    serde_json::from_str(row.get("tags"))
                        .unwrap_or_else(|_| Some(vec![]));
                Question {
                    id: QuestionId(row.get("id")),
                    title: row.get("title"),
                    content: row.get("content"),
                    tags,
                }
            })
            .fetch_all(&self.connection)
            .await
        {
            Ok(questions) => Ok(questions),
            Err(e) => {
                tracing::event!(tracing::Level::ERROR, "{:?}", e);
                Err(Error::DatabaseQueryError)
            }
        }
    }

    pub async fn add_question(
        &self,
        new_question: NewQuestion,
    ) -> Result<Question, Error> {
        match sqlx::query(
            "INSERT INTO questions (title, content, tags)
            VALUES ($1, $2, $3)
            RETURNING id, title, content, tags",
        )
        .bind(new_question.title)
        .bind(new_question.content)
        .bind(serde_json::json!(new_question.tags))
        .map(|row: SqliteRow| {
            let tags: Option<Vec<String>> =
                serde_json::from_str(row.get("tags"))
                    .unwrap_or_else(|_| Some(vec![]));
            Question {
                id: QuestionId(row.get("id")),
                title: row.get("title"),
                content: row.get("content"),
                tags,
            }
        })
        .fetch_one(&self.connection)
        .await
        {
            Ok(question) => Ok(question),
            Err(e) => {
                tracing::event!(tracing::Level::ERROR, "{:?}", e);
                Err(Error::DatabaseQueryError)
            }
        }
    }

    pub async fn update_question(
        &self,
        question: Question,
        question_id: i32,
    ) -> Result<Question, Error> {
        match sqlx::query(
            "UPDATE questions
            SET title = $1, content = $2, tags = $3
            WHERE id = $4
            RETURNING id, title, content, tags",
        )
        .bind(question.title)
        .bind(question.content)
        .bind(serde_json::json!(question.tags))
        .bind(question_id)
        .map(|row: SqliteRow| {
            let tags: Option<Vec<String>> =
                serde_json::from_str(row.get("tags"))
                    .unwrap_or_else(|_| Some(vec![]));
            Question {
                id: QuestionId(row.get("id")),
                title: row.get("title"),
                content: row.get("content"),
                tags,
            }
        })
        .fetch_one(&self.connection)
        .await
        {
            Ok(question) => Ok(question),
            Err(e) => {
                tracing::event!(tracing::Level::ERROR, "{:?}", e);
                Err(Error::DatabaseQueryError)
            }
        }
    }

    pub async fn delete_question(
        &self,
        question_id: i32,
    ) -> Result<bool, Error> {
        match sqlx::query("DELETE FROM questions WHERE id = $1")
            .bind(question_id)
            .execute(&self.connection)
            .await
        {
            Ok(_) => Ok(true),
            Err(e) => {
                tracing::event!(tracing::Level::ERROR, "{:?}", e);
                Err(Error::DatabaseQueryError)
            }
        }
    }

    pub async fn add_answer(
        &self,
        new_answer: NewAnswer,
    ) -> Result<Answer, Error> {
        match sqlx::query(
            "INSERT INTO answers (content, corresponding_question)
            VALUES ($1, $2)
            RETURNING id, content, corresponding_question",
        )
        .bind(new_answer.content)
        .bind(new_answer.question_id.0)
        .map(|row: SqliteRow| Answer {
            id: AnswerId(row.get("id")),
            content: row.get("content"),
            question_id: QuestionId(row.get("corresponding_question")),
        })
        .fetch_one(&self.connection)
        .await
        {
            Ok(answer) => Ok(answer),
            Err(e) => {
                tracing::event!(tracing::Level::ERROR, "{:?}", e);
                Err(Error::DatabaseQueryError)
            }
        }
    }

    pub async fn get_answers(
        &self,
        question_id: i32,
    ) -> Result<Vec<Answer>, Error> {
        match sqlx::query(
            "SELECT * FROM answers WHERE corresponding_question = $1",
        )
        .bind(question_id)
        .map(|row: SqliteRow| Answer {
            id: AnswerId(row.get("id")),
            content: row.get("content"),
            question_id: QuestionId(row.get("corresponding_question")),
        })
        .fetch_all(&self.connection)
        .await
        {
            Ok(answers) => Ok(answers),
            Err(e) => {
                tracing::event!(tracing::Level::ERROR, "{:?}", e);
                Err(Error::DatabaseQueryError)
            }
        }
    }
}
