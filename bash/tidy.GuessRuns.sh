#!/bin/bash

######################################################################################################
### TIDY AN LPJ-GUESS BATCH RUN
### 2017-05-26
### Matthew Forrest matthew.forrest@senckenberg.de
###
### Compresses (by using gzip and remove the duplicated files) an LPJ-GUESS batch run.
### Checks that the sum of the sizes of all the files in the run* directory matches the final *.out file, and that all the *.out files are the same length.
### If this is all okay, it removes the run* directories (since they are not needed any more), and gzips the final output.
### Note that some clusters produce log files with filenames like *.out which will flummox this simple script.  In this case, delete or rename the log file.
###
### 2019-0107 - additions
### Also direct all echo statements to a file (called tidy.log) and, if successful create a file called TIDIED_SUCCESSFULLY and output the number of lines in each file to nlines.txtit

echo "****** Checking LPJ-GUESS run in directory $PWD *******"
first=true
previous_count=0
rm \*.out
rm slurm-?*.out # For SLURM systems where the log file names are not set for the append job

# PREPARE THE OUTPUT FILES
rm tidy.log
touch tidy.log
rm TIDIED_SUCCESSFULLY


# CHECK THE LINE COUNTS
echo "*** Checking file sizes of *.out files" | tee -a tidy.log
for f in *.out 
do 
    echo "Processing $f file..." | tee -a tidy.log 
    count=$(wc -l < $f)

    # SPECIAL CASE: FIRST *.out file
    # Here we can't compare the the previous line count (because this is the first one), but we do check that the total lines in the run subdirectories match the final *.out file
    if [ "$first" = true ]
    then

	echo "First file $f has $count lines" | tee -a tidy.log
	first=false
	previous_count=$count

	# Count the lines in the sub-files
	total=0
	for temporary in run*/$f
	do
	    temporary_wc=$(($(wc -l < $temporary) - 1))
	    total=$(($total + $temporary_wc))
	done
	total=$(($total+1))

	# Check that the sub files and final output file have the same size
	if [ $count == $total ]
	then
	    echo "File $f has same number of lines as component files in run directories so is okay" | tee -a tidy.log
	else
	    echo "File $f does not have the same number of lines ($count) as component files in run directories ($total)" | tee -a tidy.log
	    echo "Output is corrupted! Exiting" | tee -a tidy.log
	    exit
	fi
	

    # ALL OTHER FILES
    # Just check that it has the same number of lines as the first file
    else
	if [ $count == $previous_count ]
	then
	    echo "File $f okay with $count lines" | tee -a tidy.log
	else
	    echo "File $f NOT okay with $count lines" | tee -a tidy.log
	    echo "Output is corrupted! Exiting" | tee -a tidy.log
	    exit
	fi
    fi

done

# REMOVE THE run* DIRECTORIES
echo "*** Removing the run* directories" | tee -a tidy.log
rm -rf run*

# GZIP THE *.out files
echo "*** Gzipping the *.out files" | tee -a tidy.log
gzip *.out

echo "Finished, tidying complete!" | tee -a tidy.log
echo $count >> TIDIED_SUCCESSFULLY
