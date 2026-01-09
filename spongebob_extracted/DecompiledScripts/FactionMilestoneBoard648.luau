local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Component);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Util.FactionsUtil);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v7 = v1.GetService("FactionService");
local v10 = v2.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        {
            ShouldConstruct = function(v8) --[[ Line: 29 ]] --[[ Name: ShouldConstruct ]]
                local l_Attribute_0 = v8.Instance:GetAttribute("FactionId");
                if not l_Attribute_0 or l_Attribute_0 == 0 then
                    return false;
                else
                    return true;
                end;
            end
        }
    }
});
v10.Construct = function(v11) --[[ Line: 44 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy)
    v11.dump = v3.new();
    v11.factionId = v11.Instance:GetAttribute("FactionId");
    v11.pointsUI = v11.Instance:WaitForChild("Counter"):WaitForChild("Part"):WaitForChild("SurfaceGui");
    v11.titleUI = v11.Instance:WaitForChild("Title"):WaitForChild("SurfaceGui");
    v11.nextTierUI = v11.Instance:WaitForChild("NextTier"):WaitForChild("SurfaceGui");
    v11.progressBar = v11.Instance:WaitForChild("ProgressBar");
    if not v11.progressBar:GetAttribute("OriginalCFrame") then
        v11.progressBar:SetAttribute("OriginalCFrame", v11.progressBar.CFrame);
        v11.progressBar:SetAttribute("OriginalSize", v11.progressBar.Size);
    end;
    v11.dump:Add(function() --[[ Line: 59 ]]
        -- upvalues: v11 (copy)
        v11.dump = nil;
    end);
end;
v10.Start = function(v12) --[[ Line: 66 ]] --[[ Name: Start ]]
    -- upvalues: v7 (copy)
    v12.dump:Add(v7.FactionsProgress:Observe(function(v13) --[[ Line: 67 ]]
        -- upvalues: v12 (copy)
        v12.globalFactionsData = v13;
        v12.thisFactionData = v13[v12.factionId];
        v12:_update();
    end));
end;
v10.Stop = function(v14) --[[ Line: 74 ]] --[[ Name: Stop ]]
    if v14.dump then
        v14.dump:Destroy();
    end;
end;
v10._update = function(v15) --[[ Line: 82 ]] --[[ Name: _update ]]
    -- upvalues: v5 (copy), v6 (copy)
    local l_v5_NextMilestone_0, v17 = v5:GetNextMilestone(v15.thisFactionData);
    v15.pointsUI.TotalCount.Amount.Text = v6:CommaNumber(v15.thisFactionData.Points or 0);
    if l_v5_NextMilestone_0 and v17 then
        v15.titleUI.Amount.Text = v6:CommaNumber(l_v5_NextMilestone_0.pointsNeeded);
        v15.nextTierUI.Title.Text = ("UNLOCKS SHOP TIER %*"):format(v17);
    else
        v15.titleUI.Amount.Text = "";
        v15.nextTierUI.Title.Text = "MAX SHOP TIER REACHED";
    end;
    local v18 = 1;
    if l_v5_NextMilestone_0 then
        v18 = v15.thisFactionData.Points / l_v5_NextMilestone_0.pointsNeeded;
    end;
    v15:_updateProgressBar((math.clamp(v18, 0, 1)));
end;
v10._updateProgressBar = function(v19, v20) --[[ Line: 105 ]] --[[ Name: _updateProgressBar ]]
    local l_progressBar_0 = v19.progressBar;
    local l_l_progressBar_0_Attribute_0 = l_progressBar_0:GetAttribute("OriginalSize");
    local l_l_progressBar_0_Attribute_1 = l_progressBar_0:GetAttribute("OriginalCFrame");
    if typeof(l_l_progressBar_0_Attribute_0) == "Vector3" and typeof(l_l_progressBar_0_Attribute_1) == "CFrame" then
        v20 = math.clamp(v20, 0, 1);
        local v24 = l_l_progressBar_0_Attribute_0.Z * v20;
        local v25 = Vector3.new(l_l_progressBar_0_Attribute_0.X, l_l_progressBar_0_Attribute_0.Y, v24);
        local v26 = Vector3.new(0, 0, -(l_l_progressBar_0_Attribute_0.Z / 2) + v24 / 2);
        local v27 = l_l_progressBar_0_Attribute_1 * CFrame.new(v26);
        l_progressBar_0.Size = v25;
        l_progressBar_0.CFrame = v27;
    end;
end;
return v10;