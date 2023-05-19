#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]
then
  echo "Usage: $0 <target_directory> <output_file>"
  exit 1
fi

# Arguments
target_directory=$1
output_file=$2

# Temporary file list
file_list=$(mktemp)

# Find all .wav, .mp3, .flac, .aac files in the target directory
find "$target_directory" -type f \( -iname \*.wav -o -iname \*.mp3 -o -iname \*.flac -o -iname \*.aac \) | while read -r file
do
  # Convert to absolute path and Append each file to the list
  echo "file '$(readlink -f "$file")'" >> "$file_list"
done

# Concatenate all audio files
ffmpeg -f concat -safe 0 -i "$file_list" -c copy "$output_file"

# Remove the temporary file
rm "$file_list"
