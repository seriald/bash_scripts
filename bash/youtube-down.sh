#! /bin/bash
echo "Please enter the URL to the video"
read link

echo "Video to download: $link"
echo ""

# yt-dlp $link -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" -k
yt-dlp $link -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" -k --no-check-certificate
echo ""
