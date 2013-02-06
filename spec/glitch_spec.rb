# encoding: utf-8

require 'spec_helper'
require 'glitch'

describe Glitch do
  before do
    @glitch = Glitch.new
  end

  describe 'when word to glitch' do
    it 'should get glitched words' do
      response = @glitch.on_privmsg(FakeMessage.new('glitch Hello, World!'))
      response.last.wont_equal('Hello, World!')
    end
  end
end
