# Choice dinner
#
# hubot dinner add <restraint> - Add restraint
# hubot dinner choice - Choice dinner by Hubot
# hubot dinner clear - Clear dinner data

module.exports = (robot) ->
  robot.respond /dinner add (.+)/i, (msg) ->
    restraint = msg.match[1]

    robot.brain.data.restraints ?= []
    robot.brain.data.restraints.push { name: restraint }

    msg.send 'Got it! Added: ' + restraint

  robot.respond /dinner (clear|flush)/i, (msg) ->
    robot.brain.data.restraints = []
    msg.send "All dinner data cleared."

  robot.respond /dinner choice$/i, (msg) ->
    robot.brain.data.restraints ?= []

    if robot.brain.data.restraints.length > 0
      restraint = msg.random robot.brain.data.restraints
      msg.send restraint.name
    else
      msg.send "I don't know"
