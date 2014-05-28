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
    require "loveframes"

    windowWidth = love.graphics.getWidth!
    windowHeight = love.graphics.getHeight!

    love.graphics.setBackgroundColor(128, 128, 128)
    love.graphics.setBlendMode("alpha")

    map = sti.new("maps/test")

    --collision_layer = map.layers["Collision"]
    --collision_tileset = value for key, value in pairs map.tilesets when value.name == "collision"

    world = World!

    player = Player(world\getPhysics!, "one")
    player_two = Player(world\getPhysics!, "two")
    player_two\bind("w", player_two\moveTowards, "up")
    player_two\bind("a", player_two\moveTowards, "left")
    player_two\bind("s", player_two\moveTowards, "down")
    player_two\bind("d", player_two\moveTowards, "right")
    player_two\bind("left", nil)
    player_two\bind("right", nil)
    player_two\bind("up", nil)
    player_two\bind("down", nil)

    button = loveframes.Create("button")
    button\SetPos(10, 10)
    

love.update = (dt) ->
    --run preUpdate methods first
    player\preUpdate(dt)
    player_two\preUpdate(dt)

    --then update methods
    map\update(dt)
    world\update(dt)
    player\update(dt)
    player_two\update(dt)

    loveframes.update(dt)

love.draw = () ->
    map\setDrawRange(0, 0, windowWidth, windowHeight)
    map\draw()
    
    --unless collision_tileset == nil
    player\draw!
    player_two\draw!

    loveframes.draw()

love.mousepressed = (x, y, button) ->
    loveframes.mousepressed(x, y, button)

love.mousereleased = (x, y, button) ->
    loveframes.mousereleased(x, y, button)

love.keyreleased = (key) ->
    loveframes.keyreleased(key)

love.keypressed = (key, unicode) ->
    player\inputKeypressed(key)
    player_two\inputKeypressed(key)
    loveframes.keypressed(key, unicode)

love.textinput = (text) ->
    loveframes.textinput(text)

math.clamp = (x, min, max) ->
    return x < min and min or (x > max and max or x)
        
