require 'minitest/autorun'
require 'yaml'
require 'rexml/document'
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require 'adapter_pattern'

describe AdapterPattern do
  before(:all) do
    data = File.open(File.join(File.dirname(__FILE__), 'data.yaml')).read
    @adapter_pattern = AdapterPattern.new(YAML.load(data))
  end

  let(:output) { @adapter_pattern.execute(self.class.to_s) }

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

  describe "outputs the data as fixed width" do
    it do
      # skip
      expected_output = <<-EO_FIXED_WIDTH.gsub(/^\s*__/, '')
      __   Name                                          PClass    Age Sex    Survived SexCode
      __ 1 Allen, Miss Elisabeth Walton                  1st     29    female        1       1
      __ 2 Allison, Miss Helen Loraine                   1st      2    female        0       1
      __ 3 Allison, Mr Hudson Joshua Creighton           1st     30    male          0       0
      __ 4 Allison, Mrs Hudson JC (Bessie Waldo Daniels) 1st     25    female        0       1
      __ 5 Allison, Master Hudson Trevor                 1st      0.92 male          1       0
      __ 6 Anderson, Mr Harry                            1st     47    male          1       0
      __ 7 Andrews, Miss Kornelia Theodosia              1st     63    female        1       1
      __ 8 Andrews, Mr Thomas, jr                        1st     39    male          0       0
      __ 9 Appleton, Mrs Edward Dale (Charlotte Lamson)  1st     58    female        1       1
      __10 Artagaveytia, Mr Ramon                        1st     71    male          0       0
      EO_FIXED_WIDTH
      assert_equal expected_output, output
    end
  end
  describe "outputs the data as ASCII table" do
    it do
      # skip
      expected_output = <<-END_OF_ASCII_TABLE.gsub(/^\s*/, '')
        +--------------------------------------------------------------------------------------------+
        |          |Name                                         |PClass|Age |Sex   |Survived|SexCode|
        +--------------------------------------------------------------------------------------------+
        |        1 |Allen, Miss Elisabeth Walton                 |1st   |29  |female|1       |1      |
        +--------------------------------------------------------------------------------------------+
        |        2 |Allison, Miss Helen Loraine                  |1st   |2   |female|0       |1      |
        +--------------------------------------------------------------------------------------------+
        |        3 |Allison, Mr Hudson Joshua Creighton          |1st   |30  |male  |0       |0      |
        +--------------------------------------------------------------------------------------------+
        |        4 |Allison, Mrs Hudson JC (Bessie Waldo Daniels)|1st   |25  |female|0       |1      |
        +--------------------------------------------------------------------------------------------+
        |        5 |Allison, Master Hudson Trevor                |1st   |0.92|male  |1       |0      |
        +--------------------------------------------------------------------------------------------+
        |        6 |Anderson, Mr Harry                           |1st   |47  |male  |1       |0      |
        +--------------------------------------------------------------------------------------------+
        |        7 |Andrews, Miss Kornelia Theodosia             |1st   |63  |female|1       |1      |
        +--------------------------------------------------------------------------------------------+
        |        8 |Andrews, Mr Thomas, jr                       |1st   |39  |male  |0       |0      |
        +--------------------------------------------------------------------------------------------+
        |        9 |Appleton, Mrs Edward Dale (Charlotte Lamson) |1st   |58  |female|1       |1      |
        +--------------------------------------------------------------------------------------------+
        |        10|Artagaveytia, Mr Ramon                       |1st   |71  |male  |0       |0      |
        +--------------------------------------------------------------------------------------------+
      END_OF_ASCII_TABLE
      assert_equal expected_output, output
    end
  end

  describe "outputs the data as HTML" do
    it do
      skip
      expected_output = <<-END_OF_HTML.gsub(/^\s*/, '')
        <table class="table table-bordered table-hover table-condensed">
          <thead>
            <tr><td align="right"></td><td>Name</td><td>PClass</td><td>Age</td><td>Sex</td><td>Survived</td><td>SexCode</td></tr>
          </thead>
          <tbody>
            <tr><td align="right">1</td><td>Allen, Miss Elisabeth Walton</td><td>1st</td><td>29</td><td>female</td><td>1</td><td>1</td></tr>
            <tr><td align="right">2</td><td>Allison, Miss Helen Loraine</td><td>1st</td><td>2</td><td>female</td><td>0</td><td>1</td></tr>
            <tr><td align="right">3</td><td>Allison, Mr Hudson Joshua Creighton</td><td>1st</td><td>30</td><td>male</td><td>0</td><td>0</td></tr>
            <tr><td align="right">4</td><td>Allison, Mrs Hudson JC (Bessie Waldo Daniels)</td><td>1st</td><td>25</td><td>female</td><td>0</td><td>1</td></tr>
            <tr><td align="right">5</td><td>Allison, Master Hudson Trevor</td><td>1st</td><td>0.92</td><td>male</td><td>1</td><td>0</td></tr>
            <tr><td align="right">6</td><td>Anderson, Mr Harry</td><td>1st</td><td>47</td><td>male</td><td>1</td><td>0</td></tr>
            <tr><td align="right">7</td><td>Andrews, Miss Kornelia Theodosia</td><td>1st</td><td>63</td><td>female</td><td>1</td><td>1</td></tr>
            <tr><td align="right">8</td><td>Andrews, Mr Thomas, jr</td><td>1st</td><td>39</td><td>male</td><td>0</td><td>0</td></tr>
            <tr><td align="right">9</td><td>Appleton, Mrs Edward Dale (Charlotte Lamson)</td><td>1st</td><td>58</td><td>female</td><td>1</td><td>1</td></tr>
            <tr><td align="right">10</td><td>Artagaveytia, Mr Ramon</td><td>1st</td><td>71</td><td>male</td><td>0</td><td>0</td></tr>
          </tbody>
        </table>
      END_OF_HTML
      expected_xml = REXML::Document.new(expected_output)
      output_xml =   REXML::Document.new(output)
      assert_equal expected_xml.to_s(2), output_xml.to_s(2)
    end
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
