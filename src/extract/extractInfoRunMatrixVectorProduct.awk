#!/bin/awk -f

# print NF # FIELD IS COLUMN
# print NR # RECORD IS LINE
# $4 = number of loops
# $6 = total inclusive/exclusive time
# $7 = total inclusive/exclusive time

BEGIN {
    file=ARGV[2] # output file
    num=0 # number of loops
}

# Stop once the output file gets processed
FILENAME == file {
    exit
}

$1 ~ /^"MAT_VEC_PRODUCT_DO$/ {
    matdo=$7
}

$1 ~ /^"MAT_VEC_PRODUCT_DO_CONCURRENT$/ {
    matdoconcurrent=$7
}

$1 ~ /^"MAT_VEC_PRODUCT_OMP$/ {
    matdoomp=$7
}

END {
    printf "%s;%s;%s\n", matdo, matdoconcurrent, matdoomp >> file
}
