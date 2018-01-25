require 'minitest/autorun'
require 'yaml'
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require 'adaptor_pattern'

describe AdaptorPattern do
  before(:all) do
    data = File.open(File.join(File.dirname(__FILE__), 'data.yaml')).read
    @adaptor_pattern = AdaptorPattern.new(YAML.load(data))
  end

  let(:output) { @adaptor_pattern.execute(self.class.to_s) }

  describe "outputs the data as CSV" do
    it do
      # skip
      expected_output = <<-EO_CSV.gsub(/^\s*/, '')
        "",Name,PClass,Age,Sex,Survived,SexCode
        1,"Allen, Miss Elisabeth Walton",1st,29,female,1,1
        2,"Allison, Miss Helen Loraine",1st,2,female,0,1
        3,"Allison, Mr Hudson Joshua Creighton",1st,30,male,0,0
        4,"Allison, Mrs Hudson JC (Bessie Waldo Daniels)",1st,25,female,0,1
        5,"Allison, Master Hudson Trevor",1st,0.92,male,1,0
        6,"Anderson, Mr Harry",1st,47,male,1,0
        7,"Andrews, Miss Kornelia Theodosia",1st,63,female,1,1
        8,"Andrews, Mr Thomas, jr",1st,39,male,0,0
        9,"Appleton, Mrs Edward Dale (Charlotte Lamson)",1st,58,female,1,1
        10,"Artagaveytia, Mr Ramon",1st,71,male,0,0
      EO_CSV
      assert_equal expected_output, output
    end
  end

  describe "outputs the data as even width" do
  end
  describe "outputs the data as an ASCII table" do
  end
  describe "outputs the data as HTML" do
  end
  describe "allows CSV to specify the order of columns" do
  end

  describe "transpose the data" do
    describe "outputs the data as even width" do
    end
    describe "outputs the data as an ASCII table" do
    end
    describe "outputs the data as HTML" do
    end
  end
end
