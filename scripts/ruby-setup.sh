#!/usr/bin/env bash

handle_directory() {
  echo "Directory name: "
  read dir_name

  if [[ -z "$dir_name" ]]; then
    echo "Using $(pwd)"
  else
    mkdir $dir_name || echo "$dir_name already exists"
    cd $dir_name
    echo $dir_name > ".ruby-gemset"
  fi
}

ruby_installed() {
  which ruby
  if [[ $? -ne 0 ]]; then
    echo 'Ruby not installed, quitting'
    exit 1
  fi
}

gemfile() {
  cat > Gemfile <<EOL
source 'https://rubygems.org'

gem 'byebug'
#gem 'json'
gem 'rubocop'
#gem 'sinatra'
EOL
}

set_ruby_version() {
  echo "Select ruby version: "
  read version
  echo "${version}" > .ruby-version
}


ruby_installed
handle_directory
set_ruby_version
gemfile
