require 'git'

class Pairing
  def initialize(git_working_directory, git_committers_names_yml)
    @git = Git.open(git_working_directory)
  end

  def stats(output)
    output.puts 'pairing stats'
  end
end
