local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
local l_map_0 = require(script.Parent:WaitForChild("map"));
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: l_map_0 (copy)
    if #v2 == 0 then
        return "";
    else
        local v5 = l_map_0(v2, function(v4) --[[ Line: 10 ]]
            return (tostring(v4));
        end);
        return table.concat(v5, v3 or ",");
    end;
end;