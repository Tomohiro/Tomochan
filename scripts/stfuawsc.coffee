# Shut the fuck up and write some code
module.exports = (robot) ->
  robot.respond /(つか|疲)れた/i, (msg) ->
    msg.send 'Shut the fuck up and write some code. だまってコードを書けよハゲ'
