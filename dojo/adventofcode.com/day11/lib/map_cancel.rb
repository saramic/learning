class MapCancel
  def initialize(input)
    @input = input.split(',')
    @directions = {
      'n' => 0,
      's' => 0,
      'ne' => 0,
      'se' => 0,
      'nw' => 0,
      'sw' => 0,
    }
  end

  def steps(route: @input)
    @directions.merge!(route.group_by { |w| w }.map { |w, ws| [w, ws.length] }.to_h)

    loop do
      length = @directions.values.sum

      # Cancel opposing directions
      cancel('n','s')
      cancel('sw','ne')
      cancel('se','nw')

      @directions['n']  += cancel('ne','nw')
      @directions['ne'] += cancel('se','n')
      @directions['se'] += cancel('ne','s')
      @directions['s']  += cancel('se','sw')
      @directions['sw'] += cancel( 's','nw')
      @directions['nw'] += cancel( 'n','sw')

      break if length == @directions.values.sum
    end
    @directions.values.sum
  end

  def cancel(dir1,dir2)
    canceled = [@directions[dir1], @directions[dir2]].min
    @directions[dir1] -= canceled
    @directions[dir2] -= canceled
    canceled
  end

  def max_steps
    @input.each_with_index.map do |_dir, index|
      steps(route: @input.slice(0, index))
    end.max
  end
end
