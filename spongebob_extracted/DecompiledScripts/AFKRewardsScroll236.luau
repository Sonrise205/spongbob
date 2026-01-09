local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Component);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v10 = require(l_ReplicatedStorage_0.AFKRewards);
local v11 = TweenInfo.new(0.3);
local v12 = v4.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
v12.Construct = function(v13) --[[ Line: 24 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy)
    v13.dumpster = v3.new();
    v13.rewardsFrame = v13.Instance.Rewards;
    v13.template = v13.rewardsFrame.Template;
    v13.template.Visible = false;
    v13.template = v13.template:Clone();
end;
v12.Start = function(v14) --[[ Line: 33 ]] --[[ Name: Start ]]
    -- upvalues: v8 (copy), v9 (copy), l_TweenService_0 (copy), v11 (copy), v10 (copy)
    local v15 = nil;
    (function(v16) --[[ Line: 36 ]] --[[ Name: displayReward ]]
        -- upvalues: v14 (copy), v8 (ref), v9 (ref), v15 (ref), l_TweenService_0 (ref), v11 (ref)
        local v17 = v14.template:Clone();
        v17.Name = v16.name;
        v17.Visible = true;
        v17.Position = UDim2.fromScale(0, -1);
        v17.Parent = v14.rewardsFrame;
        local l_v8_IconFromRewardData_0 = v8:GetIconFromRewardData(v16);
        if v16.type ~= "Unit" and l_v8_IconFromRewardData_0 then
            v17.Icon.Image = l_v8_IconFromRewardData_0;
        else
            v17.Icon.Visible = false;
            local l_v9_Image_0 = v9:CreateImage(v16.name, {
                Size = UDim2.fromScale(1, 1), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Parent = v17
            });
            Instance.new("UIAspectRatioConstraint").Parent = l_v9_Image_0;
        end;
        if v15 then
            local l_v15_0 = v15;
            local v21 = l_TweenService_0:Create(l_v15_0, v11, {
                Position = UDim2.fromScale(0, 1)
            });
            v21.Completed:Once(function() --[[ Line: 70 ]]
                -- upvalues: l_v15_0 (copy)
                l_v15_0:Destroy();
            end);
            v21:Play();
        end;
        v15 = v17;
        l_TweenService_0:Create(v17, v11, {
            Position = UDim2.fromScale(0, 0)
        }):Play();
    end)(v10[1]);
end;
v12.Stop = function(v22) --[[ Line: 98 ]] --[[ Name: Stop ]]
    v22.dumpster:Destroy();
end;
return v12;