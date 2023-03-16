#/bin/bash

# Path to video
video=$1

# Get video name
name=$(basename $video)

# Time to be used to split
chop=$2

ffmpeg -i $video -threads 3 \
       -vcodec copy -f segment -segment_time $chop \
       -reset_timestamps 1 \
       split_%02d_$name