#! /bin/bash
#v1.0
#Created by Robert Fleming
#
#

ls | egrep '\.mp4$|\.mov$|\.mkv$'
echo ""
echo "Enter the file name to convert to MP4"
read EXT

filen=$( echo $EXT | cut -d "." -f1)
ffmpeg -i $EXT -vcodec h264 -acodec aac $filen.mp4
