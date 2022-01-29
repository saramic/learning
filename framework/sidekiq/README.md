# Sidkiq

learn more about running sidekiq

## TOC

1. first job based on [YouTube Sidekiq 001.2 - SmoothTerminal](https://www.youtube.com/watch?v=bfPb1zD91Rg&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1)
   ```ruby
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
1. deployemnt base on [YouTube Sidekiq 002.4](https://www.youtube.com/watch?v=50nm6pY2gwg&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1&index=4)
   TODO: come back to this with a simple rack app on Heroku although the demo
   is a rails app on heroku
1. API base on [YouTube Sidekiq 003.2](https://www.youtube.com/watch?v=3Cq9j1Gs0pM&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1&index=5)
   ```ruby
   require "sidekiq/api"
   ss = Sidekiq.ScheduledSet
   ss.size
   ss.each{|job| job.inspect }
   ss.clear
   rs = Sidekiq.RetrySet
   ds = Sidekiq.DeadSet
   Sidekiq::Queue.all
   q = Sidekiq::Queue.new("default")
   q.jobs ???
   q.find_job("job-id")

   ps Sidekiq::ProcessSet.new
   ps.map{|process| %w[busy hostname pid].map{|field| [field, process[field]] }.to_h }
   => [{"busy"=>0, "hostname"=>"failure-driven.local", "pid"=>91807}]

   workers = Sidekiq::Workers.new
   workers.size
   worers.map{|process_id, thread_id, work| {
     process_id: process_id.inspect,
     thread_id: thread_id.inspect,
     work: work.inspect,
     work_payload: work["payload"].inspect,
   }

   stats = Sidekiq::Stats.new
   stats.processed
   stats.failed
   stats.queues
   {"default"=>0}
   stats.enqueued # no retries nor scheduled
   => 0

   s = Sidekiq::Stats::History.new(2) # last 2 days
   s.processed
   => {"2022-01-29"=>329, "2022-01-28"=>0}
   s = Sidekiq::Stats::History.new(3, Date.parse("2022-01-25")) # last 3 days from date
   s.processed
   => {"2022-01-25"=>0, "2022-01-24"=>0, "2022-01-23"=>0}
   ```
