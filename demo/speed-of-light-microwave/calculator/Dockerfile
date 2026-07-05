# syntax=docker/dockerfile:1

ARG RUBY_VERSION=4.0.5
FROM ruby:${RUBY_VERSION}-slim AS base

WORKDIR /app

ENV BUNDLE_WITHOUT="development:test:cli" \
    BUNDLE_PATH="/usr/local/bundle" \
    HANAMI_ENV="production" \
    RACK_ENV="production" \
    HANAMI_PORT="80"

# --- build stage: compile gems that need a C toolchain ---
FROM base AS build

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3 && \
    rm -rf /usr/local/bundle/cache

COPY . .

# --- final stage: runtime only, no compiler ---
FROM base

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /app /app

EXPOSE 80

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
