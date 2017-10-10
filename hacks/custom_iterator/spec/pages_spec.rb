require 'pages'

RSpec.describe Pages do
  let(:content) {
    <<-EOF.gsub(/^\s+/, '')
      line 1
      line 2
    EOF
  }
  let(:pages) { Pages.new(content, pagination_regex: /line (\d+)/) }

  context '.content returns full content' do
    specify { expect(pages.content).to eq "line 1\nline 2\n" }
  end

  context '.pages returns all pages' do
    specify {
      expect(pages.pages).to eq({
        1 => ["line 1"],
        2 => ["line 2"]
      })
    }
  end

  context 'allows iteration over pages' do
    specify { expect { |b| pages.each_by_page(&b) }.to yield_control }
    specify { expect { |b| pages.each_by_page(&b) }.to yield_successive_args("line 1", "line 2") }
  end

  context 'can get a particular page' do
    specify { expect(pages.page(2)).to eq("line 2") }
  end
end
