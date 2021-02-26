#!/usr/bin/env bash

installWith() {
    if [ $1 == "curl" ]; then
        echo "Installing using CURL"
        sudo curl -L -k https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
        sudo chmod a+rx /usr/local/bin/youtube-dl
        echo "Installation complete"
    elif [ $1 == "wget" ]; then
        echo "Installing using WGET"
        sudo wget -O /usr/local/bin/youtube-dl https://yt-dl.org/downloads/latest/youtube-dl
        sudo chmod a+rx /usr/local/bin/youtube-dl
        echo "Installation complete"
    elif [ $1 == "brew" ]; then
        echo "Installing using Homebrew"
        brew install youtube-dl
        echo "Installation complete"
    elif [ $1 == "apt" ]; then
        echo "Installing using Debian APT"
        sudo apt install youtube-dl ffmpeg alsa-utils -y
    elif [ $1 == "paru" ]; then
        echo "Installing using Paru AUR helper"
        paru -S youtube-dl ffmpeg alsa-utils
    elif [ $1 == "yay" ]; then
        echo "Installing using Yay AUR helper (just use Paru tbh)"
        yay -S youtube-dl ffmpeg alsa-utils
    elif [ $1 == "pacman" ]; then
        echo "Installing using Pacman (Arch Linux)"
        sudo pacman -S youtube-dl ffmpeg alsa-utils
    elif [ $1 == "emerge" ]; then
        echo "Installing using Portage (Gentoo)"
        sudo emerge youtube-dl ffmpeg alsa-utils
    elif [ $1 == "yum" ]; then
        echo "Installing using Yum (RHEL/Fedora)"
        sudo yum -y install youtube-dl ffmpeg alsa-utils
    fi
}


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "GNU/Linux detected."
    if ! command -v youtube-dl &> /dev/null; then
        if command -v apt &> /dev/null; then
            installWith apt
        elif command -v pacman &> /dev/null; then
            if command -v paru &> /dev/null; then
                installWith paru
            elif command -v yay &> /dev/null; then
                installWith yay
            else
            	installWith pacman
            fi
        elif command -v emerge &> /dev/null; then
            installWith emerge
        elif command -v yum &> /dev/null; then
            installWith yum
        elif command -v curl &> /dev/null; then
            installWith curl
        elif command -v wget &> /dev/null; then
            installWith wget
        fi
    fi

    youtube-dl -f 140 <VIDEO ID> -o /tmp/thing.m4a
    ffmpeg -i /tmp/thing.m4a /tmp/thing.wav
    aplay /tmp/thing.wav
    rm /tmp/thing.m4a
    rm /tmp/thing.wav
elif [[ "$OSTYPE" == "darwin"* ]] ; then
    echo "macOS detected."
    if ! command -v youtube-dl &> /dev/null; then
        if command -v brew &> /dev/null; then
            installWith brew
        elif command -v curl &> /dev/null; then
            installWith curl
        elif command -v wget &> /dev/null; then
            installWith wget
        fi
    fi

    youtube-dl -f 140 <VIDEO ID> -o /tmp/thing.m4a
    afplay /tmp/thing.m4a
    rm /tmp/thing.m4a
fi
