def sumTailRecursive(upTo: BigDecimal, accumulator: BigDecimal): BigDecimal = {
  if (upTo == 0) accumulator else sumTailRecursive(upTo - 1, accumulator + upTo)
}

println(sumTailRecursive(BigDecimal(args(0)), 0))

