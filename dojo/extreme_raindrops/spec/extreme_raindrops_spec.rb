require 'extreme_raindrops'

RSpec.describe ExtremeRaindrops do
  [
    { input: 1, output: "1"},
    { input: 3, output: "Plang"},
    { input: 5, output: "Pleng"},
    { input: 7, output: "Pling"},
    { input: 11, output: "Plong"},
    { input: 13, output: "Plung"},
    { input: 17, output: "Plyng"},
    { input: 15, output: "PlangPleng"},
    { input: 21, output: "PlangPling"},
    { input: 63, output: "PlangPling"},
    { input: 255255, output: "PlangPlengPlingPlongPlungPlyng"},
  ].each do |args|
    it "returns #{args[:output].inspect} for the input #{args[:input].inspect}" do
    plastic_drop = ExtremeRaindrops.new
      expect(
        plastic_drop.rain_drops(args[:input])
        ).to eq(args[:output])
    end
  end

  it "can initialize an extreme raindrop with a material" do
    brick_drop = ExtremeRaindrops.new("brick")
    expect(brick_drop.rain_drops(255255)).to eq("BlangBlengBlingBlongBlungBlyng")    
  end

  it "can initialize an extreme raindrop with a material glass" do
    glass_drop = ExtremeRaindrops.new("glass")
    expect(glass_drop.rain_drops(255255)).to eq("GdackGdeckGdickGdockGduckGdyck")    
  end


  it "can initialize an extreme raindrop with a material cermaic" do
    glass_drop = ExtremeRaindrops.new("cermaic")
    expect(glass_drop.rain_drops(255255)).to eq("ClangClengClingClongClungClyng")    
  end


  it "can initialize an extreme raindrop with a material wood" do
    glass_drop = ExtremeRaindrops.new("woood")
    expect(glass_drop.rain_drops(255255)).to eq("WlangWlengWlingWlongWlungWlyng")    
  end

end
