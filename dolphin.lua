--------------------------------------------------------------------------------
--
-- twista.lua
--
--------------------------------------------------------------------------------

local dolphin = {};

--constructor; contains all class-encapsulated functions
function dolphin:new(_x, _y, params)
  --Variables
  local x = _x;
  local y = _y;
  local width = params.width or 60;
  local height = params.height or 35;

  --initializes the sprite
  sprite = display.newImageRect("img/sprite/placeholderEnemy2.png", width, height)
  sprite.x = x;
  sprite.y = y;
  sprite.enemyType = 1;

  local waypointX = math.random(0, 1);
  if(waypointX == 1) then waypointX = display.contentWidth; end

  function sprite:run()
    if(self.x - waypointX < 0.01 and self.x - waypointX > -0.07) then
      self:newWaypoint();
    else
      self.x = self.x + (waypointX - self.x)*0.001;
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

return dolphin;
