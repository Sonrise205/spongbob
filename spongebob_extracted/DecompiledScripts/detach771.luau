local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2, ...) --[[ Line: 12 ]] --[[ Name: detach ]]
    for v3 = 1, select("#", ...) do
        local v4 = table.find(v2, select(v3, ...));
        if v4 then
            table.remove(v2, v4);
        end;
    end;
    return ...;
end;