local l_number_0 = require(script.Parent.Parent:WaitForChild("number"));
return function(v1) --[[ Line: 4 ]]
    -- upvalues: l_number_0 (copy)
    return not not v1 and v1 ~= 0 and v1 ~= "" and not l_number_0.isNaN(v1);
end;