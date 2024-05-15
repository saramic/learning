---
layout: post
title:  "May 2024 - learning serverless rust 🦀"
date:   2024-05-15 21:00:00 +1000
categories: learning update serverless rust
---

## Cleaning up some Lambdas at work ...

... came across this serverless rust tutorial on youtube

[![
](
  http://img.youtube.com/vi/i6FKvK5JQ8o/0.jpg
)](
    https://www.youtube.com/playlist?list=PLCOG9xkUD90KQ1IPQT_m1NbPRXXRFb63s
)

and given it covered off a bunch of things I have an interest in

- rust
- SAM (Serverless Application Model) AWS cloudformation framework
- tutorials on lambdas
- testing lambdas
- processing kinesis streams
- posting OpenTelemetry stats
- configuration management, project setup and other related things

I thought that it would be worth my while watching and as it was quite good, to
the point, not too long and well split out into meaningful chunks I thought I
should also follow along.

As always with these things, things change and go out of date. What was the
default `sam init` choose rust and `Hello World` that does a PUT API to Dynamo
DB has moved away from that and actually just does a Hello World.

Also on skipping around in the tutorial, being that I was watching it a second
time and it was different to the code I had generated, I missed the bit where
you had to do a `sam build` before you do a `sam deploy`. This lead me down a
long path of errors around `Unzipped size too big`

```sh
CREATE_FAILED            AWS::Lambda::Function    HelloWorldFunction

Resource handler returned message: "Unzipped size must be smaller than
262144000 bytes (Service: Lambda, Status Code: 400, Request ID: ...)"
(RequestToken: 827ca4b9-47bf-ee04- bf8a-62dd8362c7a9, HandlerErrorCode:
InvalidRequest)

ROLLBACK_IN_PROGRESS     AWS::CloudFormation::Stack rust-sample
```

Once that happend once, I could not get around as I continually got a
`ROLLBACK_IN_PROGRESS`. I started to hunt around all the things that **sam**
had created like 128MB artefacts on S3. Finally I found the **CloudFormation**
stacks and that I had to just delete the one that had failed to deploy. There
is some setting to do that automatcially but once it's there I think you need
to go and delete it. Anway after that long detour I could continue and get a
Hello World Rust powered lambda out there.

```sh
vi README.md    # to work out to do a sam deploy

sam build
sam deploy

# using the presented endpoints I could now hit them to see the response of
# Hello World
curl https://iepd21535e.execute-api.ap-southeast-2.amazonaws.com/Prod/hello/
curl https://iepd21535e.execute-api.ap-southeast-2.amazonaws.com/Prod/hello/ -v
```

thinking it would be too hard to re-type the dynamo DB rust example from the
YouTube, I decided to do another `sam init` and see what else I could create. I
found that there was a **Dynamo DB example** and lo and behold, it was _only_
avaialble in rust. I created a new project and took a look. Seemed close
enought so I ported across the differences in rust code and settings to create
DynamoDB and sure enough it worked.

```sh
sam init    # create a dynamo-example

# checked some difefrences
vimdiff ../rust-sample/README.md README.md
vimdiff ../rust-sample/samconfig.toml samconfig.toml
vimdiff ../rust-sample/template.yaml template.yaml
vimdiff ../../rust-sample/rust_app/Cargo.toml Cargo.toml
vimdiff ../../rust-sample/rust_app/src/main.rs src/main.rs

# changing back into my modified rust-sample app
sam build # this took forever with no feedback so I stopped
# and ran
cd rust_app
cargo build     # now with feedback of what is comiling
cargo lambda build --release --target x86_64-unknown-linux-gnu

# and this worked
sam build

# although this works better (no need to respond yes)
sam build --beta-features

# a deploy
sam deploy

# and I could try
curl \
    https://iepd21535e.execute-api.ap-southeast-2.amazonaws.com/Prod/ \
    -X PUT \
    -d '{"hello":"world"}'

# responded with
{"message":"Missing Authentication Token"}

# which threw me for a while until I re-watched that part of the video and
# worked out it needs an ID
curl \
    https://iepd21535e.execute-api.ap-southeast-2.amazonaws.com/Prod/12345 \
    -X PUT \
    -d '{"hello":"world"}'

# now responded with 🎉
item saved

# reading some more I found out I could:
# run some tests
cargo test

# view some logs
sam logs --name PutFunction --stack-name rust-sample --tail

# with some auto config
sam logs --stack-name rust-sample --tail
```

