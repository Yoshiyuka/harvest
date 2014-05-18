require("moon.all")
require("entity")
require("Input")
require("anal")
require("PhysicsRectangle")
do
  local _parent_0 = Entity
  local _base_0 = {
    moveTowards = function(self, ...)
      print(unpack(...))
      self.pos.x = self.pos.x - 32
      return self.physicsBody:move(-32, 0)
    end,
    moveRight = function(self)
      self.pos.x = self.pos.x + 32
      return self.physicsBody:move(32, 0)
    end,
    moveUp = function(self)
      self.pos.y = self.pos.y - 32
      return self.physicsBody:move(0, -32)
    end,
    moveDown = function(self)
      self.pos.y = self.pos.y + 32
      return self.physicsBody:move(0, 32)
    end,
    update = function(self, dt)
      return self.anim:update(dt)
    end,
    draw = function(self)
      self.anim:draw(self.pos.x, self.pos.y)
      return self:physicsRectangleDraw()
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, world)
      _parent_0.__init(self)
      mixin(self, Input)
      mixin(self, PhysicsRectangle, world, self.pos.x, self.pos.y, 32, 32)
      self:bind("left", (function()
        local _base_1 = self
        local _fn_0 = _base_1.moveTowards
        return function(...)
          return _fn_0(_base_1, ...)
        end
      end)(), "left", -32)
      self:bind("right", (function()
        local _base_1 = self
        local _fn_0 = _base_1.moveRight
        return function(...)
          return _fn_0(_base_1, ...)
        end
      end)())
      self:bind("up", (function()
        local _base_1 = self
        local _fn_0 = _base_1.moveUp
        return function(...)
          return _fn_0(_base_1, ...)
        end
      end)())
      self:bind("down", (function()
        local _base_1 = self
        local _fn_0 = _base_1.moveDown
        return function(...)
          return _fn_0(_base_1, ...)
        end
      end)())
      self.sprite = love.graphics.newImage("assets/ninja.png")
      self.anim = newAnimation(self.sprite, 32, 32, 0.05, 0)
    end,
    __base = _base_0,
    __name = "Player",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Player = _class_0
  return _class_0
end
