#!/usr/bin/env bash
# set -x
set -ueo pipefail

# homebrew
if [[ ! -x "$(command -v brew)" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# jenkins 
if ! brew list | grep "jenkins"; then
    brew install jenkins
fi

# rbenv
if ! brew list | grep "rbenv"; then
    brew install rbenv ruby-build
fi

# Install ruby using rbenv
ruby_version=$(cat .ruby-version)
if [[ ! -d "$HOME/.rbenv/versions/$ruby_version" ]]; then
    rbenv install "$ruby_version"
fi

# Install bundle
gem install bundle

# Install gems
bundle install

# Install pods
bundle exec pod install
