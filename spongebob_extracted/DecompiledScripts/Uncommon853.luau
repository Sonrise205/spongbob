return function() --[[ Line: 1 ]]
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 255, 34)), 
        ColorSequenceKeypoint.new(0.301, Color3.fromRGB(59, 176, 16)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(19, 143, 0)), 
        ColorSequenceKeypoint.new(0.697, Color3.fromRGB(59, 176, 16)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(26, 255, 34))
    });
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(1, 0)
    });
    l_UIGradient_0.Rotation = 45;
    return l_UIGradient_0;
end;