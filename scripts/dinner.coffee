# Choice dinner 
#
# hubot dinner add <restraint> - Add restraint
# hubot dinner choice - Choice dinner by Hubot
# hubot dinner clear - Clear all dinner data
# hubot dinner delete - Delete specific dinner data
# hubot dinners - List dinner

module.exports = (robot) ->
  robot.respond /dinner$/i, (msg) ->
    robot.brain.data.restraints ?= []

    if robot.brain.data.restraints.length > 0
      restraint = msg.random robot.brain.data.restraints
      msg.send restraint.name
    else
      msg.send "I don't know"

  robot.respond /dinner add (.+)/i, (msg) ->
    restraint = msg.match[1]

    robot.brain.data.restraints ?= []
    robot.brain.data.restraints.push { name: restraint }

    msg.send 'Got it! Added: ' + restraint

  robot.respond /dinners/i, (msg) ->
    robot.brain.data.restraints ?= []

    if robot.brain.data.restraints.length > 0
      for restraint in robot.brain.data.restraints
         msg.send restraint.name
    else
      msg.send "I don't know"

  robot.respond /dinner (delete|remove) (.*) ?$/i, (msg) ->
    restraint_name = msg.match[2]

    robot.brain.data.restraints ?= []
    length_before = robot.brain.data.restraints.length

    index_of = -1
    for restraint, i in robot.brain.data.restraints
      if restraint.name == restraint_name
        index_of = i

    robot.brain.data.restraints.splice( index_of, 1 ) if -1 != index_of

    if length_before > robot.brain.data.restraints.length
      msg.send 'Removed: ' + restraint_name
    else
      msg.send "I couldn't find that restraint."

  robot.respond /dinner (clear|flush)/i, (msg) ->
    robot.brain.data.restraints = []
    msg.send "All dinner data cleared."
