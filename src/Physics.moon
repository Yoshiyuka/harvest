HC = require "hardon"

export Physics

class Physics
    new:(world) =>
        world\setCallbacks(Physics.__base.onCollision)
    update: (dt) =>

    onCollision: (dt, shape_a, shape_b, dx, dy) =>
        print "We've got a collision, captain."


