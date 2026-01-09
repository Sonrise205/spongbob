local l_isInteger_0 = require(script.Parent:WaitForChild("isInteger"));
local l_MAX_SAFE_INTEGER_0 = require(script.Parent:WaitForChild("MAX_SAFE_INTEGER"));
return function(v2) --[[ Line: 5 ]]
    -- upvalues: l_isInteger_0 (copy), l_MAX_SAFE_INTEGER_0 (copy)
    return l_isInteger_0(v2) and math.abs(v2) <= l_MAX_SAFE_INTEGER_0;
end;