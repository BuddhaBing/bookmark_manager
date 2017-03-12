# Bookmark Manager

[![Build Status](https://travis-ci.org/treborb/bookmark_manager.svg?branch=master)](https://travis-ci.org/treborb/bookmark_manager)
[![codecov](https://codecov.io/gh/treborb/bookmark_manager/branch/master/graph/badge.svg)](https://codecov.io/gh/treborb/bookmark_manager)

## [Makers Academy](http://www.makersacademy.com) - Week 4 - Paired Programming Challenge

## Technologies
* [Ruby v2.3.3](https://www.ruby-lang.org/en/)
* [Sinatra](http://www.sinatrarb.com/)
* [PostgreSQL](https://www.postgresql.org/)
* [Rspec](http://rspec.info/)
* [Capybara](https://github.com/teamcapybara/capybara)

## Jump To
* [User Stories](#user-stories)
* [Installation](#install)
* [Usage](#usage)
* [Tests](#tests

## The Brief

Build a bookmark manager in Ruby, using Sinatra and PostgreSQL. A bookmark manager is a website to maintain a collection of URLs. You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse links other users have added.

## <a name="user-stories">User Stories</a>

```
As a User
So I can see what's on the website
I want to see a list of links from the database

As a User
So the list is organised,
I want to see the list of links in descending chronological order.

As a User
So that the website can be updated
I want to add new links to the database

As a User
So that links can be grouped
I want to add tags to the links

As a user
So that I can see an output of links by group
I want the links to be filtered by a tag
```

## <a name="install">Installation</a>

```
$ git clone https://github.com/treborb/bookmark_manager.git
$ cd example
$ rvm use 2.3.3 --install --binary --fuzzy
$ gem install bundler
$ bundle
```

## <a name="usage">Usage</a>

```
$ rackup
$ open http://localhost:9292
```

You can then sign up and begin adding links

## <a name="tests">Running the tests</a>
```
$ rspec
```