and after all is done

```sh
sam delete
```

There is also a pretty convincing plug of the video presenter to get the book
[Zero To Production In Rust - Luca
Palmieri](https://www.zero2prod.com/index.html)

![Zero to production in Rust book cover](
  https://www.zero2prod.com/assets/img/book2.png){: width="480"}

Cargo lambda

* [https://www.cargo-lambda.info/guide/getting-started.html
  ](https://www.cargo-lambda.info/guide/getting-started.html)
* [https://github.com/cargo-lambda/cargo-lambda
  ](https://github.com/cargo-lambda/cargo-lambda)

Also his site

* [https://jameseastham.co.uk/](https://jameseastham.co.uk/)

also seems to have a getting started template but for the time being it was
time to try and write some code around the original videos to create some more
of **CRUD** to the DynamoDB example following the original video series.

Ran into a bunch of problems. Some of them being around the video's having some
kind of code hint overlays that I thought where real things for me to type.
Even when I thought I had covered everything, it still would not compile. On
the second video I found there was a link to a github so I found the commit and
the code I was trying to get to.

* [https://github.com/jeastham1993/rust-on-serverless/tree/main/src/simple-serverless-api
    ](https://github.com/jeastham1993/rust-on-serverless/tree/main/src/simple-serverless-api)

even with the code there, it seemed a few things may have changed with how
`sam` and or `cargo lambda` do their things. Notably how to compile 2 separate
functions and for `sam` to pick them up and zip and deploy them. In the end I
found yet another instructional page
[
  https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/building-rust.html
](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/building-rust.html)
on how to deal with it and the change was a newer part of the `sam`
template.yaml a bit like below. In particular the `Binary: <name>`

```yaml
  PutFunction:
    Type: AWS::Serverless::Function
    Metadata:
      BuildMethod: rust-cargolambda
      BuildProperties:
        Binary: create
    Properties:
      CodeUri: ./rust_app

  GetFunction:
    Type: AWS::Serverless::Function
    Metadata:
      BuildMethod: rust-cargolambda
      BuildProperties:
        Binary: get
```

On a second check, this is actually also written in the GitHub but not in the
original version when `Get` and `Delete` actions where added as per video 2.

```sh
curl \
    https://6xh3uud9li.execute-api.ap-southeast-2.amazonaws.com/Prod/1234 \
    -X PUT \
    -d '{"hello":"world"}'
item saved

curl https://6xh3uud9li.execute-api.ap-southeast-2.amazonaws.com/Prod/1234
{"message": "Internal server error"}
```

something is wrong 🤦, in fact at this point I even wander if the save/PUT ever
worked as I never dumped the data base. I cannot see the code difference
tonight but with time no doubt I'll get someplace.

**Next time:**

- get the get/put working
- add the delete
- follow video 3 on testing
- Jump to the kinesis video - especially that extra query and load creation
  example, the ColdStart analysis query
  ```
  filter @type="REPORT"
  | fields greatest(@initDuration, 0) + @duration as duration,
  | ispresent(@initDuration) as coldstart
  | stats count(*) as count, pct(duration, 50) as p50,
  | pct(duration, 90) as p90, pct(duration, 99) as p99,
  | max(duration) as max by coldstart
  ```
  which returns - for the put lambda run on repeat

  |       | coldstart | count | p50     | p90      | p99      | max    |
  |------:|----------:|------:|--------:|---------:|---------:|-------:|
  | 1     | 0         | 440   |   4.647 |   5.8892 |  13.4866 |  36.37 |
  | 2     | 1         | 1     | 165.11  | 165.11   | 165.11   | 165.11 |

  run on repeat with
  ```sh
  repeat 200 { \
   curl \
    https://6xh3uud9li.execute-api.ap-southeast-2.amazonaws.com/Prod/`uuidgen` \
    -X PUT \
    -d '{"hello":"world"}'; sleep 0.1 }
  ```
- OpenTelemetry
- all the other videos
- go back and build a lambda processor, may be with an integration spec and
  maybe with `pact` contract testing?

