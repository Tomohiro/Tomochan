# encoding: utf-8

require 'spec_helper'
require 'wikipedia'

describe Wikipedia do
  before do 
    @wikipedia = Wikipedia.new
  end

  describe 'when search persion' do
    it 'get information in index' do
      response = @wikipedia.response(OpenStruct.new(
        to: '#test',
        body: 'まつもとゆきひろって誰'
      ))
      response.last.must_equal(URI.escape('http://ja.wikipedia.org/wiki/まつもとゆきひろ'))
    end
  end

  describe 'when search word' do
    it 'get information after transferred' do
      response = @wikipedia.response(OpenStruct.new(
        to: '#test',
        body: 'ほげって何'
      ))
      response.last.must_equal(URI.escape('http://ja.wikipedia.org/wiki/ほげ'))
    end

    it 'information is not found' do
      response = @wikipedia.response(OpenStruct.new(
        to: '#test',
        body: 'Not Found Search Result って何'
      ))
      response.last.must_equal(':Not Found')
    end
  end
end
