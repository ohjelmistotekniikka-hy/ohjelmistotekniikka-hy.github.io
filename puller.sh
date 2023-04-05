#!/bin/bash

# Instructions:
# 1. Clone all repositories into a directory on your computer
#   - Use ssh, not https
#   - Use the students' real names for the subdirectories
#   - $ git clone git@github.com:username/repository.git FirstnameLastname
# 2. Make the script executable
#   - $ chmod +x pull.sh
# 3. Run the script
#   - $ ./pull.sh

CURRENT_DIRECTORY=$(pwd)

echo "Pulling in latest changes for all repositories..."

for i in $(find . -name ".git" | cut -c 3-); do
    echo ""
    echo "$(dirname "$i")"
    cd "$(dirname "$i")"
    if git show-ref --verify --quiet refs/heads/main; then
        git checkout main
    else
        git checkout master
    fi
    git reset --hard HEAD
    git pull
    cd "$CURRENT_DIRECTORY"
done

echo "Complete!"
