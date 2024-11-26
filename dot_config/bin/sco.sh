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

if grep -q "fixme" "$1"; then
	echo "Error: File contains 'fixme'"
	grep -n "fixme" "$1"
	exit 1
fi

if grep -E '\s+:::' "$1"; then
	echo "Error: File contains '^\s+:::'"
	grep -n -E '\s+:::' "$1"
	exit 1
fi

max_number=0
for file in *; do
	if [[ $file =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}[[:space:]]Scheduling[[:space:]]Order[[:space:]]No\.[[:space:]][0-9]{1,2}\.docx$ ]]; then
		number=$(echo "$file" | grep -o -E '[0-9]+\.docx$' | grep -o -E '[0-9]+')
		if ((number > max_number)); then
			max_number=$number
		fi
	fi
done

new_number=$((max_number + 1))
current_date=$(date +%Y-%m-%d)
new_file="$current_date Scheduling Order No. $new_number.docx"

pandoc "$input_file" -o "$new_file"
