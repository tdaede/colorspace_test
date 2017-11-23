#!/bin/bash

SOURCE="-y -f lavfi -i testsrc -frames 10"

ffmpeg $SOURCE -vf colorspace=iall=bt709:irange=pc:all=bt709:format=yuv420p:range=pc:fast=1 -frames 1 srgb.png
ffmpeg $SOURCE -vf colorspace=iall=bt709:irange=pc:all=bt601-6-525:format=yuv420p:range=mpeg:fast=1 bt601_420.ogv
ffmpeg $SOURCE -vf colorspace=iall=bt709:irange=pc:all=bt601-6-525:format=yuv420p:range=mpeg:fast=1 -c:v libvpx bt601_420_vp8.webm
ffmpeg $SOURCE -vf colorspace=iall=bt709:irange=pc:all=bt601-6-525:format=yuv420p:range=mpeg:fast=1 -c:v libvpx-vp9 bt601_420_vp9.webm
ffmpeg $SOURCE -vf colorspace=iall=bt709:irange=pc:all=bt709:format=yuv420p:range=mpeg:fast=1 -c:v libvpx-vp9 bt709_420_vp9.webm
ffmpeg $SOURCE -vf colorspace=iall=bt709:irange=pc:all=bt2020:format=yuv420p:range=mpeg:fast=1 -c:v libvpx-vp9 bt709_420_vp9.webm
