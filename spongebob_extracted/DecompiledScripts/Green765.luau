return function() --[[ Line: 1 ]]
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 0)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0))
    });
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(0.7, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    return l_UIGradient_0;
end;