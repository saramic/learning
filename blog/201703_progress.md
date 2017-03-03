# Progress Mar 2017

* Fri 3rd
  * 
* Thu 2nd
  * **NOTHING**
  * Study club at work
    * Adam on building his distributed merge sort in elixir
      * [Enum.sort](https://hexdocs.pm/elixir/Enum.html) eager
      * [Stream.sort](https://hexdocs.pm/elixir/Stream.html) lazy
      * [Flow](https://hexdocs.pm/flow/Flow.html) parallel
      * deterministic sort on objects
      ```ruby
        ary = [{a: 1, b: 2}, {a: 1, b: 1}, {a: 2, b: 1}]
        ary.sort_by{|t| [t[:a], t[:b]]}
        => [{:a=>1, :b=>1}, {:a=>1, :b=>2}, {:a=>2, :b=>1}]
      ```
      Adam is working on a distributed flow merge
      this reminded me of the talk [Parallel Programming, Fork Join, and
      Reducers](https://www.youtube.com/watch?v=eRq5UBx6cbA) by Daniel
      Higginbotham about I think something similar
    * Kirsten talked about here involvment in
      [coderdojo](https://coderdojo.com/) and
      [coderdojo_Melb](https://coderdojomelbourne.com.au/) where she helps kids
      8 - 17 years how to program. Currently every 2nd Thursday in Carlton
      library. Great initiative and great way to become a mentor of sorts.
    * I mentioned learning styles from
      [Mastery](http://www.goodreads.com/book/show/81940.Mastery) by George
      Leonard and the reality of needing to enjoy the plateau as you are going
      to sit there for a long time. I also mentioned my current investigations
      into why MD5 calculations vary so much between my
      perl/ruby/elixir/clojure implementations.
      Adam mentioned that elixir/erlang are known not to be the best for
      numerical speed more for consistency, as mentioned in
      [link](http://stackoverflow.com/questions/1308527/when-does-erlangs-parallelism-overcome-its-weaknesses-in-numeric-computing)

  * present to Coder Factory Melbourne
    * history: telstra, realestate, bikeexchange, redbubble
    * how we work: Agile, OKR/plan by quarter, teams, paring TDD
    * how to get there:
      - little things
        practice every day, get good at your tools (syntax, editor), sovle
        simple problems
      - medium things
        learn framework, libraries, how to design (OO and DDD), how to refactor
      - big things
        solve user probelms, A/B testing and user testing, other technologies
    * hiring process:
      - a resume that show:
        1. abilities (languages, portfolio, etc),
        2. drive and passion (learning, ongoing improvment, passion in other
           fields, taking on resopnsibility, weekend projects, a blog)
        3. problem solving ability (solve real user problems, drive for purpose)
    * other
      * remember first real job is overwhelming, a lot of things, and how they
         all fit together (people, tools, projects, processes, etc)
* Wed 1st
  - [ ] look at c-lang from:
    - a perspective of now
    - vulkan programming
    - writing C extensions for ruby gems
  - [ ] follow up at work
    - [ ] style guide
    - [ ] developer manifesto
    - [ ] splitting the monolith into Gems
      - how to write a gem
      - finding code ripe for splitting out
      - look at open sourcing it
  * mastery book - so good
    * instruction ...
    * practice ...
    * submit ...
  * elixir tail recursion
