# Progress March 2018

# WIP - fresh in my head

  * **Rust** - do some more conding, where is the book up to, exercisms
  * **Ember** - learn more ember
  * **Domain Modelling** - continue work here
  * **Rails Camp** - what to do? finish last project? pi-top and
  * **Scouts** - OCR and translation of wendro badges book

# Wed 14th
  * [ ] read this book on computer from first principles NAND to tetris
    http://nand2tetris.org/course.php
  * came across webp format today
    eg https://static.ffx.io/images/$width_320/t_resize_width/t_sharpen%2Cq_auto%2Cf_auto/88081e44ea342dec8cf39c38749825a80ca546b4
    eg https://static.ffx.io/images/$width_7000/t_resize_width/t_sharpen%2Cq_auto%2Cf_auto/88081e44ea342dec8cf39c38749825a80ca546b4
    using `brew install webp` to install
    `cwebp` to convert to webp
    `dwebp` to convert from webp
    example of 6400 x 4266 image
    webp size 922k and in JPEG 17M

# Thu 8th
  * **Ember**
    - https://thejsguy.com/2016/01/09/handling-errors-with-ember-data.html
      * JSON-API errors response { "errors": [...] }
      * ... "source": { "pointer": JSON pointer } ...
      * JSON pointer slash based syntax `data/attributes/name`
        for a get
        ```
        { "data": { "attributes": { "name": "..." } } }
        ```
    - Old DS.RESTSerializer or DS.JSONSerialzer
      ```
      { "errors": { "key": ["value"] } }
      ```
    - [ ] read https://leanpub.com/emberdatainthewild
      https://github.com/skaterdav85/ember-data-in-the-wild

# Mon 5th

  * **Ember**
  * [ ] look at articles on this site
    https://karolgalanciak.com/test-driven-ember/
  * [ ] demo ember/frontend examples in paste bin as per below
    http://emberjs.jsbin.com/denicage/1/edit?html,js,output
  * [ ] how to access an existing component on a page? or filter to other components - particular example around file uploader
    https://stackoverflow.com/questions/28759015/how-to-access-a-known-ember-component-from-console
  * [ ] file picker, uploader, progressive display of processing a file
    - https://emberobserver.com/addons/ember-file-upload
    - http://centerforopenscience.github.io/ember-osf/files/addon_components_file-chooser_component.js.html
    - https://www.npmjs.com/package/ember-cli-filepicker
    - https://www.npmjs.com/package/ember-filepicker
    - http://mockra.com/2016/02/13/ember-s3-file-upload
    - http://scribu.net/blog/cross-browser-uploads-ember-moxie.html
  * [ ] reporting dashboard in ember
    - https://github.com/shaialon/ember-admin-dashboards
    - https://medium.com/@jatescher/creating-a-metrics-dashboard-with-ember-js-bootstrap-and-rails-part-1-b11cf922408d
    - http://www.samselikoff.com/blog/ember-d3-simple-dashboards/
    - http://blog.juliantescher.com/creating-a-metrics-dashboard-with-emberjs-bootstrap-and-rails-part-two
  * [ ] ember screen casts
    https://www.emberscreencasts.com/posts/82-introduction-to-services
  * [ ] functional JS utils
    https://gist.github.com/bendc/9b05735dfa6966859025

  * **Ruby Hacks**
    - [ ] eager loading polymorphic association - get a decent example
      https://makandracards.com/makandra/28347-eager-loading-polymorphic-associations
    - [x] fixed width some csv

    ```
    echo "column 1,a really long column name 2,column_3
      val 1, val 2, val3
      A,B,C" | ruby -e 'require "CSV"; vals = ARGF.read; widths = CSV.parse(vals).each_with_object({}) {|csv, hash| csv.each_with_index {|v, i| hash[i] ||= 0; hash[i] = v.chars.length if v.chars.length > hash[i] } }; CSV.parse(vals).each {|csv| puts widths.map{|k,v| sprintf("%#{v+2}s", csv[k]) }.join("") }'

      column 1  a really long column name 2  column_3
         val 1                        val 2      val3
             A                            B         C
    ```

    - [ ] git commit trajectory on history of recent commit frequency
      https://github.com/ruby-git/ruby-git
    - [ ] how to compare various commits in git as 1 united patch?
      https://www.linuxquestions.org/questions/linux-software-2/concatenate-multiple-patches-into-one-file-912349/


  * **Citizen Metadata Tracker**
    - https://www.theglobeandmail.com/news/world/china-using-big-data-to-detain-people-in-re-education-before-crime-committed-report/article38126551/
      * China tracking: fertilizer purchases, large food shopping, faical
        recoginition, number plate tracking, etc to predict terrorism
      * Alibaba also has demonstrated similar things

# Fri 2nd

  * [ ] ember hooks
    https://alexdiliberto.com/posts/ember-route-hooks-a-complete-look/
