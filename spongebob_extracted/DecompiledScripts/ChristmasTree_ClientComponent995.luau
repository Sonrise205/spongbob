local _ = game:GetService("Players");
local _ = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Debris");
local _ = game:GetService("RunService");
local _ = game:GetService("ServerStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v7 = require(l_ReplicatedStorage_0.Packages.Knit);
local v8 = require(l_ReplicatedStorage_0.Packages.Timer);
local v9 = require(l_ReplicatedStorage_0.Packages.RailComponent);
local v10 = require(l_ReplicatedStorage_0.Packages.BaseComponent);
local _ = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local v14 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v15 = require(l_ReplicatedStorage_0.Shared.Modules.ZonePlus);
local v16 = v9.new({
    Tag = "ChristmasTree", 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        v10
    }
});
v16._StartFreeCrate = function(v17) --[[ Line: 32 ]] --[[ Name: _StartFreeCrate ]]
    -- upvalues: v7 (copy), v12 (copy), v14 (copy), v8 (copy), v15 (copy)
    local v18 = v7.GetController("DataController");
    for _, v20 in v12.FREE_CRATES do
        if v20.id == "CoralGift" then
            v17._freeCrateData = table.clone(v20);
            break;
        end;
    end;
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    local l_expire_0 = v17._freeCrateData.expire;
    local v23 = v17._freeCrateData.start or l_workspace_ServerTimeNow_0;
    local v24 = l_expire_0 - l_workspace_ServerTimeNow_0;
    local v25 = v23 - l_workspace_ServerTimeNow_0;
    local l_ClaimLabel_0 = v17.christmasBillboard.Interaction.ClaimLabel;
    local l_NextLabel_0 = v17.christmasBillboard.Interaction.NextLabel;
    local l_Title_0 = v17.christmasBillboard.Interaction.Title;
    local v29 = false;
    local v30 = 0;
    if v24 > 1 then
        v17.christmasBillboard.Enabled = false;
        v17.titleBillboard.Enabled = false;
        task.delay(v25, function() --[[ Line: 63 ]]
            -- upvalues: v17 (copy), v18 (copy), v7 (ref), v14 (ref), v30 (ref), l_ClaimLabel_0 (copy), l_NextLabel_0 (copy), l_Title_0 (copy), v29 (ref)
            local l_secondsPerCrate_0 = v17._freeCrateData.secondsPerCrate;
            v18:OnChanged(v7.Player, {
                "FreeCrateData", 
                "CoralGift", 
                "Playtime"
            }, function(v32) --[[ Line: 68 ]]
                -- upvalues: l_secondsPerCrate_0 (copy), v14 (ref), v30 (ref), l_ClaimLabel_0 (ref), l_NextLabel_0 (ref), l_Title_0 (ref)
                local v33 = math.floor(v32 / l_secondsPerCrate_0);
                local v34 = l_secondsPerCrate_0 - v32 % l_secondsPerCrate_0;
                local v35 = v14:FormatTimeFromSeconds(v34);
                v30 = v33;
                if v33 >= 1 then
                    l_ClaimLabel_0.Text = ("Claim (%*)"):format(v33);
                    l_NextLabel_0.Text = ("Next crate in %*"):format(v35);
                    l_NextLabel_0.Visible = true;
                    return;
                else
                    local v36 = l_secondsPerCrate_0 / 60;
                    l_Title_0.Text = string.upper((("Free crate every %* minutes"):format(v36)));
                    l_ClaimLabel_0.Text = ("%*"):format(v35);
                    l_NextLabel_0.Visible = false;
                    return;
                end;
            end, true);
            v29 = true;
            v17.christmasBillboard.Enabled = true;
            v17.titleBillboard.Enabled = true;
        end);
    end;
    local l_Timer_0 = v17.christmasBillboard.Timer;
    v17:AddTask(v8.Simple(1, function() --[[ Line: 101 ]]
        -- upvalues: v24 (ref), l_Timer_0 (copy), v14 (ref)
        v24 = v24 - 1;
        if v24 < 86400 then
            l_Timer_0.Text = ("Offer ends in %*"):format((v14:FormatTimeFromSeconds(v24)));
            return;
        else
            local v38 = math.floor(v24 / 86400);
            l_Timer_0.Text = ("Offer ends in %* %*"):format(v38, v38 == 1 and "day" or "days");
            return;
        end;
    end));
    local v39 = v7.GetService("FreeCrateService");
    local v40 = v15.new(v17.Instance:WaitForChild("CollectZone"));
    v40:relocate();
    v40.localPlayerEntered:Connect(function() --[[ Line: 118 ]]
        -- upvalues: v29 (ref), v30 (ref), v39 (copy)
        if not v29 then
            return;
        elseif v30 < 1 then
            return;
        else
            v39:ClaimFreeCrates("CoralGift");
            return;
        end;
    end);
    task.delay(v24, function() --[[ Line: 131 ]]
        -- upvalues: v29 (ref), v17 (copy), v40 (copy)
        v29 = false;
        v17.christmasBillboard.Enabled = false;
        v17.titleBillboard.Enabled = false;
        v17.Instance:Destroy();
        v40:destroy();
    end);
