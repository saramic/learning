# Progress Feb 2021

## Mon 28th Feb
- [![Applying the saga
  pattern](http://img.youtube.com/vi/xDuwrtwYHu8/0.jpg)](http://youtu.be/xDuwrtwYHu8
  "Applying the Saga Pattern • Caitie McCaffrey • GOTO 2015")
  - background
    - [ ] original paper - Sagas Hector-Molina 1987 ->
      ftp://ftp.cs.princeton.edu/reports/1987/070.pdf
    - [ ] how Google does it's distributed transactions - Spanner: Google’s
      Globally-Distributed Database 2012 -> original
      https://research.google.com/archive/spanner-osdi2012.pdf
  - Once the Halo DB handled 11.6 Million users and 1 Billion games 1 DB was too small
  - Saga pattern from 1987 paper (link ^^)
    - somewhat transactional
    - guarantee consistency begining to end - gave up serializability (order of
      operation)
  - example app - book a holiday - book hotel, car, flight
  - **Serializability** - happen sequentially
  - **ACID**
    - **A**tomicity - all happend or didn't happen - no intermediate state shown
    - **C**onsistency - always a valid state - before, after or after roolback
    - **I**solation - no effect if run concurrently
    - **D**urability - once committed it is persisted - we don't loose data
  - with Services
    - Don't have canonical source of truth
    - each has own backing store
  - Two Phase Commit 2PC approach
    - **1.** single coordinator - propse change to all resources, all resources
      vote YES or NO
    - **2.** if YES commit else veto and don't do it
      - O(n^2) messages in system
      - Coordinator is a single point of failure
      - reduced throughput - bounded by slowest service
      - holding locks
      - not supported by any cloud providers due to above problems, it does not
        scale
    - Spanner Google paper (link ^^) highlighting how much of a problem this is
    - what can we give up and still have a correct system?
    - sagas paepr demoed long lived transactions on a single DB
    - all transactions complete
      - **OR** compensating transactions run to amend partial execution of saga
    - Saga - sub transactions
      - cannot depend on each other
      - cannot depend on ordering
      - each sub transaction needs a compensating transaction
      - Cn semantically undoes Tn
        - undoing things like email with another email to ignore the first
    - Saga Execution Coordinator SEC - in same execution space as DB
    - Saga Log Begin; End; Abort as well as all transactions and compensating
      transactions
    - **Backward Recovery** - most common
      - as a service fails - roll back that service and any other transactions
    - Transactions are sub reqeusts
      - provide for **C**onsistency and **D**urablity
      - probably not **A**tomicity and **I**solation
    - Saga log - durable and distributed - eg Kafka
      SEC - is not special - srouce of truth is in log
      ```
      ```
    - failure
      - services fail - or fail to reply
      - SEC crashes
      - Compensating transactions fail
        - need to retry till they pass
        - must be idempotent
        - normal transactions do not need to be idempotent although if they are
          it may be easier to recover them - or roll forward
      - SEC fails
        - not special
        - if start:end logged pick up
        - if abort just send compensating transactions - they are idempotent
        - Unsave Ti start but no Ti end
          - if Ti idempotent keep going
          - otherwise start compensating requests
      - Ti at most once
      - Ci at least once
    - stats of Halo example
      - forward recover - so people don't see stats and then they disappear
    - long lived transactions
    - trade atomicity for availability
    - failure management


## Wed 9th Feb
  - https://debitoor.com/blog/trunk-based-development-how-we-fixed-it-with-koritsu
    - interesting read on trunk based dev but not sure about adding another
      branch of `/ready` and CI-police being such a hard thing to sort out when
      a slack bot could tell you there is a problem

## Tue 8th Feb

  - post RailsCamp
    - should finish my repo
      [railscamp-27-problems](https://github.com/saramic/railscamp-27-problems)
      - linktree clone as a demo for real code problems
      - more sidekiq work
        - compare and contrast with Que and GoodJob
        - where does faye (ChargeFox) fit https://github.com/faye/faye
      - see if I can get left-associative operations working in calculator
    - take a look at WASI and running rails in browser
    - real code problems
    - github social
    - lost and found for linkedin/github/insta/facey
    - maze A/B testing game
    - railway tug o' war
    - location sound bites
  - Reading list
    - https://microservices.io//post/misc/2022/01/26/the-microservices-pattern-language.html
      - just a slide show on microservice patterns, nothing really that useful
      - author's book is better but still limited
    - https://shopify.engineering/high-availability-background-jobs
      - server uptime with banner "come back later" is not the same as high
        availability where a user has a "meaningful" service available like
        being able to place orders.
      - offloading large, error prone or slow tasks can be beneficial to make
        request cycle fast for user. Things like data processing, email
        sending, image resizing, API fetching, etc
      - background jobs as offloading work to be done later, on a different
        server
      - benefits with spikes in usage, retrying, redundancy, parallel
        processing, prioritisation, scheduling and simpler encapsulated code
        for a particular job
      - exactly once vs at least once delivery - for re-processing jobs that
        may have not reported that they completed successfully in a timely
        manner - no real answer here appart from checking state when performing
        a second time?
      - non-transactional queuing - the process can't be queued before the
        transaction finishes, and if it is queued after it occurs it can't be
        guaranteed to run if something crashes. The outbox pattern can be used
        to create transactinally staged job queues and have the job queue read
        from the staging table.
      - for several jobs you can use SAGA's to guarantee eventual consistency.
        Here not only is a job written to a staging table when it needs to be
        performed but also when it succeeds to make sure everything is
        complete. A scheduled check can run any jobs that have failed to record
        they are complete.
      - out of order delivery can be maintained by having a job queue the next
        job to make sure all jobs happen in order
      - long running jobs may be interrupted due to cloud changes or new code
        going live - checkpointing through a library
        ([shopify/job-iteration](https://github.com/shopify/job-iteration))
        or by applying partial changes can help with this.
      - some mention of distrubted background jobs through RabbitMQ and Kafka
    - ruby saga example implementation https://gist.github.com/sclinede/69afbd78fde9cc7d2dc3afd39ce3002d
    - https://www.quora.com/Does-the-Netflix-work-culture-create-a-culture-of-fear-amongst-its-employees/answer/Sid-Reddy-17
      - some external metrics and insider info on a fire slowest deer
        mentalilty of performance review. Interesting note that pre 2004
        engineers cannot handle this as well.
    - https://medium.com/zendesk-engineering/building-reliability-into-uncertain-event-delivery-a09db0750ef9
      - not that interesting
    - should look at
      - terminals
        - Warp
        - alacritty - https://alacritty.org/ - https://github.com/alacritty/alacritty
      - alternate to ansible-vault and rails credentials:edit is https://github.com/Shopify/ejson
      - [ ] book Designing Data-intensive Applications
        https://www.goodreads.com/book/show/23463279-designing-data-intensive-applications
      - Distributed data for Microservices - Event Sourcing vs Change Data Capture
        - https://debezium.io/blog/2020/02/10/event-sourcing-vs-cdc/
      - more on https://microservices.io/
      - [ ] https://increment.com/software-architecture/primer-on-functional-architecture/
      - [ ] https://www.youtube.com/watch?v=PLFl95c-IiU
      - [ ] conect an app to Okta https://www.okta.com/products/api-access-management
      - [ ] https://engineering.gusto.com/how-to-prevent-non-atomic-actions-in-rails-transactions/
      - [ ] Que related
        - [ ] https://www.petekeen.net/using-que-instead-of-sidekiq
        - [ ] https://blog.supersetinc.com/2017/12/21/que-performant-background-processing-rails-fewer-moving-parts/
        - [ ] https://github.com/que-rb/que
      - [ ] sidekiq related
        - [ ] https://about.gitlab.com/blog/2020/06/24/scaling-our-use-of-sidekiq/
        - [ ] https://about.gitlab.com/blog/2021/09/02/specialized-sidekiq-configuration-lessons-from-gitlab-dot-com/
      - [ ] transactional outbox https://microservices.io/patterns/data/transactional-outbox.html
      - [ ] continue Sidekiq Pro and Enterprise tutorials
        - [ ] https://www.youtube.com/watch?v=3HY6lcAvuhU&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1&index=7
        - [ ] https://github.com/mperham/sidekiq/wiki/Ent-Rate-Limiting etc
      - [ ] on page object and site prism https://medium.com/@SphereSoftware/page-object-pattern-in-ruby-with-siteprism-867c7e87939
      - dev fitbit
        - https://dev.fitbit.com/
        - https://dev.fitbit.com/getting-started
      - Rust and data
        - https://towardsdatascience.com/data-processing-in-rust-with-datafusion-arrow-56df5432de68
        - data frames in Rust https://github.com/pola-rs/polars
        - datafusion in Rust https://docs.rs/datafusion/5.0.0/datafusion/
        - Rust polars https://docs.rs/polars/0.4.0/polars/
      - fig terminal shortcuts https://fig.io/
      - https://www.rubypigeon.com/posts/object-tap-and-how-to-use-it/
      - Dolby hackathon related
        - https://www.toptal.com/webassembly/webassembly-rust-tutorial-web-audio
        - https://rustwasm.github.io/wasm-bindgen/examples/web-audio.html
        - https://www.netlify.com/blog/2021/10/14/write-netlify-functions-in-rust/
        - https://dolby.io/blog/capturing-high-quality-audio-with-python-and-pyaudio/
    - rails 6 and stimulus and search https://medium.com/swlh/instant-search-results-with-rails-6-and-stimulus-ffaf333926b5
  - read recently
    - Martin Fowler on LMAX https://martinfowler.com/articles/lmax.html
    - ten years later https://www.infoq.com/presentations/financial-exchange-architecture/
  - take a look at super https://hostplus.com.au/indexed-balanced

