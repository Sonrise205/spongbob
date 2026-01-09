local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2) --[[ Line: 13 ]] --[[ Name: castToGraph ]]
    if typeof(v2) == "table" and typeof(v2.validity) == "string" and typeof(v2.timeliness) == "string" and typeof(v2.dependencySet) == "table" and typeof(v2.dependentSet) == "table" then
        return v2;
    else
        return nil;
    end;
end;