end;
v16.Start = function(v41) --[[ Line: 144 ]] --[[ Name: Start ]]
    -- upvalues: v12 (copy), l_TweenService_0 (copy)
    v41:DefaultAttribute("LightsOn", false);
    v41.christmasBillboard = v41.Instance:WaitForChild("CrateBillboardAtt"):WaitForChild("BillboardGui");
    v41.christmasBillboard.Enabled = false;
    v41.titleBillboard = v41.Instance:WaitForChild("Title"):WaitForChild("BillboardGui");
    v41.titleBillboard.Enabled = false;
    local v42 = {};
    local v43 = {};
    local function v45(v44) --[[ Line: 156 ]] --[[ Name: lightAdded ]]
        -- upvalues: v43 (copy), v42 (copy)
        v43[v44] = v44.Color;
        v44.Color = Color3.new(0, 0, 0);
        v44.Transparency = 0.5;
        table.insert(v42, v44);
    end;
    for _, v47 in v41.Instance:WaitForChild("Lights"):GetChildren() do
        v43[v47] = v47.Color;
        v47.Color = Color3.new(0, 0, 0);
        v47.Transparency = 0.5;
        table.insert(v42, v47);
    end;
    v41.Instance.Lights.ChildAdded:Connect(v45);
    local l_CHRISTMAS_TREE_LIGHTUP_PROPS_0 = v12.CHRISTMAS_TREE_LIGHTUP_PROPS;
    local l_Countdown_0 = v41.Instance.Countdown;
    l_Countdown_0:SetAttribute("Countdown", (("%*,%*,%*,%*,%*"):format(l_CHRISTMAS_TREE_LIGHTUP_PROPS_0.year, l_CHRISTMAS_TREE_LIGHTUP_PROPS_0.month, l_CHRISTMAS_TREE_LIGHTUP_PROPS_0.day, l_CHRISTMAS_TREE_LIGHTUP_PROPS_0.hour, l_CHRISTMAS_TREE_LIGHTUP_PROPS_0.minute)));
    l_Countdown_0:AddTag("CountdownPad");
    l_CHRISTMAS_TREE_LIGHTUP_PROPS_0 = v41.Instance:WaitForChild("Countdown"):WaitForChild("Ring beam"):WaitForChild("BillboardAtt");
    v41:ObserveAttribute("LightsOn", function(v50) --[[ Line: 179 ]]
        -- upvalues: l_CHRISTMAS_TREE_LIGHTUP_PROPS_0 (copy), v41 (copy), v42 (copy), v43 (copy), l_TweenService_0 (ref)
        if v50 == true then
            if l_CHRISTMAS_TREE_LIGHTUP_PROPS_0 and l_CHRISTMAS_TREE_LIGHTUP_PROPS_0:IsDescendantOf(workspace) then
                l_CHRISTMAS_TREE_LIGHTUP_PROPS_0.BillboardGui.Enabled = false;
            end;
            v41:_StartFreeCrate();
        elseif l_CHRISTMAS_TREE_LIGHTUP_PROPS_0 and l_CHRISTMAS_TREE_LIGHTUP_PROPS_0:IsDescendantOf(workspace) then
            l_CHRISTMAS_TREE_LIGHTUP_PROPS_0.BillboardGui.Enabled = true;
        end;
        for _, v52 in v42 do
            local v53 = v50 and v43[v52] or Color3.new(0, 0, 0);
            local v54 = v50 and 0 or 0.7;
            l_TweenService_0:Create(v52, TweenInfo.new(0.5), {
                Color = v53, 
                Transparency = v54
            }):Play();
        end;
    end);
    l_Countdown_0 = workspace:GetServerTimeNow();
    if v12.CHRISTMAS_TREE_LIGHTUP <= l_Countdown_0 then
        v41:SetAttribute("LightsOn", true);
        return;
    else
        for _ = v12.CHRISTMAS_TREE_LIGHTUP - l_Countdown_0, 0, -1 do
            task.wait(1);
        end;
        v41:SetAttribute("LightsOn", true);
        return;
    end;
end;
v16.Stop = function(_) --[[ Line: 226 ]] --[[ Name: Stop ]]

end;
return v16;