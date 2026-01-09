local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.ExternalDebug);
local v3 = require(l_Parent_0.Memory.deriveScopeImpl);
return function(...) --[[ Line: 18 ]] --[[ Name: deriveScope ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v4 = v3(...);
    v2.trackScope(v4);
    return v4;
end;