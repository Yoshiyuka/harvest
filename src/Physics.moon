HC = require "hardon"

export Physics

class Physics
    new:(world) =>
        world\setCallbacks(Physics.__base.onCollision)
    update: (dt) =>

    onCollision: (dt, shape_a, shape_b, dx, dy) ->
            print shape_a, " is colliding with ", shape_b



