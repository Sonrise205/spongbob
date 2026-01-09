local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Graph.evaluate);
local v4 = require(l_Parent_0.Utility.nameOf);
return function(v5, v6) --[[ Line: 16 ]] --[[ Name: depend ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    v3(v6, false);
    if table.isfrozen(v5.dependencySet) or table.isfrozen(v6.dependentSet) then
        v2.logError("cannotDepend", nil, v4(v5, "Dependent"), v4(v6, "dependency"));
    end;
    v6.dependentSet[v5] = true;
    v5.dependencySet[v6] = true;
end;