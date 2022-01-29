import functools

@functools.cache
def play(p1, p2, s1=0, s2=0):
  if s2 >= 21: return 0, 1
  w1, w2 = 0, 0
  for d, n in (3,1),(4,3),(5,6),(6,7),(7,6),(8,3),(9,1):
      p = (p1 + d) % 10 or 10
      v2, v1 = play(p2, p, s2, s1+p)
      w1, w2 = w1 + v1*n, w2 + v2*n
  return w1, w2

print(max(play(7, 5)))
