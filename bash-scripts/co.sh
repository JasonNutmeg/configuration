#!/bin/bash

# Check out a git branch by passing in a unique string to identify the branch.

if [ $# -eq 0 ]; then
	echo "Usage: \$ co part_of_branch_name"
	return 1
fi

BRANCH_COUNT=`git branch | grep -c $1`
BRANCH=`git branch | grep "$1" | xargs` # xargs trims the whitespace

if [ $BRANCH_COUNT -eq 0 ]; then
	REMOTE_BRANCHES_COUNT=`git branch -a | grep -c "$1"`
	REMOTE_BRANCH=`git branch -a | grep "$1" | xargs` # xargs trims the whitespace

	if [ $REMOTE_BRANCHES_COUNT -eq 0 ]; then
		echo "No branches found"
		return 1
	fi

	if [[ $REMOTE_BRANCH == "remotes/origin/"* ]]; then # if starts with remote branch
		BRANCH=`echo $REMOTE_BRANCH | cut -d'/' -f 3` # split string by '/' and use the 3rd substring
	fi	
elif [ $BRANCH_COUNT -gt 1 ]; then
	printf  "More than one branch found:\n$BRANCH"
	return 1
elif [[ $BRANCH == \** ]]; then
	printf  "Already on branch: $BRANCH"
	return 1
fi

git checkout $BRANCH
