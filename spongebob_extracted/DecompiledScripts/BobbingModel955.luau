local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Component).new({
    Tag = "BobbingModel", 
    Ancestors = {
        workspace
    }
});
v1.GetBobbingHeight = function(v2) --[[ Line: 14 ]] --[[ Name: GetBobbingHeight ]]
    return v2.Instance:GetAttribute("BobbingHeight") or 1;
end;
v1.GetSpeedMultiplier = function(v3) --[[ Line: 18 ]] --[[ Name: GetSpeedMultiplier ]]
    return v3.Instance:GetAttribute("SpeedMultiplier") or 1;
end;
v1.Construct = function(v4) --[[ Line: 23 ]] --[[ Name: Construct ]]
    v4._bobbingHeight = v4:GetBobbingHeight();
    v4._speedMultiplier = v4:GetSpeedMultiplier();
end;
v1.Start = function(_) --[[ Line: 28 ]] --[[ Name: Start ]]

end;
v1.Stop = function(_) --[[ Line: 31 ]] --[[ Name: Stop ]]

end;
v1.HeartbeatUpdate = function(v7, v8) --[[ Line: 34 ]] --[[ Name: HeartbeatUpdate ]]
    local v9 = CFrame.new(0, v7._bobbingHeight * math.sin(os.clock() * v7._speedMultiplier) * v8, 0);
    v7.Instance:PivotTo(v7.Instance:GetPivot() * v9);
end;
return v1;