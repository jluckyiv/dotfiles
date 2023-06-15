#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <filename>"
	exit 1
fi

input_file="$1"

if [[ ! -f "$input_file" ]]; then
	echo "Error: File '$input_file' not found"
	exit 1
fi

max_number=0
for file in *; do
	if [[ $file =~ ^Scheduling[[:space:]]Order[[:space:]]No\.[[:space:]][0-9]{1,2}\.docx$ ]]; then
		number=$(echo $file | grep -o -E '[0-9]+')
		if ((number > max_number)); then
			max_number=$number
		fi
	fi
done

new_number=$((max_number + 1))
new_file="Scheduling Order No. $new_number.docx"

pandoc "$input_file" -o "$new_file"
