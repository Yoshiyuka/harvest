local HC = require("hardon")
do
  local _base_0 = {
    update = function(self, dt) end,
    onCollision = function(dt, shape_a, shape_b, dx, dy)
      return print(shape_a, " is colliding with ", shape_b)
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self, world)
      return world:setCallbacks(Physics.__base.onCollision)
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
