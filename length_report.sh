#!/bin/bash

function usage {
    echo "Usage: $0 [OPTIONS] TARGET_DIR"
    echo "Calculate the length of all audio files in TARGET_DIR and write a summary to a text file."
    echo
    echo "Options:"
    echo "  --help    display this help and exit"
}

# Handle the --help option
if [ "$1" == "--help" ]; then
    usage
    exit 0
fi

# Check if TARGET_DIR is provided
if [ -z "$1" ]; then
    echo "Error: TARGET_DIR is required."
    usage
    exit 1
fi

# Directory to search for audio files
TARGET_DIR=$1

# Remove trailing slash from TARGET_DIR if it exists
TARGET_DIR=${TARGET_DIR%/}

# The output file
OUTPUT_FILE="summary.txt"

# Clear the output file
> $OUTPUT_FILE

# Count the total number of files in the directory
TOTAL_FILES=$(find "$TARGET_DIR" -type f | wc -l)
PROCESSED_FILES=0

# Loop over all audio files in the target directory
for AUDIO_FILE in "$TARGET_DIR"/*
do
  # Check if it's a file (not a subdirectory, for example)
  if [ -f "$AUDIO_FILE" ]; then
    # Get the length of the audio file
    LENGTH=$(length "$AUDIO_FILE")
    
    # Write the file name and its length to the output file
    echo "$AUDIO_FILE: $LENGTH" >> $OUTPUT_FILE

    # Increment the number of processed files
    ((PROCESSED_FILES++))

    # Print progress
    echo -ne "$PROCESSED_FILES/$TOTAL_FILES"\\r
  fi
done

echo -e "\nSummary written to $OUTPUT_FILE"
