Rails - A Simple Approach
====

[![Build Status](https://travis-ci.org/davetoxa/davetoxa.svg?branch=master)](https://travis-ci.org/davetoxa/davetoxa)
[![Code Climate](https://codeclimate.com/github/davetoxa/davetoxa/badges/gpa.svg)](https://codeclimate.com/github/davetoxa/davetoxa)
[![Test Coverage](https://codeclimate.com/github/davetoxa/davetoxa/badges/coverage.svg)](https://codeclimate.com/github/davetoxa/davetoxa/coverage)

### This is a simple app for educational purposes :+1: :smiley:
* Simple blog platform with comments
* Github auth
* Search
* Subscribtions

## Setup

* `git clone git@github.com:davetoxa/davetoxa.git`
* `bundle install`
* `cp .env.example .env` and configure
* `rake db:setup`
* add your github nickname to `secrets.yml` (for admin feature)
* setup github application for auth

## Tech
* Ruby on Rails 5
* Ruby 2.4
* Ansible for provisioning
