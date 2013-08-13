$LOAD_PATH.unshift(File.expand_path('../../plugin', __FILE__))

require 'rubygems'
require 'bundler/setup'

require 'minitest/autorun'
require 'minitest/unit'

require 'kris'

require 'coveralls'
Coveralls.wear!

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
