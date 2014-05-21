HC = require "hardon"

export World

class World
    new: =>
        unless World.__base.physics
            World.__base.physics = HC(100, @on_collide)
            World.__base.physics\setCallbacks(@on_collide)

    update: (dt) =>
        World.__base.physics\update(dt)

    on_collide: (dt, shape_a, shape_b) =>
        print "on collision callback: calling shape_a and shape_b callbacks."
        --shape_a\onCollision(shape_b)
        --shape_b\onCollision(shape_a)

    getPhysics: () =>
        return World.__base.physics
