--------------------------------------------------------------------------------
--
-- enemymanager.lua
--
--------------------------------------------------------------------------------
local cowboy = require("cowboy")
local dolphin = require("dolphin");
local eman = {}

--list of modules
--[[
  [1] - Cowboy
  [2] - Dolphin
]]--
eman.moduleList = {
  cowboy,
  dolphin
}

--stores the individual character instances
eman.enemyList = {};

function eman:init()
  for i = 1, table.getn(self.moduleList) do
    print(i);
    self.enemyList[i] = {};
  end
end

function eman:spawn(type, x, y, params)
  x = x or display.contentWidth/2;
  y = y or display.contentHeight/2;
  params = params or {}
  local newEnemy = self.moduleList[type]:new(x, y, params);
  table.insert(self.enemyList[type], newEnemy);
  return newEnemy;
end

function eman:run()
  for i = 1, table.getn(self.enemyList) do
    for j = 1, table.getn(self.enemyList[i]) do
      if(self.enemyList[i][j]) then
        if(self.enemyList[i][j]:getIsDead() ~= true) then
          self.enemyList[i][j]:run();
        else
          self.enemyList[i][j]:removeSelf();
          table.remove(self.enemyList[i], j);
        end
      end
    end
  end
end

function eman:get(i1, i2)
  if(i1 == nil) then
    return self.enemyList;
  elseif(i2 == nil) then
    return self.enemyList[i1];
  else
    return self.enemyList[i1][i2];
  end
end

return eman;
