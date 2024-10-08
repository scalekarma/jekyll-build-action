#!/bin/sh

set -x # verbose mode
set -e # stop executing after error

echo "Starting Jekyll build"

####################################################
# Set workspace permissions
####################################################

chmod -R a+w /github/workspace
chown -R $(whoami):$(whoami) /github/workspace

git config --global safe.directory /github/workspace

git config --global --list

####################################################
# Build the Jekyll site
####################################################

jekyll build --trace JEKYLL_ENV=production

####################################################
# Build completed
####################################################

echo "Completed Jekyll build"
