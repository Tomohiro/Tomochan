# encoding: utf-8

require 'uri'
require 'google-search'

class GoogleSearch < Kris::Plugin
  def response(message)
    if message.body =~ /(?<keyword>.+)探してきて/
      search($~[:keyword])[0..2].each do |result|
        notice(message.to, result)
      end
    end
  end

  private
    def search(keyword)
      Google::Search::Web.new(query: keyword, size: :small, language: :ja).map do |item|
        "#{URI.unescape(item.title)} - #{item.uri}"
      end
    end
end

