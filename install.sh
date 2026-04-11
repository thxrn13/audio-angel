#!/bin/bash
set -e
function install_ffmpeg() {
    if which apt; then
        sudo apt install -y ffmpeg
    elif which apt-get; then
        sudo apt-get install -y ffmpeg
    elif which pacman; then
        sudo pacman -Sy ffmpeg
    elif which yum; then
        sudo yum install -y ffmpeg
    elif which brew; then
        brew install ffmpeg
    else
        echo "Cannot determine correct FFmpeg package. Please install and then continue."
        exit 1
    fi
}

# check for systemd directory, make directory if not exist
[ -d ~/.config/systemd/user/ ] || mkdir -p ~/.config/systemd/user/

# check for ffmpeg
which ffmpeg || install_ffmpeg

# curl to output directory
curl -LsSf https://raw.githubusercontent.com/thxrn13/audio-angel/refs/heads/main/audio-angel.service --output ~/.config/systemd/user/audio-angel.service

# enable and start service
systemctl --user enable --now keep-alive.service
