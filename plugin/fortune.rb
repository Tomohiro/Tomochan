# encoding: utf-8

require 'open-uri'
require 'nokogiri'

class Fortune < Kris::Plugin
  def initialize(*args)
    super
    @sex = %w(
      http://legacy.fortune.yahoo.co.jp/fortune/bin/omikuji?sex=m
      http://legacy.fortune.yahoo.co.jp/fortune/bin/omikuji?sex=f
    )
  end

  def response(message)
    if message.body == 'おみくじ'
      notice(message.to, oracle)
    end
  end

  private
    def oracle
      html = Nokogiri::HTML(open(@sex.sample))
      html.search('td').map { |td|
        td.text[/^今日のあなたの(.+?)は(.+?)。/] ?  "#{$1}: #{$2} " : nil
      }.compact.uniq.join
    end
end
