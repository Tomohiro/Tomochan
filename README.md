Tomochan
================================================================================

[![Stillmaintained](http://stillmaintained.com/Tomohiro/Tomochan.png)](http://stillmaintained.com/Tomohiro/Tomochan)
[![Dependency Status](https://img.shields.io/gemnasium/Tomohiro/Tomochan.svg?style=flat-square)](https://gemnasium.com/Tomohiro/Tomochan)
[![Build Status](https://img.shields.io/travis/Tomohiro/Tomochan.svg?style=flat-square)](https://travis-ci.org/Tomohiro/Tomochan)
[![Coverage Status](https://img.shields.io/coveralls/Tomohiro/Tomochan.svg?style=flat-square)](https://coveralls.io/r/Tomohiro/Tomochan)
[![Code Climate](https://img.shields.io/codeclimate/github/Tomohiro/Tomochan.svg?style=flat-square)](https://codeclimate.com/github/Tomohiro/Tomochan)


---

Screenshot
--------------------------------------------------------------------------------

![Tomochan](http://cl.ly/image/0U3l3T2P050G/Tomochan.png)


Requirements
--------------------------------------------------------------------------------

- Ruby 2.2.0


Deploy to Heroku
--------------------------------------------------------------------------------

1. Git clone this repository
2. Create app on Heroku
3. Configure environment variables
4. Deploy app

Commands

    $ git clone https://github.com/Tomohiro/Tomochan.git
    $ cd Tomochan
    $ heroku create <your_favorite_bot_name>
    $ heroku config add:KRIS_ENV=production IRC_SERVER=... IRC_PORT=... IRC_CHANNEL=... IRC_NICK=...
    $ git push heroku master
    $ heroku ps:scale bot=1


Development
--------------------------------------------------------------------------------

### Getting started

1. Git clone this repository
2. Install RubyGems
3. Configure IRC settings
4. Run bot

Commands

    $ git clone https://github.com/Tomohiro/Tomochan.git
    $ cd Tomochan
    $ bundle install --deployment
    $ vi Tomochan
    $ bundle exec ./Tomochan


### Plugin development flow

If you want to create a `awesome` plugin.

First, create a plugin spec file. For spec examples, see `spec` directory.

    $ vi spec/awesome_spec.rb

Second, create a plugin.

    $ vi plugin/awesome.rb

Last, run test.

    $ rake test


#### Automate test by Guard

    $ bundle exec guard


### Test framework

Use `minitest/spec`. Reference are below.

- [library minitest/spec](http://doc.ruby-lang.org/ja/1.9.3/library/minitest=2fspec.html)
- [A MiniTest::Spec Tutorial: Elegant Spec-Style Testing That Comes With Ruby](http://www.rubyinside.com/a-minitestspec-tutorial-elegant-spec-style-testing-that-comes-with-ruby-5354.html)


LICENSE
--------------------------------------------------------------------------------

&copy; 2013 - 2015 Tomohiro TAIRA.
This project is licensed under the MIT license.
See LICENSE for details.
