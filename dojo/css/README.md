# CSS dojo

An initial attempt at how to practice more CSS. Take photos of real life
designs or of existing web sites. Potentially take multiple photos to show
different states. Then style a page from scratch to match the image.

## Setup

  - take an image
  - crop and reduce the resolution and quality of the image, it is only to be
    used as a guide
  - setup a base project
    ```
    project_name/
    |-- Gemfile # using haml gem to sass compile
    |-- index.html
    |
    |-- images/
    |   |-- project_name.jpg
    |
    |-- sass/
    |   |-- main.scss
    |
    |-- stylesheets/
        |-- .gitkeep
    ```
  - run sass compiler in background
    ```
    sass --watch sass/main.scss:stylesheets/main.css
    ```

## Examples

  - [Coffee Cup Top](/coffee_top)
  - ... TODO add more

## TODO

  - [ ] solve the coffee cup top
    - [ ] change a lot of the `berzier curves` to `arcs` after all most of this
      is round
    - [ ] define what each of the path drawing attributes `d` do
      - what they should be used for
      - [ ] build a tool to allow a mouse to draw them over an image in bowser,
        or find such a tool
        - with drawings overview https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Paths
        - an overview of all the commands https://www.w3schools.com/graphics/svg_path.asp
        - more detailed description of variables to pass to the commands
          https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d
        - some attempt to describe arcs
          http://doc.4d.com/4Dv15/4D/15/SVG-PATH-ARC.301-2048872.en.html
    - a lot of other SVG specifics like preserving white space
      https://vanseodesign.com/web-design/svg-text-spacing-properties/
    - [ ] clean up the css style sheet
  - [ ] make sure solution can scale (relative to container)
  - [ ] make ability to re-write text, ReactJS binding to text box?
  - [ ] add a control to allow for scaling? in this case probably yes
  - [ ] allow for actions, steam out of steam hole, coffee out of spout, shadow change
  - [ ] pixel comparison of sample through image comparison script
  - [ ] ability to provide many solutions as separate layers
  - [ ] multi image, transition example
  - [ ] is haml gem the best?
  - [ ] sort out why `sass --watch` is currently breaking with
    ```
    NameError: uninitialized constant #<Class:FSSM::Support>::Config
    ```
  - [ ] simplify creation of a bare bones project, using
    [Yeoman](http://yeoman.io/)?
  - [ ] simplify creation of simplifed image
    - resize to standard size, what is standard? web standard width?
    - reduce colours, change RGB colour space to indexd
    - further reduce colours limiting the indexd space
    - scale down to a quarter and scale up to pixelate a little
    - are these steps necessary?
    - still rather large png? is there a squash png utility?
    - jpg seems lighter weight for the moment but transparency would be nice
    - [ ] probably crop then use correct setting in `pngcrush`
  - [ ] look at core CSS concepts that could be covered
    - look at books
    - commands
    - create a path of exercises that introduce these concepts
    -  how do frameworks get involved?
  - [ ] mix bare bones exercises with potential solutions?
    - as another layer?
    - is some kind of initial markup a good initial start? like all text and
      various elements?

