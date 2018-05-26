require 'pairing'
require 'date'

RSpec.describe Pairing do
  let(:git_committers_file) do
    filename = 'committers.yml'
    git_committers_file = Tempfile.new(filename).tap do |file|
      committers_yaml = <<-EOF.strip_leading_spaces
      ---
      :User_1:
        - "@user_1"
      :User_2:
        - "@user_2"
      EOF
      file.write(committers_yaml)
      file.close
    end
  end

  it 'passes the working_directory to Git gem' do
    expect(Git).to receive(:open).with('working_directory')
    expect(Pairing.new('working_directory', git_committers_file.path)).to be_truthy
  end

  it 'outputs the pairing stats' do
    expect(Git).to receive(:open).with('working_directory')
    pairing = Pairing.new('working_directory', git_committers_file.path)
    allow(pairing).to receive(:pairing_by_day).and_return(
      [
        {
          date: Date.new(2018, 1, 1),
          User_1: :User_2,
          User_2: :User_1
        },
        {
          date: Date.new(2018, 1, 2),
          User_1: nil,
          User_2: nil
        }
      ]
    )
    output = StringIO.new # TODO any benefit or could this be a double
    expect(output).to receive(:puts).with 'pairing stats'
    expect(output).to receive(:puts).with <<-EOF.strip_leading_spaces
    Date       | User_1 | User_2
    2018-01-01 | User_2 | User_1
    2018-01-02 |      - |      -
    EOF
    pairing.stats(output)
  end

  describe '#generate_stats' do

  end

  describe '#pairing_by_day' do
    let(:pairing) { Pairing.new('working_directory', git_committers_file.path) }
    let(:git_double) { double(Git, log: nil) }
    before do
      expect(Git).to receive(:open).with('working_directory').and_return(git_double)
    end

    it 'full date range for logs in reverse choronological order with no gaps' do
      logs = [
        double(Date, date: Date.new(2018, 1, 3)),
        double(Date, date: Date.new(2018, 1, 1))
      ]
      expect(git_double).to receive(:log).and_return(logs)
      expect(pairing.pairing_by_day).to eq([
        { date: Date.new(2018, 1, 3) },
        { date: Date.new(2018, 1, 2) },
        { date: Date.new(2018, 1, 1) },
      ])
    end
  end
end

class String
  def strip_leading_spaces
    self.split("\n").map{|line| line.sub(/^\s+/, '') }.join("\n")
  end
end

