---
layout: post
title:  "15 June 2024 - Rust web API calls"
date:   2024-06-15 10:30:00 +1000
categories: learning rust sql api async
---

## Http get implementation using old hyper

[commit:3428143](
https://github.com/saramic/learning/commit/34281435f9c19ab945559485eacd54bcd4506bdf
)

Seems that this will no longer work with latest version of hyper as
there is not even a `hyper::Client` (this) `0.14` -> (latest) `1.3.1`

## Feature addition of passing url from command line

[commit/efa504e](
https://github.com/saramic/learning/commit/efa504e742560d11bf746cfdd734c9ed66aafb75
)

## Updated to newest version of hyper

[commit/ac396db](
https://github.com/saramic/learning/commit/ac396db230444985e6d9c03936eefdc08fab7deb
)

This was very confusing
- **FINALLY**

  [https://github.com/hyperium/hyper-util/blob/master/examples/client.rs](
  https://github.com/hyperium/hyper-util/blob/master/examples/client.rs)
  got this working by using

    ```rust
    hyper_util::client::legacy::Client
    ```

  although this was no silver bullet as some other stuff changed

- **INITIALLY** tried a bunch of broken code from docs and Github

- [https://docs.rs/hyper/latest/hyper/client/conn/index.html](
  https://docs.rs/hyper/latest/hyper/client/conn/index.html)
  suggested

    ```rust
    let (mut request_sender, connection) = conn::http1::handshake(tcp).await?;
    ```

  but what is `tcp`? this code does not run
- [https://github.com/hyperium/hyper/blob/master/examples/client.rs](
  https://github.com/hyperium/hyper/blob/master/examples/client.rs)
  code example suggests

    ```rust
    let io = TokioIo::new(stream);

    let (mut sender, conn) = hyper::client::conn::http1::handshake(io).await?;
    ```

  but Tokio seems to come from
  [https://github.com/hyperium/hyper/blob/master/benches/support/tokiort.rs](
  https://github.com/hyperium/hyper/blob/master/benches/support/tokiort.rs)
  and a bunch of other stuff?

## Copy postgres version to tackle bad words

[commit:0b2e428](
https://github.com/saramic/learning/commit/0b2e42891da6d77c71984a65778c5d777e8f9506
)

## A much simpler request with Reqwest lib

[commit:98146ff](
https://github.com/saramic/learning/commit/98146ffcfd822bc88596cd05215af000146f7e0d
)

## Switch api call to apilayer bad_words filter

[commit:6405afa](
https://github.com/saramic/learning/commit/6405afaf6907a00716607dd514bbe1c038acc628
)

## Add reqwest call to bad API filter

[commit:71cc8db](
https://github.com/saramic/learning/commit/71cc8db9d33c9670eefdc0579bef0bfef8ce433a
)

initially as per book
    - [https://api.apilayer.com/bad_words](
      https://api.apilayer.com/bad_words)
but as it seemed to be down switched to
    - `https://api.api-ninjas.com/v1/profanityfilter?text=...`
also brought in an error type to remap errors and simply print the output

**NOTE:** on API failure, the message is written to the DB as reqwest does not
raise an error with a failed status code

## Deal with API errors separately

[commit:2636511](
https://github.com/saramic/learning/commit/2636511a90f153728b9cd4ae3be2aa964fd1c996
)

using ExternalAPIError

## Add back the apilayer API over Apininjas

[commit:18d8aba](
https://github.com/saramic/learning/commit/18d8aba6cb01af0edc64627b163f9fb139133d8a
)

Left **APINinjas** commented out but in future both could be made available

## Add serde json and parse out some status and content

[commit:f5aa03](
https://github.com/saramic/learning/commit/f5aa0314685e8a64076fa3e4f7cf45ef817dc355
)

## Define json type for APIResopnse

[commit:84a36a](
https://github.com/saramic/learning/commit/84a36a43267cf934879ad41cf2bfb2cac70ecb8f
)

`APIResponse`, `BadWord`, `BadWordsResponse`

running:
```sh
cargo run FTW is fuck the world
```

returns:
```rust
Object {
    "Message": Object {
        "bad_words_list": Array [
            Object {
                "deviations": Number(0),
                "info": Number(2),
                "original": String("fuck"),
                "replacedLen": Number(4),
            },
        ],
        "bad_words_total": Number(1),
        "censored_content": String("FTW is **** the world"),
        "content": String("FTW is fuck the world"),
    },
    "StatusCode": String("200"),
}
```

## Attempt to deal with API errors and parse json

[commit:ddc33b](
https://github.com/saramic/learning/commit/ddc33b19c8ab98a399813ab5aa6c903cd1f30fa6
)

The issue is that the apilayer.com service seems to be super flakey and often
**cloudflare** seems to kick in returning a `524` with no body which fails the
error parsing. Add some way to deal with that? also would be good to timeout as
this takes 1 minute to timeout by default?

although there seems to be some `content-length`? `15`? and the `report-to`
header seems to have some **cloudflare** url with a token? but it does not work

result:
```rust
Response {
    url: Url {
        scheme: "https",
        host: Some(
            Domain("api.apilayer.com"),
        ),
        path: "/bad_words",
        query: Some("censor_character=*"),
    },
    status: 524,
    headers: {
        "date": "Fri, 14 Jun 2024 12:32:41 GMT",
        "content-type": "text/plain; charset=UTF-8",
        "content-length": "15",
        "connection": "keep-alive",
        "report-to": "{\"endpoints\":
        [{\"url\":\"https:\/\/a.nel.cloudflare.com\/report\/v4?s=5eJ...zTV\"}],
        \"group\":\"cf-nel\",\"max_age\":604800}",
    },
}
```

also

```sh
thread 'tokio-runtime-worker' panicked at src/routes/question.rs:138:50:
called `Result::unwrap()` on an `Err` value: reqwest::Error { kind:
    Decode, source: Error("expected value", line: 1, column: 1) }
note: run with `RUST_BACKTRACE=1` environment variable to display a
    backtrace
```

## Extracted external API calls to profanity.rs

[commit:b29219](
https://github.com/saramic/learning/commit/b29219ed2d3533852181974658670c515ce081bb
)

with API call:
```sh
curl localhost:1337/questions \
    -H "Content-Type: application/json" \
    -d '{"id":"1","title":"the shit title","content":
        "the shit content","tags":["home","work","shit"]}'

{
    "id":1,
    "title":"the **** title",
    "content":"the **** content",
    "tags":["home","work","shit"]
}
```

checking the DB:
```sh
psql rustwebdev -XtAc "SELECT * FROM questions"

1|the **** title|the **** content|{home,work,shit}|2024-06-14 22:34
```

## Add retries with exponential backoff for API

[commit:61de2ba](
https://github.com/saramic/learning/commit/61de2ba7f0fe4417c274b844eb549ad94678b750
)

using:
```sh
cargo add reqwest-retry         # which requires middleware
cargo add reqwest-middlware
```

using 3 retries with exponential backoff results can be viwed by turning off
WiFi🛜 and watching the log

1. turn off WiFi🛜
2. curl request 📤
   ```sh
   curl localhost:1337/questions \
       -H "Content-Type: application/json" \
       -d '{"id":"1","title":"the shit title","content":
           "the shit content","tags":["home","work"]}'
   ```
3. 3 retries ♻️  in logs
   ```sh
   2024-06-14T23:04:38.546566Z  WARN
       reqwest_retry::middleware: Retry attempt #0. Sleeping 724.299389ms
       before the next attempt
   2024-06-14T23:04:39.274782Z  WARN
       reqwest_retry::middleware: Retry attempt #1. Sleeping 1.462262056s
       before the next attempt
   2024-06-14T23:04:40.743297Z  WARN
       reqwest_retry::middleware: Retry attempt #2. Sleeping 324.367927ms
       before the next attempt
   2024-06-14T23:04:41.075538Z ERROR
       warp::filters::trace: unable to process request (internal error)
       status=500...
   2024-06-14T23:04:41.076114Z ERROR
       MiddlewareReqwestAPIError(Reqwest(reqwest::Error { kind: Request ...
   ```
4. server error response 📥
   ```sh
   Internal Server Error
   ```

## Use tokio::spawn to achieve concurrency

[commit:3be71c9](
https://github.com/saramic/learning/commit/3be71c9319f31575fe98f6a0fe7c9fec7078294a
)

testing:
**3 times update `PUT` using `tokio::spawn`**
```sh
repeat 3 { time curl -X PUT "localhost:1337/...
    {"id":2,"title":"***** title","content":"***** content"...
    0.01s user 0.01s system 0% cpu 3.267 total
    {"id":2,"title":"***** title","content":"***** content"...
    0.01s user 0.01s system 0% cpu 3.333 total
    {"id":2,"title":"***** title","content":"***** content"...
    0.01s user 0.01s system 0% cpu 2.450 total

NUMBERS=(3.267 3.333 2.450) && \
    echo `bc <<< $NUMBERS` / ${#NUMBERS[@]} | bc -l

3.01666666666666666666
```

**3 times create `POST` doing one by one**
```sh
repeat 3 { time curl localhost:1337/questions -d '{"...
    {"id":19,"title":"the **** title","content":"the **** content"...
    0.01s user 0.01s system 0% cpu 4.463 total
    {"id":20,"title":"the **** title","content":"the **** content"...
    0.01s user 0.01s system 0% cpu 4.435 total
    {"id":21,"title":"the **** title","content":"the **** content"...
    0.01s user 0.01s system 0% cpu 4.570 total

NUMBERS=(4.463 4.435 4.570) && \
    echo `bc <<< $NUMBERS` / ${#NUMBERS[@]} | bc -l

4.48933333333333333333
```

## Use tokio::join! to achieve concurrency

[commit:4a8b9ef](
https://github.com/saramic/learning/commit/4a8b9ef8e733c2bde8e3d78852893e3aad2ffda7 (HEAD -> master)
)

testing:
**CURRENT 3 times create `POST` using `tokio::join!`**
```sh
repeat 3 { time curl localhost:1337/questions -d '{"...
NUMBERS=(3.658 2.393 3.331) && \
    echo `bc <<< $NUMBERS` / ${#NUMBERS[@]} | bc -l
3.12733333333333333333
```

**PREVIOUS 3 times create `POST` doing one by one**
```sh
repeat 3 { time curl localhost:1337/questions -d '{"...
NUMBERS=(4.463 4.435 4.570) && \
    echo `bc <<< $NUMBERS` / ${#NUMBERS[@]} | bc -l
4.48933333333333333333
```

**`tokio::spawn` LAST time**
```sh
repeat 3 { time curl -X PUT "localhost:1337/...

NUMBERS=(3.267 3.333 2.450) && \
    echo `bc <<< $NUMBERS` / ${#NUMBERS[@]} | bc -l
3.01666666666666666666
```

**`tokio::spawn` LAST time**
```sh
NUMBERS=(3.562 2.295 3.431) && \
    echo `bc <<< $NUMBERS` / ${#NUMBERS[@]} | bc -l
3.09600000000000000000
```
