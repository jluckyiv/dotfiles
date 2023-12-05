#!/bin/bash

date=$1
refno=$2

# check if refno is a 10-digit number
if [[ ! $refno =~ ^[0-9]{10}$ ]]; then
	echo "Usage: add_refno.sh <date> <refno>"
	exit 1
fi
fd -e pdf --newer $date -x rename "s/\.pdf$/ $refno.pdf/" {} \;
