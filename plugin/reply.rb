# encoding: utf-8

class Reply < Kris::Plugin
  def on_privmsg(message)
    response = message_choice(message.body)
    notice(message.to, response) if response
  end

  private
    def message_choice(message)
      case message
      when /ゆのっち/
        '✘╹◡╹✘ '
      when /ヒロさん/
        'ζ╹◡╹ζ'
      else
        nil
      end
    end
end
