#!/bin/bash

SOURCE="-y -f lavfi -i smptebars -frames 10"
SRCCOLOR="iall=bt601-6-525"
FAST=""

ffmpeg $SOURCE -vf colorspace=$SRCCOLOR:all=bt709:format=yuv420p:range=pc:$FAST -frames 1 srgb.png
ffmpeg $SOURCE -vf colorspace=$SRCCOLOR:all=bt601-6-525:format=yuv420p:range=mpeg:$FAST bt601_420.ogv
ffmpeg $SOURCE -vf colorspace=$SRCCOLOR:all=bt601-6-525:format=yuv420p:range=mpeg:$FAST -c:v libvpx bt601_420_vp8.webm
ffmpeg $SOURCE -vf colorspace=$SRCCOLOR:all=bt601-6-525:format=yuv420p:range=mpeg:$FAST -c:v libvpx-vp9 bt601_420_vp9.webm
ffmpeg $SOURCE -vf colorspace=$SRCCOLOR:all=bt709:format=yuv420p:range=mpeg:$FAST -c:v libvpx-vp9 bt709_420_vp9.webm
ffmpeg $SOURCE -vf colorspace=$SRCCOLOR:all=bt2020:format=yuv420p:range=mpeg:$FAST -c:v libvpx-vp9 bt2020_420_vp9.webm
