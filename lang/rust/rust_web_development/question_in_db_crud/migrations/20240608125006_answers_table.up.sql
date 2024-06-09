-- Add up migration script here
CREATE TABLE answers (
    id INTEGER NOT NULL UNIQUE,
    content TEXT NOT NULL,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    corresponding_question integer
        REFERENCES questions
        ON DELETE CASCADE,
    PRIMARY KEY("id" AUTOINCREMENT)
);
