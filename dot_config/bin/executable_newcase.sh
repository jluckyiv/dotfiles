#!/bin/bash
folder_name=$1
regex='.*([0-9]{10})$'

if [[ $folder_name =~ $regex ]]; then
	mkdir -p "$folder_name"
	cd "$folder_name"
	ref_number="${BASH_REMATCH[1]}"
	touch "scheduling-order-$ref_number.md"
else
	echo "Folder name does not end in 10 digits"
fi
