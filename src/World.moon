HC = require "hardon"

export World

class World
    new: =>
        unless World.__base.physics
            World.__base.physics = HC(100, World.__base.on_collide)

    update: (dt) =>
        World.__base.physics\update(dt)

    on_collide: (dt, shape_a, shape_b, dx, dy) =>
        print "this should not be called...."

    getPhysics: () =>
        return World.__base.physics
