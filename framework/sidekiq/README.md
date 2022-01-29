# Sidkiq

learn more about running sidekiq

## TOC

1. sidekiq_001.2 based on [YouTube Sidekiq 001.2 - SmoothTerminal](https://www.youtube.com/watch?v=bfPb1zD91Rg&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1)
   ```
   bundle exec sidekiq --require ./sidekiq_001.2/worker.rb

   # in another window CTRL-SHIFT-D - CTRL-] move between windows
   bundle exec irb -r ./sidekiq_001.2/worker.rb
   OurWorker.perform_async("easy")        # peforms in 1 sec
   OurWorker.perform_async("super_hard")  # peforms in 20 sec
   OurWorker.perform_async("hard")        # performs in 10 sec
   OurWorker.perform_async("hard")        # concurrently
   OurWorker.perform_async("hard")        # all finishing at same time

   OurWorker.perform_in(5, "easy")        # perfomr in 5 seconds
   ```
