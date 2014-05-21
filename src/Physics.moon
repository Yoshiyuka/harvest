HC = require "hardon"

export Physics

class Physics
    new:(world) =>
        --world\setCallbacks(@onCollision)
    update: (dt) =>

    onCollision: (shape) =>
        "Triggered onCollision callback!"



