
--export to prevent Entity from being file-only. 
export Entity

class Entity
    @instances = 0
    new: =>
        @pos = {}
        @pos.x = 0
        @pos.y = 0

        @@instances += 1
        @id = @@instances

    update: (dt) =>

    draw: =>

