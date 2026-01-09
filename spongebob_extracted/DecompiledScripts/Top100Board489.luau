local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v9 = v2.GetController("DataController");
local v10 = v2.GetController("UIController");
local v11 = v2.GetService("LeaderboardService");
local v12 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
v12.Construct = function(_) --[[ Line: 35 ]] --[[ Name: Construct ]]

end;
v12.Start = function(v14) --[[ Line: 40 ]] --[[ Name: Start ]]
    -- upvalues: v2 (copy), v9 (copy), v7 (copy), v10 (copy), v11 (copy)
    local v15 = v14.Instance:Clone();
    v15.Parent = v2.Player.PlayerGui;
    v14.Instance.Enabled = false;
    v14.Instance.Active = false;
    v15.Enabled = true;
    v15.Active = true;
    v15.Adornee = v14.Instance.Adornee;
    local l_Main_0 = v15.Main;
    local l_Season_0 = l_Main_0.Season;
    local l_Claim_0 = l_Main_0.Claim;
    local l_Eligibility_0 = l_Main_0.Eligibility;
    local v20 = {
        [true] = l_Eligibility_0.Yes, 
        [false] = l_Eligibility_0.No
    };
    local l_ProximityPrompt_0 = v15.Adornee.ProximityAttachment.ProximityPrompt;
    local v22 = v9:Get(v2.Player, "ClaimedSeasonLeaderboardPrizes"):expect();
    local v23 = v7.SEASON - 1;
    local l_SEASON_0 = v7.SEASON;
    local v25 = tostring(v23);
    local v26 = tostring(l_SEASON_0);
    l_Claim_0.Visible = false;
    l_Season_0.Visible = false;
    l_Eligibility_0.Visible = false;
    l_ProximityPrompt_0.Enabled = false;
    v20[true].Title.Text = ("QUALIFIED FOR SEASON %*"):format(v26);
    local function v29() --[[ Line: 80 ]] --[[ Name: update ]]
        -- upvalues: l_Season_0 (copy), v22 (copy), v25 (copy), v14 (copy), v26 (copy), l_Eligibility_0 (copy), l_Claim_0 (copy), v20 (copy), l_ProximityPrompt_0 (copy)
        l_Season_0.Visible = true;
        if v22[v25] or not v14.placementData.previous or not next(v14.placementData.previous) then
            l_Season_0.Text = ("SEASON %*"):format(v26);
            l_Eligibility_0.Visible = true;
            l_Claim_0.Visible = false;
            local v27 = next(v14.placementData.current) ~= nil;
            for v28 in v20 do
                v20[v28].Visible = v28 == v27;
            end;
            return;
        else
            l_Season_0.Text = ("END OF SEASON %*"):format(v25);
            l_Eligibility_0.Visible = false;
            l_Claim_0.Visible = true;
            l_ProximityPrompt_0.Enabled = true;
            return;
        end;
    end;
    v10:HandleButton(l_Claim_0, function() --[[ Line: 104 ]] --[[ Name: claim ]]
        -- upvalues: v22 (copy), v25 (copy), l_ProximityPrompt_0 (copy), v29 (copy), v10 (ref), v14 (copy)
        v22[v25] = true;
        l_ProximityPrompt_0.Enabled = false;
        v29();
        v10:GetModuleAsync("Top100Winner"):expect():Open(v14.placementData);
    end);
    l_ProximityPrompt_0.Triggered:Connect(function(v30) --[[ Line: 115 ]]
        -- upvalues: v2 (ref), v22 (copy), v25 (copy), l_ProximityPrompt_0 (copy), v29 (copy), v10 (ref), v14 (copy)
        if v30 ~= v2.Player then
            return;
        else
            v22[v25] = true;
            l_ProximityPrompt_0.Enabled = false;
            v29();
            v10:GetModuleAsync("Top100Winner"):expect():Open(v14.placementData);
            return;
        end;
    end);
    v11.Placements:Observe(function(v31) --[[ Line: 123 ]]
        -- upvalues: v14 (copy), v29 (copy)
        if not v31 then
            return;
        else
            v14.placementData = v31;
            v29();
            return;
        end;
    end);
end;
v12.Stop = function(_) --[[ Line: 133 ]] --[[ Name: Stop ]]

end;
return v12;