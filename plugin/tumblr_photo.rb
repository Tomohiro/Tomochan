# encoding: utf-8

require 'tumblr_client'

class TumblrPhoto < Kris::Plugin
  def initialize(*args)
    super
    Tumblr.configure do |config|
      config.consumer_key    = ENV['TUMBLR_CONSUMER_KEY']
      config.consumer_secret = ENV['TUMBLR_CONSUMER_SECRET']
    end
    @tumblr = Tumblr::Client.new
  end

  def on_privmsg(message)
    if message.body =~ /^img (?<keyword>.+)$/
      notice(message.to, photo_url($~[:keyword]))
    end
  end

  private
    def photo_url(keyword)
      items = @tumblr.tagged(keyword)
      items.select! do |item|
        item['type'] == 'photo'
      end

      raise StandardError.new unless items.size

      items.sample['photos'][0]['alt_sizes'][0]['url']
    rescue
      'Not found'
    end
end
