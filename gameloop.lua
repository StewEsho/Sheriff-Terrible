---------------------------------------------------------------------------------
--
-- gameloop.lua
--
---------------------------------------------------------------------------------
local gameloop = {}
local AudioManager = require("AudioManager")

local movementX, movementY = 0

function gameloop:init()
    AudioManager:playSound("sounds/funnymusic.mp3")
end

function gameloop:run()

end

return gameloop;
