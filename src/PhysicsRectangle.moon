require "Physics"

export PhysicsRectangle

class PhysicsRectangle extends Physics
    new: (world, x, y, width, height) =>
        super(world)
        @physicsBody = world\addRectangle(x, y, width, height)
    
    physicsRectangleDraw: () =>
        @physicsBody\draw("line")


