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
