return function() --[[ Line: 1 ]]
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 32, 113)), 
        ColorSequenceKeypoint.new(0.15, Color3.fromRGB(0, 255, 247)), 
        ColorSequenceKeypoint.new(0.35, Color3.fromRGB(44, 177, 130)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 225, 191)), 
        ColorSequenceKeypoint.new(0.65, Color3.fromRGB(44, 177, 130)), 
        ColorSequenceKeypoint.new(0.85, Color3.fromRGB(0, 255, 247)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 32, 113))
    });
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(1, 0)
    });
    l_UIGradient_0.Rotation = 45;
    return l_UIGradient_0;
end;