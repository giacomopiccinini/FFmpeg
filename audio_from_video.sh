#!/bin/bash

video=$1

# Remove the extension
base_name="${video%.*}"

# Add the new extension
output="${base_name}.mp3"

ffmpeg -i "$video" -vn -acodec libmp3lame "$output"
