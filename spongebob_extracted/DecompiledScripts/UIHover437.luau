local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.Component);
local _ = {};
local v7 = v5.new({
    Tag = script.Name, 
    Ancestors = {
        v3.Player.PlayerGui
    }
});
v7.Construct = function(v8) --[[ Line: 18 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v8.dumpster = v4.new();
end;
v7.Start = function(v9) --[[ Line: 22 ]] --[[ Name: Start ]]
    -- upvalues: l_TweenService_0 (copy)
    local v10 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
    local l_Position_0 = v9.Instance.Position;
    l_TweenService_0:Create(v9.Instance, v10, {
        Position = UDim2.fromScale(l_Position_0.X.Scale, l_Position_0.Y.Scale - l_Position_0.Y.Scale * 0.1)
    }):Play();
end;
v7.Stop = function(v12) --[[ Line: 36 ]] --[[ Name: Stop ]]
    v12.dumpster:Destroy();
end;
v3.OnStart():andThen(function() --[[ Line: 44 ]]

end);
return v7;