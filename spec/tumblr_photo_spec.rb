# encoding: utf-8

require 'spec_helper'
require 'tumblr_photo'

describe TumblrPhoto do
  before do
    @tumblr = TumblrPhoto.new
  end

  describe 'when give text' do
    it 'should get correct text' do
      return unless ENV['TUMBLR_CONSUMER_KEY']
      response = @tumblr.on_privmsg(FakeMessage.new("img 吉高由里子"))
      response[1].must_match(/tumblr/)
    end
  end
end
