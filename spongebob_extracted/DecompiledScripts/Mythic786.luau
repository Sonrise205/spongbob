return function() --[[ Line: 1 ]]
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 238)), 
        ColorSequenceKeypoint.new(0.484, Color3.fromRGB(255, 200, 0)), 
        ColorSequenceKeypoint.new(0.734, Color3.fromRGB(255, 0, 221)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(212, 0, 255))
    });
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(1, 0)
    });
    l_UIGradient_0.Rotation = 45;
    return l_UIGradient_0;
end;