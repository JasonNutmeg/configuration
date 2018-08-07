#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Usage: \$ commit 'your commit message'"
	exit 1
fi

JIRA_SEPARATOR='_'
USER_MESSAGE=$1
JIRA_NUMBER=$(git rev-parse --abbrev-ref HEAD | cut -d $JIRA_SEPARATOR -f 1)

COMMIT_MESSAGE="$JIRA_NUMBER: $USER_MESSAGE"

echo $COMMIT_MESSAGE
git commit -m "$COMMIT_MESSAGE"
