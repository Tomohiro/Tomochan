require 'mechanize'
require 'open-uri'

class Url < Kris::Plugin
  def initialize(*args)
    super
    @agent = create_agent
  end

  def on_privmsg(message)
    channel = message.to
    message = message.body

    URI.extract(message, %w(http https)).map { |uri| page_title(uri) }.each do |title|
      notice(channel, title)
    end
  rescue StandardError => e
    puts e.to_s
  end

  private

  def page_title(uri)
    case uri
    when /twitter.com/
      get_tweet(uri)
    else
      @agent.get(URI.escape(uri)).title
    end
  end

  def create_agent
    Mechanize.new { |a| a.user_agent_alias = 'Windows IE 7' }
  end

  def get_tweet(uri)
    body = Nokogiri::HTML(open(URI.escape(uri.gsub('#!/', ''))))
    username = body.at('.js-action-profile-name b').text
    tweet = body.at('.tweet-text').text.strip
    datetime = body.at('.client-and-actions span.metadata span').text
    "@#{username}: #{tweet} - #{datetime}"
  rescue Mechanize::ResponseCodeError
    "Sorry, that page doesn't exist! by Twitter.com"
  rescue
    'Undefined Error'
  end
end
