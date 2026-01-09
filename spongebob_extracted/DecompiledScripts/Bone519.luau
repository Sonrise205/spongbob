--!native
local _ = require(script.Parent.Parent.Types);
local v3 = {
    ToPosition = function(_, v2) --[[ Line: 8 ]] --[[ Name: ToPosition ]]
        return v2.Instance.TransformedWorldCFrame.Position;
    end
};
v3.ToDirection = function(_, v5) --[[ Line: 12 ]] --[[ Name: ToDirection ]]
    -- upvalues: v3 (copy)
    if v5.Position then
        return v3:ToPosition(v5) - v5.Position;
    else
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
v3.ToVisual = function(_, v7) --[[ Line: 20 ]] --[[ Name: ToVisual ]]
    -- upvalues: v3 (copy)
    return CFrame.lookAt(v3:ToPosition(v7), v7.Position or Vector3.new(0, 0, 0, 0));
end;
return v3;