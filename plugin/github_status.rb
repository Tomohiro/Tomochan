# encoding: utf-8

require 'open-uri'
require 'json'
require 'time'

class GithubStatus < Kris::Plugin
  def on_privmsg(message)
    if message.body =~ /^status github/
      json = JSON.parser.new(open('https://status.github.com/api/status.json').read)
      d = json.parse
      t = Time.parse("#{d['last_updated']}").getlocal

      notice(message.to, "status: #{d['status']} (last_updated: #{t})")
    end
  end
end
