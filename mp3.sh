#!/bin/bash

# Get the input file
input="$1"

# Remove the extension
base_name="${input%.*}"

# Add the new extension
output="${base_name}.mp3"

# Convert to mp3 at 44.1kHz
ffmpeg -i $input -vn -ar 44100 -ac 2 -b:a 192k $output