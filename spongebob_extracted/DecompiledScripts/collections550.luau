local l_Array_0 = require(script:WaitForChild("Array"));
local l_Map_0 = require(script:WaitForChild("Map"));
local l_Object_0 = require(script:WaitForChild("Object"));
local l_Set_0 = require(script:WaitForChild("Set"));
local l_WeakMap_0 = require(script:WaitForChild("WeakMap"));
local l_inspect_0 = require(script:WaitForChild("inspect"));
local _ = require(script.Parent:WaitForChild("es7-types"));
return {
    Array = l_Array_0, 
    Object = l_Object_0, 
    Map = l_Map_0.Map, 
    coerceToMap = l_Map_0.coerceToMap, 
    coerceToTable = l_Map_0.coerceToTable, 
    Set = l_Set_0, 
    WeakMap = l_WeakMap_0, 
    inspect = l_inspect_0
};