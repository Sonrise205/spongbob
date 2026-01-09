local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
local l_indexOf_0 = require(script.Parent:WaitForChild("indexOf"));
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: l_indexOf_0 (copy)
    return l_indexOf_0(v2, v3, v4) ~= -1;
end;