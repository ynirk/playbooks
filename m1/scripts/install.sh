#!/bin/zsh

PYTHON_VERSION=3.10.3

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ${HOME}/.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off

# install pyenv
brew install pyenv
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# install python & ansible
pyenv install $PYTHON_VERSION
# fix pyenv bug
touch ${HOME}/version
pyenv global $PYTHON_VERSION

# install ansible
pip install ansible

