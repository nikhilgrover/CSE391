#!/bin/bash
# Nikhil Grover
# CSE 391
# 11/12/17

for file in $@; do
    echo "$file: "
    LINES=$(wc -l < $file)
    echo "  lines: $LINES"
    NONBLANKS=$(grep "." $file | wc -l)
    let BLANKS="$LINES-$NONBLANKS"
    let PERCENT="$BLANKS*100/$LINES"
    echo "  blank: $BLANKS ($PERCENT%)"
    CHARS=$(wc -m < $file)
    WORDS=$(wc -w < $file)
    let DIV="$CHARS/$WORDS"
    echo "  chars: $CHARS in $WORDS words ($DIV char/word)"
done
