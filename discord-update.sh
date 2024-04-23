#!/bin/bash

directory="$HOME/Downloads/"
files=($(find "$directory" -maxdepth 1 -type f -name "discord*" -print))

highest_version=""
for file in "${files[@]}"; do
    filename=$(basename "$file")
    version=$(echo "$filename" | sed 's/discord-\(.*\)\.deb/\1/')
    if [[ -z $highest_version || $version > $highest_version ]]; then
        highest_version=$version
    fi
done

echo "Highest version found: $highest_version"
sudo apt install "${directory}discord-$highest_version.deb" -y
