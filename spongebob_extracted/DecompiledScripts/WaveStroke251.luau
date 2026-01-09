local v0 = require(script.Parent.Parent);
return function(v1, v2, v3, v4) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    local v5 = ColorSequence.new({
        ColorSequenceKeypoint.new(0, v4), 
        ColorSequenceKeypoint.new(0.5, v4), 
        ColorSequenceKeypoint.new(1, v4)
    });
    local v6 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(0.25, 1), 
        NumberSequenceKeypoint.new(0.5, 1), 
        NumberSequenceKeypoint.new(0.75, 1), 
        NumberSequenceKeypoint.new(1, 0)
    });
    local v7 = v0.Stroke.new(v1, v3);
    local v8 = v0.Gradient.new(v7.Instance, v5, v6);
    v8:SetOffsetSpeed(v2, 1);
    v8:SetTransparencyOffsetSpeed(v2 * 0.9, 1);
    return {
        Effects = {
            v8, 
            v7
        }
    };
end;