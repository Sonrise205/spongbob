local l_Players_0 = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.Component);
local v7 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v8 = require(l_ReplicatedStorage_0.Packages.Promise);
local v9 = require(l_ReplicatedStorage_0.Packages.Tree);
local v10 = require(l_ReplicatedStorage_0.Packages.Squash);
local v11 = require(l_ReplicatedStorage_0.Packages.DeltaCompress);
local v12 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v13 = require(l_ReplicatedStorage_0.Packages.EzVisuals);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v18 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v19 = require(l_ReplicatedStorage_0.Shared.Data.LeaderboardsShared);
local v20 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v21 = require(l_ReplicatedFirst_0.PlaceIds);
local v22 = v5.GetService("LeaderboardService");
local v23 = v5.GetController("UIController");
local v24 = v5.GetController("DataController");
local v25 = v5.GetController("CharacterController");
local v26 = v5.GetController("LeaderboardController");
local v27 = nil;
local v28 = ("Leaderboards_%*"):format(v21:IsReleaseBranch() and "RELEASE" or v17.LEADERBOARDS.PLAYER_VERSION);
local v29 = {
    [true] = {
        ["Content/UIGradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#22daff")), 
            ColorSequenceKeypoint.new(1, Color3.fromHex("#137dff"))
        }), 
        ["Content/UIStroke"] = Color3.fromHex("#1546b1"), 
        ["Content/Title/UIStroke"] = Color3.fromHex("#1546b1")
    }, 
    [false] = {
        ["Content/UIGradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#bcbcbc")), 
            ColorSequenceKeypoint.new(1, Color3.fromHex("#6b6d6f"))
        }), 
        ["Content/UIStroke"] = Color3.fromHex("#595e63"), 
        ["Content/Title/UIStroke"] = Color3.fromHex("#595e63")
    }
};
local v30 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromHex("#ffd15d")), 
    ColorSequenceKeypoint.new(0.5, Color3.fromHex("#c6802f")), 
    ColorSequenceKeypoint.new(1, Color3.fromHex("#ffd15d"))
});
local v31 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0), 
    NumberSequenceKeypoint.new(1, 0)
});
local v32 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v33 = v6.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.ResetOnSpawn = false;
l_ScreenGui_0.Name = "Leaderboards";
l_ScreenGui_0:SetAttribute("IGNORE_AUTO_SCALING", true);
l_ScreenGui_0.Parent = v5.Player.PlayerGui;
v33.Construct = function(v35) --[[ Line: 101 ]] --[[ Name: Construct ]]
    -- upvalues: v7 (copy)
    v35.dumpster = v7.new();
    v35.pathDumpster = v35.dumpster:Extend();
    v35.rankingDumpster = v35.dumpster:Extend();
