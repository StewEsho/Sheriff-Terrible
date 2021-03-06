---------------------------------------------------------------------------------
--
-- main.lua
--
---------------------------------------------------------------------------------
local gameloop = require("gameloop");

gameloop:init()

local function runGameloop()
  gameloop:run();
end

Runtime:addEventListener("enterFrame", runGameloop)
