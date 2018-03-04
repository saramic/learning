# Progress March 2018

# WIP - fresh in my head

  * **Rust** - do some more conding, where is the book up to, exercisms
  * **Ember** - learn more ember
  * **Domain Modelling** - continue work here
  * **Rails Camp** - what to do? finish last project? pi-top and
  * **Scouts** - OCR and translation of wendro badges book

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

# Fri 2nd

  * [ ] ember hooks
    https://alexdiliberto.com/posts/ember-route-hooks-a-complete-look/
