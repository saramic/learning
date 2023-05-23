# Progress May 2023

## Tue 23rd

- on Kafka
    - https://medium.com/lydtech-consulting/kafka-transactions-part-1-exactly-once-messaging-9949350281ff
        - seems like exactly once delivery is for any downstream delivery of
          related messages and the processing may still happen many times on an
          application
    - https://medium.com/lydtech-consulting/kafka-idempotent-consumer-transactional-outbox-74b304815550
        - Coupling the Idempotent Consumer using the data flush strategy with
           the Transactional Outbox and CDC provides the gold standard in
           managing duplicate messages in applications using Kafka for
           distributed messaging
    - https://medium.com/lydtech-consulting/kafka-idempotent-producer-6980a3e28698
        - seems to be a setting to jsust turn on
    - https://www.confluent.io/resources/top-3-use-cases-for-real-time-streams-in-financial-services-architectures/
        - could download a white paper but it sounds like the core 3 uses for
          data streaming are
            1. Customer 360
            2. Real-time fraud detection
            3. Mainframe offloading and modernisation
    - https://www.confluent.io/industry-solutions/financial-services/
        - fraud detection
        - cyber and regulatory compliance
        - real-time trading
        - hyper personalisation
        - nothing really for transactional acccount to account payments???
    - https://www.kai-waehner.de/blog/2021/01/18/apache-kafka-financial-services-industry-open-banking-api-finserv-payment-fraud-middleware-messaging-transactions/
        - FinServ as a term
        - again no transactionality but mostly becoming event drive, user
          analytics, fraud detection etc
    - https://www.kai-waehner.de/blog/2023/04/04/the-state-of-data-streaming-for-financial-services-in-2023/
        - BaaS - Banking as a Service
        - again examples of personalisation, analytics with Kappa Architecutre
        - a little mention of payment processing
    - https://pandio.com/5-ways-financial-institutions-can-use-event-streaming/
        - increased customer engagment
        - fraud detection, risk assessment
        - single view of business
    - https://dzone.com/articles/decentralized-data-mesh-with-apache-kafka-in-financial-services
        - mentions transactions at any scale
    - https://www.slideshare.net/ConfluentInc/transforming-financial-services-with-event-streaming-data
        - personalisation
        - big data analytics
        - unified digital experience
        - trading platform
    - https://www.openlogic.com/blog/kafka-stream-processing
        - case study of OpenLogic - https://www.youtube.com/watch?v=bflk3nCbTtY ?
            - 5.3 M messages / minute - 5 second latency
            - Streaming records for set-top boxes and records around real time
              events for 150M customers - analytics

## Wed 3rd

- [x] https://medium.com/@jankammerath/how-kubernetes-and-kafka-will-get-you-fired-a6dccbd36c77
    - how does Kafka on K8s rate vs plain old AWS API Gateway, SQS, SNS
    - especially the TCO (Total cost of ownership)
    - and for small teams
    - as well as to tune it to high availability numbers
- System Design Primer - good resource for learning how to whiteboard
    - https://github.com/donnemartin/system-design-primer
