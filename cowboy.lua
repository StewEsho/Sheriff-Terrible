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
  local sprite = nil;
  local enemyType = 1;

  --initializes sprite;
  if (params.sprite) then
    sprite = display.newImageRect(params.sprite, width, height)
    sprite.x = x;
    sprite.y = y;
  else
    sprite = display.newRect(x, y, width, height)
  end

  local waypointX = math.random(0, 1);
  if(waypointX == 1) then waypointX = display.contentWidth; end

  function sprite:run()
    if(self.x - waypointX < 0.2 and self.x - waypointX > -0.2) then
      self:newWaypoint();
    else
      self.x = self.x + (waypointX - self.x)*(math.random(1, 50)/100);
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
