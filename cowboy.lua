--------------------------------------------------------------------------------
--
-- cowboy.lua
--
--------------------------------------------------------------------------------

local cowboy = {};

--constructor; contains all class-encapsulated functions
function cowboy:new(_x, _y, params)
  --Variables
  local x = _x;
  local y = _y;
  local width = params.width or 35;
  local height = params.height or 60;

  --initializes the sprite
  sprite = display.newImageRect("img/sprite/cowboy.png", width, height)
  sprite.x = x;
  sprite.y = y;
  sprite.enemyType = 1;
  sprite.speed = 30;

  local waypointX = math.random(0, 1);
  if(waypointX == 1) then waypointX = display.contentWidth; end

  function sprite:run()
    if(self.x - waypointX < 20 and self.x - waypointX > -20) then
      self:newWaypoint();
      self.speed = math.random(6, 40);
    else
      self.x = self.x + (waypointX - self.x)/self.speed;
    end
    x = self.x;
    y = self.y;
  end

  --selects a new waypoint for the enemy to run too
  function sprite:newWaypoint()
    if(waypointX == display.contentWidth) then
      waypointX = 0;
    else
      waypointX = display.contentWidth;
    end
    return waypointX;
  end

  return sprite;
end

return cowboy;
