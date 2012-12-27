require 'rubygems'
require 'bundler/setup'

require 'minitest/unit'
require 'minitest/autorun'

require 'kris'

class Zircon
  attr_reader :channel

  def initialize
    @channel = '#test'
  end

  def notice(channel, message)
    [channel, message]
  end
end

class Kris::Plugin
  def initialize
    @robot = Zircon.new
  end
end

class FakeMessage
  attr_reader :body

  def initialize(body)
    @body = body
  end

  def to
    '#test'
  end
end
