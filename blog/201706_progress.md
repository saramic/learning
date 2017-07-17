# Progress June 2017

TOMORROW?
  - [ ] [books I've read](https://sivers.org/book)
  - [ ] [A unified styling language](https://medium.com/seek-blog/a-unified-styling-language-d0c208de2660)
* Sat 10th
  ...

* Fri 9th
  * Functional R
  ...

* Thu 8th
  * [Keynote: Building and Motivating Engineering Teams - Camille Fournier](http://www.camilletalk.com/)
    - managers path book writer
    - [3 factors of engagement](https://www.youtube.com/watch?v=7R-Y2DwWOr0)
      - rewards: economic, status, getting things done, learning, engineers like to ship
      - respect: safety, relatedness, community, partenrship, treat colleagues like humans
      - purpose: why, why this, "give away your legos"
    - [x] [give away your legos](http://firstround.com/review/give-away-your-legos-and-other-commandments-for-scaling-startups/)
      - 30 - 50 employees - communications is key
      - 50 - 200 employees - get rid of weak hires
      - 200 - 750 employees - need to be very deliberate to try and change anything
      * Make a list of the qualities you want your company to embody. Who do
        you want to be? How do you want it to feel to work there?
      * Write down what you’re doing in the world. What’s your vision for the
        change you want to make?
      * Communicate these things again and again and again. Through all the
        channels. All the time. You can’t overcommunicate these ideas.
      * Focus on hiring quality people, never lower the bar
      * Fire people if they don't fit the culture, do it
      * Hire amazing leaders as early as you can
      * Prioritize principles over process.
      * Keep giving away your Legos! And tell everyone around you to do the
        same. It’s going to be okay.
  * [Functional programming design patterns by Scott Wlaschin](https://www.youtube.com/watch?v=E8I19uA-wGY)
    - can make any function 1 parameter for better composition
    - [ ] watch again once I have more functional experience
    also watch DDD using types for design
    - [ ] [Domain Driven Design with the F# Type System](http://fsharpforfunandprofit.com/ddd/)
    also watch Railway Oriented Programming
    - [ ] [Railway Oriented Programing - functional approach to error handling](http://fsharpforfunandprofit.com/rop/)
    also on F#
    - [x] [F# Has Won Me Over: Coming to .Net World from Outside .Net](http://www.prigrammer.com/?p=363)
      a getting started installing and TDD guide
    - [ ] https://github.com/fsharp/vim-fsharp/
    - [ ] https://juliankay.com/development/writing-and-running-f-scripts-with-vim/
    - [ ] https://github.com/kongo2002/fsharp-vim
    - [ ] http://fsharp.org/guides/mac-linux-cross-platform/
  * came across an interesting teaching site https://www.datacamp.com/home
  * some general things I should learn in R
    - [ ] [GLM](http://www.statmethods.net/advstats/glm.html)
    - [ ] [Decision Trees](http://trevorstephens.com/kaggle-titanic-tutorial/r-part-3-decision-trees/)
    - [ ] [Tree based models](http://www.statmethods.net/advstats/cart.html)
    - [ ] [Tree based modeling](https://www.analyticsvidhya.com/blog/2016/04/complete-tutorial-tree-based-modeling-scratch-in-python/)
    - [ ] [on random forests](https://www.stat.berkeley.edu/~breiman/RandomForests/)
  * read [F# Has Won Me Over: Coming to .Net World from Outside .Net](http://www.prigrammer.com/?p=363)
    F# resource on how to get started on a mac with basic TDD project
* Wed 7th
  * dojo/ruby_clock_hand_mirror
    `ruby -I dojo/ruby_clock_hand_mirror/lib -e 'require "clock_mirroring"; puts ClockMirroring.mirror_times_for(0)'`

* Tue 6th
  * take a look at
    - [ ] [Fourier transform tutorial in R](http://www.di.fc.ul.pt/~jpn/r/fourier/fourier.html)
		- [ ] [plotly R complex examples](https://moderndata.plot.ly/time-series-charts-by-the-economist-in-r-using-plotly/)

  * get R running in `jupyter notebooks` with plotly graphs

    # mostly as per https://plot.ly/r/using-r-in-jupyter-notebooks/#install-irkernel
    # but some extra packages and override my mirror settings

    R

    install.packages(c('repr', 'IRdisplay', 'pbdZMQ', 'devtools'), repos='http://cran.us.r-project.org')
    install.packages(c('crayon', 'uuid'), repos='http://cran.us.r-project.org')
    install.packages('plotly', repos='http://cran.us.r-project.org')
    devtools::install_github('IRkernel/IRkernel')
    IRkernel::installspec()

    # according to this a wild guess https://github.com/jupyter/notebook/issues/2287
    jupyter notebook --NotebookApp.iopub_data_rate_limit=10000000000

  * change default cran mirror
    NOT WORKING
    `options(repos=structure(c(CRAN="http://cran.us.r-project.org")))`

* Mon 5th
  * NOTHING
* Sun 4th
  * NOTHING
* Sat 3rd
  * NOTHING
* Fri 2nd
  * NOTHING
* Thu 1st
  * NOTHING
