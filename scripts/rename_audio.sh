!#/bin/bash

# rename all files in a directory

# modify all file names that match a pattern

for file in *_converted.wav; do
  newname="${file/_converted/}" # replace _converted with nothing
  mv "$file" "$newname"
done
