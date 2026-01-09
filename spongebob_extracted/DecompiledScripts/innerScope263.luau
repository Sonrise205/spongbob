local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.ExternalDebug);
local v3 = require(l_Parent_0.Memory.deriveScopeImpl);
return function(v4, ...) --[[ Line: 15 ]] --[[ Name: innerScope ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v5 = v3(v4, ...);
    table.insert(v4, v5);
    table.insert(v5, function() --[[ Line: 23 ]]
        -- upvalues: v4 (copy), v5 (copy)
        local v6 = table.find(v4, v5);
        if v6 ~= nil then
            table.remove(v4, v6);
        end;
    end);
    v2.trackScope(v5);
    return v5;
end;