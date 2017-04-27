# Progress Apr 2017

* Sun 30th

* Sat 29th

* Fri 28th

* Thu 27th
  * convert a number of renamed png screen captures to jpg for better compression
    ```
    ls | egrep 'all_|exp_' | xargs  convert -quality 60 {} {}.jpg
    ```
  - [ ] need to understand this {} syntax
  - [ ] need to resize as they seemed to get bigger?
  * Lecture 1.1 on [category theory - Bartosz Milewski](https://www.youtube.com/watch?v=I8LbkfSSR58&index=1&list=PLbgaMIhjbmEnaH_LTkxLI7FMa2HsnawM_)
    https://youtu.be/I8LbkfSSR58
    * Category Theory is a higher abstraction
    * Type theory, logic, and 1 other are related
    * Haskel is a higher abstraction then C++
    * c++ hard problem is template metaprogramming
    * in Haskel that is 1 line
    Found by article
      * via https://news.ycombinator.com/item?id=14138196
      * https://hackernoon.com/why-functional-programming-matters-c647f56a7691 in comments from author
      - [ ] also should watch [Structure and interpretation of computer programs](https://www.youtube.com/playlist?list=PLF4E3E1B72A58B492)
* Wed 26th
  Node TDD - day digit calculator - how many days over 100 years do you have
  unique digits in your age.
* Tue 25th
  NOTHING
* Mon 24th
  NOTHING
* Sun 23rd
  NOTHING
* Sat 22nd
  MelbDatathon2017 - team discussions
* Fri 21st
  MelbDatathon2017 - 3070 and patient micro analysis
* Thr 20th
  NOTHING
* Wed 19th
  MelbDatathon2017 - illness normalization
  MelbDatathon2017 - distance measurement
  MelbDatathon2017 - lipitor per patient
* Tue 18th
  MelbDatathon2017 - sales per store by region
* Mon 17th
  NOTHING
* Sun 16th
  NOTHING
* Sat 15th
  MelbDatathon2017 - Most popular drug
* Fri 14th
  NOTHING
* Thr 13th
  MelbDatathon2017 - start
* Wed 12th
  NOTHING
* Tue 11th
  * watched [Intro to ML Spark and Zepplin](https://youtu.be/k4KOmnenuFk)
    - tutorial and notebooks in spark
  * watched [Spark MLlib 2.0 preview](https://youtu.be/kvk4gnXL9H4)
    - [ ] go back and look at the databricks notebook example of
      amazon sentiment analysis
    - points about lots of algorithms added
    - points about going to production
    - currently still need spark under the covers to run a model
  * dump memcached keys for each slab, 1000 dump per slab

      echo -e "stats items\nquit" \
        | nc localhost 11211      \
        | grep -oe ':[0-9]*:'     \
        | grep -oe '[0-9]*'       \
        | sort                    \
        | uniq                    \
        | xargs -L1 -I{} bash -c 'echo -e "stats cachedump {} 1000\nquit" | nc localhost 11211' \
        | grep YOUR_TERM_TO_FILTER_ON

* Mon 10th
  * deriving taxonomies 6.3.1 gxia
  * triangel count 5.2.2 gxia
  * skimmed ch 6 & 7 d3ia - hierarchical and network visualization
* Sun 9th
  * NOTHING
* Sat 8th
  * practical D3 with React d3ia
  * practical React in Action Ch 2
  * read ch 6 GraphX in action - deriving taxonomies from Word2Vec MST
* Fri 7th
* Thu 6th
* Wed 5th
  *
* Tue 4th
  * es6 dojo x2
  * read - ch 9 D3 - react
  * started watching fast.ai week 1
* Mon 3rd
  * es6 tennis dojo for practice
  * read - ch3 React Quickly - JSX
* Sun 2nd
  * watched pubnub
    [tutorial/webinar](https://www.pubnub.com/developers/webinars/view-on-demand/?vidid=22815)
    on EON etc. Key takeaways:
      * 1M requests on free tier
      * 32kb limit, used for iOT, message apps, gaming etc
      * lots of datasets setup like random, HN, wikipedia, etc
      * open-notify.org for getting NASA data
      * the idea of "blocks" to modify data in the network prior to getting on client
      * definitely should have a play
* Sat 1st
  * Ruby data pull and write to csv continued
