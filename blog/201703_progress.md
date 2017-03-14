# Progress Mar 2017

* Mon 14th
  * examples ch 3 of tensorflow book
  * issues from ch3 code
    - for pyplotlib to work needed to
      ```bash
      cat ~/.matplotlib/matplotlibrc
      backend: TkAgg
      ^D
      ```
    - index for csv 'r' not 'rb' and next(csvreader)
      ```python
        with open(filename, 'r') as csvfile:
          ...
          next(csvreader)
      ```

* Mon 13th
  * examples ch 2 of tensorflow book
  * reading GraphX summaries of chapters
    - [ ] read pregel ch 4
    - [ ] demo of built in algos ch 5
* Sun 12th
  * NOTHING
* Sat 11th
  * NOTHING
* Fri 10th
  * work react info
  * tennis dojo with junio
* Thu 9th
  * looking at working with optaplanner again
    - [ ] someones demo project http://appwriter.com/new-easier-optaplanner-example-project.html
    - [ ] and code https://bitbucket.org/betterology/optaplannerhellotest
    - [ ] currently breaking on https://issues.apache.org/jira/browse/SMX4-581
  * Study Club notes
    * Adam - AI and more elixir flow merge sort
      * AI
       * reinforcement learning algorithms https://gym.openai.com/
          * Teach your game to play itself
            * https://openai.com/blog/universe/
            * https://universe.openai.com/
          * UC Berkeley Pac Man as intro to AI http://ai.berkeley.edu/project_overview.html
      * Flow Discussion of https://en.wikipedia.org/wiki/Schwartzian_transform
    * Me - Readme docs are hard
      * Played with react-universally (as used in boom) but struggled with
        instructions like "You need to add your own version of Weather Icons
        CSS." from react-weathericons made me think: how? where? from where?
        what syntax? how to incorporate in react? in webpack? give me
        something!!!
      * OptaPlanner is a constraint satisfaction solver to solve
        things like bin packing, travelling salesman, rostering etc. Running a
        demo is easy but getting a simple program written from scratch is
        impossible solving shortest path with a number of trucks and constraints on when customers accept deliveries
        * uses https://en.wikipedia.org/wiki/Tabu_search under the covers
        * blog how to win the US election with less then a quarter of the vote
        * some insight on running/starting an open source project https://www.optaplanner.org/blog/2016/08/07/ADecadeOfOptaPlanner.html
      * Book Review Machine Learning with TensorFlow easy to follow along with and a lightweight approach but unfortunately no meaty examples to really solve a problem. More of a backgrounder and reminded me that python is a language that is very much alive.
      * playing with HAWK use python httpie
        pip install requests-hawk httpie

* Wed 8th
  * TensorFlow book: linear regression, multi classifiers, k-means and audio
    segmentation example, Hidden Markov Models, autoencoders for images
    * starting to feel that the examples may get you started but will not solve
      a real world problem at the level of the book, maybe in a later chapter?
* Tue 7th
  * Redux wired up in data-fe
  * charting libs Plotly and SigmaJS added to data-fe
* Mon 6th
  * added api to data-fe
* Sun 5th
  * spark-jobserver attempt to run
* Sat 4th
  * building out Front end for React to display data components for upcoming
    unearthed hackathon, [Data FE](https://github.com/saramic/data-fe)

    following https://github.com/ctrlplusb/react-universally/blob/master/docs/FEATURE_BRANCHES.md
    git clone https://github.com/ctrlplusb/react-universally my-project
    cd my-project
    git remote rename origin upstream
    git remote add origin https://github.com/my-github-username/my-project
    git push -u origin master

    looked at adding simple charts http://www.reactd3.org/ still a work in progress

  * read summaries of GraphX in Action
    * start with Spark Job Server to get simple REST API endpoint up
    * probably do the hard work of working through most of the algorithms and
      the kind of problems they solve
    * look at Zepplin and D3.js for simple visualisation
    * look into state of GraphFrames as they are faster
  * read summaries of TensorFlow in Action books
    * probably need to work through most of this linearly although Ch9 is
      around image classification
    * probably look at the default problems on the website

* Fri 3rd
  * coding dojo ruby - Roman to arabic converter
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
