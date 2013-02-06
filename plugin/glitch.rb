# encoding: utf-8

# https://gist.github.com/4347478
# $ glitch Hey everyone check out her knee socks!
# => Hey ͘everyo̼ne͎ ch͈eck out̪ ͑h̋er ͎k̉nͫe̍e s̷ocͧks!

class Glitch < Kris::Plugin
  GLITCH_TABLE = ("\u0300".."\u036f").to_a

  def on_privmsg(message)
    if message.body =~ /^(glitch) (?<str>.+?)$/
      notice(message.to, glitch($~[:str]))
    end
  end

  private
    def glitch(str)
      str.each_char.map do |c|
        c + rand(2).times.map { GLITCH_TABLE.sample }.join
      end.join
    end
end
