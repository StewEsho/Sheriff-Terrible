--------------------------------------------------------------------------------
--
-- gameloop.lua
--
--------------------------------------------------------------------------------
local enemy = require("enemymanager");
local gameloop = {}
local AudioManager = require("AudioManager")

local movementX, movementY = 0

local enemy1;

function gameloop:init()
  --AudioManager:playSound("sounds/funnymusic.mp3")
  enemy1 = baseEnemy:new(display.contentWidth/2, display.contentHeight/2, {sprite = "img/sprite/placeholderEnemy1.png"})
  enemy:init();
  enemy:spawn(1, display.contentWidth/2, display.contentHeight/2, {sprite = "img/sprite/placeholderEnemy1.png"})
  enemy:spawn(1, 300, 25, {sprite = "img/sprite/placeholderEnemy1.png"});
  enemy:spawn(1, 400, 50, {sprite = "img/sprite/placeholderEnemy1.png"});
  enemy:spawn(1, 200, 75, {sprite = "img/sprite/placeholderEnemy1.png"});
  enemy:spawn(1, 100, 200, {sprite = "img/sprite/placeholderEnemy1.png"});
  enemy:spawn(1, 50, 300, {sprite = "img/sprite/placeholderEnemy1.png"});
  enemy:spawn(1, 700, 400, {sprite = "img/sprite/placeholderEnemy1.png"});
end

function gameloop:run()
  enemy:run();
end

return gameloop;
