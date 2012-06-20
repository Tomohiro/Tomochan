# Misawa Generator
#
# hubot misawa <tweet url> - Post tweet url to Misawa generator
module.exports = (robot) ->
  robot.respond /misawa .+twitter\.com\/(.+)\/status\/(.+)/i, (msg) ->
    screen_name = msg.match[1]
    status_id   = msg.match[2]
    msg.send "http://misawagenerator.herokuapp.com/#{screen_name}/#{status_id}"
