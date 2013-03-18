# encoding: utf-8

# http://starwing.net/suddenly_death.html

require 'unicode/display_width'

class Totsuzen < Kris::Plugin
  def on_privmsg(message)
    if message.body =~ /^突然の(?<keyword>.+?)$/
      totsuzenize($~[:keyword]).each do |line|
        notice(message.to, line)
      end
    end
  end

  private
    def totsuzenize(keyword)
      display_keyword = "突然の#{keyword}"
      width = display_keyword.display_width

      header = '人' * (width / 2)
      footer = '^Y' * (width / 2)

      [
        "＿人#{header}人＿",
        "＞  #{display_keyword}  ＜",
        "￣Y#{footer}￣"
      ]
    end
end
