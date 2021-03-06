require("Physics")
require("moon.all")
do
  local _parent_0 = Physics
  local _base_0 = {
    physicsRectangleDraw = function(self)
      return self.physicsBody:draw("line")
    end,
    onCollide = function(self, group, reaction)
      return _parent_0.onCollide(self, group, reaction)
    end,
    collideWith = function(self, other, dx, dy)
      return _parent_0.collideWith(self, other, dx, dy)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, world, x, y, width, height)
      _parent_0.__init(self, world)
      self.physicsBody = world:addRectangle(x, y, width, height)
      self.physicsBody.object = self
    end,
    __base = _base_0,
    __name = "PhysicsRectangle",
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
  PhysicsRectangle = _class_0
  return _class_0
end
