#!/bin/bash

# Check if the directory to move is provided as an argument
if [ -z "$1" ]; then
	echo "Usage: $0 <directory-to-move>"
	exit 1
fi

# Define the archive directory
ARCHIVE_DIR="$HOME/4 Archive"

# Check if the archive directory exists, if not create it
if [ ! -d "$ARCHIVE_DIR" ]; then
	mkdir -p "$ARCHIVE_DIR"
fi

# Get the directory to move
DIR_TO_MOVE="$1"

# Check if the directory to move exists
if [ ! -d "$DIR_TO_MOVE" ]; then
	echo "Error: Directory '$DIR_TO_MOVE' does not exist."
	exit 1
fi

# Move the directory to the archive directory
mv "$DIR_TO_MOVE" "$ARCHIVE_DIR/"

# Check if the move was successful
if [ $? -eq 0 ]; then
	echo "Successfully moved '$DIR_TO_MOVE' to '$ARCHIVE_DIR/'"
else
	echo "Error: Failed to move '$DIR_TO_MOVE' to '$ARCHIVE_DIR/'"
	exit 1
fi
