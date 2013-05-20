# encoding: utf-8

require 'spec_helper'
require 'github_status'

describe GithubStatus do
  before do
    @github_status = GithubStatus.new
  end

  describe 'when access to github api' do
    it 'should get json' do
      response = @github_status.on_privmsg(FakeMessage.new('status github'))
      response.last.must_match(/last_updated/)
    end
  end
end
