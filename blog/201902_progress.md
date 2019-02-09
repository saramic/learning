# Progress Feb 2019

* Sun 10th
- alternatives to geckoboard
  - [Freeboard.io](https://github.com/Freeboard/freeboard)
    - as mentioned [RasPi forum - platform for sensor data visualization](https://www.raspberrypi.org/forums/viewtopic.php?t=188963)
  - preffered from above [Corlysis](https://corlysis.com/)
  - [dygraphs](http://dygraphs.com/)
  - [Perfecting data visualization with plotly](https://engineersportal.com/blog/2017/9/24/perfecting-data-visualization-with-plotly)
    - [Plot.ly](https://plot.ly/)
  - [Cloud4RPi](https://cloud4rpi.io/)
  - time series [influxdata](https://www.influxdata.com/time-series-platform/)
    - [running tick stack on RPi](https://www.influxdata.com/blog/running-the-tick-stack-on-a-raspberry-pi/)
    - [RPi install instructions](https://community.influxdata.com/t/raspberry-pi-installation-instructions/5515)
  - [Graphana](https://grafana.com/get)

* Sat 9th
- **Video** - [A Branch in Time (a story about revision histories)](https://www.youtube.com/watch?v=1NoNTqank_U)
  - by [@tekin](https://twitter.com/tekin)
  - reason for squashing commits and _why_ in commit messages - to add logical
    reason and completness to commit and hence commit history.
  - use _pickaxe_ to help find history of a method `method_name`
    ```
    git log -S method_name -p
    ```

- **Video** - [Cats, The Musical! Algorithmic Song Meow-ification](https://www.youtube.com/watch?v=JTNPLwqJIDg)
  - by [@haubertdashery](https://twitter.com/haubertdashery) - https://www.bethanyhaubert.com/
  - good fun of trying to meow-ify a theme
  - maybe "6-pack finder" is not such a bad idea

* Sun 3rd
- **BOOK - test driven react**
  - got snapshot testing working - had typo in `jest.config.js` in
    snapshotSerializers was Serlializers so it was ignored
  - got wallaby working - was in wrong directory, needs `node_modules`
  - change eslint to single quotes and dangling commas

* Sat 2nd
- **BOOK - test driven react**
  - continue with styled testing and attempt to get wallaby working

* Fri 1st
- **BOOK - test driven react**
  - webpack setup
