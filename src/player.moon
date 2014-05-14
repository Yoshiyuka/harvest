require "moon.all"
require "entity"
require "Input"

export Player

class Player extends Entity
    new: =>
        print "player has entered the scene"
        mixin self, Input


