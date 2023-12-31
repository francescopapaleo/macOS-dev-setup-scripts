!#/bin/bash

# convert all flac files in a directory to wav

for input in *.flac; do
    output="${input%.*}.wav"    # keep the same name, but change the extension
    ffmpeg -i "$input" "$output"
done

