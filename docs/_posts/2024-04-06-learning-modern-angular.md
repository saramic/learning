---
layout: post
title:  "April 2024 - learning modern angular"
date:   2024-04-06 15:00:00 +1100
categories: learning update angular
---

## just listend to Syntax podcast

and they had

[
  React vs Vue vs Angular with Corbin Crutchley
](https://syntax.fm/show/752/react-vs-vue-vs-angular-with-corbin-crutchley)

talking about his freely available book [The Framework Field
Guide](https://unicorn-utterances.com/collections/framework-field-guide)
covering Angular, Vue and React. As I just recently bought Armen Vardanyan's,
[Modern Angular](https://www.manning.com/books/modern-angular) and am now in an
Angular environment at work, it may be time to pick up on some of the modern
ideas in Angular like signals and also see how they manage environments given
it seems they have just removed `envionment.js` files? will be an interesting
read

## first up a basic install

```sh
# get the command line ng command
npm install -g @angular/cli

ng new hrms \
  --defaults \
  --standalone \
  --routing

# and to go all minimal
ng new 12_days \
  --minimal \
  --defaults \
  --standalone \
  --routing
```

## next up, apply some projects basics

Appart from following the book or both books or maybe even Adam Freeman's, [Pro
Angular 16](https://www.manning.com/books/pro-angular-16), I would also like to
build out a fast track BDD TDD project, initially basing it on 12 days of
Chritmass Kata
- BDD with Cypress E2E
- Component testing with Cypress components
- Storybook?
- Unit testing with either default or vitest
- do I need a `Makefile` to manage it or is `package.json` enough?
- eslint,
- typescript,
- prettier,
- github build actions
- maybe extending to using an LLM to generate beyond first 12 verses?
- deploy to some cloud? netlify?

The idea is to come up with a quick start guide to BDD, TDD and a quality
project and use best of breed testing and linting from the start

I am thinking for the ui an input box where you type how many verses to be
printed and another comonent that displays the verses, if you go over 12, an
LLM is called to generate some more?

```sh
brew install ollama
ollama run mistral
ollama run llama2
curl -X POST http://localhost:11434/api/generate \
  -d '{
    "model": "llama2",
    "prompt":"what 13 objects should I gift a friends and what action does " \
             "that object make"
  }'
```

