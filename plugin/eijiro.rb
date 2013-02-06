# encoding: utf-8

require 'open-uri'
require 'nokogiri'

class Eijiro < Kris::Plugin
  def on_privmsg(message)
    if message.body =~ /^(eijiro|alc) (?<keyword>.+?)$/
      notice(message.to, translate($~[:keyword]))
    end
  end

  private
    def translate(keyword)
      uri = "http://eow.alc.co.jp/#{URI.encode(keyword)}/UTF-8"
      Nokogiri::HTML(open(uri)).search('#resultsList//ol').map do |result|
        result.text
      end.join("\n")
    end
end
