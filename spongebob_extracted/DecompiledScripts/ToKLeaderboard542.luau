local l_Players_0 = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.Component);
local v7 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v8 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Packages.Tree);
local v10 = require(l_ReplicatedStorage_0.Packages.Squash);
local v11 = require(l_ReplicatedStorage_0.Packages.DeltaCompress);
local v12 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v13 = require(l_ReplicatedStorage_0.Packages.EzVisuals);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v15 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.BeltHandler);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v18 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v19 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v20 = require(l_ReplicatedStorage_0.Shared.Data.LeaderboardsShared);
local v21 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v22 = require(l_ReplicatedFirst_0.PlaceIds);
local v23 = v5.GetService("LeaderboardService");
local v24 = v5.GetController("UIController");
local v25 = v5.GetController("DataController");
local v26 = v5.GetController("CharacterController");
local v27 = v5.GetController("LeaderboardController");
local v28 = nil;
local v29 = ("Leaderboards_%*"):format(v22:IsReleaseBranch() and "RELEASE" or v18.LEADERBOARDS.PLAYER_VERSION);
local v30 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromHex("#793637")), 
    ColorSequenceKeypoint.new(0.5, Color3.fromHex("#442c10")), 
    ColorSequenceKeypoint.new(1, Color3.fromHex("#793637"))
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
local function _(v35, v36) --[[ Line: 79 ]] --[[ Name: updateBeltIcon ]]
    -- upvalues: v15 (copy), v19 (copy)
    v35.ImageColor3 = v15.GetBeltColor(v36);
    v35.Tier.Text = v19:IntToRoman(v15.GetBeltTier(v36));
end;
v33.Construct = function(v38) --[[ Line: 85 ]] --[[ Name: Construct ]]
    -- upvalues: v7 (copy)
    v38.dumpster = v7.new();
    v38.pathDumpster = v38.dumpster:Extend();
    v38.rankingDumpster = v38.dumpster:Extend();
