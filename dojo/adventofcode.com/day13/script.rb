h = ARGF.read.chomp.split("\n").inject({}) {|h,j|
  h.merge Hash[[j.split(": ").map(&:to_i)]]
}
puts h.inspect
caught = (0..h.keys.max)
  .select{|k| h.has_key? k }
  .inject({}) { |cght, c|
    len = h[c] - 1
    pos = c == 0 ? 0 : (c/len).odd? ? len -  (c % len) : (c % len)
    pos == 0 ? cght.merge(Hash[*[c, h[c]]]) : cght
}
puts caught.map{|(k,v)| k*v}.sum
