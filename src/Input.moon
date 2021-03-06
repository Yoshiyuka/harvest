require "moon.all"
export Input

class Input
    new: =>
        --default mappings
        @action = {}
        @action["left"] = () => print("left")
        @action["right"] = () => print("right")

    bind: (key, callback, ...) =>
        @action[key] = {callback, {...}}

    inputKeypressed: (key) =>
        local func
        local args

        if @action[key] == nil
            return

        for tuple in *@action[key]
            if type(tuple) == "function"
                func = tuple
            elseif tuple ~= nil
                args = tuple

        if type(func) == "function"
            if args == nil then
                func()
             else
                func(args)

    inputUpdate: (dt) =>

