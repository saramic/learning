# Progress Sep 2024

backing up data from Herkou

naive dump
```sh
heroku run bin/rails runner \
    'puts User.all.map{_1.attributes.to_json}' > users_table_dump.json
```

following Heroku artilce
* https://devcenter.heroku.com/articles/heroku-postgres-import-export

heroku pg:backups:capture --app matilda-party-quotes
heroku pg:backups:download --app matilda-party-quotes
mv latest.dump matilda-party-quotes.latest.dump

heroku pg:backups:capture --app kamil-party-quotes
heroku pg:backups:download --app kamil-party-quotes
mv latest.dump kamil-party-quotes.latest.dump

heroku pg:backups:capture --app pairwithme
heroku pg:backups:download --app pairwithme
mv latest.dump pairwithme.latest.dump
```
    
but to restore needed same version so check

```sh
pg_restore --version
heroku run pg_restore -- --version
```

bumped local postgres to 16

```sh
brew services list
brew servcies stop postgresql@14

# also needed this to get around ICU
#   https://stackoverflow.com/a/78870143/1564635
export PKG_CONFIG_PATH="/opt/homebrew/opt/icu4c/lib/pkgconfig"
MAKELEVEL=0 brew install postgresql@16

brew services start postgresql@16

# and also ASDF as that is used for the pg_restore script
MAKELEVEL=0 asdf install postgres 16.4

asdf local postgres 16.4
```

now I could restore

```sh
pg_restore --verbose --clean --no-acl --no-owner -h localhost \
    -d matilda_party_quotes_development matilda-party-quotes.latest.dump

DB_NAME=matilda_party_quotes_development bin/rails s

pg_restore --verbose --clean --no-acl --no-owner -h localhost \
    -d kamil_party_quotes_development kamil-party-quotes.latest.dump

DB_NAME=kamil_party_quotes_development bin/rails s
```

with a little tweaking of bucket names, all seemed OK 👌

## more on ProxMox

[
My Proxmox Home Server Walk-Through: Part 1 (TrueNAS, Portainer, Wireguard)
- Hardware Haven
](https://www.youtube.com/watch?v=_sfddZHhOj4)


## rust

[
RustConf 2021 - Writing the Fastest GBDT Library in Rust by Isabella Tromba Rust
](https://www.youtube.com/watch?v=D1NAREuicNs)


[
So You Want to Build An Event Driven System? - James Eastham - NDC Oslo 2024 -
NDC Conferences
](https://www.youtube.com/watch?v=-jgB3aGGIKc)

[
Process Kinesis Streams with AWS Lambda & Rust - James Eastham
](https://www.youtube.com/watch?v=yd0iUPMG-DM&list=PLCOG9xkUD90KQ1IPQT_m1NbPRXXRFb63s&index=13)

- https://github.com/ServerlessDevelopers/serverless-rust/tree/main/templates/patterns/messaging-patterns/kinesis-message-processor/lambdas
- https://github.com/ServerlessDevelopers/serverless-rust
- https://saramic.github.io/learning/learning/update/serverless/rust/2024/05/15/learning-serverless-rust.html
- https://github.com/jeastham1993/rust-on-serverless/tree/main
- https://github.com/jeastham1993?tab=repositories
- https://github.com/jeastham1993/serverless-rust.github.io/tree/main/templates/patterns/messaging-patterns
- https://github.com/jeastham1993/zero-to-production-rust
- https://github.com/jeastham1993/rust-on-serverless

[
I spent 18 months rebuilding my algorithmic trading platform in Rust. I’m
filled with regret.
](https://medium.com/codex/i-spent-18-months-rebuilding-my-algorithmic-trading-in-rust-im-filled-with-regret-d300dcc147e0)

## comp sci

[
Measuring Coupling and Cohesion In Object-Oriented Systems Martin Hitz, Behzad Montazeri
](http://www.isys.uni-klu.ac.at/PDF/1995-0043-MHBM.pdf)

## bitmaps

[
rust roaring bitmaps
](https://docs.rs/roaring/latest/roaring/)

## RxJS

[
TOP 6 Mistakes in RxJS code - Decoded Frontend
](https://www.youtube.com/watch?v=OhuRvfcw3Tw)

## Zig

and YouTube scraping yt2mp3 style, as well as music finger printing

[
A Systems-Minded Approach to Creating a Music Player Application by Andrew
Kelley - TigerBeetle
](https://www.youtube.com/watch?v=SCLrNqc9jdE)

## Other

- [ ] https://strada.hotwired.dev/
- [ ] https://sourcegraph.com/blog/dev-tool-time-theprimeagen

[
Enhancing Netflix Reliability with Service-Level Prioritized Load Shedding
](https://netflixtechblog.com/enhancing-netflix-reliability-with-service-level-prioritized-load-shedding-e735e6ce8f7d)

[
So Long Secure Coding - Practical Steps for Securing the entire SDLC - Laura
Bell Main - NDC Conferences
](https://www.youtube.com/watch?v=hDvz8KivY_U)

[
How I used GitHub Projects to move my house - Michelle "MishManners" Duke - NDC
Conferences
](https://www.youtube.com/watch?v=UY8pXVBtG5Q)

[
Front End Testing with GitHub Actions - Amy Kapernick - NDC Sydney 2024 - NDC
Conferences
](https://www.youtube.com/watch?v=586OdcFyccs)

[
HTMX: Why You Don't Always Need a SPA Framework - Duncan Hunter - NDC Sydney
2024 - NDC Conferences
](https://www.youtube.com/watch?v=KbIrMpccdbI)

[
TDD & DDD from the Ground Up (Live Coding) - Chris Simon - NDC Sydney 2024 -
NDC Conferences
](https://www.youtube.com/watch?v=IP71G44pQLE)

[
I Connected My Farm To The Internet. Now What? - Lars Klint - NDC Sydney 2024 -
NDC Conferences
](https://www.youtube.com/watch?v=okqngjyTW88)


## FPGA

- [ ] [A High-Level Gameplan To Start Playing With FPGAs
      ](https://rtpg.co/2020/04/26/fpga-getting-started.html)
- [ ] https://www.reddit.com/r/FPGA/comments/1bbn6rl/how_to_get_into_hft_fpga_jobs/
- [ ] https://www.reddit.com/r/FPGA/comments/cp33rf/working_w_fpga_in_hft/
- [ ] [In Pursuit of Ultra-Low Latency: FPGA in High-Frequency Trading
      ](https://www.velvetech.com/blog/fpga-in-high-frequency-trading/)
- [ ] https://www.joelw.id.au/FPGA/CheapFPGADevelopmentBoards
- [ ] https://www.aliexpress.com/item/4000269874245.html
    - Xilinx Spartan 6 FPGA Development Board Kit includes FPGA spartan 6
      development board AD/DA module and 4.3 inch TFT LCD ~$200
- [ ]
    - board https://nandland.com/the-go-board/
    - book [Getting Started with FPGAs - Russell Merrick
      ](https://nandland.com/book-getting-started-with-fpga/)

## Game bitmaps

- https://lospec.com/palette-list/golden-boy-gb

## job hunting app

- https://zagg.app/

## audio routing on mac

- https://existential.audio/blackhole/download/?code=693908814
