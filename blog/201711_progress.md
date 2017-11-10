# Progress November 2017

* Thu 12th
  * **offline documentation for rails camp**
  * dasht
  ```
    brew install dasht

    dasht-docsets-install bash    # install bash docset
    dasht 'c - x'                 # search
    dasht-server                  # to access via web

    man dasht
  ```

  * **Ras Pi finger print reader**
    * https://tutorials-raspberrypi.com/how-to-use-raspberry-pi-fingerprint-sensor-authentication/
    * [ ] [Fingerprint Sensor Project](https://www.raspberrypi.org/forums/viewtopic.php?t=84572)
    * [ ] [RASPIREADER: BUILD YOUR OWN FINGERPRINT READER](https://www.raspberrypi.org/blog/raspireader-fingerprint-scanner/)
    * **Ras Pi Cases**
      * https://tutorials-raspberrypi.com/raspberry-pi-3-cases-2b/
    * **Book**
      * [Exploring Raspberry Pi: Interfacing to the Real World with Embedded Linux](http://au.wiley.com/WileyCDA/WileyTitle/productCd-1119188687.html)
      * code https://github.com/derekmolloy/exploringrpi
      ```
      git clone https://github.com/derekmolloy/exploringrpi.git
      ```
  * **Sound on computer**
    * [github freealut library for OpenAL](https://github.com/vancegroup/freealut)
    * https://www.openal.org/
    * https://github.com/mdoege/PyScape
    * http://boodler.org/lib/

* Wed 11th
  * **Rails Camp** prep
    * **Ruby extensions**
      - [ ] http://blog.reverberate.org/2016/06/12/native-extensions-memory-management-part1-ruby-mri.html
      - [ ] [Rust and C and ruby - Yehuda Katz](https://t.co/Gbkyo2fuz8)
      * using **Rust**
        - **Helix**
          - [ ] [helix talk at ruby conf](http://blog.skylight.io/introducing-helix/)
          - [ ] [use helix](https://usehelix.com/)
          - [ ] [helix roadmap](https://usehelix.com/roadmap)
          - [ ] [github Helix](https://github.com/tildeio/helix)

        - **Ruru**
          - [ ] [github Ruru](https://github.com/d-unseductable/ruru)
            - [ ] [HN on ruru](https://news.ycombinator.com/item?id=11923769)
        - **case_transform-rust-extensions**
          - [ ] https://github.com/NullVoxPopuli/case_transform-rust-extensions
      * using **C++**
        - [ ] https://www.amberbit.com/blog/2014/6/12/calling-c-cpp-from-ruby/
        - [ ] https://rubyplus.com/articles/1171-Calling-Native-Library-Code-from-Ruby
        - [ ] https://github.com/jasonroelofs/rice
      * using **LUA**
        - [ ] [github rlua](https://github.com/whitequark/rlua)
        - [ ] http://lua-users.org/wiki/BindingCodeToLua
        - [ ] https://c7.se/from-ruby-to-lua/
        - [ ] https://www.compose.com/articles/a-quick-guide-to-redis-lua-scripting/

  * readline history in IRB
  ```
  puts Readline::HISTORY.to_a
  ```
  * where is my tmux shortcuts/dojo thing? needed

* Fri 3rd
  * **Rust**
    continue in ch3 of book
