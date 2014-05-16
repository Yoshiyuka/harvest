require "moon.all"
require "entity"
require "Input"
require "anal"
require "PhysicsRectangle"

export Player

class Player extends Entity
    new: (world) =>
        super!
        mixin self, Input
        mixin self, PhysicsRectangle, world, @pos.x, @pos.y, 32, 32

        @\bind("left", @\moveLeft)
        @\bind("right", @\moveRight)
        @\bind("up", @\moveUp)
        @\bind("down", @\moveDown)

        @sprite = love.graphics.newImage("assets/ninja.png")
        @anim = newAnimation(@sprite, 32, 32, 0.05, 0)

    moveLeft: =>
        @pos.x -= 32
        @physicsBody\move(-32, 0)
    moveRight: =>
        @pos.x += 32
        @physicsBody\move(32, 0)
    moveUp: =>
        @pos.y -= 32
        @physicsBody\move(0, -32)
    moveDown: =>
        @pos.y += 32
        @physicsBody\move(0, 32)

    update: (dt) =>
        @anim\update(dt)
    draw: =>
        @anim\draw(@pos.x, @pos.y)
        @physicsRectangleDraw!
