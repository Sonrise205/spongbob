local l_trimStart_0 = require(script.Parent:WaitForChild("trimStart"));
local l_trimEnd_0 = require(script.Parent:WaitForChild("trimEnd"));
return function(v2) --[[ Line: 4 ]]
    -- upvalues: l_trimStart_0 (copy), l_trimEnd_0 (copy)
    return l_trimStart_0(l_trimEnd_0(v2));
end;