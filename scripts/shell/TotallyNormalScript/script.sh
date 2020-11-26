#!/usr/bin/env sh

installWith() {
    if [[ $1 == "curl" ]]; then
        echo "Installing using CURL"
        sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
        sudo chmod a+rx /usr/local/bin/youtube-dl
        echo "Installation complete"
    elif [[ $1 == "wget" ]]; then
        echo "Installing using WGET"
        sudo wget -O /usr/local/bin/youtube-dl https://yt-dl.org/downloads/latest/youtube-dl
        sudo chmod a+rx /usr/local/bin/youtube-dl
        echo "Installation complete"
    elif [[ $1 == "brew" ]]; then
        echo "Installing using Homebrew"
        brew install youtube-dl
        echo "Installation complete"
    fi
}


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "GNU/Linux detected."
    if ! command -v youtube-dl &> /dev/null; then
        if command -v curl &> /dev/null; then
            installWith curl
        elif command -v wget &> /dev/null; then
            installWith wget
        fi
    fi

    youtube-dl -f 140 "https://www.youtube.com/watch?v=dQw4w9WgXcQ" -o /tmp/thing.m4a
    aplay /tmp/thing.m4a
    rm /tmp/thing.m4a
elif [[ "$OSTYPE" == "darwin"* ]]; then
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

    youtube-dl -f 140 "https://www.youtube.com/watch?v=dQw4w9WgXcQ" -o /tmp/thing.m4a
    afplay /tmp/thing.m4a
    rm /tmp/thing.m4a
fi
