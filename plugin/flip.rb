# encoding: utf-8

# https://gist.github.com/4347478
# $ flip Hey everyone check out her knee socks!
# => Hǝʎ ǝʌǝɹʎouǝ ɔɥǝɔʞ onʇ ɥǝɹ ʞuǝǝ soɔʞs¡

class Flip < Kris::Plugin
  FLIP_TABLE = {
    "a"      => "\u0250",
    "b"      => "q",
    "c"      => "\u0254",
    "d"      => "p",
    "e"      => "\u01DD",
    "f"      => "\u025F",
    "g"      => "\u0183",
    "h"      => "\u0265",
    "i"      => "\u0131",
    "j"      => "\u027E",
    "k"      => "\u029E",
    "l"      => "\u0283",
    "m"      => "\u026F",
    "n"      => "u",
    "r"      => "\u0279",
    "t"      => "\u0287",
    "v"      => "\u028C",
    "w"      => "\u028D",
    "y"      => "\u028E",
    "."      => "\u02D9",
    "["      => "]",
    "("      => ")",
    "{"      => "}",
    "?"      => "\u00BF",
    "!"      => "\u00A1",
    "\""     => ",",
    "<"      => ">",
    "_"      => "\u203E",
    ";"      => "\u061B",
    "\u203F" => "\u2040",
    "\u2045" => "\u2046",
    "\u2234" => "\u2235"
  }

  def response(message)
    if message.body =~ /^(flip) (?<str>.+?)$/
      notice(message.to, flip($~[:str]))
    end
  end

  private
    def flip(str)
      str.each_char.map do |c|
        FLIP_TABLE[c] || FLIP_TABLE.invert[c] || c
      end.join
    end
end
