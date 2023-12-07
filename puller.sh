#!/bin/bash

# Instructions:
# 1. Clone all repositories into a directory on your computer
#   - Use ssh, not https
#   - Use the students' real names for the subdirectories
#   - $ git clone git@github.com:username/repository.git FirstnameLastname
# 2. Make the script executable
#   - $ chmod +x puller.sh
# 3. Run the script
#   - $ ./puller.sh

CURRENT_DIRECTORY=$(pwd)

for i in $(find . -name ".git" | cut -c 3-); do
    echo "Pulling $(dirname "$i")..."
    cd "$(dirname "$i")"
    if git show-ref --verify --quiet refs/heads/main; then
        git checkout --quiet main
    else
        git checkout --quiet master
    fi
    git reset --quiet --hard HEAD
    git pull --quiet
    cd "$CURRENT_DIRECTORY"
done

echo "Done!"
