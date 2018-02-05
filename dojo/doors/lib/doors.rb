class Doors
  def initialize(person:, doors:)
    @person = person
    @doors = Array.new(doors, false)
  end

  def open
    (1..@person).each do |person|
      @doors = @doors.each_with_index.map do |door, index|
        (index + 1) % person == 0 ? !door : door
      end
    end
    @doors
  end
end
