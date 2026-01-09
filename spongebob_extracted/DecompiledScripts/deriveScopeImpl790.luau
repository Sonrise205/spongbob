local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Utility.merge);
return function(v3, v4, ...) --[[ Line: 19 ]] --[[ Name: deriveScopeImpl ]]
    -- upvalues: v2 (copy)
    local v5 = getmetatable(v3);
    if v4 ~= nil then
        v5 = table.clone(v5);
        v5.__index = v2(true, {}, v5.__index, v2(false, {}, v4, ...));
    end;
    return (setmetatable({}, v5));
end;