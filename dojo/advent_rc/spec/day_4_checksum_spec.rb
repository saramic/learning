require 'spec_helper'

def create_checksum(code)
  Hash[
    code.
    chars.
    reject{|c| c !~ /[a-z]/}.
    inject(Hash.new(0)) {|hash, char| hash[char] += 1; hash }.
    sort{|a,b|
      (b[1] <=> a[1]) == 0 ?
        a[0] <=> b[0] :
        b[1] <=> a[1]

    }
  ].keys.slice(0,5).join
end

def solver_day_4(input)
  input.split(/\n/).map do |line|
    m = /(.*)-(\d*)\[(.*)\]/.match(line)
    code =  m[1]
    sector = m[2].to_i
    checksum = m[3]
    my_checksum = create_checksum(code)

    my_checksum == checksum ? sector : 0
  end.reduce(:+)
end

RSpec.describe 'day 4' do
  [
    ['a-1[a]', 1],
    ['a-1[b]', 0],
    ['aab-1[b]', 0],
    ['a-a--b-1[ab]', 1],
    ['a-1-a-2-b-1[ab]', 1],
    ['abcdef-1[abcde]', 1],
    ['ooa-1[oa]', 1],
    ['ooaa-1[ao]', 1],
    ['aaaaa-bbb-z-y-x-123[abxyz]', 123],
    ['a-b-c-d-e-f-g-h-987[abcde]', 987],
    ['not-a-real-room-404[oarel]', 404],
    ['totally-real-room-200[decoy]', 0],
    ["""gbc-frperg-pubpbyngr-znantrzrag-377[rgbnp]
nij-mywlyn-wlsiayhcw-jfumncw-alumm-mbcjjcha-422[mcjwa]
pualyuhapvuhs-ibuuf-zhslz-227[uhalp]""", 1026],
    [File.read('./spec/day_4_data.txt'), 409147]
  ].each do |(input, output)|
    it_should_behave_like 'input output solver', :solver_day_4, input, output
  end
end
