#!/bin/bash

# check if fd is installed
if ! command -v fd &>/dev/null; then
	echo "fd could not be found"
	echo "install fd with 'brew install fd'"
	exit
fi
date=$1
# if date is empty, set it to "5m" for 5 minutes
if [ -z "$date" ]; then
	date="5m"
fi

fd --newer $date -x mv '{}' ~/Inbox/ \;
