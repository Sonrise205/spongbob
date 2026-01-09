return function() --[[ Line: 1 ]]
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), 
        ColorSequenceKeypoint.new(0.5, Color3.new(0.7098039388656616, 0.7215686440467834, 0.7372549176216125)), 
        ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
    });
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(0.09894459694623947, 0), 
        NumberSequenceKeypoint.new(0.5, 1), 
        NumberSequenceKeypoint.new(0.8997361660003662, 0), 
        NumberSequenceKeypoint.new(1, 0)
    });
    return l_UIGradient_0;
end;