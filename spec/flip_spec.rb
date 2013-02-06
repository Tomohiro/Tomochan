# encoding: utf-8

require 'spec_helper'
require 'flip'

describe Flip do
  before do
    @flip = Flip.new
  end

  describe 'when word to flip' do
    it 'should get fliped words' do
      response = @flip.on_privmsg(FakeMessage.new('flip Hello, World!'))
      response.last.wont_equal('Hello, World!')
    end
  end
end
