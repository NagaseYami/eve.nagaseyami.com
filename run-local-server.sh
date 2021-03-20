#!/bin/bash

set -ex

git fetch --prune
git reset --hard
git checkout dev
git pull
bundle exec jekyll serve --host 0.0.0.0
