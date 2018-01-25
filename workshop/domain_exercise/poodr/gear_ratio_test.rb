require 'minitest/autorun'
require 'yaml'
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require 'gear_ratio_domain'

describe GearRatioDomain do
  before(:all) do
    data = File.open(File.join(File.dirname(__FILE__), 'data.yaml')).read
    @gear_ratio_domain = GearRatioDomain.new(YAML.load(data))
  end

  let(:output) { @gear_ratio_domain.execute(self.class.to_s) }

  describe "find gear 1 and return it's ratio" do
    it do
      # skip
      assert_equal 4.7273, output
    end
  end

  describe "find gear 2 and return it's ratio" do
    it do
      skip
      assert_equal 1.1111, output
    end
  end

  describe "find gear 3 and return it's ratio" do
    it 'raises an ArgumentError exception for gear objects that cannot be found' do
      skip
      assert_raises(ArgumentError) { @gear_ratio_domain.execute(self.class.to_s) }
    end
  end
end
