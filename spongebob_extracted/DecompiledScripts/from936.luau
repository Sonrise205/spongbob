local l_Set_0 = require(script.Parent.Parent:WaitForChild("Set"));
local l_Map_0 = require(script.Parent.Parent:WaitForChild("Map"):WaitForChild("Map"));
local l_isArray_0 = require(script.Parent:WaitForChild("isArray"));
local v3 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"));
local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
local l_fromString_0 = require(script:WaitForChild("fromString"));
local l_fromSet_0 = require(script:WaitForChild("fromSet"));
local l_fromMap_0 = require(script:WaitForChild("fromMap"));
local l_fromArray_0 = require(script:WaitForChild("fromArray"));
return function(v9, v10, v11) --[[ Line: 19 ]]
    -- upvalues: l_isArray_0 (copy), l_fromArray_0 (copy), v3 (copy), l_Set_0 (copy), l_fromSet_0 (copy), l_Map_0 (copy), l_fromMap_0 (copy), l_fromString_0 (copy)
    if v9 == nil then
        error("cannot create array from a nil value");
    end;
    local v12 = typeof(v9);
    local _ = nil;
    if v12 == "table" and l_isArray_0(v9) then
        return (l_fromArray_0(v9, v10, v11));
    elseif v3(v9, l_Set_0) then
        return (l_fromSet_0(v9, v10, v11));
    elseif v3(v9, l_Map_0) then
        return (l_fromMap_0(v9, v10, v11));
    elseif v12 == "string" then
        return (l_fromString_0(v9, v10, v11));
    else
        return {};
    end;
end;