class AdapterPattern
  def initialize(data)
    # TODO your domain initializations gets kicked off here
    # @data = AdapterData.new(data)

  end

  def execute(command)
    case command
    when /outputs the data as (.*)$/
      # TODO format data
      # @data.format = $1
      # @data.output
    else
      raise ArgumentError.new("not supported command #{command.inspect}")
    end
  end
end

# TODO maybe add some classes
