--------------------------------------------------------------------------------
--
-- enemy.lua
--
--------------------------------------------------------------------------------

local enemy = {};

function enemy:new(_x, _y, params)
  --Variables
  local x = _x;
  local y = _y;
  local width = params.width or 85;
  local height = params.height or 125;
  local sprite = 3;

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
  print(sprite.x - waypointX);

  function sprite:run()
    if(self.x - waypointX < 40 and self.x - waypointX > -1) then
      self:newWaypoint();
    else
      self.x = self.x + (waypointX - self.x)*0.01
      print ((waypointX - self.x))
    end
    x = self.x;
    y = self.y;
  end

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

return enemy;
