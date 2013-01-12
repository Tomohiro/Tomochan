# encoding: utf-8

require 'spec_helper'
require 'google_search'

describe GoogleSearch do
  before do
    @google = GoogleSearch.new
  end

  describe 'when search keyword' do
    it 'should get search result' do
      response = @google.response(FakeMessage.new('GitHub探してきて'))
      response.size.must_equal(3)
    end
  end
end

