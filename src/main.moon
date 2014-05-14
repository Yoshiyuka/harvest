sti = require "sti"
require "anal"
require "player"

export map
export collision_layer, collision_tileset
export windowWidth, windowHeight
export player
love.load = () ->
    windowWidth = love.graphics.getWidth!
    windowHeight = love.graphics.getHeight!

    love.graphics.setBackgroundColor(128, 128, 128)
    love.graphics.setBlendMode("alpha")

    map = sti.new("maps/test")

    collision_layer = map.layers["Collision"]
    collision_tileset = value for key, value in pairs map.tilesets when value.name == "collision"

    player = Player!

love.update = (dt) ->
    --map\update(dt)

love.draw = () ->
    --map\setDrawRange(0, 0, windowWidth, windowHeight)
    --map\draw()
    
    --unless collision_tileset == nil

love.keyreleased = (key) ->
    if(key == "right") or (key == "left")
        return true

love.keypressed = (key) ->
    player\inputKeypressed(key)
math.clamp = (x, min, max) ->
    return x < min and min or (x > max and max or x)
        
