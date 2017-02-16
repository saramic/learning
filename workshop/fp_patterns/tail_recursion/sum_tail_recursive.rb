def sum_tail_recursive(up_to, acc)
  up_to == 0 ? acc : sum_tail_recursive(up_to - 1, acc + up_to)
end
