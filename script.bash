#!/bin/bash
export LANG=en_US.UTF-8
d=0
f=0
function print()
{
local subdirs=($1/*)
local subdir_count=${#subdirs[@]}
local c=$2
for counter in ${!subdirs[@]}; do 
	for ((i=0; i<c; i++)); do
		echo -n "│   "
	done
	
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
		print ${subdirs[$counter]} $(($c+1))
	elif [ -f ${subdirs[$counter]} ]
	then
		((f++))
	fi
done
}

if [ -z "$1" ]
then
	echo '.'
	print '.' 0
else
	echo $1
	print $1 0
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
