require("moon.all")
do
  local _base_0 = {
    bind = function(self, key, callback, ...)
      self.action[key] = {
        callback,
        {
          ...
        }
      }
    end,
    inputKeypressed = function(self, key)
      local func
      local args
      local _list_0 = self.action[key]
      for _index_0 = 1, #_list_0 do
        local tuple = _list_0[_index_0]
        if type(tuple) == "function" then
          func = tuple
        else
          args = tuple
        end
      end
      if type(func) == "function" then
        if args == nil then
          return func()
        else
          return func(args)
        end
      end
    end,
    inputUpdate = function(self, dt) end
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
