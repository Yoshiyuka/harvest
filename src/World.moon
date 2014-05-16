HC = require "hardon"

export World

class World
    new: =>
        unless World.__base.physics
            World.__base.physics = HC(100, @on_collide)

    update: (dt) =>
        World.__base.physics\update(dt)

    on_collide: (dt, shape_a, shape_b) =>
        print "collision!"

    getPhysics: () =>
        return World.__base.physics
