# encoding: utf-8

require 'spec_helper'
require 'ginger'

describe Ginger do
  before do
    @ginger = Ginger.new
  end

  describe 'when give text' do
    it 'should get correct text' do
      text = 'hello'
      response = @ginger.on_privmsg(FakeMessage.new("ginger #{text}"))
      response.last.must_match(text.capitalize)
    end
  end
end
