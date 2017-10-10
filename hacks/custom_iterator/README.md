# Custom Iterator

look at creating a custom iterator over pages which are represented as lines.

# TODO
  - [ ] use Enumerable as per [Design patterns in ruby - Iterator
    example](https://github.com/davidgf/design-patterns-in-ruby/blob/master/iterator.md)
  - [ ] focus on simplifying the `pages` method

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

