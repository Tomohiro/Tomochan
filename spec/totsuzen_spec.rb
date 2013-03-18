# encoding: utf-8

require 'spec_helper'
require 'totsuzen'

describe Totsuzen do
  before do
    @totsuzen = Totsuzen.new
  end

  describe 'Suddenly' do
    it 'Death!!!' do
      response = @totsuzen.on_privmsg(FakeMessage.new('突然の死'))
      response[1].must_equal('＞  突然の死  ＜')
    end
  end
end
