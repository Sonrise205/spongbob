local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.ExternalDebug);
local v3 = require(l_Parent_0.Utility.merge);
local v4 = require(l_Parent_0.Memory.scopePool);
return function(...) --[[ Line: 16 ]] --[[ Name: scoped ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    local v5 = setmetatable(v4.reuseAny() or {}, {
        __index = v3(false, {}, ...)
    });
    v2.trackScope(v5);
    return v5;
end;