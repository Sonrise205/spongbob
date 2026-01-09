local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
return function(v3, v4) --[[ Line: 14 ]] --[[ Name: poisonScope ]]
    -- upvalues: v2 (copy)
    local v5 = getmetatable(v3);
    if typeof(v5) == "table" and v5._FUSION_POISONED then
        return;
    else
        table.clear(v3);
        setmetatable(v3, {
            _FUSION_POISONED = true, 
            __index = function() --[[ Line: 25 ]] --[[ Name: __index ]]
                -- upvalues: v2 (ref), v4 (copy)
                v2.logError("poisonedScope", nil, v4);
            end, 
            __newindex = function() --[[ Line: 28 ]] --[[ Name: __newindex ]]
                -- upvalues: v2 (ref), v4 (copy)
                v2.logError("poisonedScope", nil, v4);
            end
        });
        return;
    end;
end;