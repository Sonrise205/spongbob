return function() --[[ Line: 1 ]]
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
        ColorSequenceKeypoint.new(0.151, Color3.fromRGB(255, 136, 254)), 
        ColorSequenceKeypoint.new(0.35, Color3.fromRGB(73, 170, 255)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(2, 254, 255)), 
        ColorSequenceKeypoint.new(0.651, Color3.fromRGB(73, 170, 255)), 
        ColorSequenceKeypoint.new(0.785, Color3.fromRGB(255, 136, 254)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    });
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(1, 0)
    });
    l_UIGradient_0.Rotation = 45;
    return l_UIGradient_0;
end;