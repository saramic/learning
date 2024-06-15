---
layout: post
title:  "10 June 2024 - Rust web SQL and DB"
date:   2024-06-10 12:30:00 +1000
categories: learning rust sql database crud
---

## From in-memroy to in DB

[commit:1dc666c](
https://github.com/saramic/learning/commit/1dc666c92504528d74e9591cb2160ad8ab4fed0c
)

this simply copied my `in-memory` work into a new directory

[lang/rust/rust_web_development/question_in_memory_crud](
https://github.com/saramic/learning/tree/master/lang/rust/rust_web_development/question_in_memory_crud)

to allow seeing the refactor to using a database

run the code
```sh
cargo run
```

or with debug mode

```sh
RUST_LOG=debug cargo run
```

and interogate with `cURL`

```sh
export QID=`uuidgen`

# 🄲 reate
curl localhost:1337/questions \
    -H "Content-Type: application/json" \
    -d '{"id":"'$QID'","title":"the title","content":"the content"}'

# 🅁 ead
curl localhost:1337/question/$QID

# 🅄 pdate
curl -X PUT \
    localhost:1337/questions/$QID \
    -H 'content-type: application/json' \
    -d '{"id":"'QID'","title":"NOT","content":"NOT"}'

# 🄳 elete
curl -X DELETE localhost:1337/questions/$QID

# 🄻 ist
curl localhost:1337/questions
```

## Convert from in memory to a real database

[commit:b85db6b](
https://github.com/saramic/learning/commit/b85db6b32d54fb51e598a008256806ba5c553e5c
)

Had a bunch of issues following the text
- `corresponding_question` vs `question_id` in a bunch of queries
- not RETURNING id, content, corresponding_question" from insert
- comile errors between rust `1.73` and `sqlx 0.7.4`

    ```sh
    error[E0658]: `async fn` return type cannot contain a projection
      or `Self` that references lifetimes from a parent scope error:

    could not compile `sqlx-core`
    ```

- https://github.com/launchbadge/sqlx/issues/2855#issuecomment-1798475204
- updated with

    ```sh
    rustc --version
    rustc 1.73
    rustup update
    rustc --version
    rustc 1.78.0
    cargo --version
    cargo 1.78.0
    ```

- but got there in the end
- try:

    ```sh
    just
    just clean
    just setup-db
    cargo run
    just demo-crud
    ```

## Added for debugging

[commit:eadfa84](
https://github.com/saramic/learning/commit/eadfa84dc092b3ccb3a8e6e2356261dcbc4a3376
)

## Some error refactoring

[commit:3188016](
https://github.com/saramic/learning/commit/3188016966190e1a6c58e6716795163973b6ba21
)

not that I really understood what was going on with

```rust
use sqlx::error::Error as SqlxError;
```

## Switch to using cargo sqlx migrations

[commit:b0839cd](
https://github.com/saramic/learning/commit/b0839cdccc111957709b0dfca37f4bfcd45524ec
)

with:
```sh
cargo install sqlx-cli
sqlx migrate add -r questions_table
cargo sqlx --help
cargo sqlx migrate add -r questions_table
cargo sqlx migrate add -r answers_table
cargo sqlx migrate run --database-url postgresql://localhost:5432/rustwebdev
cargo sqlx migrate revert --database-url postgresql://localhost:5432/rustwebdev
```

## Switch from postgresql to sqlite

[commit:8576632](
https://github.com/saramic/learning/commit/85766324bb8047f994815f35e326f52a83f13caf
)

A bunch of changes were required
- different SQL for the migrations
- Sqlite has no array property, so switched it to JSON
    - which meant it needed to convert `JSON` to `Vec<String>` to maintain
      the type of "tags"
- Postgres seemed to be ok with `LIMIT` being None and just returning
  everything? in Sqlite I could not work out a good default so am
  passing a `?limit=...&offset=...` in the query, having `LIMIT` None in
  Sqltie raises an error
- also started to exercise the tag creation and updating in the just
  demo script
- also added a `ON DELETE CASCADE`, this would ALSO work and be needed for
  the postgresql solution
posgresql
- this only works the first time for `ID=1` at the present
- LEARNING: certainly took a lot more debugging to make this work than I
  had thought it would.
