local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2, ...) --[[ Line: 12 ]] --[[ Name: insert ]]
    for v3 = 1, select("#", ...) do
        table.insert(v2, (select(v3, ...)));
    end;
    return ...;
end;