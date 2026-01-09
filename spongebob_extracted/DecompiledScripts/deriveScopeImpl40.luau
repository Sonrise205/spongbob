local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Utility.merge);
local v3 = require(l_Parent_0.Memory.scopePool);
return function(v4, v5, ...) --[[ Line: 20 ]] --[[ Name: deriveScopeImpl ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v6 = getmetatable(v4);
    if v5 ~= nil then
        v6 = table.clone(v6);
        v6.__index = v2(true, {}, v6.__index, v2(false, {}, v5, ...));
    end;
    return (setmetatable(v3.reuseAny() or {}, v6));
end;