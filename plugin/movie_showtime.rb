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
        title = movie_info.at('h3/a').text

        if title =~ Regexp.new(Regexp.quote(search_title))
          site  = movie_info.at('div.pic_block/a[@target="_blank"]').attributes['href']
          results << "#{title.gsub('　', '')}  #{site}"

          (movie_info/'table.set_d').each do |screen|
            movie = [" - [#{screen.at('th.cinema/img').attributes['alt']}]"]
            (screen/'td').each do |time|
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

      html = Nokogiri::HTML(open('http://www.google.co.jp/movies?tid=3d1a4be489681836'))
      html.search('div.movie').each do |movie_info|
        movie_title = movie_info.at('div.name/a/span[@dir="ltr"]').text

        if movie_title =~ expression
          time = movie_info.inner_html.scan(/(..:..+?)</).last
          results << "#{theater_name} #{movie_title} #{time} (http://www.sakura-zaka.com/)"
        end
      end
      results
    end
end
