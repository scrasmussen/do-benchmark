#!/usr/bin/env  bash
function run {
    echo $@
    eval $@
    if [[ $? -eq 139 ]]; then
       echo "SEGFAULT"
       exit 1
    fi
}


export TAU_OPTIONS='-optNoMPI -optPreProcess'
export TAU_OPTIONS='-optNoMPI -optPreProcess -optKeepfiles'
export TAU_MAKEFILE=/apps/software/TAU/2.27-foss-2018a/x86_64/lib/Makefile.tau-papi-pdt-openmp-opari

rm -f output.txt
echo ";SAXBY;SAXBY_DO;SAXBY_DO_CONCURRENT" >> output.txt
for (( i=1; i<=1000; i+=100 ))
# for (( i=1; i<=1050000; i+=10000 ))
do
    if [ $i -eq 1 ]; then
	let n=1
    else
	let n=$i-1
    fi
    cmd="tau_f90.sh -g -O3 -DSETN=${n} -DSETRUN=1000 saxpy.F90 -o saxpy.exe"
    run $cmd
    run "./saxpy.exe"
    printf "${n};" >> output.txt
    run "./extractInfo.awk profile.0.0.0"
done
echo "FIN"
