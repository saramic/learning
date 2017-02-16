# bash challenge 5

from https://itsfoss.com/bash-challenge-5/

    cat >> sample.data
    102
    071
    210
    153

    declare -i SUM=0
    while read X ; do
      SUM+=$X
    done < sample.data
    echo "Sum is: $SUM"

  > 522

# answer

  should be 536 as 071 is read as octal so 57 and 71 - 57 = 14
  and 522 + 14 = 536

    declare -i SUM=0
    while read X ; do
      SUM+=$((10#$X))
    done < sample.data
    echo "Sum is: $SUM"


