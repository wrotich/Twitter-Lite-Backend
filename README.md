[![Build Status](https://travis-ci.org/wrotich/twitter-lite-backend.svg?branch=develop)](https://travis-ci.org/wrotich/twitter-lite-backend) [![CircleCI](https://circleci.com/gh/wrotich/twitter-lite-backend/tree/develop.svg?style=svg)](https://circleci.com/gh/wrotich/twitter-lite-backend/tree/develop) 

# TWITTER-LITE-BACKEND

Twitter-Lite is an application used to allow andelan users to read and post tweets.

# EXTERNAL-DEPENDENCIES

This web application is written with Ruby using the Ruby on Rails framework and a PostgreSQL database. You need Ruby version 2.4.1 for the application to work

* To install rvm , visit [RVM](https://rvm.io/rvm/install)
* To install this ruby version, you can run the command below but you can use other channels to install it as well e.g. `rbenv`.
    ```bash
    rvm install ruby-2.4.1
    ```
* To install PostgreSQL, run
    ```bash
    brew install postgres
    ```

*To know more about Ruby or Rails visit [Ruby Lang](https://www.ruby-lang.org) or [Ruby on Rails](http://rubyonrails.org/).*

# Installation

  1. Run `git clone https://github.com/wrotich/twitter-lite-backend.git`
  2. Run `bundle install`
  3. Run `rake db:create`
  4. Run `rake db:migrate`
  5. Run `rails s`
  6. Visit `localhost:3000`
