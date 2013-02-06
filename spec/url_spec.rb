# encoding: utf-8

require 'spec_helper'
require 'url'

describe Url do
  before do
    @url = Url.new
  end

  describe 'when access to the Google' do
    it 'should get title' do
      response = @url.on_privmsg(FakeMessage.new('http://www.google.com'))
      response.first.must_equal('Google')
    end
  end

  describe 'when access to the Twitter' do
    it 'should get tweet' do
      response = @url.on_privmsg(FakeMessage.new('https://twitter.com/#!/gongoZ/statuses/288559849971781633'))
      response.first.must_match(/おなかすいたでげそ/)
    end
  end

  describe 'when recieved message' do
    it 'should not be accessed' do
      response = @url.on_privmsg(FakeMessage.new('Tomochan: test'))
      response.size.must_equal(0)
    end
  end
end
