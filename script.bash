#!/bin/bash
export LANG=en_US.UTF-8

function print()
{
local subdirs=($1/*)
local subdir_count=${#subdirs[@]}
local c=$2
for counter in ${!subdirs[@]}; do 
	for ((i=1; i<c; i++)); do
		echo -n "│   "
	done

	if [ -d ${subdirs[$counter]} ]
	then 
		echo -n "├── "
		
		echo ${subdirs[$counter]##*/}
		print ${subdirs[$counter]} $(($c+1))
	elif [ -f ${subdirs[$counter]} ]
	then
		echo -n "└── "
		echo ${subdirs[$counter]##*/}
	fi
done
}

print $1 0
