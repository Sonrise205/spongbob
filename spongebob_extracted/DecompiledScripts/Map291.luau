local _ = require(script.Parent.Parent:WaitForChild("es7-types"));
local l_Map_0 = require(script:WaitForChild("Map"));
local l_coerceToMap_0 = require(script:WaitForChild("coerceToMap"));
local l_coerceToTable_0 = require(script:WaitForChild("coerceToTable"));
return {
    Map = l_Map_0, 
    coerceToMap = l_coerceToMap_0, 
    coerceToTable = l_coerceToTable_0
};