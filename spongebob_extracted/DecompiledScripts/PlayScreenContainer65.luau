local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v2 = require(l_ReplicatedStorage_0.Packages.Fusion);
local _ = v2.peek;
local l_Children_0 = v2.Children;
return function(v5, v6) --[[ Line: 25 ]]
    -- upvalues: l_Children_0 (copy)
    return v5:innerScope():New("Frame")({
        Name = v6.Name or "PlayScreenContainer", 
        AnchorPoint = v6.AnchorPoint or Vector2.new(0.5, 0.5), 
        Position = v6.Position or UDim2.fromScale(0.5, 0.5), 
        BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
        Size = v6.Size or UDim2.fromScale(1, 1), 
        SizeConstraint = v6.SizeConstraint, 
        LayoutOrder = v6.LayoutOrder, 
        BackgroundTransparency = 0, 
        ZIndex = v6.ZIndex, 
        Parent = v6.Parent, 
        [l_Children_0] = {}
    });
end;