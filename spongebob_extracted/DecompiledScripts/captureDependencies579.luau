local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Logging.parseError);
local v3 = require(l_Parent_0.Dependencies.sharedState);
local l_initialisedStack_0 = v3.initialisedStack;
local v5 = 0;
return function(v6, v7, ...) --[[ Line: 25 ]] --[[ Name: captureDependencies ]]
    -- upvalues: v3 (copy), v5 (ref), l_initialisedStack_0 (copy), v2 (copy)
    local l_dependencySet_0 = v3.dependencySet;
    v3.dependencySet = v6;
    local l_v3_0 = v3;
    l_v3_0.initialisedStackSize = l_v3_0.initialisedStackSize + 1;
    l_v3_0 = v3.initialisedStackSize;
    local v10 = nil;
    if v5 < l_v3_0 then
        l_initialisedStack_0[l_v3_0] = {};
        v5 = l_v3_0;
    else
        v10 = l_initialisedStack_0[l_v3_0];
        table.clear(v10);
    end;
    local v11 = table.pack(xpcall(v7, v2, ...));
    v3.dependencySet = l_dependencySet_0;
    local l_v3_1 = v3;
    l_v3_1.initialisedStackSize = l_v3_1.initialisedStackSize - 1;
    return table.unpack(v11, 1, v11.n);
end;