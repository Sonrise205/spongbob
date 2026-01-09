local l___DEV___0 = _G.__DEV__;
local l_isArray_0 = require(script.Parent:WaitForChild("isArray"));
local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
return function(v3) --[[ Line: 6 ]]
    -- upvalues: l___DEV___0 (copy), l_isArray_0 (copy)
    if l___DEV___0 and not l_isArray_0(v3) then
        error(string.format("Array.shift called on non-array %s", (typeof(v3))));
    end;
    if #v3 > 0 then
        return table.remove(v3, 1);
    else
        return nil;
    end;
end;