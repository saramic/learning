# Sidkiq

learn more about running sidekiq

## TOC

1. first job based on [YouTube Sidekiq 001.2 - SmoothTerminal](https://www.youtube.com/watch?v=bfPb1zD91Rg&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1)
   ```
   bundle exec sidekiq --require ./worker.rb

   # in another window CTRL-SHIFT-D - CTRL-] move between windows
   bundle exec irb -r ./worker.rb
   OurWorker.perform_async("easy")        # peforms in 1 sec
   OurWorker.perform_async("super_hard")  # peforms in 20 sec
   OurWorker.perform_async("hard")        # performs in 10 sec
   OurWorker.perform_async("hard")        # concurrently
   OurWorker.perform_async("hard")        # all finishing at same time

   OurWorker.perform_in(5, "easy")        # perfomr in 5 seconds
   ```
1. error handling based on [YouTube Sidekiq 001.4 - SmoothTerminal](https://www.youtube.com/watch?v=dGpbYqP5lr8&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1&index=2)
   ```
   SIDEKIQ_DEMO_W_EXCEPTION=1 bundle exec sidekiq --require ./worker.rb

   # in another window CTRL-SHIFT-D - CTRL-] move between windows
   bundle exec irb -r ./worker.rb
   OurWorker.perform_async("super_hard")  # will raise an error

   # start web UI
   make sidekiq-web
   # restart sidekiq without exception and re-run job
   bundle exec sidekiq --require ./worker.rb
   ```
1. signal handling based on [YouTube Sidekiq 002.2 - SmoothTerminal](https://www.youtube.com/watch?v=0Q6CbF-ZmB8&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1&index=3)
   ```
   SIDEKIQ_DEMO_W_EASY_ERROR=1 bundle exec sidekiq --require ./worker.rb

   # find pid
   ps ax | grep sidekiq

   kill -TTIN 87657 # throws error in current process?
   # <date-time> pid=87657 tid=1xa5 WARN: Thread TID-1wv5 scheduler
   # <date-time> pid=87657 tid=1xa5 WARN: ...timed_stack.rb:78:in `sleep'

   kill -USR1 <PID> # Did not work
   kill -USR2 <PID> # Did not work
   # [1]    PID user-defined signal 2  SIDEKIQ_DEMO_W_EASY_ERROR=1 bundle exec
   #                                             sidekiq --require ./worker.rb

   bundle exec sidekiq --pid tmp/sidekiq ... # did not work
   # ERROR: PID file creation was removed in Sidekiq 6.0, please use a proper
   #        process supervisor to start and manage your services
   ```

