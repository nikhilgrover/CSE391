#!/bin/bash
# Nikhil Grover
# HW6

# gradeit.sh grades a student's assignment, with a
# max score given in the args


# Check for args
if [ $# -eq 0 ]
    then
    echo "Usage: ./gradeit.sh MAXPOINTS"
else
    # ADDED FOR FORMATTING TO EXPECTED OUTPUT
    MAXPOINTS=$1
    echo "Retro Grade-It, 1970s version"
    echo "Grading with a max score of $MAXPOINTS"
    echo

    # Loop through the students in the directory
    for student in $(ls students/); do
	echo "Processing $student..."

	# I originally tried running gettysburg.sh from 
	# outside the student's directory, but if the script
	# doesn't exist or isn't named properly, the 
	# appropriate message is sent.
	
	cd students/$student/
	
	if [ -e gettysburg.sh ]
	    then
	    # run gettysburg.sh and direct to output.txt
	    bash ./gettysburg.sh > output.txt
	    # Need to go back to access expected.txt
	    cd ../..
	    
	    # FIRST DO LINE BY LINE COMPARISON
	    differences=$(diff -bw expected.txt ./students/$student/output.txt | grep "[<>]" | wc -l)

	    # Apply penalty
	    let SCORE="$MAXPOINTS - $differences * 5"

	    if [ $differences -gt 0 ]
		then
		echo "$student has incorrect output ($differences lines do not match)"
	    else
		echo "$student has correct output"
	    fi

	    # CHECK FOR COMMENTS
	    comments=$(grep "#" ./students/$student/gettysburg.sh | wc -l)
	    echo "$student has $comments lines with comments"
	    if [ $comments -lt 3 ]
		then
		let FINALSCORE="$SCORE - 7"
	    else
		let FINALSCORE=$SCORE
	    fi

	    # OUTPUT FINAL SCORE
	    if [ $FINALSCORE -lt 0 ]
		then
		echo "$student has earned a score of 0 / $MAXPOINTS"
	    else
		echo "$student has earned a score of $FINALSCORE / $MAXPOINTS"
	    fi
	    
	    # REMOVE TEMP FILE
	    rm ./students/$student/output.txt
	else
	    # Student mispelled or did not turn in gettysburg.sh
	    echo "$student did not turn in the assignment"
	    echo "$student has earned a score of 0 / $MAXPOINTS"
	    cd ../..
	fi
	echo
    done
fi


