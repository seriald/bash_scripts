#! /bin/bash
#v1.0
#Created by Robert Fleming
#
#


find . -name "*.flac" -exec ffmpeg -i {} -ab 160k -map_metadata 0 -id3v2_version 3 {}.mp3 \;