end;
v33.Start = function(v36) --[[ Line: 108 ]] --[[ Name: Start ]]
    -- upvalues: v27 (ref), v23 (copy), l_ScreenGui_0 (copy), v5 (copy), v24 (copy), v17 (copy), v18 (copy), v22 (copy), l_RunService_0 (copy), v26 (copy), l_TweenService_0 (copy), v32 (copy), v25 (copy), v8 (copy), v12 (copy), v13 (copy), v30 (copy), v31 (copy), v19 (copy), v20 (copy), v10 (copy), v11 (copy)
    v27 = v23:GetModuleAsync("LeaderboardInspect"):expect();
    local v37 = v36.Instance:Clone();
    v37:SetAttribute("IGNORE_AUTO_SCALING", true);
    v36.Instance.Enabled = false;
    v36.Instance.Active = false;
    v37.Enabled = true;
    v37.Active = true;
    v37.Adornee = v36.Instance.Adornee or v36.Instance.Parent;
    v37.MaxDistance = 200;
    v36.leaderboardKey = v37:GetAttribute("Leaderboard");
    v36.pathKey = v37:GetAttribute("DefaultPath");
    v36.isTimeValue = v37:GetAttribute("TimeValue");
    local l_v37_Attribute_0 = v37:GetAttribute("DefaultDifficulty");
    v36.difficulty = l_v37_Attribute_0;
    v37.Name = v36.leaderboardKey;
    v37.Parent = l_ScreenGui_0;
    v36.dumpster:Add(v37);
    v36.header = v37.Header;
    v36.timerLabel = v36.header.Title.Timer;
    v36.leaderboard = v37.Leaderboard;
    v36.playerStatsFrame = v37.PlayerStats;
    v36.categoryButtonsFrame = v37.Categories.Buttons;
    v36.loadingCanvas = v37.Loading;
    if v36.header:FindFirstChild("Icon") then
        v36.header.Icon:Destroy();
    end;
    v36.playerStatsFrame.Username.Text = v5.Player.Name;
    v36.playerStatsFrame.Placement.Text = "???";
    v36.playerStatsFrame.Amount.Value.Text = "0";
    v36.playerStatsFrame.Amount.Emblem.Visible = false;
    v36.loadingCanvas.Visible = true;
    v36.dumpster:Add(v24:OnChanged(v5.Player, "Faction", function(v39) --[[ Line: 150 ]]
        -- upvalues: v17 (ref), v36 (copy)
        local v40 = v17.FACTIONS.FACTION_IMAGES[v39.Id];
        v36.playerStatsFrame.Faction.Image = v40 or "";
    end, true));
    local v41 = v36.leaderboard.Template:Clone();
    v41.Username.Text = "Loading...";
    v36.leaderboard.Template:Destroy();
    v36.leaderboard.Visible = false;
    v36.rankingFrames = {};
    v36.rankingFrameLookup = {};
    for v42 = 1, v17.LEADERBOARDS.MAX_RANKS do
        local v43 = v41:Clone();
        v43.Name = v42;
        v43.Visible = false;
        v43.Amount.Emblem.Visible = false;
        v43.Placement.Text = string.format("%0.3i", v42);
        v43.Parent = v36.leaderboard;
        table.insert(v36.rankingFrames, v43);
    end;
    v41:Destroy();
    v36.categoryButtons = {};
    if v36.categoryButtonsFrame.Parent.Visible then
        v18:IterateClass(v36.categoryButtonsFrame, "TextButton", function(v44) --[[ Line: 178 ]]
            -- upvalues: v36 (copy), v23 (ref)
            local v45 = v44:GetAttribute("Path") or v44.Name;
            v44:SetAttribute("InvertClick", true);
            v36.categoryButtons[v45] = v44;
            v23:HandleButton(v44, function() --[[ Line: 185 ]]
                -- upvalues: v36 (ref), v45 (copy)
                if v36.pathKey == v45 then
                    return;
                else
                    v36.pathKey = v45;
                    v36:_pathChanged(true);
                    return;
                end;
            end);
        end, true);
    end;
    v36.difficultyButtons = {};
    v36.headerDifficultyIcons = {};
    if l_v37_Attribute_0 then
        local l_SurfaceGui_0 = v37.Adornee.Parent.Parent.Type.Display:FindFirstChildOfClass("SurfaceGui");
        local v47 = l_SurfaceGui_0:Clone();
        l_SurfaceGui_0.Enabled = false;
        l_SurfaceGui_0.Active = false;
        v47.Enabled = true;
        v47.Active = true;
        v47.Adornee = l_SurfaceGui_0.Adornee or l_SurfaceGui_0.Parent;
        v47.MaxDistance = 200;
        v47.Name = ("%*_Difficulties"):format(v36.leaderboardKey);
        v47.Parent = l_ScreenGui_0;
        v36.dumpster:Add(v47);
        local l_Difficulties_0 = v47.Difficulties;
        v18:IterateClass(l_Difficulties_0, "TextButton", function(v49) --[[ Line: 218 ]]
            -- upvalues: v36 (copy), v23 (ref)
            if not v49.Visible then
                return;
            else
                v49:SetAttribute("InvertClick", true);
                local l_Name_0 = v49.Name;
                v36.difficultyButtons[l_Name_0] = v49;
                local v51 = v49:Clone();
                v51.Content.Unselected.Visible = false;
                v51.Visible = false;
                v51.Active = false;
                v51.LayoutOrder = -1;
                v51.Parent = v36.header;
                v36.headerDifficultyIcons[l_Name_0] = v51;
                v23:HandleButton(v49, function() --[[ Line: 237 ]]
                    -- upvalues: v36 (ref), l_Name_0 (copy)
                    if v36.difficulty == l_Name_0 then
                        return;
                    else
                        v36.difficulty = l_Name_0;
                        v36:_pathChanged(true);
                        return;
                    end;
                end);
                return;
            end;
        end, true);
    end;
    local v52 = v36.dumpster:Extend();
    v36.dumpster:Add(v22.RefreshTimestamp:Observe(function(v53) --[[ Line: 249 ]]
        -- upvalues: v52 (copy), l_RunService_0 (ref), v36 (copy), v18 (ref)
        v52:Destroy();
        v52:Add(l_RunService_0.RenderStepped:Connect(function() --[[ Line: 252 ]]
            -- upvalues: v53 (copy), v36 (ref), v18 (ref)
            local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
            local v55 = math.max(0, v53 - l_workspace_ServerTimeNow_0);
            if v55 == 0 then
                v36.timerLabel.Text = "Updating...";
                return;
            else
                v36.timerLabel.Text = v18:SecondsToClock(v55, true);
                return;
            end;
        end));
    end));
    v36.dumpster:Add(v26.UsernamesChanged:Connect(function(v56) --[[ Line: 264 ]]
        -- upvalues: v36 (copy)
        for v57, v58 in v56 do
            local v59 = v36.rankingFrameLookup[v57];
            if v59 then
                v59.Username.Text = v58;
            end;
        end;
    end));
    local l_Adornee_0 = v37.Adornee;
    local l_ProximityAttachment_0 = l_Adornee_0:FindFirstChild("ProximityAttachment");
    if l_ProximityAttachment_0 then
        local l_ProximityPrompt_0 = l_ProximityAttachment_0.ProximityPrompt;
        local l_Parent_0 = l_Adornee_0.Parent.Parent;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_Y_0 = l_Parent_0:GetExtentsSize().Y;
        l_Y_0 = if v36.difficulty then l_Y_0 * 0.65 else l_Y_0 * 0.6;
        local v66 = v36.dumpster:Extend();
        local l_l_Adornee_0_0 = l_Adornee_0 --[[ copy: 5 -> 12 ]];
        local l_l_ProximityPrompt_0_0 = l_ProximityPrompt_0 --[[ copy: 7 -> 13 ]];
        do
            local l_l_Y_0_0 = l_Y_0;
            v36.dumpster:Add(l_ProximityPrompt_0.Triggered:Connect(function(v70) --[[ Line: 291 ]]
                -- upvalues: v5 (ref), l_CurrentCamera_0 (copy), l_l_Adornee_0_0 (copy), l_l_Y_0_0 (ref), v36 (copy), l_TweenService_0 (ref), v32 (ref), v66 (copy), v25 (ref), v23 (ref), l_l_ProximityPrompt_0_0 (copy)
                if v70 ~= v5.Player then
                    return;
                else
                    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
                    local v71 = l_l_Adornee_0_0.CFrame * CFrame.new(0, 0, -l_l_Y_0_0);
                    v71 = CFrame.lookAt(v71.Position, l_l_Adornee_0_0.Position);
                    if v36.difficulty then
                        v71 = v71 * CFrame.new(0, -3, 0);
                    end;
                    local v72 = l_TweenService_0:Create(l_CurrentCamera_0, v32, {
                        CFrame = v71
                    });
                    v72:Play();
                    v66:Add(function() --[[ Line: 307 ]]
                        -- upvalues: v72 (copy)
                        v72:Cancel();
                        v72:Destroy();
                    end);
                    v25:ToggleHideAll(true);
                    v23:Toggle("LeaderboardInspect", true);
                    l_l_ProximityPrompt_0_0.Enabled = false;
                    return;
                end;
            end));
            v36.dumpster:Add(v27.CloseLeaderboard:Connect(function() --[[ Line: 317 ]]
                -- upvalues: v66 (copy), v25 (ref), l_CurrentCamera_0 (copy), l_l_ProximityPrompt_0_0 (copy)
                v66:Destroy();
                v25:ToggleHideAll(false);
                l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
                l_l_ProximityPrompt_0_0.Enabled = true;
            end));
        end;
    end;
    if not v5.Player:GetAttribute("DATA_LOADED") then
        l_Adornee_0 = v8.new(function(v73) --[[ Line: 327 ]]
            -- upvalues: v36 (copy), v5 (ref)
            v36.dumpster:Add(v5.Player:GetAttributeChangedSignal("DATA_LOADED"):Once(v73), "LoadedSignal");
        end):andThen(function() --[[ Line: 329 ]]
            -- upvalues: v36 (copy)
            if v36.dumpster:Get("LoadedSignal") then
                v36.dumpster:Remove("LoadedSignal", true);
            end;
        end);
        v36.dumpster:Add(l_Adornee_0, "DataLoaded");
        if not l_Adornee_0:await() then
            return;
        elseif v36.dumpster:Get("DataLoaded") then
            v36.dumpster:Remove("DataLoaded", true);
        end;
    end;
    v36:_pathChanged(false);
    l_Adornee_0 = v37.Adornee.Position;
    l_ProximityAttachment_0 = v8.new(function(v74) --[[ Line: 350 ]]
        -- upvalues: v36 (copy), v12 (ref), v25 (ref), l_Adornee_0 (copy)
        v36.dumpster:Add(v12.Simple(0.25, function() --[[ Line: 351 ]]
            -- upvalues: v25 (ref), l_Adornee_0 (ref), v74 (copy)
            local l_v25_Position_0 = v25:GetPosition();
            if not l_v25_Position_0 then
                return;
            else
                if (l_Adornee_0 - l_v25_Position_0).Magnitude < 100 then
                    v74();
                end;
                return;
            end;
        end), "DistanceCheckTimer");
    end):andThen(function() --[[ Line: 362 ]]
        -- upvalues: v36 (copy)
        if v36.dumpster:Get("DistanceCheckTimer") then
            v36.dumpster:Remove("DistanceCheckTimer");
        end;
    end);
    v36.dumpster:Add(l_ProximityAttachment_0, "DistanceCheck");
    if not l_ProximityAttachment_0:await() then
        return;
    else
        if v36.dumpster:Get("DistanceCheck") then
            v36.dumpster:Remove("DistanceCheck", true);
        end;
        v36.loadingGradient = v13.Gradient.new(v36.loadingCanvas, v30, v31);
        v36.loadingGradient:SetOffsetSpeed(0.5, 0.4);
        local l_v22_LeaderboardData_0 = v22:GetLeaderboardData(v36.leaderboardKey);
        v36.dumpster:AddPromise(l_v22_LeaderboardData_0, "InitialDataFetch");
        l_v22_LeaderboardData_0:andThen(function(v77) --[[ Line: 390 ]]
            -- upvalues: v36 (copy), v19 (ref), v20 (ref), v10 (ref)
            if v77 == nil then
                return;
            else
                task.defer(function() --[[ Line: 395 ]]
                    -- upvalues: v36 (ref)
                    if v36.dumpster:Get("InitialDataFetch") then
                        v36.dumpster:Remove("InitialDataFetch", true);
                    end;
                end);
                for _, v79 in v19.leaderboardPaths[v36.leaderboardKey] do
                    local v80 = v20(v77, v79);
                    local v81 = v10.frombuffer(v80);
                    local v82 = v19.leaderboardSerdes.des(v81);
                    v20(v77, v79, v82);
                end;
                v36.leaderboardData = v77;
                v36:_updateRankings();
                return;
            end;
        end);
        v36.dumpster:Add(v22.LeaderboardUpdated:Connect(function(v83, v84) --[[ Line: 414 ]]
            -- upvalues: v36 (copy), l_v22_LeaderboardData_0 (ref), v11 (ref)
            if not v36.leaderboardData then
                return;
            elseif v83 ~= v36.leaderboardKey then
                return;
            elseif v84 == nil then
                return;
            else
                if l_v22_LeaderboardData_0 then
                    l_v22_LeaderboardData_0:cancel();
                    l_v22_LeaderboardData_0 = nil;
                end;
                v36.leaderboardData = v11.applyImmutable(v36.leaderboardData, v84);
                v36:_updateRankings();
                return;
            end;
        end));
        return;
    end;
