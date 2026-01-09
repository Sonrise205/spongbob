local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2) --[[ Line: 13 ]] --[[ Name: castToState ]]
    if typeof(v2) == "table" and v2.type == "State" then
        return v2;
    else
        return nil;
    end;
end;