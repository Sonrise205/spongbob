--!native
local v0 = require(script.Parent.Parent.Settings);
local _ = require(script.Parent.Parent.Types);
local v4 = {
    ToPosition = function(_, v3) --[[ Line: 10 ]] --[[ Name: ToPosition ]]
        return v3.Position or v3.Instance.WorldPosition;
    end
};
v4.ToDirection = function(_, v6) --[[ Line: 14 ]] --[[ Name: ToDirection ]]
    -- upvalues: v4 (copy), v0 (copy)
    local v7 = v6.Instance.WorldPosition - v4:ToPosition(v6);
    if v7.Magnitude == 0 then
        v7 = v6.LastDirection.Unit * v0.Minimum_Stationary_Length;
    end;
    return v7;
end;
v4.ToVisual = function(_, v9) --[[ Line: 24 ]] --[[ Name: ToVisual ]]
    -- upvalues: v4 (copy)
    return CFrame.lookAt(v4:ToPosition(v9), v9.Instance.WorldPosition);
end;
return v4;