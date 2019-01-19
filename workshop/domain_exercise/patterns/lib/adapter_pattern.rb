class AdapterPattern
  def initialize(data)
    # TODO your domain initializations gets kicked off here
    # @data = AdapterData.new(data)

  end

  def execute(command)
    case command
    when /outputs the data as (.*)$/
      # TODO format data
      # @data.format = $1
      # @data.output
    else
      raise ArgumentError.new("not supported command #{command.inspect}")
    end
  end
end

# TODO maybe add some classes
# -    @data = AdapterData.new(data)
+    # @data = AdapterData.new(data)
 
   end
 
   def execute(command)
     case command
     when /outputs the data as (.*)$/
-      # TODO find gear
-      @data.format = $1
-      @data.output
+      # TODO format data
+      # @data.format = $1
+      # @data.output
     else
       raise ArgumentError.new("not supported command #{command.inspect}")
     end
@@ -18,108 +18,3 @@ class AdapterPattern
 end
 
 # TODO maybe add some classes
-require 'csv'
-require 'erb'
-
-module Adapter
-  class Csv
-    def self.output(data)
-      CSV.generate do |csv|
-        headers = data.first.keys
-        headers[0] = '' # drop the row number
-        csv << headers
-        data.each do |row|
-          csv << row.values
-        end
-      end
-    end
-  end
-
-  class FixedWidth
-    def self.output(data)
-      output = []
-      puts widths.inspect
-      headers = data.first.keys
-      headers[0] = '' # drop the row number
-      output << headers.map{|value| value}
-      data.each do |row|
-        output << row.values.map{|value| value }
-      end
-      output << headers.each_with_index.map{|value, index| "%-#{widths[index]}s" % value }
-      data.each do |row|
-        output << row.values.each_with_index.map{|value, index| "%-#{widths[index]}s" % value }
-      end
-      widths = data.each_with_object(Hash.new(0)) { |row, length_store| row.each_with_index{|(key, field), index| key_length = key.chars.length; length = field.chars.length; length = [key_length, length].max; length_store[index] = length if length > length_store[index] } }
-      output.join("\n")
-    end
-  end
-
-  class AsciiTable
-    def self.output(data)
-      'ascii table output'
-    end
-  end
-
-  class Html
-    def self.output(data)
-      'html output'
-    end
-  end
-end
-
-class AdapterData
-  def initialize(data)
-    @rows = data
-    @adapter = Adapter.const_get(formats.first.to_s.capitalize)
-  end
-
-  def format=(format)
-    format_name = format.to_s.split(/\W/).collect(&:capitalize).join.to_sym
-    raise ArgumentError.new("#{format_name} not found in supported formats #{formats}") unless formats.include? format_name
-    @adapter = Adapter.const_get(format_name)
-  end
-
-  def formats
-    Adapter.constants
-  end
-
-  def output
-    @adapter.output(@rows)
-#      elsif format == 'fixed width'
-#        <<-EOF
-#     Name                                          PClass    Age Sex    Survived SexCode
-#   1 Allen, Miss Elisabeth Walton                  1st     29    female        1       1
-#   2 Allison, Miss Helen Loraine                   1st      2    female        0       1
-#   3 Allison, Mr Hudson Joshua Creighton           1st     30    male          0       0
-#   4 Allison, Mrs Hudson JC (Bessie Waldo Daniels) 1st     25    female        0       1
-#   5 Allison, Master Hudson Trevor                 1st      0.92 male          1       0
-#   6 Anderson, Mr Harry                            1st     47    male          1       0
-#   7 Andrews, Miss Kornelia Theodosia              1st     63    female        1       1
-#   8 Andrews, Mr Thomas, jr                        1st     39    male          0       0
-#   9 Appleton, Mrs Edward Dale (Charlotte Lamson)  1st     58    female        1       1
-#  10 Artagaveytia, Mr Ramon                        1st     71    male          0       0
-#  EOF
-#      elsif format == 'HTML'
-#        <<-END_OF_HTML.strip
-#          <table class="table table-bordered table-hover table-condensed">
-#            <thead>
-#              <tr><td align="right"></td><td>Name</td><td>PClass</td><td>Age</td><td>Sex</td><td>Survived</td><td>SexCode</td></tr>
-#            </thead>
-#            <tbody>
-#              <tr><td align="right">1</td><td>Allen, Miss Elisabeth Walton</td><td>1st</td><td>29</td><td>female</td><td>1</td><td>1</td></tr>
-#              <tr><td align="right">2</td><td>llison, Miss Helen Loraine</td><td>1st</td><td>2</td><td>female</td><td>0</td><td>1</td></tr>
-#              <tr><td align="right">3</td><td>llison, Mr Hudson Joshua Creighton</td><td>1st</td><td>30</td><td>male</td><td>0</td><td>0</td></tr>
-#              <tr><td align="right">4</td><td>llison, Mrs Hudson JC (Bessie Waldo Daniels)</td><td>1st</td><td>25</td><td>female</td><td>0</td><td>1</td></tr>
-#              <tr><td align="right">5</td><td>llison, Master Hudson Trevor</td><td>1st</td><td>0.92</td><td>male</td><td>1</td><td>0</td></tr>
-#              <tr><td align="right">6</td><td>Anderson, Mr Harry</td><td>1st</td><td>47</td><td>male</td><td>1</td><td>0</td></tr>
-#              <tr><td align="right">7</td><td>Andrews, Miss Kornelia Theodosia</td><td>1st</td><td>63</td><td>female</td><td>1</td><td>1</td></tr>
-#              <tr><td align="right">8</td><td>Andrews, Mr Thomas, jr</td><td>1st</td><td>39</td><td>male</td><td>0</td><td>0</td></tr>
-#              <tr><td align="right">9</td><td>Appleton, Mrs Edward Dale (Charlotte Lamson)</td><td>1st</td><td>58</td><td>female</td><td>1</td><td>1</td></tr>
-#              <tr><td align="right">10</td><td>Artagaveytia, Mr Ramon</td><td>1st</td><td>71</td><td>male</td><td>0</td><td>0</td></tr>
-#            </tbody>
-#          </table>
-#        END_OF_HTML
-#      end
-  end
-end
-
