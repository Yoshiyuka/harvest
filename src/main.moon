sti = require "sti"
require "anal"
require "World"
require "player"

export map
export collision_layer, collision_tileset
export windowWidth, windowHeight
export player
export player_two
export ball
export world

love.load = () ->
    windowWidth = love.graphics.getWidth!
    windowHeight = love.graphics.getHeight!

    love.graphics.setBackgroundColor(128, 128, 128)
    love.graphics.setBlendMode("alpha")

    map = sti.new("maps/test")

    --collision_layer = map.layers["Collision"]
    --collision_tileset = value for key, value in pairs map.tilesets when value.name == "collision"

    world = World!

    player = Player(world\getPhysics!)
    player_two = Player(world\getPhysics!)
    

love.update = (dt) ->
    --run preUpdate methods first
    player\preUpdate(dt)
    player_two\preUpdate(dt)

    --then update methods
    map\update(dt)
    world\update(dt)
    player\update(dt)
    player_two\update(dt)


love.draw = () ->
    map\setDrawRange(0, 0, windowWidth, windowHeight)
    map\draw()
    
    --unless collision_tileset == nil
    player\draw!
    player_two\draw!

love.keyreleased = (key) ->
    if(key == "right") or (key == "left")
        return true

love.keypressed = (key) ->
    player\inputKeypressed(key)
math.clamp = (x, min, max) ->
    return x < min and min or (x > max and max or x)
        
