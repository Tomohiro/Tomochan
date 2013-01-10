# encoding: utf-8

require 'open-uri'
require 'nokogiri'

class SunSignAstrology < Kris::Plugin
  NotFoundError = Class.new(StandardError)

  def response(message)
    channel = message.to
    message = message.body

    if message =~ /(?<constellatio>.+)の運勢教えて/
      rank = get_rank($~[:constellatio])
      notice(channel, "#{rank[:name]} #{rank[:rank]} #{rank[:desc]} (#{rank[:link]})")
    end
  rescue NotFoundError
    notice(channel, 'Not Found')
  rescue => e
    notice(@robot.channel, "#{self.class} #{e.to_s}")
  end

  private
    def get_rank(constellatio)
      doc = Nokogiri::HTML(open('http://fortune.yahoo.co.jp/12astro/ranking.html'))

      names = doc.search('td/p/img')
      ranks = doc.search('td/img')
      descs = doc.search('p.ft01/a')

      names.each_with_index do |name, desc_counter|
        rank_counter = desc_counter + 1
        rank = {
          name: name.attributes['alt'].text,
          rank: ranks[rank_counter].attributes['alt'].text,
          desc: descs[desc_counter].text,
          link: descs[desc_counter].attributes['href'].text
        }

        return rank if rank[:name] == constellatio
      end

      raise NotFoundError
    end
end
