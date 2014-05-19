local sti = require("sti")
require("anal")
require("World")
require("player")
love.load = function()
  windowWidth = love.graphics.getWidth()
  windowHeight = love.graphics.getHeight()
  love.graphics.setBackgroundColor(128, 128, 128)
  love.graphics.setBlendMode("alpha")
  map = sti.new("maps/test")
  world = World()
  player = Player(world:getPhysics())
  player_two = Player(world:getPhysics())
end
love.update = function(dt)
  player:preUpdate(dt)
  player_two:preUpdate(dt)
  map:update(dt)
  world:update(dt)
  player:update(dt)
  return player_two:update(dt)
end
love.draw = function()
  map:setDrawRange(0, 0, windowWidth, windowHeight)
  map:draw()
  player:draw()
  return player_two:draw()
end
love.keyreleased = function(key)
  if (key == "right") or (key == "left") then
    return true
  end
end
love.keypressed = function(key)
  return player:inputKeypressed(key)
end
math.clamp = function(x, min, max)
  return x < min and min or (x > max and max or x)
end
