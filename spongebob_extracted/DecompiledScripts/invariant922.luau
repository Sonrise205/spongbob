local l_Error_0 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Error;
return function(v1, v2, ...) --[[ Line: 24 ]] --[[ Name: invariant ]]
    -- upvalues: l_Error_0 (copy)
    if not v1 then
        error(l_Error_0(string.format(v2, ...)));
    end;
end;