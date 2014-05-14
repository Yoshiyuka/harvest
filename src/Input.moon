require "moon.all"
export Input

class Input
    new: =>
        --default mappings
        @action = {}
        @action["left"] = () => print("left")
        @action["right"] = () => print("right")

    bind: (key, callback) =>
        @action[key] = callback

    inputKeypressed: (key) =>
        if type(@action[key]) == "function" then @action[key]()


