Tomochan
================================================================================

[![Build Status](https://secure.travis-ci.org/Tomohiro/Tomochan.png)](https://secure.travis-ci.org/Tomohiro/Tomochan)
[![Dependency Status](https://gemnasium.com/Tomohiro/Tomochan.png)](https://gemnasium.com/Tomohiro/Tomochan)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/Tomohiro/Tomochan)


---


### Deploy to Heroku

1. Git clone
2. Create app on Heroku
3. Configure environment variables
4. Deploy app


    $ git clone https://github.com/Tomohiro/Tomochan.git
    $ cd Tomochan
    $ heroku create your_favorite_bot_name
    $ heroku config add:KRIS_ENV=production IRC_SERVER=... IRC_PORT=... IRC_CHANNEL=... IRC_NICK=...
    $ git push heroku master
    $ heroku ps:scale bot=1
