# encoding: utf-8

require 'tumblr_client'

class TumblrPhoto < Kris::Plugin
  def initialize(*args)
    super
    Tumblr.configure do |config|
      config.consumer_key    = ENV['TUMBLR_CONSUMER_KEY']
      config.consumer_secret = ENV['TUMBLR_CONSUMER_SECRET']
    end
  end

  def on_privmsg(message)
    if message.body =~ /^img (?<keyword>.+)$/
      notice(message.to, photo_url($~[:keyword]))
    end
  end

  private
    def photo_url(keyword)
       client = Tumblr::Client.new
       photo_urls = [];

       posts = client.tagged(keyword)
       posts.each do |post|
         if post['type'] == 'photo'
           post['photos'].each do |photo|
             photo_urls << photo['alt_sizes'][0]['url']
           end
         end
       end
       photo_urls[rand(photo_urls.length)]
    end
end
