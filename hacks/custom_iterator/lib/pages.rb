class Pages
  attr_reader :content

  def initialize(content, pagination_regex: nil)
    @content = content
    @pagination_regex = pagination_regex
  end

  def pages
    buffer = []
    content.lines.inject({}) do |hash, line|
      buffer << line.chomp
      if @pagination_regex.match(line)
        hash[$1.to_i] = buffer
        buffer = []
      end
      hash
    end
  end

  def page(page_number)
    pages[page_number].join
  end

  def each_by_page
    pages.each_with_index do |page, index|
      yield page.last.join
    end
  end
end
