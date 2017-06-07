# Progress June 2017

* Thu 8th

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
