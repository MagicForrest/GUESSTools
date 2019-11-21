#!/bin/bash

######################################################################################################
### COMPARE TWO LPJ-GUESS RUNS
### 2017-05-26
### Matthew Forrest matthew.forrest@senckenberg.de
###
### Compares two LPJ-GUESS runs to check if they are scientifically identical.  By this I mean that the ordering of the lines of the files doesn't matter
### just the actual data.  First it checks that the files are the same lengths (a quick check for non-identicality), before sorting them and checking them more exactly.
### Note that is checks each file (names *.out) in the first run against a corresponding file in second run.  Extra files in the second run are ignored.
### Note also that some clusters produce log files with filenames like *.out which will flummox this simple script.  In this case, delete or rename the log file. 



echo "****** Comparing LPJ-GUESS runs in directories $1 and $2 *******"

startdir=$PWD

first=true
previous_count=0


# CHECK THE LINE COUNTS
echo "*** Comparing sizes of *.out files"
cd $1
for f in *.out 
do 
    count1=0
    count2=0
    count1=$(wc -l < $f)
    cd $startdir
    cd $2
    count2=$(wc -l < $f)
     
    if [ $count1 == $count2 ]
    then
	echo "File $f .... OK"
    else
	echo "File $f ... NOT OK"
	echo "Files have different lengths, runs NOT identical, exiting..."
	exit
    fi
    cd $startdir
    cd $1

done

cd $startdir

# CHECK THE ACTUAL DATA
echo "*** Output files have the same length in both runs, now checking the data."
cd $1
for f in *.out 
do
    sort $f > $f.sorted
    cd $startdir
    cd $2
    sort $f > $f.sorted
    cd $startdir
    diff $1/$f.sorted $2/$f.sorted > diff.temp
    rm $1/$f.sorted
    rm $2/$f.sorted
    if [[ -s  diff.temp ]] ; then
	echo "File $f ... NOT OK"
	echo "Files don't match (even after sorting), so runs NOT identical, exiting..."
	#rm diff.temp
	exit

    else
	echo "File $f .... OK"
	##rm diff.temp
    fi ;
    cd $1
done

cd $startdir

echo "*** Output files match in both runs. These runs are scientifically identical!"
echo "NOTE: The ordering of the data in the files might be different due to different run configurations of the runs"
