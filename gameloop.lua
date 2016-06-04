--------------------------------------------------------------------------------
--
-- gameloop.lua
--
--------------------------------------------------------------------------------
local enemy = require("enemymanager");
local gameloop = {}
local AudioManager = require("AudioManager")

local movementX, movementY = 0;

local enemy1;

function gameloop:init()
  --AudioManager:playSound("music/action1.mp3", 1, -1);
  AudioManager:setMusicVolume(1);
  enemy:init();
  enemy:spawn(1, display.contentWidth/2, display.contentHeight/2)
  enemy:spawn(1, 300, 25);
  enemy:spawn(1, 400, 50);
  enemy:spawn(2, 200, 75);
  enemy:spawn(2, 100, 200);
  enemy:spawn(2, 50, 300);
  enemy:spawn(2, 700, 400);
end

function gameloop:run()
  enemy:run();
end

return gameloop;
