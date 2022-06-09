# frozen_string_literal: true

RSpec.describe 'runner' do
  describe 'unit' do
    it 'prints out hello from runner' do
      allow(Kernel).to receive(:puts)
      load File.join(File.dirname(__FILE__), '../bin/runner.rb')
      expect(Kernel).to have_received(:puts).with('hello from runner')
    end

    it 'calls WordCount.new with ARGV' do
      allow(WordCount).to receive(:new)

      ARGV = %w[command line arguments].freeze
      load File.join(File.dirname(__FILE__), '../bin/runner.rb')

      expect(WordCount).to have_received(:new).with(%w[command line arguments])
    end
  end

  describe 'integration' do
    context 'when the passed in args are bin/runner.rb' do
      let(:args) { 'bin/runner.rb' }

      it 'prints word count of 17' do
        runner_file_path = File.join(File.dirname(__FILE__), '../bin/runner.rb')
        expect(`#{runner_file_path} #{args}`).to eq <<~EO_OUTPUT
          hello from runner
          [{\"filename\":\"bin/runner.rb\",\"word_count\":17}]
        EO_OUTPUT
      end

      it 'same as the wc -w word count utility, number of words is 17' do
        expect(`wc -w #{args}`.lstrip).to eq <<~EO_OUTPUT
          17 bin/runner.rb
        EO_OUTPUT
      end
    end
  end
end
