# encoding: utf-8

require 'spec_helper'
require 'sun_sign_astrology'

describe SunSignAstrology do
  before do
    @sun_sign_astrology = SunSignAstrology.new
  end

  describe 'when query constellatio' do
    it 'should get message' do
      response = @sun_sign_astrology.response(FakeMessage.new('おとめ座の運勢教えて'))
      response.last.must_match(/おとめ座/)

      response = @sun_sign_astrology.response(FakeMessage.new('ほげ座の運勢教えて'))
      response.last.must_match(/Not Found/)
    end
  end
end
