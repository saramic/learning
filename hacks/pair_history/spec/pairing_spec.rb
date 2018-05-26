require 'pairing'

RSpec.describe Pairing do
  it 'passes the working_directory to Git gem' do
    expect(Git).to receive(:open).with('working_directory')
    expect(Pairing.new('working_directory', 'commiters.yml')).to be_truthy
  end

  it 'outputs the pairing stats' do
    expect(Git).to receive(:open).with('working_directory')
    pairing = Pairing.new('working_directory', 'commiters.yml')
    output = StringIO.new
    expect(output).to receive(:puts).with 'pairing stats'
    pairing.stats(output)
  end
end
