--------------------------------------------------------------------------------
--
-- enemymanager.lua
--
--------------------------------------------------------------------------------
local cowboy = require("cowboy")
local eman = {}

--list of modules
--[[
  [1] - Cowboy
]]--
eman.moduleList = {
  cowboy
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
      self.enemyList[i][j]:run();
    end
  end
end

return eman;
