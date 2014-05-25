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
  player = Player(world:getPhysics(), "one")
  player_two = Player(world:getPhysics(), "two")
  player_two:bind("w", (function()
    local _base_0 = player_two
    local _fn_0 = _base_0.moveTowards
    return function(...)
      return _fn_0(_base_0, ...)
    end
  end)(), "up")
  player_two:bind("a", (function()
    local _base_0 = player_two
    local _fn_0 = _base_0.moveTowards
    return function(...)
      return _fn_0(_base_0, ...)
    end
  end)(), "left")
  player_two:bind("s", (function()
    local _base_0 = player_two
    local _fn_0 = _base_0.moveTowards
    return function(...)
      return _fn_0(_base_0, ...)
    end
  end)(), "down")
  player_two:bind("d", (function()
    local _base_0 = player_two
    local _fn_0 = _base_0.moveTowards
    return function(...)
      return _fn_0(_base_0, ...)
    end
  end)(), "right")
  player_two:bind("left", nil)
  player_two:bind("right", nil)
  player_two:bind("up", nil)
  return player_two:bind("down", nil)
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
  player:inputKeypressed(key)
  return player_two:inputKeypressed(key)
end
math.clamp = function(x, min, max)
  return x < min and min or (x > max and max or x)
end
