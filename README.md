# FFmpeg

Since FFmpeg scripts are not that easy to read, I created this repo where I share those that I deem useful. 

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