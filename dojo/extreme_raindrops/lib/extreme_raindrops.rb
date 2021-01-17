class ExtremeRaindrops
  RAINDROPS = {
    3 => "a",
    5 => "e",
    7 => "i",
    11 => "o",
    13 => "u",
    17 => "y"
  }

  def initialize(material = "plastic")
    @material = material
  end
  
  def rain_drops(num)
    output = ""
    RAINDROPS.keys.each do |key|
      output += resonance(:sound, key) if num % key == 0
    end

    output += num.to_s if output.empty?
    output
  end

  private

  def sound(resonant_sound)
    pre = "l"
    post = "ng"
    if @material =~ /glass/ # thanks Mathieu
      pre = "d"
      post = "ck"
    end
    [
      @material[0].upcase,
      pre,
      resonant_sound,
      post
    ].join
  end

  def resonance(surface, frequency)
    method(surface).call(RAINDROPS[frequency])
  end
end
