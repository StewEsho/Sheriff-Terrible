--------------------------------------------------------------------------------
--
-- gameloop.lua
--
--------------------------------------------------------------------------------
local enemy = require("enemymanager");
local gameloop = {}
local AudioManager = require("AudioManager")

local movementX, movementY = 0;

local timer;
local runtime;
local spawnTime;
local title, subtitle;

function gameloop:init()
  --AudioManager:playSound("music/action1.mp3", 1, -1);
  AudioManager:setMusicVolume(1);

  title = display.newText("Sherrif-Terrible", display.contentWidth/2, 12, "font/CabinSketch-Bold.ttf", 42);
  title:setFillColor(1, 0.7, 0.1);

  subtitle = display.newText("Quick Draw!", display.contentWidth/2, 42, "font/CabinSketch-Bold.ttf", 24);
  subtitle:setFillColor(1, 1, 1);

  enemy:init();
  timer = 25;
  runtime = 0;
  spawnTime = math.random(45, 105);
end

function gameloop:run()
  timer = timer + getDeltaTime();
  if (timer > spawnTime and #enemy:get(1) < 3) then
    enemy:spawn(1, math.random(0, display.contentWidth), math.random(60, display.contentHeight-60));
    timer = 0;
    spawnTime = math.random(45, 105);
  end
  enemy:run();
end

function getDeltaTime()
    local temp = system.getTimer()  -- Get current game time in ms
    local deltaTime = (temp-runtime) / (1000/60)  -- 60 fps or 30 fps as base
    runtime = temp  -- Store game time
    return deltaTime;
end

return gameloop;
