do
  local _base_0 = {
    update = function(self, dt) end,
    draw = function(self) end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self)
      self.pos = { }
      self.pos.x, self.pos.y = 0
      self.__class.instances = self.__class.instances + 1
      self.id = self.__class.instances
    end,
    __base = _base_0,
    __name = "Entity"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  self.instances = 0
  Entity = _class_0
  return _class_0
end