end;
v33.Start = function(v39) --[[ Line: 92 ]] --[[ Name: Start ]]
    -- upvalues: v28 (ref), v24 (copy), l_ScreenGui_0 (copy), v5 (copy), v25 (copy), v15 (copy), v19 (copy), v18 (copy), v27 (copy), l_TweenService_0 (copy), v32 (copy), v26 (copy), v8 (copy), v12 (copy), v13 (copy), v30 (copy), v31 (copy), v23 (copy), v20 (copy), v21 (copy), v10 (copy), v11 (copy)
    v28 = v24:GetModuleAsync("LeaderboardInspect"):expect();
    local v40 = v39.Instance:Clone();
    v40:SetAttribute("IGNORE_AUTO_SCALING", true);
    v39.Instance.Enabled = false;
    v39.Instance.Active = false;
    v40.Enabled = true;
    v40.Active = true;
    v40.Adornee = v39.Instance.Adornee or v39.Instance.Parent;
    v40.MaxDistance = 200;
    v39.leaderboardKey = v40:GetAttribute("Leaderboard");
    v39.pathKey = v40:GetAttribute("DefaultPath");
    v39.isTimeValue = v40:GetAttribute("TimeValue");
    v40.Name = v39.leaderboardKey;
    v40.Parent = l_ScreenGui_0;
    v39.dumpster:Add(v40);
    v39.leaderboard = v40.Leaderboard;
    v39.playerStatsFrame = v40.PlayerStats;
    v39.loadingCanvas = v40.Loading;
    v39.playerStatsFrame.Username.Text = v5.Player.Name;
    v39.playerStatsFrame.Placement.Text = "???";
    v39.playerStatsFrame.Amount.Value.Text = "0";
    v39.loadingCanvas.Visible = true;
    v39.dumpster:Add(v25:OnChanged(v5.Player, "TowerOfKarate.Progression.Level", function(v41) --[[ Line: 124 ]]
        -- upvalues: v39 (copy), v15 (ref), v19 (ref)
        local l_Belt_0 = v39.playerStatsFrame.Belt;
        l_Belt_0.ImageColor3 = v15.GetBeltColor(v41);
        l_Belt_0.Tier.Text = v19:IntToRoman(v15.GetBeltTier(v41));
    end, true));
    local v43 = v39.leaderboard.Template:Clone();
    v43.Username.Text = "Loading...";
    v39.leaderboard.Template:Destroy();
    v39.leaderboard.Visible = false;
    v39.rankingFrames = {};
    v39.rankingFrameLookup = {};
    for v44 = 1, v18.LEADERBOARDS.MAX_RANKS do
        local v45 = v43:Clone();
        v45.Name = v44;
        v45.Visible = false;
        v45.Placement.Text = string.format("%0.3i", v44);
        v45.Parent = v39.leaderboard;
        table.insert(v39.rankingFrames, v45);
    end;
    v43:Destroy();
    v39.dumpster:Add(v27.UsernamesChanged:Connect(function(v46) --[[ Line: 164 ]]
        -- upvalues: v39 (copy)
        for v47, v48 in v46 do
            local v49 = v39.rankingFrameLookup[v47];
            if v49 then
                v49.Username.Text = v48;
            end;
        end;
    end));
    local l_Adornee_0 = v40.Adornee;
    local l_ProximityAttachment_0 = l_Adornee_0:FindFirstChild("ProximityAttachment");
    if l_ProximityAttachment_0 then
        local l_ProximityPrompt_0 = l_ProximityAttachment_0.ProximityPrompt;
        local l_Parent_0 = l_Adornee_0.Parent;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local v55 = l_Parent_0:GetExtentsSize().Y * 0.675;
        local v56 = v39.dumpster:Extend();
        local l_l_Adornee_0_0 = l_Adornee_0 --[[ copy: 3 -> 10 ]];
        local l_l_ProximityPrompt_0_0 = l_ProximityPrompt_0 --[[ copy: 5 -> 11 ]];
        do
            local l_v55_0 = v55;
            v39.dumpster:Add(l_ProximityPrompt_0.Triggered:Connect(function(v60) --[[ Line: 187 ]]
                -- upvalues: v5 (ref), l_CurrentCamera_0 (copy), l_l_Adornee_0_0 (copy), l_v55_0 (ref), l_TweenService_0 (ref), v32 (ref), v56 (copy), v26 (ref), v24 (ref), l_l_ProximityPrompt_0_0 (copy)
                if v60 ~= v5.Player then
                    return;
                else
                    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
                    local v61 = l_l_Adornee_0_0.CFrame * CFrame.new(0, 0, -l_v55_0);
                    v61 = CFrame.lookAt(v61.Position, l_l_Adornee_0_0.Position) * CFrame.new(0, 3.5, 0);
                    local v62 = l_TweenService_0:Create(l_CurrentCamera_0, v32, {
                        CFrame = v61
                    });
                    v62:Play();
                    v56:Add(function() --[[ Line: 200 ]]
                        -- upvalues: v62 (copy)
                        v62:Cancel();
                        v62:Destroy();
                    end);
                    v26:ToggleHideAll(true);
                    v24:Toggle("LeaderboardInspect", true);
                    l_l_ProximityPrompt_0_0.Enabled = false;
                    return;
                end;
            end));
            v39.dumpster:Add(v28.CloseLeaderboard:Connect(function() --[[ Line: 210 ]]
                -- upvalues: v56 (copy), v26 (ref), l_CurrentCamera_0 (copy), l_l_ProximityPrompt_0_0 (copy)
                v56:Destroy();
                v26:ToggleHideAll(false);
                l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
                l_l_ProximityPrompt_0_0.Enabled = true;
            end));
        end;
    end;
    if not v5.Player:GetAttribute("DATA_LOADED") then
        l_Adornee_0 = v8.new(function(v63) --[[ Line: 220 ]]
            -- upvalues: v39 (copy), v5 (ref)
            v39.dumpster:Add(v5.Player:GetAttributeChangedSignal("DATA_LOADED"):Once(v63), "LoadedSignal");
        end):andThen(function() --[[ Line: 222 ]]
            -- upvalues: v39 (copy)
            if v39.dumpster:Get("LoadedSignal") then
                v39.dumpster:Remove("LoadedSignal", true);
            end;
        end);
        v39.dumpster:Add(l_Adornee_0, "DataLoaded");
        if not l_Adornee_0:await() then
            return;
        elseif v39.dumpster:Get("DataLoaded") then
            v39.dumpster:Remove("DataLoaded", true);
        end;
    end;
    v39:_pathChanged(false);
    l_Adornee_0 = v40.Adornee.Position;
    l_ProximityAttachment_0 = v8.new(function(v64) --[[ Line: 243 ]]
        -- upvalues: v39 (copy), v12 (ref), v26 (ref), l_Adornee_0 (copy)
        v39.dumpster:Add(v12.Simple(0.25, function() --[[ Line: 244 ]]
            -- upvalues: v26 (ref), l_Adornee_0 (ref), v64 (copy)
            local l_v26_Position_0 = v26:GetPosition();
            if not l_v26_Position_0 then
                return;
            else
                if (l_Adornee_0 - l_v26_Position_0).Magnitude < 100 then
                    v64();
                end;
                return;
            end;
        end), "DistanceCheckTimer");
    end):andThen(function() --[[ Line: 255 ]]
        -- upvalues: v39 (copy)
        if v39.dumpster:Get("DistanceCheckTimer") then
            v39.dumpster:Remove("DistanceCheckTimer");
        end;
    end);
    v39.dumpster:Add(l_ProximityAttachment_0, "DistanceCheck");
    if not l_ProximityAttachment_0:await() then
        return;
    else
        if v39.dumpster:Get("DistanceCheck") then
            v39.dumpster:Remove("DistanceCheck", true);
        end;
        v39.loadingGradient = v13.Gradient.new(v39.loadingCanvas, v30, v31);
        v39.loadingGradient:SetOffsetSpeed(0.5, 0.4);
        local l_v23_LeaderboardData_0 = v23:GetLeaderboardData(v39.leaderboardKey);
        v39.dumpster:AddPromise(l_v23_LeaderboardData_0, "InitialDataFetch");
        l_v23_LeaderboardData_0:andThen(function(v67) --[[ Line: 283 ]]
            -- upvalues: v39 (copy), v20 (ref), v21 (ref), v10 (ref)
            if v67 == nil then
                return;
            else
                task.defer(function() --[[ Line: 288 ]]
                    -- upvalues: v39 (ref)
                    if v39.dumpster:Get("InitialDataFetch") then
                        v39.dumpster:Remove("InitialDataFetch", true);
                    end;
                end);
                for _, v69 in v20.leaderboardPaths[v39.leaderboardKey] do
                    local v70 = v21(v67, v69);
                    local v71 = v10.frombuffer(v70);
                    local v72 = v20.tokLeaderboardSerdes.des(v71);
                    v21(v67, v69, v72);
                end;
                v39.leaderboardData = v67;
                v39:_updateRankings();
                return;
            end;
        end);
        v39.dumpster:Add(v23.LeaderboardUpdated:Connect(function(v73, v74) --[[ Line: 307 ]]
            -- upvalues: v39 (copy), l_v23_LeaderboardData_0 (ref), v11 (ref)
            if not v39.leaderboardData then
                return;
            elseif v73 ~= v39.leaderboardKey then
                return;
            elseif v74 == nil then
                return;
            else
                if l_v23_LeaderboardData_0 then
                    l_v23_LeaderboardData_0:cancel();
                    l_v23_LeaderboardData_0 = nil;
                end;
                v39.leaderboardData = v11.applyImmutable(v39.leaderboardData, v74);
                v39:_updateRankings();
                return;
            end;
        end));
        return;
    end;
