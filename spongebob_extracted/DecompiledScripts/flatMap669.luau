local l___DEV___0 = _G.__DEV__;
local l_flat_0 = require(script.Parent:WaitForChild("flat"));
local l_map_0 = require(script.Parent:WaitForChild("map"));
local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
return function(v4, v5, v6) --[[ Line: 9 ]] --[[ Name: flatMap ]]
    -- upvalues: l___DEV___0 (copy), l_flat_0 (copy), l_map_0 (copy)
    if l___DEV___0 then
        if typeof(v4) ~= "table" then
            error(string.format("Array.flatMap called on %s", (typeof(v4))));
        end;
        if typeof(v5) ~= "function" then
            error("callback is not a function");
        end;
    end;
    return l_flat_0(l_map_0(v4, v5, v6));
end;