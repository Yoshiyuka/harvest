local HC = require("hardon")
do
  local _base_0 = {
    update = function(self, dt)
      return World.__base.physics:update(dt)
    end,
    on_collide = function(self, dt, shape_a, shape_b, dx, dy) end,
    getPhysics = function(self)
      return World.__base.physics
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self)
      if not (World.__base.physics) then
        World.__base.physics = HC(100, World.__base.on_collide)
      end
    end,
    __base = _base_0,
    __name = "World"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  World = _class_0
  return _class_0
end
