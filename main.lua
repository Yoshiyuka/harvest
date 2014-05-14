local sti = require("sti")
require("anal")
require("player")
love.load = function()
  windowWidth = love.graphics.getWidth()
  windowHeight = love.graphics.getHeight()
  love.graphics.setBackgroundColor(128, 128, 128)
  love.graphics.setBlendMode("alpha")
  map = sti.new("maps/test")
  collision_layer = map.layers["Collision"]
  for key, value in pairs(map.tilesets) do
    if value.name == "collision" then
      collision_tileset = value
    end
  end
  player = Player()
end
love.update = function(dt) end
love.draw = function() end
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
