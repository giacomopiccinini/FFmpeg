#!/bin/bash

ffprobe -v error -show_entries stream=bits_per_raw_sample -of default=noprint_wrappers=1:nokey=1 $1
