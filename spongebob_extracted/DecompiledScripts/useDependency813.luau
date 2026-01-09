local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Dependencies.sharedState);
local l_initialisedStack_0 = v2.initialisedStack;
return function(v4) --[[ Line: 14 ]] --[[ Name: useDependency ]]
    -- upvalues: v2 (copy), l_initialisedStack_0 (copy)
    local l_dependencySet_0 = v2.dependencySet;
    if l_dependencySet_0 ~= nil then
        local l_initialisedStackSize_0 = v2.initialisedStackSize;
        if l_initialisedStackSize_0 > 0 and l_initialisedStack_0[l_initialisedStackSize_0][v4] ~= nil then
            return;
        else
            l_dependencySet_0[v4] = true;
        end;
    end;
end;