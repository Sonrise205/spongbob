local l___DEV___0 = _G.__DEV__;
local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
return function(v2) --[[ Line: 7 ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        print("Luau now has a direct table.isfrozen call that can save the overhead of this library function call");
    end;
    return table.isfrozen(v2);
end;