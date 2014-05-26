HC = require "hardon"

export Physics

class Physics
    new:(world) =>
        world\setCallbacks(Physics.__base.onCollision)

        print "_onCollide is being made an empty table"
        @_onCollide = {}
        @group = "test"
    update: (dt) =>

    onCollision: (dt, shape_a, shape_b, dx, dy) ->
        shape_a.object.collideWith(shape_a.object, shape_b.object, dx, dy)
        shape_b.object.collideWith(shape_b.object, shape_a.object, dx, dy)

    onCollide: (group, reaction) =>
        @_onCollide[group] = reaction
            
    collideWith: (other, dx, dy) =>
        (@_onCollide[other.group])(@, other, dx, dy)





