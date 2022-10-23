#!/bin/bash
export LANG=en_US.UTF-8

function print()
{
local subdirs=($1/*)
local subdir_count=${#subdirs[@]}
for counter in ${!subdirs[@]}; do 
	echo ${subdirs[$counter]##*/}
	if [ -d ${subdirs[$counter]} ]
	then print ${subdirs[$counter]}
	fi
done
}

print $1
