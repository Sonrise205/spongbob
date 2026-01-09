local l_Map_0 = require(script.Parent:WaitForChild("Map"));
local v1 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"));
local l_reduce_0 = require(script.Parent.Parent:WaitForChild("Array"):WaitForChild("reduce"));
local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
return function(v4) --[[ Line: 9 ]] --[[ Name: coerceToTable ]]
    -- upvalues: v1 (copy), l_Map_0 (copy), l_reduce_0 (copy)
    if not v1(v4, l_Map_0) then
        return v4;
    else
        return l_reduce_0(v4:entries(), function(v5, v6) --[[ Line: 15 ]]
            v5[v6[1]] = v6[2];
            return v5;
        end, {});
    end;
end;