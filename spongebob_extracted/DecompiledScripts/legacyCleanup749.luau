local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Memory.doCleanup);
return function(v4) --[[ Line: 11 ]] --[[ Name: legacyCleanup ]]
    -- upvalues: v2 (copy), v3 (copy)
    v2.logWarn("cleanupWasRenamed");
    return v3(v4);
end;