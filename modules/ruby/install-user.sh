#!/bin/zsh

set -e

rbenv install -s 3:latest
rbenv global $(rbenv versions --bare | grep '^3\.' | tail -1)

