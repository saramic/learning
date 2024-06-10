-- Add up migration script here
CREATE TABLE answers (
    id serial PRIMARY KEY,
    content TEXT NOT NULL,
    created_on TIMESTAMP NOT NULL DEFAULT NOW(),
    corresponding_question integer
        REFERENCES questions
        ON DELETE CASCADE
);
