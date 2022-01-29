# Progress November 2021

* Thu 11th Nov
  - started on Sidekiq in practice
  - interesting alternative from Sam for a pre-commit hook
  ```
  staged_ruby_files=$(git --no-pager diff --diff-filter=dr --name-only --cached | grep '.rb$' | tr '\n' ' ' | xargs)
  if [ -n "$staged" ]
  then
    bundle exec rubocop -A $staged_ruby_files
    git add $staged_ruby_files
  fi
  ```
* Wed 10th Nov
  - read an encouraging article on Vercel vs Netlify and now there is also
    Cloudflare pages in the mix. Heard about this after Yana Martens Dev Ops
    YouTube live.
    - https://dev.to/maxniederman/netlify-vs-vercel-a-comparison-5643
    - should look into this at some stage - maybe a talk comparing platforms
    - https://vercel.com/
    - https://pages.cloudflare.com/
  - did some timeseries data science learning
  - read some Staff Enginner book
  - still might do some TypeScript
  - maybe get back into Rust tomorrow
  - what about microservices - deploy an app on a serverless infra above
  - watched [Sidekiq in Practice: Mike Perham on Scaling Sidekiq](https://www.youtube.com/watch?v=qyqqGRkUzuw)
