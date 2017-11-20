#!/bin/bash
# Nikhil Grover
# CSE 391
# 11/12/17

A=$(echo -n $1 | wc -c)
B=$2
C=$A

while [ $C -gt -4 ]; do	
	echo -n "*"
	let C="$C-1"
done

echo

while [ $B -gt 0 ]; do 
	echo "* $1 *"
	let B="$B-1"
done

while [ $A -gt -4 ]; do
        echo -n "*"
        let A="$A-1"
done

echo
