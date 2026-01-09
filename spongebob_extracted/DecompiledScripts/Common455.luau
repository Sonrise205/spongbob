return function() --[[ Line: 1 ]]
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
        ColorSequenceKeypoint.new(0.299, Color3.fromRGB(176, 176, 176)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(143, 143, 143)), 
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(176, 176, 176)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    });
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(1, 0)
    });
    l_UIGradient_0.Rotation = 45;
    return l_UIGradient_0;
end;