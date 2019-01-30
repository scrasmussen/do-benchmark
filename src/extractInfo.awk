#!/bin/awk  -f

# print NF # FIELD IS COLUMN
# print NR # RECORD IS LINE
# $4 = number of loops
# $6 = total inclusive/exclusive time
# $7 = total inclusive/exclusive time

BEGIN {
    num=0 # number of loops
}

$1 ~ /^"SAXPY$/ {
    if (!num) {
    	num=$4
    }
    saxpy=$7
}

$1 ~ /^"SAXPY_DO$/ {
    saxpydo=$7
}

$1 ~ /^"SAXPY_DO_CONCURRENT$/ {
    saxpydoconcurrent=$7
}


END {
    printf "%s;%s;%s\n", saxpy, saxpydo, saxpydoconcurrent >> "output.txt"
    # printf "%s;%s;%s;%s\n", num, saxpy, saxpydo, saxpydoconcurrent >> "output.txt"
}
