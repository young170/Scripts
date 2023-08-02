#!/bin/bash

###
# init
###
if [ $# -eq 0 ];
then
	echo "$0: Missing arguments"
	echo "use option <help, h> for help"
	exit 1
fi

###
# help
###
if [ $1 = "help" ] || [ $1 = "h" ];
then
    echo "==================================================="
	echo "git_push_process.sh"
    printf "\t- script to efficiently execute git_push commands.\n"
	printf "instructions:\t$USER \$ git_push_process.sh <options>\n"
    printf "options:\n"
	printf "\t<help, h> prints list of commands.\n"

	printf "\t<run, r> runs all three(add, commit, push) with default settings.\n"
	printf "\t\t- git add .\n"
	printf "\t\t- git commit -m \"[\$date] Modified - \$USER\"\n"
    printf "\t\t- git push origin\n"

	printf "\t<add, a> executes git_add related commands.\n"
	printf "\t\t- [\$2] state file(s) to add.\n"

	printf "\t<commit, c> executes git_commit related commands.\n"
	printf "\t\t- [\$2] state mode(Add, Update, Delete, etc.).\n"
	printf "\t\t- [\$3] state file(s) modified.\n"
	printf "\t\t- [\$4] state user(s) to blame. \$USER as default\n"

	printf "\t<push, p> executes git_push related commands.\n"
	printf "\t\t- [\$2] state branch to push.\n"	
	exit 1
fi

###
# run default
###
if [ $1 = "run" ] || [ $1 = "r" ];
then

	# get changes from git_status
	# git_status.sh > changes
#	SCRIPT_PATH="/usr/local/bin/git_status_process.sh"
#	eval '"$SCRIPT_PATH"' > changes

	now=$(date +%F)
	git add .
    echo "Done...git_add"
	git commit -m "[$now] - Modified - $USER"
    echo "Done...git_commit"
	git push origin
    echo "Done...git_push"
	exit 1
fi

###
# git_add
###
if [ $1 = "add" ] || [ $1 = "a" ];
then
	git add $2
	echo "Done...git_add"
	exit 1
fi

###
# git_commit
###
if [ $1 = "commit" ] || [ $1 = "c" ];
then
	user=$USER

	if [ $4 != "" ];
	then
		user=$4
	fi

	# $2: mode(add, delete, update, etc.), $3: file/path
	git commit -m "[$(date +%F)] $2 $3 - $user"
	echo "Done...git_commit"
fi

###
# git_push
###
if [ $1 = "push" ] || [ $1 = "p" ];
then
	git push $2
	echo "Done...git_push"
	exit 1
fi

###
# exception
###
	echo "use option <help, h>"
	exit 1
