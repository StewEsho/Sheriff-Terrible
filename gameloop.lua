--------------------------------------------------------------------------------
--
-- gameloop.lua
--
--------------------------------------------------------------------------------
local baseEnemy = require("enemy");
local gameloop = {}
local AudioManager = require("AudioManager")

local movementX, movementY = 0

local enemy1;

function gameloop:init()
  --AudioManager:playSound("sounds/funnymusic.mp3")
  enemy1 = baseEnemy:new(display.contentWidth/2, display.contentHeight/2, {sprite = "img/sprite/placeholderEnemy1.png"})
end

function gameloop:run()
  enemy1:run();
end

return gameloop;
