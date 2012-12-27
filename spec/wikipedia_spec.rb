# encoding: utf-8

require 'spec_helper'
require 'wikipedia'

describe Wikipedia do
  before do 
    @wikipedia = Wikipedia.new
  end

  describe 'when search person' do
    it 'should get information in index' do
      response = @wikipedia.response(FakeMessage.new('まつもとゆきひろって誰'))
      response.last.must_equal(URI.escape('http://ja.wikipedia.org/wiki/まつもとゆきひろ'))
    end
  end

  describe 'when search word' do
    it 'should get information after transferred' do
      response = @wikipedia.response(FakeMessage.new('ほげって何'))
      response.last.must_equal(URI.escape('http://ja.wikipedia.org/wiki/ほげ'))
    end
  end

  describe 'when search not exist keyword' do
    it 'information is not found' do
      response = @wikipedia.response(FakeMessage.new('Not Found Search Result って何'))
      response.last.must_equal(':Not Found')
    end
  end
end
