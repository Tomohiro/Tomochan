# encoding: utf-8

require 'open-uri'
require 'nokogiri'

class Isup < Kris::Plugin
  def on_privmsg(message)
    if message.body =~ /^is (?<domain>.*?) (up|down)(\?)?/
      notice(message.to, up?($~[:domain]))
    end
  rescue URI::InvalidURIError
    notice(message.to, 'Invalid domain error.')
  end

  private
    def up?(domain)
      body = Nokogiri::HTML(open("http://www.isup.me/#{domain}")).search('body')

      case body.text
      when /It's just you/
        "#{domain} looks UP from here."
      when /It's not just you!/
        "#{domain} looks DOWN from here."
      end
    end
end
