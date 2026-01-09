local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Graph.evaluate);
local v4 = require(l_Parent_0.Graph.castToGraph);
local v5 = require(l_Parent_0.State.castToState);
local v6 = require(l_Parent_0.Utility.nameOf);
return function(v7, v8) --[[ Line: 18 ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy), v6 (copy), v5 (copy)
    if v4(v8) then
        v3(v8, false);
        if table.isfrozen(v7.dependencySet) or table.isfrozen(v8.dependentSet) then
            v2.logError("cannotDepend", nil, v6(v7, "Dependent"), v6(v8, "dependency"));
        end;
        v8.dependentSet[v7] = true;
        v7.dependencySet[v8] = true;
        if v5(v8) then
            return v8._EXTREMELY_DANGEROUS_usedAsValue;
        else
            return nil;
        end;
    else
        return v8;
    end;
end;