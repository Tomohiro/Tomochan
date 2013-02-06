# encoding: utf-8

require 'spec_helper'
require 'movie_showtime'

describe MovieShowtime do
  before do
    @showtime = MovieShowtime.new
  end

  describe 'when search movie' do
    it 'should get showtimes' do
      response = @showtime.on_privmsg(FakeMessage.new('劇場版の上映時間教えて'))
      response.size.wont_equal(0)
    end
  end
end
