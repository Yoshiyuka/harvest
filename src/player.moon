require "moon.all"
require "entity"
require "Input"
require "anal"

export Player

class Player extends Entity
    new: =>
        print "player has entered the scene"
        mixin self, Input

        @\bind("left", @\moveLeft)
        @\bind("right", @\moveRight)
        @\bind("up", @\moveUp)
        @\bind("down", @\moveDown)

        @sprite = love.graphics.newImage("assets/ninja.png")
        @anim = newAnimation(@sprite, 32, 32, 0.05, 0)
        super!

    moveLeft: =>
        @pos.x -= 1
    moveRight: =>
        @pos.x += 1
    moveUp: =>
        @pos.y -= 1
    moveDown: =>
        @pos.y += 1

    update: (dt) =>
        @anim\update(dt)
    draw: =>
        @anim\draw(@pos.x * 32, @pos.y * 32)
