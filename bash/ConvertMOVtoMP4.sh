#! /bin/bash
#v1.0
#Created by Robert Fleming
#
#
 
find . -name "*.mov" -exec ffmpeg -i {} -vcodec h264 -acodec mp2 {}.mp4 \;
