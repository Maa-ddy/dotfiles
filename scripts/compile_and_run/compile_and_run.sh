#!/bin/bash
#author: Maaddy
#compiles and runs the following files:
#	.cpp
#	.c
#	.java
#	.py
#usage:
#place this in your /usr/bin
#compile_and_run filename (without extension)
#compile_and_run will look for a file named "main" or "Main" in the current dir and compiles and runs it.

#bonus:
#create a dir named "testS" and make a text file inside it called "test0.txt"
#then running "compile_and_run" will compile and run your main file redirecting that text file as input
#but only if you put a comment (or name a variable) in your code as "codeforces"
#this feature is used to quicly test code on a test file when playing on a cp contest.


if [ $# -gt 1 ]; then
	echo -e "\e[1;93mWARNING: \e[0monly one file will be compiled and ran."
	echo "multiple files copmiling is in construction."
fi
target=$1
if [ $# -eq 0 ]; then
	files=`ls | grep -i "^main\."`
	number_of_files=0
	for file in $files; do
		if [ $number_of_files -eq 0 ]; then
			if [ $file != "Main.class" ]; then
				target=$file
			else
				number_of_files=$(($number_of_files - 1))
			fi
		fi
		number_of_files=$(($number_of_files + 1))
	done
	if [ $number_of_files -eq 0 ]; then
		echo -e "\e[1;91mERROR: \e[0mNo 'main' file found. please specify the file name you want to compile and run."
		exit 1
	fi
	if [ $number_of_files -gt 1 ]; then
		echo -e "\e[1;93mWARNING: \e[0mmultiple 'main' files found, but no specific name given."
		echo "compiling and running the first main found: ${target}"
		echo "..."
	fi
fi

if ! [ -f $target ]; then
	echo -e "\e[1;91mERROR: \e[0mFile '$target' not found. please verify the file name."
	exit 1
fi

file_extension=`echo $target | grep -o -i "\.[a-z]*"`
file_name=`echo $target | grep -o -i "[0-9a-z_-]*\." | grep -o "[^.]*"`

acm=`cat $target | grep "codeforces" | wc -l`


if [ -z $file_extension ]; then
	echo -e "\e[1;91mERROR: \e[0mUnknown file type. file name must have an extention (like .cpp or .py)."
	exit 1
fi

if [ $file_extension = ".py" ]; then
	if [ $acm -eq 0 ]; then
		python3 $target
	else
		#for now, you have to edit the test file manually. until the codeforces submitting script is ready.
		if [ -f "testS/test0.txt" ]; then
			python3 $target < testS/test0.txt
		else
			echo "No test files found. enter test manually:"
			python3 $target
		fi
	fi
elif [ $file_extension = ".c" ]; then
	if [ -f $file_name ]; then	#if there's a leftover file from previous interrupted compilation
		rm $file_name
	fi
	if [ $acm -eq 0 ]; then
		gcc $target -o $file_name && ./$file_name && rm $file_name
	else
		#for now, you have to edit the test file manually. until the codeforces submitting script is ready.
		if [ -f "testS/test0.txt" ]; then
			gcc $target -o $file_name && ./$file_name < testS/test0.txt && rm $file_name
		else
			echo "No test files found. enter test manually:"
			gcc $target -o $file_name && ./$file_name
		fi
	fi
elif [ $file_extension = ".cpp" ]; then
	if [ -f $file_name ]; then
		rm $file_name
	fi
	if [ $acm -eq 0 ]; then
		g++ $target -o $file_name && ./$file_name && rm $file_name
	else
		#for now, you have to edit the test file manually. until the codeforces submitting script is ready.
		if [ -f "testS/test0.txt" ]; then
			g++ $target -o $file_name && ./$file_name < testS/test0.txt && rm $file_name
		else
			echo "No test files found. enter test manually:"
			g++ $target -o $file_name && ./$file_name
		fi
	fi

elif [ $file_extension = ".java" ]; then
	if [ -f ${file_name}.class ]; then
		rm ${file_name}.class
	fi
	if [ $acm -eq 0 ]; then
		javac $target && java $file_name && rm ${file_name}.class
	else
		#for now, you have to edit the test file manually. until the codeforces submitting script is ready.
		if [ -f "testS/test0.txt" ]; then
			javac $target &&java $file_name < testS/test0.txt && rm ${file_name}.class
		else
			echo "No test files found. enter test manually:"
			javac $target && java $file_name && rm ${file_name}.class
		fi
	fi
else
	echo -e "\e[1;91mERROR: \e[0mNo compiler or interpreter for this type of files: '$file_extension' in this script. Compile it and run it manually."
	exit 1
fi