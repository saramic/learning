require 'yaml'

#File.expand_path(File.dirname(__FILE__))
DATA = YAML.load_file(File.join(File.dirname(__FILE__), "numerals.yml"))

def roman(i)
  DATA.each { |r, a| return r + roman(i-a) if i >= a }
  ""
end

def roman_tail(i, acc="")
  DATA.each { |r, a| return roman_tail(i-a, acc + r) if i >= a }
  acc
end

