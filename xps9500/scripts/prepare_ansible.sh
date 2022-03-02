#!/bin/bash
PYTHON_VERSION=3.10.1

sudo apt update
sudo apt -y dist-upgrade

sudo apt install -y libssl-dev libbz2-dev libreadline-dev libsqlite3-dev --no-install-recommends

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init --path)"\nfi' >> ~/.bashrc

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION
pip install ansible
