#!/bin/bash

video=$1

ffmpeg -i "$video"-vn -acodec libmp3lame "cut_$video"
