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

$1 ~ /^"SAXPY_DO_OMP$/ {
    saxpydoomp=$7
}

END {
    printf "%s;%s;%s;%s\n", saxpy, saxpydo, saxpydoconcurrent, saxpydoomp >> file
}
