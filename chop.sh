#!/bin/bash

video=$1
start=$2
end=$3

ffmpeg -i $video -ss $start -to $end -c copy cut_$video
