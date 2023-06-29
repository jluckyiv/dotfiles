#!/bin/bash

folder_name=$(pwd)
regex='.*([0-9]{10})$'

if [[ $folder_name =~ $regex ]]; then
	folder_name="${BASH_REMATCH[1]}"
	touch "scheduling-order-$folder_name.md"
else
	echo "Folder name does not end in 10 digits"
fi
