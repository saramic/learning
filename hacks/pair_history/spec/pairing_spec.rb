require 'pairing'

RSpec.describe Pairing do
  context 'integrate with actual git commiters yaml file' do
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
      output = StringIO.new # TODO any benefit or could this be a double
      expect(output).to receive(:puts).with 'pairing stats'
      expect(output).to receive(:puts).with 'User_1 | User_2'
      pairing.stats(output)
    end
  end
end

class String
  def strip_leading_spaces
    self.split("\n").map{|line| line.sub(/^\s+/, '') }.join("\n")
  end
end

