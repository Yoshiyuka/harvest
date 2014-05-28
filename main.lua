local sti = require("sti")
require("anal")
require("World")
require("player")
love.load = function()
  require("loveframes")
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
  player_two:bind("down", nil)
  local button = loveframes.Create("button")
  return button:SetPos(10, 10)
end
love.update = function(dt)
  player:preUpdate(dt)
  player_two:preUpdate(dt)
  map:update(dt)
  world:update(dt)
  player:update(dt)
  player_two:update(dt)
  return loveframes.update(dt)
end
love.draw = function()
  map:setDrawRange(0, 0, windowWidth, windowHeight)
  map:draw()
  player:draw()
  player_two:draw()
  return loveframes.draw()
end
love.mousepressed = function(x, y, button)
  return loveframes.mousepressed(x, y, button)
end
love.mousereleased = function(x, y, button)
  return loveframes.mousereleased(x, y, button)
end
love.keyreleased = function(key)
  return loveframes.keyreleased(key)
end
love.keypressed = function(key, unicode)
  player:inputKeypressed(key)
  player_two:inputKeypressed(key)
  return loveframes.keypressed(key, unicode)
end
love.textinput = function(text)
  return loveframes.textinput(text)
end
math.clamp = function(x, min, max)
  return x < min and min or (x > max and max or x)
end
