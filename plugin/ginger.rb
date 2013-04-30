# encoding: utf-8

require 'gingerice'

class Ginger < Kris::Plugin
  def initialize(*args)
    super
    @parser = Gingerice::Parser.new
  end

  def on_privmsg(message)
    if message.body =~ /^ginger (?<text>.+)$/
      notice(message.to, correct_text($~[:text]))
    end
  end

  private
    def correct_text(text)
      @parser.parse(text)['result']
    end
end
