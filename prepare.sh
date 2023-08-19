#!/bin/bash

# Check if npm is already installed
if ! command -v npm &> /dev/null; then
    echo "npm is not installed. Installing..."

    # Check which package manager is available and install npm accordingly
    if command -v apt &> /dev/null; then
        sudo apt update
        sudo apt install -y npm
    elif command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y npm
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y npm
    else
        echo "Unsupported package manager. Please install npm manually."
        exit 1
    fi

    echo "npm has been installed."
else
    echo "npm is already installed."
fi

echo "now installing Node Version Manager"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
source ~/.nvm/nvm.sh #load nvm into current shell session
source ~/.bashrc #load bashrc changes
echo "installing Node:11"
nvm install 11
nvm use 11
echo "Pulling StixUI project"
git pull https://github.com/valentin-source/StixUI.git
cd ./app
echo "Building and running Project:"
npm run build
cd ./build
xdg-open ./index.html
