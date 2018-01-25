class AdaptorPattern
  def initialize(data)
    # TODO your domain initializations gets kicked off here
    # @data = AdaptorData.new(data)

  end

  def execute(command)
    case command
    when /outputs the data as (.*)$/
      # TODO find gear
      # @data.output($1)
    else
      raise ArgumentError.new("not supported command #{command.inspect}")
    end
  end
end

# TODO maybe add some classes

