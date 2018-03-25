[![Coverage Status](https://coveralls.io/repos/github/willcurry/favourite-language/badge.svg?branch=master&service=github)](https://coveralls.io/github/willcurry/favourite-language?branch=master)
[![Build Status](https://travis-ci.org/willcurry/favourite-language.svg?branch=master)](https://travis-ci.org/willcurry/favourite-language)

## Setup

### Install the gems:

`bundle install`

### Set the required enviroment variables:

You can generate a token [here](https://github.com/settings/tokens). It doesn't require any scope.

`export GITHUB_ACCESS_TOKEN='xxxxxx'`

### Run the project:

`rackup`

### Run the tests:

`rspec`

## The app

Once the server is up head to http://localhost:9292/ and you will be able to search a username and will be presented with a webpage like this:

![alt text](https://github.com/willcurry/favourite-language/blob/master/languages.png)

Alternatively you can do a GET request on:

`http://localhost:9292/api/top?username=username_in_question`

And receive a json payload like this:

`[{"language":"Ruby","bytes":168181},
  {"language":"Java","bytes":122209},
  {"language":"Vim script","bytes":78081}]`
