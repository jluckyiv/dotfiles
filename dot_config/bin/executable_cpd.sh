#!/bin/bash

# Check if the user provided a filename
if [ $# -ne 1 ]; then
	echo "Usage: $0 filename"
	exit 1
fi

# Get the filename from the command line argument
filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
	echo "File not found: $filename"
	exit 1
fi

# Get the current date in ISO-8601 format
current_date=$(date +%Y-%m-%d)

# Get the directory and base name of the file
dir=$(dirname "$filename")
base=$(basename "$filename")

# Create the new filename with the current date prepended
new_filename="$dir/$current_date-$base"

# Copy the file to the new filename
cp "$filename" "$new_filename"

# Print the new filename
echo "Copied to: $new_filename"
