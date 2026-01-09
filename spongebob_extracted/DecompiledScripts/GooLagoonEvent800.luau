local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Signal);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v5 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.GetButtons);
local v7 = require(l_ReplicatedStorage_0.Packages.Tree);
local v8 = require(v2.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v9 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v10 = require(l_ReplicatedFirst_0.PlaceIds);
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = {
    "Content/UIGradient", 
    "Content/UIStroke", 
    "Content/Title/UIStroke"
};
local v20 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 4, 31)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 4, 31))
});
local v21 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
});
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    _pages = {}, 
    _pageButtonObjects = {}, 
    PageChanged = v3.new(), 
    dumpster = v9.new(), 
    Init = function(v22, v23, v24) --[[ Line: 65 ]] --[[ Name: Init ]]
        -- upvalues: v11 (ref), v2 (copy), v12 (ref), v13 (ref), v14 (ref), v15 (ref), v19 (copy), v7 (copy)
        v11 = v2.GetController("UIController");
        v12 = v2.GetController("EventController");
        v13 = v2.GetController("FastTravelController");
        v14 = v2.GetController("DataController");
        v15 = v2.GetController("PlaceTeleportController");
        v22.currentMode = v24;
        v22.ui = v23;
        v22.main = v23.Main.Window;
        v22.content = v22.main.Content;
        v22.collection = v22.content.Bin.Collection;
        v22.indexContent = v22.collection.Units;
        v22.navBar = v22.content.Top.Buttons;
        v22.pagesBin = v22.content.Bin;
        v22.exitBtn = v22.main.Exit;
        v22.timerBar = v22.main.TimerBar;
        v22.activeColors = {};
        v22.inactiveColors = {};
        for _, v26 in v19 do
            v22.activeColors[v26] = v7.Find(v22.navBar.Overview, v26).Color;
            v22.inactiveColors[v26] = v7.Find(v22.navBar.Collection, v26).Color;
        end;
    end, 
    Start = function(v27) --[[ Line: 96 ]] --[[ Name: Start ]]
        -- upvalues: v16 (ref), v11 (ref), v17 (ref), v18 (ref), v10 (copy), v15 (ref), v14 (ref), v2 (copy), v5 (copy), v13 (ref), v6 (copy), v12 (ref)
        v16 = v11:GetModuleAsync("ChallengeShop"):expect();
        v17 = v11:GetModuleAsync("Notification"):expect();
        v18 = v11:GetModuleAsync("MessagePrompt"):expect();
        v11:HandleButton(v27.pagesBin.Overview.Teleport.Confirm, function() --[[ Line: 101 ]]
            -- upvalues: v10 (ref), v18 (ref), v15 (ref), v14 (ref), v2 (ref), v5 (ref), v17 (ref), v13 (ref), v11 (ref)
            if not v10:IsLobby() then
                v18:Prompt({
                    message = v10:GetDestinationPrompt("Lobby"), 
                    options = {
                        {
                            text = "Yes", 
                            callback = function() --[[ Line: 108 ]] --[[ Name: callback ]]
                                -- upvalues: v15 (ref)
                                v15:Teleport("Lobby");
                            end
                        }, 
                        {
                            text = "No"
                        }
                    }
                });
            end;
            local v28 = v14:Get(v2.Player, "PlayerStats"):expect();
            if not v5:MeetsLevelRequirement(v28, 10) then
                v17:Notify({
                    message = ("Reach Level %* to participate!"):format(10), 
                    isPositive = false, 
                    duration = 4
                });
                return;
            else
                v13:Travel("Challenge");
                v11:Toggle(script.Name, false);
                return;
            end;
        end);
        for _, v30 in v27.pagesBin:GetChildren() do
            if v30:IsA("Frame") then
                v27._pages[v30.Name] = v30;
                v30.Visible = false;
            end;
        end;
        v27._pageButtons = v6(v27.navBar, function(v31) --[[ Line: 142 ]]
            return v31:GetAttribute("Locked") ~= true;
        end, function(v32) --[[ Line: 144 ]]
            -- upvalues: v11 (ref), v16 (ref), v13 (ref), v27 (copy)
            v11:HandleButton(v32, function() --[[ Line: 145 ]]
                -- upvalues: v32 (copy), v16 (ref), v13 (ref), v11 (ref), v27 (ref)
                local l_Name_0 = v32.Name;
                if l_Name_0 == "Shop" then
                    v16:OpenFrom(script.Name);
                    return;
                elseif l_Name_0 == "Crafting" then
                    v13:Travel("Crafting");
                    v11:Toggle(script.Name, false);
                    return;
                else
                    v27:SetPage(v32.Name);
                    return;
                end;
            end);
        end, true);
        v27:SetPage("Overview");
        v11:HandleButton(v27.exitBtn, function() --[[ Line: 165 ]]
            -- upvalues: v11 (ref)
            v11:Toggle(script.Name, false);
        end);
        v12.EventEnded:Connect(function() --[[ Line: 169 ]]
            -- upvalues: v11 (ref)
            if v11:GetToggleState(script.Name) then
                v11:Toggle(script.Name, false);
            end;
        end);
        local l_v12_Timestamps_0, v35 = v12:GetTimestamps();
        l_v12_Timestamps_0 = l_v12_Timestamps_0.UnixTimestamp;
        v35 = v35.UnixTimestamp;
        v12:ObserveTimeLeft(function(v36, _, v38) --[[ Line: 180 ]]
            -- upvalues: v27 (copy), v5 (ref), v35 (ref), l_v12_Timestamps_0 (ref)
            v27.timerBar.Bar.Title.Text = v38 and "Event Begins In" or "Event Ends In";
            v27.timerBar.Bar.Timer.Text = v5:FormatTimeFromSeconds(v36 or 0);
            local v39 = math.clamp(1 - v36 / (v35 - l_v12_Timestamps_0), 0, 1);
            v27.timerBar.Bar.Fill.Size = UDim2.fromScale(v39, 1);
        end);
    end, 
    Opening = function(v40) --[[ Line: 192 ]] --[[ Name: Opening ]]
        -- upvalues: v8 (copy), v4 (copy), v14 (ref), v2 (copy), v21 (copy), v20 (copy), v5 (copy)
        for _, v42 in v40.indexContent:GetChildren() do
            if v42:IsA("Frame") then
                local l_Model_0 = v42.ViewportFrame.WorldModel:FindFirstChildOfClass("Model");
                if l_Model_0 then
                    local v44 = l_Model_0:GetAttribute("Animation") or v42.Name;
                    local v45 = v8.new(v44, l_Model_0, "Friendlies");
                    if v45 then
                        v45:Play("Idle");
                        v40.dumpster:Add(v45);
                    end;
                    local v46 = select(2, v4:GetRarity(v42.Name));
                    v42.TowerInfo.Rarity.Text = v46 or "Unknown";
                    v42.TowerInfo.Rarity:SetAttribute("Rarity", v46);
                    v42.TowerInfo.Rarity:AddTag("VisualizeRarity");
                    v40.dumpster:Add(function() --[[ Line: 217 ]]
                        -- upvalues: v42 (copy)
                        v42.TowerInfo.Rarity:RemoveTag("VisualizeRarity");
                    end);
                end;
            end;
        end;
        v40.dumpster:Add(v14:OnChanged(v2.Player, "UnitsIndex", function(v47) --[[ Line: 222 ]]
            -- upvalues: v40 (copy), v21 (ref), v20 (ref)
            if not v47 then
                return;
            else
                for _, v49 in v40.indexContent:GetChildren() do
                    if v49:IsA("Frame") then
                        if v47.Index[v49.Name] then
                            v49.ViewportFrame.UIGradient.Color = v21;
                        else
                            v49.ViewportFrame.UIGradient.Color = v20;
                        end;
                    end;
                end;
                return;
            end;
        end, true));
        v40.dumpster:Add(v14:OnChanged(v2.Player, "GooLagoonStats", function(v50) --[[ Line: 239 ]]
            -- upvalues: v40 (copy), v5 (ref)
            if not v50 then
                return;
            else
                local l_Stats_0 = v40.collection.Stats;
                l_Stats_0.TotalCrafted.Content.Amount.Text = v5:SuffixNumber(v50.CoralCandyCrafted or 0);
                l_Stats_0.TotalCurrency.Content.Amount.Text = v5:SuffixNumber(v50.SandDollarsObtained or 0);
                l_Stats_0.TotalOpened.Content.Amount.Text = v5:SuffixNumber(v50.ScoopCapsulesOpened or 0);
                l_Stats_0.TotalPlayed.Content.Amount.Text = ("%* Matches"):format((v5:SuffixNumber(v50.ChallengeMapPlays or 0)));
                return;
            end;
        end, true));
    end, 
    Closed = function(v52) --[[ Line: 252 ]] --[[ Name: Closed ]]
        v52.dumpster:Clean();
    end, 
    SetPage = function(v53, v54) --[[ Line: 257 ]] --[[ Name: SetPage ]]
        -- upvalues: v7 (copy)
        if not v53._pages[v54] then
            return;
        else
            v53._currentPage = v54;
            for v55, v56 in v53._pageButtons do
                local v57 = if v55 == v54 then v53.activeColors else v53.inactiveColors;
                if not v53._pageButtonObjects[v55] then
                    v53._pageButtonObjects[v55] = {};
                end;
                for v58, v59 in v57 do
                    local v60 = v53._pageButtonObjects[v55][v58];
                    if not v60 then
                        v60 = v7.Find(v56, v58);
                        v53._pageButtonObjects[v55][v58] = v60;
                    end;
                    if v60 then
                        v60.Color = v59;
                    end;
                end;
            end;
            for v61, v62 in v53._pages do
                v62.Visible = v61 == v54;
            end;
            v53.PageChanged:Fire(v53._currentPage);
            return;
        end;
    end
};