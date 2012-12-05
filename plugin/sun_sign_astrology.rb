# encoding: utf-8

require 'kconv'
require 'open-uri'
require 'nokogiri'

class SunSignAstrology < Kris::Plugin
  def response(message)
    channel = message.to
    message = message.body

    if message =~ /(.+)の運勢教えて/
      result = ''
      constellatio = $1
      rank = get_ranking.find { |r| r[:name].value == constellatio.toutf8 }
      notice(channel, "#{rank[:name]} #{rank[:rank]} #{rank[:desc]} (#{rank[:link]})")
    end
  rescue => e
    notice(@robot.channel, "#{self.class} #{e.to_s}")
  end

  private
    def get_ranking
      doc = Nokogiri::HTML(open('http://fortune.yahoo.co.jp/12astro/ranking.html'))

      names = doc/'td/p/img'
      ranks = doc/'td/img'
      descs = doc/'p.ft01/a'

      ranking = []
      names.each_with_index do |name, desc_counter|
        rank_counter = desc_counter + 1
        ranking << {
          :name => name.attributes['alt'],
          :rank => ranks[rank_counter].attributes['alt'],
          :desc => descs[desc_counter].text,
          :link => descs[desc_counter].attributes['href']
        }
      end

      ranking
    end
end
