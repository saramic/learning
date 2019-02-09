# Progress Feb 2019

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
