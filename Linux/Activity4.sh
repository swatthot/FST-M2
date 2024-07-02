#!/bin/bash
touch song{7,8,9,10}.mp3
touch snap{7,8,9,10}.jpg
touch film{7,8,9,10}.mp4

mkdir -p Music1
mkdir -p Pictures1
mkdir -p Videos1

mv *.mp3 Music1/
mv *.jpg Pictures1/
mv *.mp4 Videos1/