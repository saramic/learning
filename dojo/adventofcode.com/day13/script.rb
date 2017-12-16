h = ARGF.read.chomp.split("\n").inject({}) {|h,j|
  h.merge Hash[[j.split(": ").map(&:to_i)]]
}
puts h.inspect
puts (0..100_000_000).find { |delay|
  caught = (0..h.keys.max)
    .select{|k| h.has_key? k }
    .inject({}) { |cght, c|
      t = c + delay
      len = h[c] - 1
      pos = t == 0 ?
        0 :
        (t/len).odd? ?
          len -  (t % len) :
          (t % len)
      pos == 0 ? cght.merge(Hash[*[c, h[c]]]) : cght
  }
  result = caught.map{|(k,v)| k*v}.sum + caught.keys.length
  #puts [delay, result].inspect;
  result == 0
}
