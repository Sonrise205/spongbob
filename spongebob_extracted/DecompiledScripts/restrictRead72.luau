local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Logging.logError);
return function(v2, v3) --[[ Line: 12 ]] --[[ Name: restrictRead ]]
    -- upvalues: v1 (copy)
    local v4 = getmetatable(v3);
    if v4 == nil then
        v4 = {};
        setmetatable(v3, v4);
    end;
    v4.__index = function(_, v6) --[[ Line: 21 ]] --[[ Name: __index ]]
        -- upvalues: v1 (ref), v2 (copy)
        v1("strictReadError", nil, tostring(v6), v2);
    end;
    return v3;
end;