end;
v33.Stop = function(v85) --[[ Line: 438 ]] --[[ Name: Stop ]]
    v85.dumpster:Destroy();
end;
v33._pathChanged = function(v86, v87) --[[ Line: 446 ]] --[[ Name: _pathChanged ]]
    -- upvalues: v28 (copy), v17 (copy), v24 (copy), v5 (copy), v29 (copy), v9 (copy)
    v86.pathDumpster:Destroy();
    local v88 = ("%*.%*.%*"):format(v28, v86.leaderboardKey, v86.pathKey);
    if v86.difficulty then
        v88 = v88 .. (".%*"):format(v86.difficulty);
    end;
    if v86.pathKey == "Season" then
        v88 = v88 .. (".%*"):format((tostring(v17.SEASON)));
    end;
    v86.pathDumpster:Add(v24:OnChanged(v5.Player, v88, function(v89) --[[ Line: 459 ]]
        -- upvalues: v86 (copy)
        if not v89 then
            return;
        else
            v86:_setValue(v86.playerStatsFrame.Amount.Value, v89.value);
            return;
        end;
    end, true));
    for v90, v91 in v86.categoryButtons do
        local l_v29_0 = v29;
        local v93 = v90 == v86.pathKey;
        for v94, v95 in l_v29_0[v93] do
            if v9.Exists(v91, v94) then
                v9.Find(v91, v94).Color = v95;
            end;
        end;
    end;
    if v86.difficulty then
        for v96, v97 in v86.difficultyButtons do
            v97.Content.Unselected.Visible = v96 ~= v86.difficulty;
        end;
        for v98, v99 in v86.headerDifficultyIcons do
            v99.Visible = v98 == v86.difficulty;
        end;
    end;
    if v87 then
        v86:_updateRankings();
    end;
    v86.leaderboard.CanvasPosition = Vector2.new();
