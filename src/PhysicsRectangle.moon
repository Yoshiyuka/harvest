require "Physics"
require "moon.all"

export PhysicsRectangle

class PhysicsRectangle extends Physics
    new: (world, x, y, width, height) =>
        super(world)
        @physicsBody = world\addRectangle(x, y, width, height)
        @physicsBody.object = @ --hold a reference to parent class (this) in shape for use in onCollision callback
    
    physicsRectangleDraw: () =>
        @physicsBody\draw("line")

    onCollide: (group, reaction) =>
        super group, reaction

    collideWith: (other, dx, dy) =>
        super other, dx, dy

