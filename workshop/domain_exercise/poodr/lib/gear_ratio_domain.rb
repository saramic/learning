class GearRatioDomain
  def initialize(data)
    # TODO your domain initializations gets kicked off here
    # @gears = data[:gears].map do |gear|
    #   Gear.new(gear)
    # end

  end

  def execute(command)
    case command
    when /find gear (\d+) and return it's ratio/
      # TODO find gear
      # Gear.find_by_id($1)
    else
      raise ArgumentError.new("not supported command #{command.inspect}")
    end
  end
end

# TODO maybe a gear class might help
class Gear
  # TODO implementation
end

