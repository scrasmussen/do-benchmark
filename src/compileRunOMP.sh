#!/usr/bin/env  bash
function run {
    echo $@
    eval $@
    if [[ $? -eq 139 ]]; then
       echo "SEGFAULT"
       exit 1
    fi
}


export TAU_OPTIONS='-optNoMPI -optPreProcess -optContinueBeforeOMP'
export TAU_MAKEFILE=/apps/software/TAU/2.27-foss-2018a/x86_64/lib/Makefile.tau-papi-pdt-openmp-opari
file=saxpy_omp
echo "-----------------------omp num threads = ${OMP_NUM_THREADS}"

optimization="-O0"
fflag="-g ${optimization}"
output=outputSaxpy${optimization}.txt
rm -f ${output}
echo  "tau_f90.sh ${fflag} -DSETN=n -DSETRUN=10000 ${file}.F90 -o ${file}.exe" >> ${output}
echo ";SAXPY;SAXPY_DO;SAXPY_DO_CONCURRENT;SAXPY_DO_OMP" >> ${output}
for (( i=1; i<=4000000; i+=50000 ))
# for (( i=1; i<=4; i+=50000 ))
do
    if [ $i -eq 1 ]; then
    	let n=1
    else
    	let n=$i-1
    fi

    cmd="tau_f90.sh ${fflag} -DSETN=${n} -DSETRUN=10000 ${file}.F90 -o ${file}.exe"
    run $cmd
    run "./${file}.exe"
    printf "${n};" >> ${output}
    run "./extractInfoOMP.awk profile.0.0.0 ${output}"
    run "rm -f ${file}.exe"
done


optimization="-O3"
fflag="-g ${optimization}"
output=outputSaxpy${optimization}.txt
rm -f ${output}
echo  "tau_f90.sh ${fflag} -DSETN=n -DSETRUN=10000 ${file}.F90 -o ${file}.exe" >> ${output}
echo ";SAXPY;SAXPY_DO;SAXPY_DO_CONCURRENT;SAXPY_DO_OMP" >> ${output}
for (( i=1; i<=4000000; i+=50000 ))
# for (( i=1; i<=4; i+=50000 ))
do
    if [ $i -eq 1 ]; then
    	let n=1
    else
    	let n=$i-1
    fi

    cmd="tau_f90.sh ${fflag} -DSETN=${n} -DSETRUN=10000 ${file}.F90 -o ${file}.exe"
    run $cmd
    run "./${file}.exe"
    printf "${n};" >> ${output}
    run "./extractInfoOMP.awk profile.0.0.0 ${output}"
    run "rm -f ${file}.exe"
done


echo "FIN"