- [ ] (How to Get Started with OpenTelemetry - NGINX)[https://www.youtube.com/watch?v=Txe4ji4EDUA]
- Anton's open telemetry sandbox
- alternatives to screen share iPhone and Android
    - https://www.airsquirrels.com/reflector
    - https://www.vysor.io/
- Tejas page on vercel with liveblocks
    - https://liveblocks-three.vercel.app/
    ```
    background-image: url("https://user-images.githubusercontent.com/278723/233741198-0d9c3bd3-6457-4eba-b792-5c544a2fda21.jpg");
    ```
- hack for fun with retool
    https://failuredriven.retool.com/
    ```
    NUM=1 curl --request POST \
      'https://api.retool.com/v1/workflows/8f5cc16e-91c3-4700-8c76-0a9dc852e915/startTrigger?workflowApiKey=retool_wk_fe0a2cd51672427a8aacf35d33b26d20' \
      --data-raw "{\"email\":\"selenawiththetatto+${NUM}@gmail.com\",\"full_name\":\"Selena Smells\"}" \
      -H "Content-Type:application/json"

    # and later wrapped with
    for NUM in {10..1000} do; curl ... done;
    ```
- how does mruby-mqtt deal with no threading?
    - https://github.com/hiroeorz/mruby-mqtt/tree/master/src
- Ruboto
    - https://github.com/ruboto/ruboto
    - http://ruboto.org/downloads/
        - RubotoCore-release-1.0.5.apk
    - https://github.com/ruboto/ruboto-irb
        - via https://github.com/ruboto/ruboto-irb/tree/master/dist
        - IRB-0.9.1.apk
    - the group https://groups.google.com/g/ruboto/c/Al7aKy3KH9A
- for link shortner look at a prescribed series of numbers with
  - https://en.wikipedia.org/wiki/Linear_congruential_generator
- ESP-IDF toolchain
    - setup https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html
    - VSCode extension https://github.com/espressif/vscode-esp-idf-extension/blob/master/docs/tutorial/install.md
- look at curses
    - https://stackoverflow.com/questions/7078973/an-analogue-of-ncurses-for-jruby-running-in-browser
    - https://www.ruby-forum.com/t/curses/245981
    - https://github.com/seanohalpin/ffi-ncurses
    - https://sourceforge.net/projects/javacurses/
    - http://graysoftinc.com/terminal-tricks/basic-curses
- terminal width why is io/console not always there?
    - https://stackoverflow.com/questions/2068859/how-to-get-the-width-of-terminal-window-in-ruby
    - `stty size` ? https://stackoverflow.com/questions/263890/how-do-i-find-the-width-height-of-a-terminal-window
    - mouse click? https://stackoverflow.com/questions/11301883/using-ncurses-to-capture-mouse-clicks-on-a-console-application
    - https://github.com/ruby/curses
    - https://www.2n.pl/blog/basics-of-curses-library-in-ruby-make-awesome-terminal-apps
- WIFI QR code
    - decoded from RailsConf via https://zxing.org/w/decode
```
Decode Succeeded
Raw text	        WIFI:T:WPA;S:railsconf;P:@rubycentral;H:;;
Raw bytes	        71 a4 2a 57 49 46 49 3a   54 3a 57 50 41 3b 53 3a
                    72 61 69 6c 73 63 6f 6e   66 3b 50 3a 40 72 75 62
                    79 63 65 6e 74 72 61 6c   3b 48 3a 3b 3b 00 ec 11
                    ec 11 ec 11 ec 11 ec
Barcode format	    QR_CODE
Parsed Result Type	WIFI
Parsed Result	    railsconf
                    WPA
                    @rubycentral
                    false
```
- more conferences
    - https://www.renderatl.com/links
    - https://shift.infobip.com/
- developer advocate role https://jobs.flightcontrol.dev/developer-advocate
>   🛫
>   Developer Advocate/Educator at a Calm, Ambitious DevTools Startup
>
>   https://www.flightcontrol.dev
>
>   Flightcontrol is a 6 person devtool startup cofounded by the creator of
>   Blitz.js. We’re not the macho, overworked team that “startup” might bring
>   to mind. We’re intentionally building the most life-giving and fulfilling
>   company possible, and we want you to join us! :)
>
>   notion image
>   notion image
>   notion image
>   notion image
>
>   Photos from our last retreat in Italy — contrary to appearances, we also
>   did real work :)
>   Flightcontrol is transforming the app deployment landscape
>   Flightcontrol provides the deployment experience of a Platform-as-a-Service
>   but without the limitations.
>   Traditionally, users had to choose between a PaaS like Heroku, which is
>   easy to use but is a closed-box with limitations and restrictions, or AWS
>   which gives you full power and control but is a royal pain to set up. But
>   with Flightcontrol they get the best of both worlds: great developer
>   experience and full control and scalability
>
>   Our product is so compelling that most of our users are migrating existing
>   applications from Heroku, Render, Railway, Vercel and from custom AWS
>   setups.
>
>   Before you cringe at our current design, know that we are currently working
>   with Overnice to completely overhaul our brand design, marketing site, and
>   UI/UX. So rest assured, you’ll soon have world-class brand materials to
>   work with :)
>   Since launching in January 2022, over 350 users have deployed 30,000+ times
>   Users of all sizes love the product, from solo indie hackers to enterprises
>   We went through Y Combinator in W22 and have raised $3.5M.
>   We’re default alive — on track to become profitable this year
>   Intrigued? Read more about our company here.
>   Deployments Per Month
>   notion image
>
>   Meet Our Team
>
>   Brandon Bayer, Cofounder and CEO. Dayton, Ohio. You might know me as the
>   creator of Blitz.js. Although highly technical, my strengths are product
>   design and marketing. My superpower is simplicity. My top values that
>   define everything I do are excellence, equality, inclusion, and freedom.
>   Outside of work I love traveling, flying airplanes and helicopters, and
>   rock climbing. My intention is to build the best company to work for in the
>   world. I’m here to support you and help make your dreams come true.
>
>   Mina Abadir, Cofounder and CTO. Toronto, Canada. Mina is the technical
>   genius that brings our core product features to life. He’s deeply authentic
>   and caring, loves to laugh, and greatly enjoys a good video game. His
>   superpower is empathy.
>
>   Blake Bayer, Junior Software Engineer. Dayton, Ohio. Formerly a nurse,
>   Blake joined at the end of April. This is his first job in tech, and he
>   continually impresses everyone on the team with his ability to learn and
>   implement complex things quickly. He loves rock climbing and learning new
>   things.
>
>   Camila Rondinini, Senior Backend Software Engineer. Spain. Since joining
>   this past June, she is already an extremely foundational part of our team,
>   having designed and shipped some of our most important features. She’s an
>   incredible engineer and has made a massive impact on our engineering
>   culture.
>   Kayla Sween, Senior Software Engineer. Mississippi. She started January 30! 🤗
>   Jeff Linwood, Senior Developer Advocate. Texas. He started February 20! 🤗
>   You? 😉
>   Interns
>   Siddharth Suresh, Part-Time Blitz Maintainer Intern. India.
>
>   We need you to help us grow through awareness & education
>
>   As one of our first two devrel hires, this is your chance to really shine
>   and help propel Flightcontrol into one of the most loved developer
>   companies of this decade. This is a critical role in shaping Flightcontrol
>
>   We want to become known as the cloud education company. The place where all
>   devs turn to become maestros of the cloud. We believe that most engineers
>   are intimidated by cloud because 1) they don’t understand it and 2) they
>   don’t have good tooling. We’re already working on the tooling, now we want
>   to work on the education. We want to make cloud fun, understandable, and
>   accessible to an entirely new generation of developers.
>
>   Essential Responsibilities
>
>   Deeply understand our product, its strengths and weaknesses
>   Create and distribute compelling technical content, including
>   documentation, education, guides, demos, and videos
>   We care about quality over quantity
>   Secondary Responsibilities
>
>   Help with customer success. As a small team, we all share this
>   responsibility. Helping with this is one of the best ways to understand
>   nitty-gritty details of our product, product improvement ideas, and
>   documentation ideas.
>   A customer recently said that we “have amazing support and developer
>   success” and that it provides a tremendous amount of value to them
>   Possibly, but not required: represent Flightcontrol at events
>   Identifying relevant events for Flightcontrol and organizing our
>   participation (meetups, conferences, hackathons, workshops, etc.),
>   Ideally participating in 4-8 of these events per year, as a speaker or sponsor
>   Identify and work on collaborations and integrations with other companies
>   and projects
>   Example: how to use Flightcontrol preview environments to run isolated
>   Cypress e2e tests
>
>   Requirements
>
>   1 year full-time devrel experience
>   2 years full-time software engineering experience and are comfortable with
>   fullstack
>   Some knowledge of basic AWS services like EC2, S3, RDS, Lambda
>   Teacher — can explain complex things in as simple a manner as possible
>   Writer — great at writing technical content, ideally for 1+ years
>   Grit — can ship content consistently over time through thick and thin
>   Empathy — can learn and understand what’s important to developers and
>   engineering organizations
>   Credible — produces content that acknowledges the trade-offs and
>   complexities of the real world
>   Can overlap with 9a-noon US Eastern time (EST) . You can work from anywhere
>   in the world, but we have our company wide meetings in the 9a-12p EST time
>   range.
>   Nice to have
>   2+ years full-time devrel experience
>   Experience in the AWS or cloud space
>   Great at creating videos
>   Conference speaking experience
>   Great knowledge of the application hosting/deployment ecosystem
>   Able to work with basic demos in several programming languages
>   Experience with our stack: Typescript, React, Next.js
>
>   You Are Someone Who
>
>   Is Kind. We are a team that seeks to work really well together by building
>   deep relationships. We have each other’s backs. We care about and check in
>   on each other, and we enjoy being together. We have company retreats 2-3
>   times per year for a week at a time.
>
>   Is Collaborative. We all work closely together to design and develop the
>   best product possible. We want someone who is humble but will bring your
>   own ideas on how to be more excellent.
>
>   Takes Ownership. We offer significant equity because we want you to think
>   at a higher level than just your daily tasks. We want you to help us shape
>   the business. We need someone who loves to dig in and do what it takes to
>   figure things out. And we want someone who is good at turning vague ideas
>   into magnificence.
>
>   Has a Growth Mindset. It matters more where you are going than where you
>   are today. We’re looking for someone who loves to grow, improve, and learn
>   new things.
>
>   Your Typical Week at Flightcontrol
>
>   On Monday, depending on your timezone, you’ll start your morning or
>   afternoon with a coffee chat where everyone is together for causal
>   conversation. After that, you’ll join our Flightcontrol planning session
>   with the entire Flightcontrol product team.
>
>   Tuesday is a normal work day, and may have some specific project meetings.
>   On Wednesday you’ll have your weekly 1 on 1 with Brandon, the CEO. This is
>   your time to ask for what you want, bring up issues, ask hard questions,
>   and give and receive feedback. Brandon takes feedback very seriously and is
>   quick to make needed changes.
>   Thursday and Friday are your time for deep work.
>
>   Aside from being available 9a-12p EST, your work hours are flexible and up
>   to you. Some of us work a standard 9-5 type of deal while others have
>   varying schedules.
>
>   You’ll collaborate with Brandon as much as is needed.
>
>   Since we’re a startup, the journey from idea to building to shipping to
>   growing is certainly a bit of a roller coaster. But we're all on the roller
>   coaster together, learning and iterating as quickly as we can. As long as
>   we stick to our values and show up for each other with curiosity,
>   compassion, and collaboration, we can likely overcome just about anything
>   together.
>   Every month we have a tech-debt cleanup day. Every other month we have a
>   company hackathon.
>
>   You Can Grow With Us
>
>   We want you to grow with us as much as you desire. As we scale, you’ll be
>   able to grow into almost any role you can imagine. Want to become a team
>   lead? We’ll help train you. Want to become a manager? We’ll make it happen.
>   Want to be an executive? Let’s figure that out. We want you to be with us
>   as long as you are extremely happy. If we get to place were you aren’t
>   happy, we’ll do everything we can to help you find a place where you are.
>
>   Our Code of Excellence
>   Go above and beyond. We’re not here to half-way do anything. If we’re going
>   to do something, we’re going to do a stellar job.
>   Tell the truth even when it hurts. We don’t tell white lies, and we don’t
>   deceive. Even when it costs.
>   Take care of you and yours first, work second. Nothing matters more than
>   family and close relationships. We never sacrifice them for work.
>   Treat people better than they deserve. Kindness and generosity guides how
>   we treat everyone, including teammates and customers.
>   Give and receive feedback. Feedback is essential for growth. We highly
>   value giving and receiving informal, constructive feedback between all
>   members of the team, and then taking prompt action on that feedback.
>   Have a life outside work. It can be anything, hobbies, side projects,
>   reading, etc. As long as you have something and work isn’t all you live
>   for.
>   Eradicate stress. Stress is a killer, and we work to eliminate it through
>   any means, including systems, exercise, and meditation.
>   Nothing is impossible. We believe we can create any future we imagine, and
>   we lean into solving the things that seem impossible.
>   Build a legacy. We are here to do our very best work. Work that will
>   inspire generations for years to come.
>
>   Salary & Benefits
>   Salary: $110k — $145k USD (same as our engineering roles)
>   0.75% — 1% Equity Stock Options. You’ll be a $20+ millionaire if our growth
>   continues like it is
>   Minimum 4 Weeks PTO - It's critical to have good work life balance, so you
>   must take at least 4 weeks PTO each year.
>   Fully Remote
>   Health Insurance Fully Paid For
>   Menstrual Leave - There's no use trying to be productive when you are
>   suffering. Take the day(s) off as PTO, no explanation needed.
>   Parental Leave - 12 weeks paid time off regardless of parental role or gender
>   Unlimited Sick Leave - If you are feeling crappy, you aren't going to be
>   doing your best work. So rest, get better, then come back energized.
>   401k - We’re still working out the details on this, but will get it nailed
>   down asap if it’s important to you
>   2+ In-Person Company Retreats Per Year
>   Open Source - We are passionate about open-source and encourage you to
>   contribute on company time to anything that will benefit the company.
>   Equipment - We'll make sure you have all the equipment you need to have an
>   ergonomic, productive environment, including a standing desk and external
>   monitors.
>   Conferences - We're a big fan of in-person conference experiences, and
>   encourage you to speak at and attend them. We'll fully pay for you to
>   attend 2 conferences per year.
>   Education - Budget for books or courses that are at least tangentially
>   related to your work.
>
>
>   🔥
>   Please apply here 👉 https://airtable.com/shrPet5euUinQ0uP4 👈
>
>   Our process:
>   You submit the application
>   45 minute zoom with Brandon, CEO
>   45 minute zoom with Mina, CTO
>   45 minute technical interview with Camila
>   Bring a project you are proud of and talk through it
>   1 hour zoom with Brandon, CEO — a deep dive on your experience, devrel
>   strategy, tactics, and information architecture
>   Another short call with Brandon for both of us to ask and answer questions
>   in preparation for making an offer
