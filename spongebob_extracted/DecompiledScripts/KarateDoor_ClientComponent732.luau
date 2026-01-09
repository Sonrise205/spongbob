local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.ObserveAttribute);
local v7 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v8 = v2.GetController("AudioController");
local v9 = v3.new({
    Tag = "KarateDoor", 
    Extensions = {}
});
v9.Construct = function(v10) --[[ Line: 20 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v10.dump = v4.new();
    v10.doors = v10.Instance:WaitForChild("Doors");
end;
v9.Start = function(v11) --[[ Line: 25 ]] --[[ Name: Start ]]
    -- upvalues: v7 (copy), v5 (copy), v6 (copy), v8 (copy)
    local v12 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
    local function v17(v13, v14) --[[ Line: 28 ]] --[[ Name: tweenDoor ]]
        -- upvalues: v7 (ref), v12 (copy)
        local v15 = v13:GetPivot().RightVector * (v14 and 15 or -15);
        v7("CFrameValue", v13:GetPivot(), v12, {
            Value = v13:GetPivot() + v15
        }, function(v16) --[[ Line: 37 ]]
            -- upvalues: v13 (copy)
            v13:PivotTo(v16);
        end);
    end;
    local l_DoorL_0 = v11.doors:WaitForChild("DoorL");
    local l_DoorR_0 = v11.doors:WaitForChild("DoorR");
    for _, v21 in v5.Table.Extend(l_DoorL_0:GetDescendants(), l_DoorR_0:GetDescendants()) do
        if v21:IsA("BasePart") then
            v21.CanCollide = true;
        end;
    end;
    v11.dump:Add(v6(v11.Instance, "IsOpened", function(v22) --[[ Line: 54 ]]
        -- upvalues: v8 (ref), v11 (copy), v17 (copy), l_DoorL_0 (copy), l_DoorR_0 (copy)
        if not v22 then
            return;
        else
            v8:PlaySound({
                name = "SFX.Karate_DoorOpen", 
                adornee = v11.Instance.PrimaryPart, 
                soundGroup = "Master.SFX.VFX"
            });
            v17(l_DoorL_0, false);
            v17(l_DoorR_0, true);
            return;
        end;
    end));
end;
v9.Stop = function(v23) --[[ Line: 70 ]] --[[ Name: Stop ]]
    v23.dump:Destroy();
end;
return v9;