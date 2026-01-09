local l_Map_0 = require(script.Parent:WaitForChild("Map"));
local l_Object_0 = require(script.Parent.Parent:WaitForChild("Object"));
local v2 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"));
local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
return function(v4) --[[ Line: 9 ]] --[[ Name: coerceToMap ]]
    -- upvalues: v2 (copy), l_Map_0 (copy), l_Object_0 (copy)
    return v2(v4, l_Map_0) and v4 or l_Map_0.new(l_Object_0.entries(v4));
end;