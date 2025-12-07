#!/bin/zsh

set -e

brew install rbenv ruby-build

rbenv install -s 3:latest
rbenv global $(rbenv versions --bare | grep '^3\.' | tail -1)
