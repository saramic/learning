module Demo
  def sum_recursive(up_to)
    up_to == 0 ? 0 : up_to + sum_recursive(up_to - 1)
  end

  def sum_tail_recursive(up_to, acc)
    up_to == 0 ? acc : sum_tail_recursive(up_to - 1, acc + up_to)
  end
end
