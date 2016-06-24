--------------------------------------------------------------------------------
--
-- gameloop.lua
--
--------------------------------------------------------------------------------
local enemy = require("enemymanager");
local gameloop = {}
local AudioManager = require("AudioManager")
local globals = require("globals");

local movementX, movementY = 0;

local timer;
local runtime;
local spawnTime;
local title, subtitle;
local skyBG;
local reactTimer;
local wastedSeconds, wastedSecondsText;
local scoreText;

function gameloop:init()
  --AudioManager:playSound("music/action1.mp3", 1, -1);
  AudioManager:setMusicVolume(1);

  display.setDefault("background", 0.8, 0.5, 0.25)
  skyBG = display.newRect(display.actualContentWidth/2, 0, display.actualContentWidth, 150);
  skyBG:setFillColor(0.2, 0.6, 0.8);
  skyBG.path.y3 = skyBG.path.y3 - 16

  title = display.newText(globals.title, display.contentWidth/2, 12, "font/CabinSketch-Bold.ttf", 42);
  title:setFillColor(1, 0.7, 0.1);

  subtitle = display.newText("Quick Draw!", display.contentWidth/2, 42, "font/CabinSketch-Bold.ttf", 24);
  subtitle:setFillColor(1, 1, 1);

  wastedSecondsText = display.newText("Total Draw Time: 0.00", display.contentWidth/2, 90, "font/CabinSketch-Bold.ttf", 18);
  scoreText = display.newText("Duels Won: 0", display.contentWidth/2, 110, "font/CabinSketch-Bold.ttf", 18);

  enemy:init();
  timer = 25;
  runtime = 0;
  spawnTime = math.random(45, 400);
  reactTimer = 0;
end

function gameloop:run()
  scoreText.text = "Duels Won: " .. globals.score;

  if(#enemy:get(1) < 3) then
    timer = timer + getDeltaTime();
  else
    timer = 0;
    spawnTime = math.random(45, 400);
  end

  if(#enemy:get(1) > 0)then
    reactTimer = reactTimer + getDeltaTime();
  end

  if (timer > spawnTime and #enemy:get(1) < 3) then
    enemy:spawn(1, math.random(0, display.contentWidth), math.random(150, display.contentHeight-60));
    timer = 0;
    spawnTime = math.random(45, 400);
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
