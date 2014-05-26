require "moon.all"
require "entity"
require "Input"
require "anal"
require "PhysicsRectangle"

export Player

class Player extends Entity
    new: (world, name) =>
        super!
        @name = name
        mixin self, Input
        mixin self, PhysicsRectangle, world, @pos.x, @pos.y, 32, 32

        @onCollide("test", (self) -> print self.name)

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
        
        @moving = true

    preUpdate: (dt) =>
        if @moving
            --move physics body first to check for collisions
            print @name .. " is moving."
            @physicsBody\move(@facing.x * 16, @facing.y * 16)
            @moving = false

    update: (dt) =>
        @pos.x, @pos.y = @physicsBody\center()
        @pos.x -= 16
        @pos.y -=16

        @anim\update(dt)
    draw: =>
        @anim\draw(@pos.x, @pos.y)
        @physicsRectangleDraw!
