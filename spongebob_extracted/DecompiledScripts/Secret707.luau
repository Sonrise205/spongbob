return function() --[[ Line: 1 ]]
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 38)), 
        ColorSequenceKeypoint.new(0.45, Color3.fromRGB(63, 0, 188)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(63, 0, 188)), 
        ColorSequenceKeypoint.new(0.55, Color3.fromRGB(63, 0, 188)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 38))
    });
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(1, 0)
    });
    l_UIGradient_0.Rotation = 45;
    return l_UIGradient_0;
end;