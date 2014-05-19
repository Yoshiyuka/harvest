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

        -- x: [left: -1, neither: 0, right: 1], y: [up: -1, neither: 0, down: 1]
        @facing = {x: 0, y: 1} 
        @DIRECTIONS = {left: -1, right: 1, up: -1, down: 1, neither: 0}

        --bind key, method, direction
        @\bind("left", @\moveTowards, "left")
        @\bind("right", @\moveTowards, "right")
        @\bind("up", @\moveTowards, "up")
        @\bind("down", @\moveTowards, "down")

        @sprite = love.graphics.newImage("assets/ninja.png")
        @anim = newAnimation(@sprite, 32, 32, 0.05, 0)

    moveTowards: (dir) =>
        direction = unpack(dir)
        switch direction
            when "left", "right"
                @facing.x = @DIRECTIONS[direction]
                @facing.y = @DIRECTIONS.neither
            when "up", "down"
                @facing.x = @DIRECTIONS.neither
                @facing.y = @DIRECTIONS[direction]
       
        print "facing: " .. @facing.x .. " " .. @facing.y
        --@physicsBody\move(@facing * 32)
 
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