end;
v33._updateRankings = function(v100) --[[ Line: 494 ]] --[[ Name: _updateRankings ]]
    -- upvalues: v20 (copy), v17 (copy), l_Players_0 (copy), v24 (copy), v5 (copy), v26 (copy)
    local l_pathKey_0 = v100.pathKey;
    if v100.difficulty then
        l_pathKey_0 = l_pathKey_0 .. (".%*"):format(v100.difficulty);
    end;
    local v102 = v20(v100.leaderboardData, l_pathKey_0);
    local v103 = false;
    table.clear(v100.rankingFrameLookup);
    for v104, v105 in v100.rankingFrames do
        local v106 = v102[v104];
        if not v106 then
            v105.Visible = false;
        else
            v100.rankingFrameLookup[v106.userId] = v105;
            local v107 = nil;
            do
                local l_v107_0 = v107;
                local function _() --[[ Line: 517 ]] --[[ Name: updateFaction ]]
                    -- upvalues: v17 (ref), l_v107_0 (ref), v105 (copy)
                    local v109 = v17.FACTIONS.FACTION_IMAGES[l_v107_0];
                    v105.Faction.Image = v109 or "";
                end;
                local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v106.userId);
                if l_l_Players_0_PlayerByUserId_0 and l_l_Players_0_PlayerByUserId_0:GetAttribute("DATA_LOADED") then
                    v100.rankingDumpster:Add(v24:Get(l_l_Players_0_PlayerByUserId_0, "Faction"):andThen(function(v112) --[[ Line: 524 ]]
                        -- upvalues: l_v107_0 (ref), v17 (ref), v105 (copy)
                        l_v107_0 = v112.Id;
                        local v113 = v17.FACTIONS.FACTION_IMAGES[l_v107_0];
                        v105.Faction.Image = v113 or "";
                    end));
                else
                    l_v107_0 = v106.faction;
                    local v114 = v17.FACTIONS.FACTION_IMAGES[l_v107_0];
                    v105.Faction.Image = v114 or "";
                end;
                v100:_setValue(v105.Amount.Value, v106.value);
                v105.Visible = true;
                if l_l_Players_0_PlayerByUserId_0 then
                    v105.Username.Text = l_l_Players_0_PlayerByUserId_0.Name;
                    if l_l_Players_0_PlayerByUserId_0 == v5.Player then
                        v100.playerStatsFrame.Placement.Text = v105.Placement.Text;
                        v103 = true;
                    end;
                else
                    v105.Username.Text = v26:GetUsername(v106.userId) or "Loading...";
                end;
            end;
        end;
    end;
    v100.leaderboard.Visible = true;
    if v100.loadingGradient then
        v100.loadingGradient:Destroy();
        v100.loadingGradient = nil;
    end;
    if v100.loadingCanvas then
        v100.loadingCanvas:Destroy();
        v100.loadingCanvas = nil;
    end;
    if not v103 then
        v100.playerStatsFrame.Placement.Text = "???";
    end;
end;
v33._setValue = function(v115, v116, v117) --[[ Line: 566 ]] --[[ Name: _setValue ]]
    -- upvalues: v18 (copy)
    if v115.isTimeValue then
        v116.Text = v18:SecondsToClock(v117);
        return;
    else
        v116.Text = v18:SuffixNumber(v117, true);
        return;
    end;
end;
return v33;