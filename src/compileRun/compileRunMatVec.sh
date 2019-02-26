#!/usr/bin/env  bash
function run {
    echo $@
    eval $@
    if [[ $? -eq 139 ]]; then
       echo "SEGFAULT"
       exit 1
    fi
}

function program {
    fflag="-g ${optimization}"
    output=output${extract}${optimization}.txt
    loop_count=1000
    loop_count=1
    rm -f ${output}
    echo  "tau_f90.sh ${fflag} -DSETN=n -DLOOPCOUNT=${loop_count} math/${file}.F90 tools.o -o ${file}.exe" >> ${output}
    echo ";MAT_VEC_DO;MAT_VEC_DO_CONCURRENT;MAT_VEC_DO_OMP" >> ${output}
    # for (( i=1; i<=4000000; i+=50000 ))
	for (( i=500; i<=1000; i+=1000 ))
    do
	if [ $i -eq 1 ]; then
    	    let n=1
	else
    	    let n=$i-1
	fi

	cmd="tau_f90.sh ${fflag} -DSETN=${n} -DSETLOOP=${loop_count} tools.o math/${file}.F90 -o ${file}.exe"
	run $cmd
	run "./${file}.exe"
	printf "${n};" >> ${output}
	run "./extract/extractInfo${extract}.awk profile.0.0.0 ${output}"
	run "rm -f ${file}.exe"
    done
}


# set TAU OPTIONS and file name

# parse command line arguments for optimization level
for arg in "$@"; do
    case $arg in
	-file=*)
	    file=${arg#"-file="}
	    extract=${file^}
	    ;;
	-O0|-O1|-O2|-O3)
	    optimization=$arg
	    ;;
	*)
	    echo $arg "not an accepted argument"
	    exit 1
	    ;;
    esac
done

if [ -n "$file" ] && [ -n "$extract" ]; then
    program
else
    echo "Stopping early, file needs to be set with -file=[name] and -extract=[method name]"
fi

echo "FIN"
