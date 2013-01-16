# encoding: utf-8

require 'open-uri'
require 'nokogiri'

class MovieShowtime < Kris::Plugin
  def response(message)
    if message.body =~ /^(?<movie>.+)の上映時間教えて$/
      results = startheaters($~[:movie]) + sakurazaka($~[:movie])
      results.each do |showtime|
        notice(message.to, showtime)
      end
    end
  end

  private
    def startheaters(search_title)
      results = []

      html = Nokogiri::HTML(open('http://www.startheaters.jp/schedule'))
      html.search('div.unit_block').each do |movie_info|
        movie_title = movie_info.at('h3/a').text

        if movie_title =~ /#{Regexp.quote(search_title)}/
          site  = movie_info.at('div.pic_block/a[@target="_blank"]').attributes['href']
          results << "#{movie_title.gsub('　', '')}  #{site}"

          movie_info.search('table.set_d').each do |screen|
            movie = [" - [#{screen.at('th.cinema/img').attributes['alt']}]"]
            screen.search('td').each do |time|
              movie << time.text unless time.text.to_i == 0
            end
            results << movie.join('  ')
          end
        end
      end
      results
    end

    def sakurazaka(search_title)
      theater_name = '[桜坂劇場]'
      results = []

      html = Nokogiri::HTML(open(URI.escape('http://www.google.co.jp/movies?near=沖縄&tid=3d1a4be489681836')))
      html.search('div.movie').each do |movie_info|
        movie_title = movie_info.at('div.name/a').text

        if movie_title =~ /#{Regexp.quote(search_title)}/
          time = movie_info.search('div.times/span').text.gsub('&nbsp', '')
          results << "#{theater_name} #{movie_title} #{time} (http://www.sakura-zaka.com/)"
        end
      end
      results
    end
end
