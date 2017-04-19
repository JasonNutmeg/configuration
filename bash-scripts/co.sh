#!/bin/bash

# Check out a git branch by passing in a unique string to identify the branch.

if [ $# -eq 0 ]; then
	echo "Usage: \$ co part_of_branch_name"
	return 1
fi

BRANCH_COUNT=`git branch | grep -c $1`
BRANCH=`git branch | grep $1`

if [ $BRANCH_COUNT -eq 0 ]; then
	echo "No branches found"
	return 1
elif [ $BRANCH_COUNT -gt 1 ]; then
	printf  "More than one branch found:\n$BRANCH"
	return 1
fi

git checkout $BRANCH
