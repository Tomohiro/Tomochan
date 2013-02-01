# encoding: utf-8

require 'spec_helper'
require 'eijiro'

describe Eijiro do
  before do
    @eijiro = Eijiro.new
  end

  describe 'when translate japanaese keyword' do
    it 'should get english' do
      response = @eijiro.response(FakeMessage.new('eijiro 認証'))
      response.size.must_equal(2)
      response = @eijiro.response(FakeMessage.new('alc 認証'))
      response.size.must_equal(2)
    end
  end

  describe 'when translate english keyword' do
    it 'should get japanese' do
      response = @eijiro.response(FakeMessage.new('eijiro authentication'))
      response.size.must_equal(2)
      response = @eijiro.response(FakeMessage.new('alc authentication'))
      response.size.must_equal(2)
    end
  end
end
