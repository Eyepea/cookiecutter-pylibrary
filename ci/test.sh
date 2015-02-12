#!/bin/bash -eE
shopt -s xpg_echo

if [ -z "$1" ]; then
    echo Usage:
    echo    $0 env-name
    exit 1
fi

echo "\033[1;36m================================\033[0m"
echo "\033[1;36m================================ Testing: $1\033[0m"
echo "\033[1;36m================================\033[0m"

set -x
pwd
cp ci/envs/$1.cookiecutterrc ~/.cookiecutterrc
cat ~/.cookiecutterrc
cookiecutter --no-input .
cd python-nameless
git init .
git config user.email "you@example.com"
git config user.name "Your Name"
git add .
git commit -m "initial."
tox
