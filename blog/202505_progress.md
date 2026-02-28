# Progress May 2025

**VS Code Agent Mode Just Changed Everything - Visual Studio Code**

[![
  VS Code Agent Mode Just Changed Everything - Visual
  Studio Code
](
  http://img.youtube.com/vi/dutyOc_cAEU/0.jpg
)](https://youtu.be/dutyOc_cAEU)

- **ask** vs **edit** vs **agent** mode - where agent just does
  the thing like you would.
- demo training cut off date, context can be provided using tools
  (via `#`) so `#fetch` to get docs
- define requirements in a `prd.md` like
  https://gist.github.com/burkeholland/24802296b5bfaaf7fb775c81cd626512#file-prd-md

# **Project Requirements Document: The Urlist Website**

The following table outlines the detailed functional requirements of The Urlist
website.

| Requirement ID | Description               | User Story                                                                                       | Expected Behavior/Outcome                                                                                                    |
|-----------------|---------------------------|--------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| FR001          | Creating a New URL List   | As a user, I want to be able to start a new, empty list so I can begin adding URLs.              | The system should provide a clear way for the user to initiate the creation of a new list, potentially presenting an empty list view or an "add new list" button. |
| FR002          | Adding URLs to a List     | As a user, I want to be able to input or paste URLs into my list so I can compile the resources I want to share. | The system should provide an input field or mechanism for users to enter URLs. Upon submission, the URL should be added to the list. |
| FR003          | Viewing URLs in a List    | As a user, I want to be able to see all the URLs I have added to my list so I can review and manage them. | The system should display the list of added URLs, potentially with their automatically fetched titles and descriptions. |
| FR004          | Editing URLs in a List    | As a user, I want to be able to edit a URL in my list if I made a mistake or if the link has changed. | The system should provide a way for users to modify the URL of an existing item in the list. |
| FR005          | Deleting URLs from a List | As a user, I want to be able to remove a URL from my list if it's no longer relevant or if I added it by mistake. | The system should provide a mechanism for users to delete individual URLs from their list. |
| FR006          | Customizing the List URL  | As a user, I want to be able to choose a custom URL for my list so it's easy to remember and share. | The system should provide an input field where users can specify their desired custom URL. It should also handle cases where the chosen URL is already taken. |
| FR007          | Automatic URL Generation  | As a user, if I don't want to think of a custom URL, I want the system to automatically create one for my list so I can still share it. | The system should generate a unique and shareable URL for the list if the user doesn't provide one. |
| FR008          | Publishing a List         | As a user, I want to be able to publish my list so that others can view the collection of URLs.  | Upon publishing, the list should be saved and made publicly accessible at the associated URL. |
| FR009          | Sharing a List            | As a user, I want to be able to easily share the link to my list with others through various channels. | The system should provide the user with the URL of their list, potentially with options for copying it. |
| FR010          | Accessing a Shared List   | As a recipient, I want to be able to view the collection of URLs by clicking on or entering the shared link. | When a user visits a The Urlist link, they should be presented with the list of URLs. |
| FR011          | Viewing all lists         | As a user, I want to be able to see all the lists I have created so I can manage them easily.    | The system should provide a dashboard or overview page where users can see all their created lists. |
| FR012          | Deleting a List           | As a user, I want to be able to delete an entire list if I no longer need it.                    | The system should provide a way for users to delete their entire list, including all associated URLs. |

- can also help copilot with some best pracitces in a
  .github/copilot-instructions.md like
  https://github.com/burkeholland/the-urlist-web/blob/main/.github/copilot-instructions.md
- MCP (Model Context Protocol) servers to connect to DB
    - https://mcpservers.org/
    - https://mcp.so/

### need to clean up

- https://www.youtube.com/@RyanLPeterman
- https://www.allthingsdistributed.com/now-go-build.html
- https://www.allthingsdistributed.com/2025/02/thinking-like-a-fox-a-reading-list-for-the-future.html
- https://survivalstoic.com/alone-gear-list/
- https://emhub.io/articles/5-steps-to-building-a-healthy-engineering-team-culture
- https://tarotcardsoftech.artefactgroup.com/

- https://www.reddit.com/r/rails/comments/1aokwrh/how_do_ddd_projects_prevent_ar_relationships_from/
- https://github.com/rootstrap/rails-modular-monolith-with-ddd/tree/main-packwerk/components/app_base
- https://www.visuality.pl/posts/bounded-context-ddd-in-ruby-on-rails
- https://www.sitepoint.com/ddd-for-rails-developers-part-1-layered-architecture/
- https://blog.arkency.com/activerecord-repository/

[
RailsConf 2023 - Using Rails Engines to Supercharge Your Team by Austin Story

Ruby Central](https://www.youtube.com/watch?v=ZE9dKoBIr48)
[Brian Scalan - Monolith-ifying perfectly good microservices - Rails World 2023

Ruby on Rails](https://www.youtube.com/watch?v=wV1Yva-Dp4Y)
[Effective Data Synchronization between Rails Microservices - Austin Story

Ruby Central](https://www.youtube.com/watch?v=LxxcHcBU4Bk)
[RailsConf 2023 - Applying microservices patterns to a modular monolith by Guillermo Aguirre](
https://www.youtube.com/watch?v=4zrQAJ0RlI4)

- packwerk presentation
    - https://docs.google.com/presentation/d/1iM1ffdoy6otuBopqGTUTgnOC9nXgrzrcxN6l8xsF13Y/edit?slide=id.g22f905f66dc_0_115#slide=id.g22f905f66dc_0_115
    - https://github.com/rubyatscale
    - https://github.com/gradual-systems/railsconf-workshop
- https://asmaloney.com/2014/01/code/creating-an-interactive-map-with-leaflet-and-openstreetmap/

## Review some repos

- https://github.com/meshtastic/web
- https://github.com/Johnnsonkp/codeBASED
- https://github.com/Johnnsonkp/codebased_server
- https://github.com/ServerlessDevelopers/serverless-rust
- https://github.com/Rust-Web-Development/code
- https://github.com/danielmiessler/SecLists

## Escape rooms

- https://www.reddit.com/r/gamingsuggestions/comments/10xmgj0/best_inbrowser_games_that_can_be_hosted_for_a/
- https://codenames.game/
- https://www.reddit.com/r/javascript/comments/2rj6th/javascript_escape_room_game_ive_been_working_on/
- https://mortoray.com/i-wrote-an-online-escape-game/
- https://learninghypothesis.com/how-to-create-a-digital-escape-room/
- https://medium.com/@decode_the_key/creating-an-escape-room-app-dee5450c2f0f
- https://github.com/AldoAbdn/Escape-Room-Generator
- https://codepen.io/KristopherVanSant/pen/dEZZEN
- https://lockpaperscissors.co/envy
- [How To Make Your Own Virtual Escape Room - Jacob Boesch](
    https://www.youtube.com/watch?v=P7TJX889G-0)

## Music

- blackbird tutorial as used by Tilda
    - **Blackbird Guitar Tutorial - The Beatles Acoustic Guitar Lesson -
      Bissett’s Bits**
    - [
        Blackbird Guitar Tutorial - The Beatles Acoustic Guitar Lesson -
        Bissett’s Bits
    ](https://www.youtube.com/watch?v=Y8RRhc9fBCU)
- shape of my heart
    - **Dominic Miller Plays “Shape of My Heart” and More! - Vintage Guitar**
      [
        Dominic Miller Plays “Shape of My Heart” and More! - Vintage Guitar
      ](https://www.youtube.com/watch?v=OXFNqf8hLj0)
    - **Shape Of My Heart Guitar Tutorial Sting Guitar Lesson |Fingerpicking| - GuitarZero2Hero**
      [
        Shape Of My Heart Guitar Tutorial Sting Guitar Lesson |Fingerpicking| -
        GuitarZero2Hero
      ](https://www.youtube.com/watch?v=JTMEAMa4sUE)
- **Metallica Nothing Else Matters Guitar Lesson Part 1 - Marty Music**
    [Metallica Nothing Else Matters Guitar Lesson Part 1 - Marty
    Music](https://www.youtube.com/watch?v=7silbMA9UME)


## MCP - Model Context Protocol

**Model Context Protocol (MCP), clearly explained (why it matters) - Greg
Isenberg**
[
    Model Context Protocol (MCP), clearly explained (why it matters)
](https://youtu.be/7j_NE6Pjv-E)

- https://github.com/modelcontextprotocol
- https://modelcontextprotocol.io/introduction
- https://mcp.so/
- https://deeplp.com/f/mcp-vs-langchain-choosing-the-right-ai-framework
- [LangChain vs. MCP — How They Work, When to Use Them, and Why They Matter -
  Jalaj Agrawal](
  https://medium.com/@jalajagr/langchain-vs-mcp-how-they-work-when-to-use-them-and-why-they-matter-171c5b6fab1c)

## Rails related

- https://play.battlesnake.com/
- parallel processing
    - https://github.com/grosser/parallel
    - https://ruby-doc.org/core-2.5.9/Thread.html
    - https://thoughtbot.com/blog/my-adventure-with-async-ruby
    - https://blog.saeloun.com/2022/03/01/ruby-fibers-101/
    - https://blog.dnsimple.com/2018/05/simple-async-map-reduce-queue-for-ruby/
    - https://www.codeotaku.com/journal/2024-09/interactive-rails/index
- import maps https://radanskoric.com/articles/rails-assets-combine-importmaps
- https://www.codewithjason.com/what-is-a-rails-model/
- https://www.codewithjason.com/code-without-service-objects/

- A11y testing
    - https://github.com/dequelabs/axe-core
- Pull Requests
    - https://angiejones.tech/ten-commandments-code-reviews/#
    - https://blog.thecodewhisperer.com/permalink/whats-not-to-like-about-this-code-1
    - https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/about-rulesets
    - https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository
    - https://github.com/axolo-co/pull_request_template
    - https://pre-commit.com/
    - https://www.sonarsource.com/products/sonarqube/
    - https://www.multitudes.com/
    - https://www.qodo.ai/products/qodo-merge/
- manage your dotfiles
    - https://www.chezmoi.io/
- run github actions locally
    - https://github.com/nektos/act
- recommender systems
    - https://github.com/jihoo-kim/awesome-RecSys
- HTML aware ERB
    - https://marcoroth.dev/posts/introducing-herb
- **Eileen Uchitelle - The Myth of the Modular Monolith - Rails World 2024**
    [
    Eileen Uchitelle - The Myth of the Modular Monolith - Rails World 2024
    ](https://www.youtube.com/watch?v=olxoNDBp6Rg)
- React markdown
    - https://github.com/remarkjs/react-markdown?tab=readme-ov-file#what-is-this
- list of free software
    - https://github.com/awesome-selfhosted/awesome-selfhosted?tab=readme-ov-file
    - Accounting
        - https://bigcapital.app/
        - https://github.com/bigcapitalhq/bigcapital

- AoC solutions
    - https://github.com/careyi3/aoc_2024/tree/master/solutions/24
    - https://github.com/phene/advent-of-code/blob/main/2024/24/graph.svg
    - https://github.com/phene/advent-of-code/blob/main/2024/24/24.rb
- Packwerk
    - https://railsatscale.com/2024-01-26-a-packwerk-retrospective/
    - https://leanpub.com/package-based-rails-applications
    - https://revs.runtime-revolution.com/gradual-modularization-for-ruby-and-rails-4ad25cc58bdf
    - https://github.com/gradual-systems/railsconf-workshop
    - https://github.com/alexevanczuk/packs
    - https://github.com/rubyatscale

## Hardware

- dongle for zigbee
    - https://vi.aliexpress.com/item/1005007089589385.html
- Recommended soldering iron "gvda soldering iron"
- boost regulators - https://www.pololu.com/category/132/step-up-boost-voltage-regulators
- FPGA
    - https://nandland.com/the-go-board/
- BTC miner on ESP32??
    - https://github.com/NMminer1024/NMMiner
- https://planetscale.com/case-studies/cash-app
- Proxmark3 on Mac via branch
    - https://github.com/RfidResearchGroup/proxmark3/blob/master/doc/md/Installation_Instructions/macOS-Homebrew-Installation-Instructions.md
    - https://github.com/RfidResearchGroup/proxmark3?tab=readme-ov-file
- all the conferences
    - https://cfp.watch/conferences/
- hackberry Pi zero
    - https://www.tomshardware.com/raspberry-pi/the-hackberry-pi-zero-is-a-tinker-tool-for-hackers-that-fits-in-your-pocket
    - https://www.tindie.com/products/zitaotech/hackberrypi-cyberdeck-handheld-with-q20-keyboard/
    - https://github.com/ZitaoTech/Hackberry-Pi_Zero
- LoRaWAN adapter
    - https://wiki.dragino.com/xwiki/bin/view/Main/User%20Manual%20for%20LoRaWAN%20End%20Nodes/LA66%20USB%20LoRaWAN%20Adapter%20User%20Manual/#H1.5A0Example:Send26GetMessagesviaLoRaWANinPC
- https://www.geotech1.com/pages/metdet/projects/matchless/matchless300c.pdf
- Dragino LA66 USB LoRaWAN
    - https://vi.aliexpress.com/item/1005005361790633.html
- Dragino TrackerD LoRaWAN
    - https://vi.aliexpress.com/item/1005005403549469.html
- 433MHz coil loaded antenna
    - https://www.instructables.com/433-MHz-Coil-loaded-antenna/
    - https://randomnerdtutorials.com/rf-433mhz-transmitter-receiver-module-with-arduino/
    - https://forum.arduino.cc/t/solved-antenna-doubt/362673/15
    - https://vi.aliexpress.com/item/1005008375909513.html
- Lilygo T-Glass AR glasses ESP32
    - https://vi.aliexpress.com/item/1005008354604045.html
- 12V 3S Power Wall 18650 battery box
    - https://vi.aliexpress.com/item/4000648416374.html
    - and batteries - https://vi.aliexpress.com/item/1005006860256662.html
- Lilygo T-Keyboard ESP32
    - https://vi.aliexpress.com/item/1005004182998265.html
- Lilygo TTGO Mestastic T-echo LoRa
    - https://vi.aliexpress.com/item/1005003026107533.html
- sparker
    - https://quartzcomponents.com/blogs/electronics-projects/diy-electric-arc-lighter?srsltid=AfmBOoqDaTotCDG_hVwS2to-UyS5nC673IMWULE2_updhun4Sjm8NzoB
- 27MHz toy remote controls
    - https://www.aliexpress.com/w/wholesale-27mhz-remote.html?spm=a2g0o.productlist.search.0
    - https://www.electro-tech-online.com/threads/making-27mhz-duplicate-toy-car-transmitter.22689/
    - https://www.google.com/search?q=27mhz+diy+controller
    - https://www.aliexpress.com/w/wholesale-ad9850-dds.html
    - https://www.riyas.org/2014/06/computer-controlling-27mhz-remote-control-car-ad9850-dds.html
    - RC Speed Poo + tear down GrandadIsAnOldMan - https://www.youtube.com/watch?v=yPnLl7WFSIA
- camera
    - https://vi.aliexpress.com/item/1005008075604131.html

## Outdoors

- hardware store Bow and Arrow build challenge
    - [Hardware Store Bow and Arrow Build Challenge - Benjamin Stevens](
    https://www.youtube.com/watch?v=k28TJWMH0V4)
- [Making a Fully Functional Jet Engine using Soda can | diy Jet Engine | Top 2
  Jet Engine designs
    ](https://www.youtube.com/watch?v=OOMvJRqZMjc)
- [I FINALLY Built Myself a Kayak, from (mostly) Trash - Jackman Works](
    https://www.youtube.com/watch?v=rfmRHSukCHY)
- [Stepped Airfoils for Model Airplanes - Are They Better? - Design Your Own
  Airplanes](https://www.youtube.com/watch?v=AT6d3Jk7CeY)
- [My Kickstarter failed, so I open sourced it - StuckAtPrototype](
    https://www.youtube.com/watch?v=6jzG-BMannc)

## Slackdump

interesting tool to download and analyse slack content, number of messages,
sentiment etc.

- https://github.com/rusq/slackdump
- https://github.com/huytd/slack-save-plugin
- https://github.com/sebseager/slack-exporter

## Coupling

From DDD Europe

* good overview of coupling and it's inherent part of system design
* coupling models and levels of **complexity** from Structured Design,
  **levels**: content, common, external, control, stamp and data complexity
    * _any talk that mentions Edward Yourdon, Structured Design is a winner_
* **connascence layers: static** - name & type, meaning, algorithm, position and
  **dynamic**: execution, timing, value, identity
* to drive out Vlad Khononov model of
    * Strength: intrusive, functional, model, contract
    * Volatility: how often does it change
    * Distance: statement, method, class, namespace, component, (micro)
      service, system
* `Pain = 𝑓(S * V * D)`

**Balancing Coupling in Software Design - Vlad Khononov - DDD Europe 2023**
[
    Balancing Coupling in Software Design - Vlad Khononov - DDD Europe 2023
](https://youtu.be/KTy4rqgPOjg)

example:

* having duplicate logic to calculate something (functional strength) in the
  same class (class distance) in a CSV importer (low volatility as pretty
  generic and likely not core functionality)
* may not be as coupled as...
* Referencing models (model strength) across packwerk packs (component
  distance) in core business flow (high volatility as core functionality
  and often changing)

interview about a recent book on this topic by that presenter

**Balancing Coupling in Software Design - Vlad Khononov - DDD Europe 2023**
[
    Balancing Coupling in Software Design: Universal Design Principles for
    Architecting Modular Software Systems
](https://youtu.be/_9vi70yFBDg)

Vlad also wrote the classic:
* [Learning Domain-Driven Design: Aligning Software Architecture and Business
  Strategy](
  https://www.goodreads.com/book/show/57573212-learning-domain-driven-design)

the interview seems more of a puff piece:
* coupling is a way to shoot yourself in programming back in the 60's and 70's
  (Structured Design days) as well as now in Microservices days
* a bit of a discussion of how he distilled these old ideas into the modern
  view of integration strength
* assessing complexity to have more educated estimation
* ideas of local vs global complexity and how important that is in getting
  microservices right

book also covers [Cynefin
framework](https://en.wikipedia.org/wiki/Cynefin_framework)
which is also useful in categorising complexity in things like software
systems:
* **clear** - you know how to do it and you do it
* **complicated** - you may need to reach out to an expert to get it done
* **complex** - unknown unknowns, need to run experiments to work out cause and
  effect, how users interact with a system or when the contract between two
  systems is not clear
* **chaotic** - even running experiments does not yield the same result each
  time


DDD Aggregate
**The One Question To Haunt Everyone: What is a DDD Aggregate? - Thomas Ploch - DDD Europe 2022**
- https://www.youtube.com/watch?v=zlFqjD2LKlE

Balancing Coupling in Software Design - Vlad Khononov - NDC Oslo 2023
- https://www.youtube.com/watch?v=eQOM-UrNTS4

## Visual Collaborative modelling

- https://leanpub.com/visualcollaborationtools
- https://davidsibbet.com/visual-meetings-book/

**Visual and Collaborative Modelling - Kenny Baas-Schwegler - DDD Europe 2020**
[
    Visual and Collaborative Modelling - Kenny Baas-Schwegler - DDD Europe 2020
](https://youtu.be/5RrEzJM5bdw)

## On AI

- [AI Engineering Isn't Magic, It's Method: Key Strategies for Building Better
  Software Faster - Nick Baumann - May 16, 2025](
  https://cline.bot/blog/ai-engineering-isnt-magic-its-method-key-strategies-for-building-better-software-faster)

## Anime JS from Matt G.

- https://animejs.com/

## From NDC Melbourne

- https://connell.dev/

## Light Phone III

- https://www.thelightphone.com/shop/products/light-phone-iii

## Block chain

Talked to an uber driver who did a bunch of research and said to get into
"utility coins" that have `ISO20022` certification

- https://101blockchains.com/iso-20022-compliant-crypto-list/

## Accurate navigation

How the islanders navigated accurately using certain stars and when they rise
and set, does require seeing the horizon

- https://en.wikipedia.org/wiki/We,_the_Navigators
- https://www.amazon.com.au/We-Navigators-Ancient-Landfinding-Pacific/dp/0824815823
- https://www.goodreads.com/book/show/758833.We_the_Navigators

## Books

related to code quality and the "coupling" books above

- https://pragprog.com/titles/atcrime2/your-code-as-a-crime-scene-second-edition/

## Minature kites

for scouts badge that would work in a small park maybe

- https://miniatures.kitingusa.com/
- https://www.instructables.com/Mini-Kite/
- https://www.my-best-kite.com/miniature-kites.html
- https://www.amazon.com.au/Miniature-Kite-Plans-build-kites/dp/169886728X
- https://tra.extension.colostate.edu/wp-content/uploads/sites/9/2021/09/Mini-Kite-Designs.pdf

## Distributed consensus problem

- https://news.ycombinator.com/item?id=39676493
- https://mark-burgess-oslo-mb.medium.com/using-promise-theory-to-solve-the-distributed-consensus-problem-4cc2116f24e1

## Everything event sourcing

- https://eventmodeling.org/
- https://podcast.eventmodeling.org/
- https://leanpub.com/eventmodeling-and-eventsourcing

## Outdoors

- big saw
    - [Silky Saws Big Boy Curve 360mm Outback $175.00](
    https://www.woodtamer.com.au/products/copy-of-big-boy-folding-saw-360mm)

## Books other

supposedly a good read:

- https://www.amazon.com.au/Anita-Loos-A-Biography/dp/0747502943
    - https://www.goodreads.com/book/show/2128901.Anita_Loos
