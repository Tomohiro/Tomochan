# encoding: utf-8

require 'spec_helper'
require 'fortune'

describe Fortune do
  before do
    @fortune = Fortune.new
  end

  describe 'when consult an oracle' do
    it 'should get message' do
      response = @fortune.on_privmsg(FakeMessage.new('おみくじ'))
      response.last.must_match(/仕事運/)
    end
  end
end
