# FFmpeg

Since FFmpeg scripts are not that easy to read, I created this repo where I share those that I deem useful. 

### Extract audio from video

To extract the audio from a video in .mp3 format

```
./audio_from_video.sh <VIDEO>
```

### Convert to MP3

To convert audio from .wav to .mp3 

```
./mp3.sh <WAVE_FILE>
```
The output is a file with the same name (but different extension) in mp3 format. 

### Concatenate Video

Merging `Concatenate Audio` and `Waveform` (see below). It takes all the audio files in a directory, concatenates them, and then creates a video with the resulting waveform. 
Also, it write down the timestamps in a json file. 

```
./concat_video.sh <DIRECTORY_WITH_AUDIO_FILES> <OUTPUT_FILE> <JSON_FILE>
```

### Concatenate Audio

Take all the audio files in a directory (format accepted: mp3, wav, flac, aac) and concatenate them in a single file. Also, it create a json file where the timestamps
for each file in the concatenated file are reported. 

```
./concat_audio.sh <DIRECTORY_WITH_AUDIO_FILES> <OUTPUT_FILE> <JSON_FILE>
```

### Waveform

Given an audio file, create a video with that audio and frames representing the corresponding waveform. 

```
./waveform.sh <PATH_TO_AUDIO> <OUTPUT_NAME>
```

### Chop

Chop a video from starting time to end time. 

```
./chop.sh <PATH_TO_VIDEO> <START_TIME> <END_TIME>

```

### Length report

Apply the `length.sh` script recursively on all the audio files in a directory, and writes a summary with the result for each file. Note: the `length.sh` script needs to be installed in `/bin/length`. 

```
./length_report.sh <TARGET_DIRECTORY>
```

### Length

It computes the length of a video in seconds. As simple as that. 

```
./length.sh <PATH_TO_VIDEO>
```

### Divide

Divide a video in chunks of fixed length. For instance, you can divide a 60-minute video into 6 chunks of 10 minutes each. 

```
./divide.sh <PATH_TO_VIDEO> <CHUNK_LENGTH>
```

Notice that there are various ways to set the chunk length. The easiest is in the format `hh:mm:ss`. However, also specifying just the minutes is fine, e.g. `10:00` for splitting every ten minutes. 