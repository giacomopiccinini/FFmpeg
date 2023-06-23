#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -ne 3 ]
then
  echo "Usage: $0 <target_directory> <output_file> <json_file>"
  exit 1
fi

# Arguments
target_directory=$1
output_file=$2
json_file=$3

# Temporary file list
file_list=$(mktemp)

# Initialize elapsed time
elapsed_time=0

# Start the json file
echo "{" > "$json_file"

# Find all .wav, .mp3, .flac, .aac files in the target directory
find "$target_directory" -type f \( -iname \*.wav -o -iname \*.mp3 -o -iname \*.flac -o -iname \*.aac \) | while read -r file
do
  # Convert to absolute path and Append each file to the list
  abs_file=$(readlink -f "$file")
  echo "file '$abs_file'" >> "$file_list"
  
  # Get the duration of the file in seconds
  duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$abs_file")
  duration=${duration%.*} # remove decimal part
  
  # Get the filename only
  filename=$(basename "$file")
  
  # Print this information to the JSON file
  echo "  \"$filename\": {" >> "$json_file"
  echo "    \"start\": $elapsed_time," >> "$json_file"
  elapsed_time=$((elapsed_time + duration))
  echo "    \"end\": $elapsed_time" >> "$json_file"
  echo "  }," >> "$json_file"
done

# Remove the trailing comma from the JSON
sed -i '$ s/,$//' "$json_file"

# End the json file
echo "}" >> "$json_file"

# Concatenate all audio files
ffmpeg -y -f concat -safe 0 -i "$file_list" -af aresample=44100 -ac 2 -c:a pcm_s16le "$output_file"

#ffmpeg -f concat -safe 0 -i "$file_list" -c copy "$output_file"

# Remove the temporary file
rm "$file_list"
