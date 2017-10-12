# Custom Iterator

look at creating a custom iterator over pages which are represented as lines.

# TODO
  - [ ] use Enumerable as per [Design patterns in ruby - Iterator
    example](https://github.com/davidgf/design-patterns-in-ruby/blob/master/iterator.md)
  - [ ] more on pattern http://www.informit.com/articles/article.aspx?p=1398604
  - [ ] focus on simplifying the `pages` method
  - [ ] waht about using currying?
    https://stackoverflow.com/questions/4272114/simple-currying-in-ruby
    http://genua.github.io/ruby/2015/03/17/ruby-function-composition-and-more/
    http://andrewberls.com/blog/post/partial-function-application-for-humans
    https://neiro.io/2016/03/08/partial-function-application-and-currying-in-ruby.html
    https://www.sitepoint.com/functional-programming-techniques-with-ruby-part-ii/

  ```ruby
  doc = [
    "Heading on page 1",
    "content of page 1",
    "footer page 1 of 3",
    "Heading on page 2",
    "content of page 2",
    "footer page 2 of 3",
    "Heading on page 3",
    "content of page 3",
    "footer page 3 of 3"
  ]
  ```

have an iterator that allows me to:

  * get all pages
    ```ruby
    doc.pages
    [
      { 1: [
        "Heading on page 1",
        "content of page 1",
        "footer page 1 of 3
        ]
      },
      { 2: [
        "Heading on page 2",
        "content of page 2",
        "footer page 2 of 3",
        ]
      },
      { 3: [
        "Heading on page 3",
        "content of page 3",
        "footer page 3 of 3"
      ]
    }
  ]
    ```
  * iterate through pages
    ```ruby
    doc.each_by_page do |page|
      page # ["Heading on page 1", "content of page 1", "footer page 1 of 3"]
    end
    ```
  * get a particular page
    ```ruby
    doc.page(3) # ["Heading on page 3", "content of page 3", "footer page 3 of 3"]
    ```

