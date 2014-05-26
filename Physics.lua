local HC = require("hardon")
do
  local _base_0 = {
    update = function(self, dt) end,
    onCollision = function(dt, shape_a, shape_b, dx, dy)
      shape_a.object.collideWith(shape_a.object, shape_b.object, dx, dy)
      return shape_b.object.collideWith(shape_b.object, shape_a.object, dx, dy)
    end,
    onCollide = function(self, group, reaction)
      self._onCollide[group] = reaction
    end,
    collideWith = function(self, other, dx, dy)
      return (self._onCollide[other.group])(self, other, dx, dy)
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self, world)
      world:setCallbacks(Physics.__base.onCollision)
      print("_onCollide is being made an empty table")
      self._onCollide = { }
      self.group = "test"
    end,
    __base = _base_0,
    __name = "Physics"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Physics = _class_0
  return _class_0
end
