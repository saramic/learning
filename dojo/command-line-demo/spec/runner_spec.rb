# frozen_string_literal: true

RSpec.describe 'runner' do
  it 'prints out hello from runner' do
    allow(Kernel).to receive(:puts)
    load File.join(File.dirname(__FILE__), '../bin/runner.rb')
    expect(Kernel).to have_received(:puts).with('hello from runner')
  end
end
