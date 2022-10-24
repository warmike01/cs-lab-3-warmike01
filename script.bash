#!/bin/bash
export LANG=en_US.UTF-8
d=0
f=0
function print()
{
local subdirs=($1/*)
local subdir_count=${#subdirs[@]}
local c=$2
local flag=$3
for counter in ${!subdirs[@]}; do 
	if [ $flag -eq 0 ]
	then
		for ((i=0; i<c; i++)); do
			echo -n "│   "
		done
	else
	for ((i=1; i<c; i++)); do
			echo -n "│   "
		done
	echo -n "    "
	fi
	if [ $counter -eq $(($subdir_count-1)) ]
		then
		echo -n "└── "
		else
		echo -n "├── "
		fi
	echo ${subdirs[$counter]##*/}
	if [ -d ${subdirs[$counter]} ]
	then 
		((d++))
		if [ $counter -eq $(($subdir_count-1)) ]
		then
			print ${subdirs[$counter]} $(($c+1)) 1
		else
			print ${subdirs[$counter]} $(($c+1)) 0
		fi
	elif [ -f ${subdirs[$counter]} ]
	then
		((f++))
	fi
done
}

if [ -z "$1" ]
then
	echo '.'
	print '.' 0 0
else
	echo $1
	print $1 0 0
fi
printf '\n'
echo -n $d
if [ $d -eq 1 ]
then
echo -n " directory, "
else
echo -n " directories, "
fi
echo -n $f
if [ $f -eq 1 ]
then
echo " file"
else
echo " files"
fi
