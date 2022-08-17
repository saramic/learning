# frozen_string_literal: true

require 'distributed_word_count'

RSpec.describe DistributedWordCount do
  it "takes an array of filenams and passes them to a WordCountEnricher" do
    distributed_word_count = DistributedWordCount.new(["file_name1", "file_name2"])
    distributed_word_count
  end
  # before do
  #   allow(File).to receive(:read).and_return('the text')
  # end

  # it 'processes a number of filenames' do
  #   word_count = WordCount.new(%w[filename_1 filename_2])
  #   expect(JSON.parse(word_count.to_s)).to eq(
  #     [
  #       {
  #         'filename' => 'filename_1',
  #         'word_count' => 2
  #       },
  #       {
  #         'filename' => 'filename_2',
  #         'word_count' => 2
  #       }
  #     ]
  #   )
  # end

  # describe WordCount::Counter do
  #   it 'reads the file, splits the lines and counts the words' do
  #     allow(File).to receive(:read).and_return(<<~EO_FILE_TEXT)
  #       #!/some/cool/header text

  #       and some more text 7
  #     EO_FILE_TEXT
  #     expect(WordCount::Counter.word_count('filename')).to eq 7
  #     expect(File).to have_received(:read).with('filename')
  #   end
  # end
end
