local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.ExternalDebug);
local v3 = require(l_Parent_0.Utility.merge);
return function(...) --[[ Line: 15 ]] --[[ Name: scoped ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v4 = setmetatable({}, {
        __index = v3(false, {}, ...)
    });
    v2.trackScope(v4);
    return v4;
end;