#!/bin/bash

# Get the current date in yyyy-mm-dd format
current_date=$(date +'%Y-%m-%d')

# File to copy (change this to your file name)
file="your_file.txt"

# Check if the file exists
if [ -f "$file" ]; then
	# Get the directory and filename without extension
	directory=$(dirname "$file")
	filename=$(basename "$file" | cut -f 1 -d '.')

	# Get the file extension
	extension="${file##*.}"

	# Determine the separator character
	separator="${1:--}" # Use the first argument, or default to hyphen

	# Create a new filename with prepended date
	new_filename="${current_date}${separator}${filename}.${extension}"

	# Copy the file with the new filename
	cp "$file" "$directory/$new_filename"
	echo "Date prepended to filename: $new_filename"
else
	echo "Error: $file does not exist."
	exit 1
fi
