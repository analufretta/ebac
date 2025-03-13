#!/bin/bash

#Creating a program that
#1 - reads a csv file
#2 - formats it line per line
#3 counts the total number of lines

#parameter 1
if [ -z "$1" ]; then #if var $1 is empty, then
	echo 'No file provided. Please provide a file path as a parameter'
	exit 1 #General error exit
fi #closing 'if' statement

#parameter 2
if [ ! -f "$1" ]; then # ! inverts -f reads the file
	echo 'File not found! Please enter a valid path'
	exit 1
fi

line_count=0 #start line count

#reading the file
while IFS= read -r line; do

	if [ $line_count -eq 0 ]; then # = and == for strings, -eq to numeric comparisons
		IFS=',' read -r -a header <<< "$line" #creating head array
	else
		IFS=',' read -r -a liner <<< "$line" #creating lines arrays 
		result="" #empty variable
		
		for (( x=0; x<${#header[@]}; x++ )); #loop 
		do
		    result="${result} ${header[$x]}:${liner[$x]}"
	     	done

		echo "$result"
	fi
	((line_count++)) #increment: line_count=line_count+1
done < "$1"

echo "Total lines: $(($line_count-1))"