end;
v33.Stop = function(v75) --[[ Line: 331 ]] --[[ Name: Stop ]]
    v75.dumpster:Destroy();
end;
v33._pathChanged = function(v76, v77) --[[ Line: 339 ]] --[[ Name: _pathChanged ]]
    -- upvalues: v29 (copy), v18 (copy), v25 (copy), v5 (copy)
    v76.pathDumpster:Destroy();
    local v78 = ("%*.%*.%*"):format(v29, v76.leaderboardKey, v76.pathKey);
    if v76.pathKey == "Season" then
        v78 = v78 .. (".%*"):format((tostring(v18.SEASON)));
    end;
    v76.pathDumpster:Add(v25:OnChanged(v5.Player, v78, function(v79) --[[ Line: 348 ]]
        -- upvalues: v76 (copy)
        if not v79 then
            return;
        else
            v76:_setValue(v76.playerStatsFrame.Amount.Value, v79.value);
            return;
        end;
    end, true));
    if v77 then
        v76:_updateRankings();
    end;
    v76.leaderboard.CanvasPosition = Vector2.new();
end;
v33._updateRankings = function(v80) --[[ Line: 363 ]] --[[ Name: _updateRankings ]]
    -- upvalues: v21 (copy), l_Players_0 (copy), v25 (copy), v15 (copy), v19 (copy), v5 (copy), v27 (copy)
    local l_pathKey_0 = v80.pathKey;
    local v82 = v21(v80.leaderboardData, l_pathKey_0);
    local v83 = false;
    table.clear(v80.rankingFrameLookup);
    for v84, v85 in v80.rankingFrames do
        local v86 = v82[v84];
        if not v86 then
            v85.Visible = false;
        else
            v80.rankingFrameLookup[v86.userId] = v85;
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v86.userId);
            if l_l_Players_0_PlayerByUserId_0 and l_l_Players_0_PlayerByUserId_0:GetAttribute("DATA_LOADED") then
                v80.rankingDumpster:Add(v25:Get(l_l_Players_0_PlayerByUserId_0, "TowerOfKarate.Progression.Level"):andThen(function(v88) --[[ Line: 383 ]]
                    -- upvalues: v85 (copy), v15 (ref), v19 (ref)
                    local l_Belt_1 = v85.Belt;
                    l_Belt_1.ImageColor3 = v15.GetBeltColor(v88);
                    l_Belt_1.Tier.Text = v19:IntToRoman(v15.GetBeltTier(v88));
                end));
            else
                local l_Belt_2 = v85.Belt;
                local l_level_0 = v86.level;
                l_Belt_2.ImageColor3 = v15.GetBeltColor(l_level_0);
                l_Belt_2.Tier.Text = v19:IntToRoman(v15.GetBeltTier(l_level_0));
            end;
            v80:_setValue(v85.Amount.Value, v86.value);
            v85.Visible = true;
            if l_l_Players_0_PlayerByUserId_0 then
                v85.Username.Text = l_l_Players_0_PlayerByUserId_0.Name;
                if l_l_Players_0_PlayerByUserId_0 == v5.Player then
                    v80.playerStatsFrame.Placement.Text = v85.Placement.Text;
                    v83 = true;
                end;
            else
                v85.Username.Text = v27:GetUsername(v86.userId) or "Loading...";
            end;
        end;
    end;
    v80.leaderboard.Visible = true;
    if v80.loadingGradient then
        v80.loadingGradient:Destroy();
        v80.loadingGradient = nil;
    end;
    if v80.loadingCanvas then
        v80.loadingCanvas:Destroy();
        v80.loadingCanvas = nil;
    end;
    if not v83 then
        v80.playerStatsFrame.Placement.Text = "???";
    end;
end;
v33._setValue = function(v92, v93, v94) --[[ Line: 422 ]] --[[ Name: _setValue ]]
    -- upvalues: v19 (copy)
    if v92.isTimeValue then
        v93.Text = v19:SecondsToClock(v94);
        return;
    else
        v93.Text = v19:SuffixNumber(v94, true);
        return;
    end;
end;
return v33;