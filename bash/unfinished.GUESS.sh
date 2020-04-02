#!/bin/bash

# some initialisation
prefix="run"
declare -a finished_runs=()
declare -a all_runs=()


# get the finished runs
alllines=`sh progress.sh | grep -B 10 Finished | grep 'Last few lines'`
while IFS= read -r line; do
    IFS='/' # space is set as delimiter                                                                  
    read -ra ADDR <<< "$line" # str is read into an array as tokens separated by IFS                      
    tempstr=${ADDR[1]}
    runnum=${tempstr#"$prefix"}
    finished_runs+=("$runnum")
    #echo $runnum
    #for i in "${ADDR[@]}"; do # access each element of array                                             
    #	echo "$i"
    #done
done <<< "$alllines"


# get all the runs
alllines=`sh progress.sh | grep 'Last few lines'`
while IFS= read -r line; do
    IFS='/' # space is set as delimiter                                                                  
    read -ra ADDR <<< "$line" # str is read into an array as tokens separated by IFS                      
    tempstr=${ADDR[1]}
    runnum=${tempstr#"$prefix"}
    all_runs+=("$runnum")
    #echo $runnum
    #for i in "${ADDR[@]}"; do # access each element of array                                             
    #	echo "$i"
    #done
done <<< "$alllines"



# get the unfinished runs
echo ${all_runs[@]} ${finished_runs[@]} | tr ' ' '\n' | sort | uniq -u


