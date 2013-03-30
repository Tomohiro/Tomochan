# encoding: utf-8

require 'spec_helper'
require 'isup'

describe Isup do
  before do
    @isup = Isup.new
  end

  describe 'Check out the up domain' do
    it 'should get message' do
      response = @isup.on_privmsg(FakeMessage.new('is facebook.com up?'))
      response.last.must_match('looks UP from here.')
    end
  end

  describe 'Check out the down domain' do
    it 'should get message' do
      response = @isup.on_privmsg(FakeMessage.new('is example.jp up?'))
      response.last.must_match('looks DOWN from here.')
    end
  end
end
