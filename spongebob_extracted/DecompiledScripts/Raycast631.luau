--!native
local _ = require(script.Parent.Parent.Types);
local v1 = {
    Solvers = {}
};
v1.Cast = function(_, v3, v4) --[[ Line: 8 ]] --[[ Name: Cast ]]
    -- upvalues: v1 (copy)
    local v5 = v1.Solvers[v3.Instance.ClassName];
    local v6 = v5:ToPosition(v3);
    local v7 = v5:ToDirection(v3);
    return workspace:Raycast(v6, v7, v4), v7;
end;
return v1;