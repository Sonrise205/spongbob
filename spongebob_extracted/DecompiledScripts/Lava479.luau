local v0 = require(script.Parent.Parent);
return function(v1, v2) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    local v3 = v0.Gradient.new(v1, v0.Templates.Lava.Color, 0);
    v3:SetOffsetSpeed(v2, 1);
    return {
        Effects = {
            v3
        }
    };
end;