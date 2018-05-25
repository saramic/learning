require 'pairing'

RSpec.describe Pairing do
  it 'takes a git woring directory and committers.yml to init' do
    expect(Pairing.new('working_directory', 'commiters.yml')).to be_truthy
  end

  it 'outputs the pairing stats' do
    pairing = Pairing.new('working_directory', 'commiters.yml')
    output = StringIO.new
    expect(output).to receive(:puts).with 'pairing stats'
    pairing.stats(output)
  end
end
