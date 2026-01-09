local v0 = {
    Solid = {
        White = Color3.new(1, 1, 1), 
        Black = Color3.new(0, 0, 0), 
        DeepPurple = Color3.fromRGB(61, 67, 150), 
        Red = Color3.fromRGB(247, 83, 78), 
        Blue = Color3.fromRGB(0, 150, 255), 
        SeaBottom = Color3.fromRGB(37, 41, 91), 
        LightPurple = Color3.fromRGB(119, 124, 187), 
        Green = Color3.fromRGB(61, 152, 0), 
        LightGreen = Color3.fromRGB(174, 243, 129), 
        LightRed = Color3.fromRGB(245, 118, 114), 
        Disabled = Color3.fromRGB(43, 70, 104), 
        Gold = Color3.fromHex("#f4ff4a"), 
        Normal = Color3.fromRGB(89, 255, 0), 
        Hard = Color3.fromRGB(255, 81, 0), 
        Nightmare = Color3.fromRGB(255, 0, 212), 
        ["Davy Jones"] = Color3.fromRGB(255, 0, 25), 
        RedConfirmationOutline = Color3.fromRGB(111, 14, 43), 
        GreenConfirmationOutline = Color3.fromRGB(18, 77, 27)
    }, 
    Gradient = {
        RedConfirmation = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(179, 20, 26)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 79, 117))
        }), 
        GreenConfirmation = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(175, 238, 0)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(3, 153, 38))
        }), 
        Green = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(91, 185, 31)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(174, 243, 129))
        }), 
        Red = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(247, 83, 78)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 195, 188))
        }), 
        Blue = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(163, 217, 255))
        }), 
        Purple = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(178, 96, 255)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(226, 196, 255))
        }), 
        Grey = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(88, 120, 144)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(134, 171, 200))
        }), 
        Orange = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 149, 0)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 247, 0))
        }), 
        Disabled = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(146, 182, 199)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(43, 70, 104))
        }), 
        Common = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
            ColorSequenceKeypoint.new(0.299, Color3.fromRGB(176, 176, 176)), 
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(143, 143, 143)), 
            ColorSequenceKeypoint.new(0.7, Color3.fromRGB(176, 176, 176)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
        }), 
        Uncommon = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 255, 34)), 
            ColorSequenceKeypoint.new(0.301, Color3.fromRGB(59, 176, 16)), 
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(19, 143, 0)), 
            ColorSequenceKeypoint.new(0.697, Color3.fromRGB(59, 176, 16)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(26, 255, 34))
        }), 
        Rare = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 60, 255)), 
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 213, 255)), 
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 213, 255)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 60, 255))
        }), 
        Epic = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(247, 0, 255)), 
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(81, 0, 255)), 
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(72, 0, 227)), 
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(81, 0, 255)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(247, 0, 255))
        }), 
        Legendary = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 247, 0)), 
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 149, 0)), 
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 102, 0)), 
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 149, 0)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 247, 0))
        }), 
        Mythic = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 0, 255)), 
            ColorSequenceKeypoint.new(0.348, Color3.fromRGB(0, 255, 238)), 
            ColorSequenceKeypoint.new(0.678, Color3.fromRGB(255, 200, 0)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(212, 0, 255))
        }), 
        Limited = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 242, 64)), 
            ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 101, 62)), 
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(157, 58, 255)), 
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(222, 71, 149)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 242, 64))
        }), 
        Secret = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 14, 35)), 
            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(94, 23, 55)), 
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 123)), 
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(94, 23, 55)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(58, 14, 35))
        }), 
        SecretLight = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(112, 16, 62)), 
            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(146, 23, 78)), 
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 123)), 
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(146, 23, 78)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(112, 16, 62))
        }), 
        SPEED_ACTIVE = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 156, 62)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(48, 255, 238))
        }), 
        Exotic = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 32, 113)), 
            ColorSequenceKeypoint.new(0.15, Color3.fromRGB(25, 32, 113)), 
            ColorSequenceKeypoint.new(0.35, Color3.fromRGB(44, 177, 130)), 
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 225, 213)), 
            ColorSequenceKeypoint.new(0.65, Color3.fromRGB(44, 177, 130)), 
            ColorSequenceKeypoint.new(0.85, Color3.fromRGB(25, 32, 113)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 32, 113))
        }), 
        Prismatic = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
            ColorSequenceKeypoint.new(0.151, Color3.fromRGB(255, 136, 254)), 
            ColorSequenceKeypoint.new(0.35, Color3.fromRGB(73, 170, 255)), 
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(2, 254, 255)), 
            ColorSequenceKeypoint.new(0.651, Color3.fromRGB(73, 170, 255)), 
            ColorSequenceKeypoint.new(0.785, Color3.fromRGB(255, 136, 254)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
        })
    }
};
v0.Gradient.Normal = v0.Gradient.Green;
v0.Gradient.Hard = v0.Gradient.Orange;
v0.Gradient.Nightmare = v0.Gradient.Purple;
v0.Gradient["Davy Jones"] = v0.Gradient.Red;
v0.ApplyColor = function(v1, v2, v3) --[[ Line: 204 ]] --[[ Name: ApplyColor ]]
    local l_UIGradient_0 = v2:FindFirstChildOfClass("UIGradient");
    if not l_UIGradient_0 then
        l_UIGradient_0 = Instance.new("UIGradient");
        l_UIGradient_0.Parent = v2;
    end;
    l_UIGradient_0.Color = v1[v3];
end;
return v0;