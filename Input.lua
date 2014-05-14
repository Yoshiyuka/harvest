require("moon.all")
do
  local _base_0 = {
    bind = function(self, key, callback)
      self.action[key] = callback
    end,
    inputKeypressed = function(self, key)
      if type(self.action[key]) == "function" then
        return self.action[key]()
      end
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self)
      self.action = { }
      self.action["left"] = function(self)
        return print("left")
      end
      self.action["right"] = function(self)
        return print("right")
      end
    end,
    __base = _base_0,
    __name = "Input"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Input = _class_0
  return _class_0
end
