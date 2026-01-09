local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v7 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v8 = require(l_ReplicatedStorage_0.Packages.Silo);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v10 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v11 = require(l_ReplicatedStorage_0.ReplicaController);
local _ = require(l_ReplicatedStorage_0.Levels);
local v13 = require(l_ReplicatedStorage_0.BossBattleData);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v16 = require(l_ReplicatedStorage_0.Shared.Data.EnemyShared);
local v17 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v18 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Util.TimeFormat);
local v20 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v21 = require(v5.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v22 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Util.SetProps);
local v24 = require(l_ReplicatedStorage_0.Shared.Util.GetButtons);
local v25 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v26 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local _ = require(v5.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Missions);
local v29 = require(l_ReplicatedStorage_0.Shared.Data.TurfWarsQuests);
local _ = require(l_ReplicatedStorage_0.TraitsData);
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local _ = {
    Boss = 1, 
    Tier = 1
};
local _ = {
    [1] = Color3.fromRGB(98, 255, 0), 
    [2] = Color3.fromRGB(255, 200, 0), 
    [3] = Color3.fromRGB(102, 0, 255), 
    [4] = Color3.fromRGB(255, 0, 4)
};
local v53 = v8.new({
    selectedBoss = nil, 
    selectedTier = nil, 
    friendsMode = false, 
    selectedWorld = nil, 
    selectedChapter = nil, 
    selectedDifficulty = nil, 
    selectionData = {
        Boss = nil, 
        Tier = nil, 
        world = nil, 
        chapter = nil, 
        difficulty = nil, 
        endless = false
    }
}, {
    SetBoss = function(v39, v40) --[[ Line: 91 ]]
        v39.selectedBoss = v40;
    end, 
    SetTier = function(v41, v42) --[[ Line: 94 ]]
        v41.selectedTier = v42;
    end, 
    SetFriendsMode = function(v43, v44) --[[ Line: 99 ]]
        v43.friendsMode = v44;
    end, 
    SetWorld = function(v45, v46) --[[ Line: 102 ]]
        v45.selectedWorld = v46;
    end, 
    SetChapter = function(v47, v48) --[[ Line: 105 ]]
        v47.selectedChapter = v48;
    end, 
    SetDifficulty = function(v49, v50) --[[ Line: 108 ]]
        v49.selectedDifficulty = v50;
    end, 
    SetSelectionData = function(v51, v52) --[[ Line: 111 ]]
        v51.selectionData = v52;
    end
});
local v54 = {
    primaryMenu = true, 
    blur = false, 
    _worldButtons = {}, 
    _chapterButtons = {}, 
    _playerFrames = {}, 
    _myCompletions = {}, 
    _myChapterClears = {}, 
    _chapterNightmareUnlocked = {}, 
    _taggedRarityVisuals = {}, 
    ToggleAll = {}
};
local v55 = v6.new();
local function _() --[[ Line: 136 ]] --[[ Name: leaveLobby ]]
    -- upvalues: v54 (copy)
    v54:_fireServer("LeaveQueue");
end;
local function v58(v57) --[[ Line: 141 ]] --[[ Name: selectFriendsMode ]]
    return v57.friendsMode;
end;
local function v60(v59) --[[ Line: 145 ]] --[[ Name: selectSelectionData ]]
    return v59.selectionData;
end;
local function v64(v61, v62) --[[ Line: 149 ]] --[[ Name: formatDecimal ]]
    v62 = v62 or 3;
    if typeof(v61) ~= "number" then
        return (tostring(v61));
    else
        local v63 = string.format("%." .. v62 .. "f", v61);
        v63 = string.gsub(v63, "%.?0+$", "");
        if v63:sub(-1) == "." then
            v63 = v63:sub(1, -2);
        end;
        return v63;
    end;
end;
v54.Init = function(v65, v66) --[[ Line: 170 ]] --[[ Name: Init ]]
    -- upvalues: v31 (ref), v5 (copy), v32 (ref), v33 (ref), v34 (ref), v35 (ref), l_TweenService_0 (copy)
    v31 = v5.GetController("DataController");
    v32 = v5.GetController("UIController");
    v33 = v5.GetController("DeviceTypeController");
    v34 = v5.GetController("EventController");
    v35 = v5.GetController("MissionController");
    v65.ui = v66;
    v65.main = v66.Main;
    v65.selectionScreen = v65.main.SelectionScreen;
    v65.selectionMain = v65.selectionScreen.Main;
    v65.stageSelect = v65.selectionMain.StageSelect;
    v65.stageTimerBar = v65.selectionMain.TimerBar;
    v65.selectionContent = v65.stageSelect.WorldSelect.Content;
    v65.stagesScroll = v65.selectionContent.Stages;
    v65.chapterSelect = v65.stageSelect.ChapterSelect;
    v65.selectInfo = v65.stageSelect.Info;
    v65.selectContent = v65.selectInfo.Content;
    v65.worldInfo = v65.selectInfo.Content.Info;
    v65.selectRewardsBin = v65.selectInfo.Content.Rewards;
    v65.readyButton = v65.selectionMain.Options.Options.Confirm;
    v65.leaveButton = v65.selectionMain.Options.Options.Leave;
    v65.friendsOnlyButton = v65.selectionMain.Options.FriendsOption.Toggle;
    v65.rewardsBin = v65.selectInfo.Content.Rewards.Main.Bin.Inner;
    v65.firstTimeBin = v65.selectInfo.Content.Rewards.Main.FirstTimeClear;
    v65.rewardTemplate = v65.rewardsBin.Template;
    v65.rewardTemplate.Parent = nil;
    v65.rewardTemplate:SetAttribute("InvertClick", true);
    v65.startScreen = v65.main.StartScreen;
    v65.startMain = v65.startScreen.Main;
    v65.startOptions = v65.startMain.Options;
    v65.startPlayers = v65.startMain.Players;
    v65.startInfo = v65.startMain.StageInfo.Inner;
    v65.startTimerBar = v65.startMain.TimerBar;
    v65.teamFrame = v65.main.Team;
    v65.loadoutFrame = v65.teamFrame.Loadout;
    v65.loadoutTemplate = v65.loadoutFrame.Template:Clone();
    v65.loadoutFrame.Template:Destroy();
    v65.conditionsFrame = v65.startInfo.Unsorted.Conditions;
    v65.conditionTemplate = v65.conditionsFrame.Template:Clone();
    v65.conditionsFrame.Template:Destroy();
    v65.difficultyGradientTween = l_TweenService_0:Create(v65.selectInfo.Content.DifficultyGradient, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Offset = Vector2.new(0, 0.2)
    });
end;
v54.Start = function(v67, _) --[[ Line: 234 ]] --[[ Name: Start ]]
    -- upvalues: v36 (ref), v32 (ref), v31 (ref), v5 (copy), v11 (copy), v6 (copy), v53 (copy), v18 (copy), v17 (copy), v64 (copy), v25 (copy), v21 (copy), v33 (ref), l_GuiService_0 (copy), v14 (copy), l_TweenService_0 (copy), v55 (copy)
    v36 = v32:GetModuleAsync("Achievements"):expect();
    v67._myCompletions = v31:Get(v5.Player, "BossClears"):expect();
    v31:OnChanged(v5.Player, "BossClears", function(v69) --[[ Line: 239 ]]
        -- upvalues: v67 (copy)
        v67._myCompletions = v69;
        v67:UpdateLockedLevelStates();
        for v70, v71 in v67._worldButtons do
            local l_v67_TotalStars_0, v73 = v67:GetTotalStars((tonumber(v70)));
            v71.Content.StarsEarned.Amount.Text = ("%*/%*"):format(l_v67_TotalStars_0 or 0, v73 or 0);
        end;
    end, true);
    v67:_initSelectionScreen();
    v11.NewReplicaSignal:Connect(function(v74) --[[ Line: 266 ]]
        -- upvalues: v67 (copy), v6 (ref), v5 (ref), v53 (ref), v18 (ref), v17 (ref), v64 (ref), v25 (ref), v21 (ref), v33 (ref), v32 (ref), l_GuiService_0 (ref), v14 (ref), l_TweenService_0 (ref), v31 (ref), v55 (ref)
        local l_Class_0 = v74.Class;
        if string.split(l_Class_0, "_")[1] ~= "Queue" then
            return;
        elseif v74.Data.Mode ~= "BossBattle" then
            return;
        else
            v67.queueDump = v6.new();
            v67.queueReplica = v74;
            v67.isLobbyOwner = v74.Data.LobbyOwner == v5.Player;
            v67.mode = v74.Data.Mode;
            v67.defaultMode = v67.mode;
            local function v83(v76, v77) --[[ Line: 286 ]] --[[ Name: renderReward ]]
                -- upvalues: v53 (ref), v67 (ref), v18 (ref), v17 (ref), v64 (ref), v25 (ref)
                local v78 = v53:GetState().selectionData.endless or v67.mode == "Endless";
                local v79 = v77.extraData or v77.ExtraData;
                v76.Content.Inner.Shiny.Visible = v79 and v79.Shiny or false;
                v76.Content.Inner.Wumbo.Visible = v79 and v79.Wumbo or false;
                if v77.type == "Unit" then
                    v76.LayoutOrder = -999999;
                end;
                if v77.weight then
                    local v80 = v18:Color3ToHex(v17.Solid.Gold);
                    v76.Content.Inner.Amount.RichText = true;
                    v76.Content.Inner.Amount.Text = ("x%* <font color=\"%*\">%%%*</font>"):format(v77.amount or 1, v80, (v64(v77.weight or 1)));
                elseif not v78 then
                    local v81 = ("x%*"):format(v77.amount or 1);
                    if v77.amountRange then
                        v81 = if v77.amountRange.Min ~= v77.amountRange.Max then ("x%* ~ %*"):format(v77.amountRange.Min, v77.amountRange.Max) else ("x%*"):format(v77.amountRange.Min);
                    end;
                    v76.Content.Inner.Amount.Text = v81;
                elseif v78 then
                    v76.Content.Inner.Amount.Text = "";
                end;
                if v77.type == "Unit" then
                    v25:SetImage(v76.Content.Inner.Icon, v77.name);
                else
                    local l_v18_IconFromRewardData_0 = v18:GetIconFromRewardData(v77);
                    v76.Content.Inner.Icon.Image = l_v18_IconFromRewardData_0 or "";
                end;
                return {
                    v76.Content.Backdrop, 
                    v76.Content.Glow
                };
            end;
            v67.rewardsVisualizer = v21.new({}, {
                template = v67.rewardTemplate, 
                parent = if v67.isLobbyOwner then v67.rewardsBin else v67.startInfo.Rewards.Bin, 
                renderMethod = v83
            });
            if v67.isLobbyOwner then
                v67.firstTimeRewardsVisualizer = v21.new({}, {
                    template = v67.rewardTemplate, 
                    parent = v67.firstTimeBin.Reward, 
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(0.5, 0.55), 
                    renderMethod = v83
                });
                v67.queueDump:Add(v67.firstTimeRewardsVisualizer);
            end;
            if v67.isLobbyOwner then
                v67.startScreen.Visible = false;
                v67.selectionScreen.Visible = true;
                v67.main.BackgroundTransparency = 0.5;
                v67:UpdateInfoScreen(true);
                task.delay(0.2, function() --[[ Line: 357 ]]
                    -- upvalues: v33 (ref), v32 (ref), l_GuiService_0 (ref), v67 (ref)
                    if v33:IsConsole() and v32:GetToggleState(script.Name) then
                        l_GuiService_0.SelectedObject = v67._worldButtons["1"];
                    end;
                end);
            end;
            v32:Toggle(script.Name, true);
            v67.queueDump:Add(v67:_onChanged("FriendsOnly", function(v84) --[[ Line: 369 ]]
                -- upvalues: v53 (ref)
                v53:Dispatch(v53.Actions.SetFriendsMode(v84));
            end, true));
            local v85 = nil;
            local v86 = nil;
            v67.startTimerBar.Bar.Fill.Size = UDim2.fromScale(0, 1);
            v67.queueDump:Add(v67:_onChanged("selectionTimeLeft", function(v87) --[[ Line: 378 ]]
                -- upvalues: v67 (ref), v18 (ref), v85 (ref), v14 (ref), l_TweenService_0 (ref)
                v67.stageTimerBar.Bar.Timer.Text = v18:FormatTimeFromSeconds(math.max(0, v87) or 0);
                if v85 then
                    return;
                else
                    local v88 = math.clamp(1 - v87 / v14.QUEUE.MAX_SELECTION_TIME, 0, v14.QUEUE.MAX_SELECTION_TIME);
                    v67.stageTimerBar.Bar.Fill.Size = UDim2.fromScale(v88, 1);
                    local v89 = TweenInfo.new(v87, Enum.EasingStyle.Linear);
                    v85 = l_TweenService_0:Create(v67.stageTimerBar.Bar.Fill, v89, {
                        Size = UDim2.fromScale(1, 1)
                    });
                    v85:Play();
                    v67.queueDump:Add(v85);
                    return;
                end;
            end, true));
            local v90 = 0;
            v67.queueDump:Add(v67:_onChanged("startTimeLeft", function(v91) --[[ Line: 402 ]]
                -- upvalues: v67 (ref), v18 (ref), v90 (ref), v86 (ref), l_TweenService_0 (ref)
                if not v67.queueReplica.Data.confirmedMap then
                    return;
                else
                    local v92 = math.max(0, v91.timeLeft - (workspace:GetServerTimeNow() - v91.sent));
                    v67.startTimerBar.Bar.Timer.Text = v18:FormatTimeFromSeconds(v92 or 0);
                    if v91.max == v90 then
                        return;
                    else
                        v90 = v91.max;
                        if v86 then
                            v86:Cancel();
                            v86:Destroy();
                        end;
                        local v93 = math.clamp(1 - v92 / v91.max, 0, v91.max);
                        v67.startTimerBar.Bar.Fill.Size = UDim2.fromScale(v93, 1);
                        local v94 = TweenInfo.new(v92, Enum.EasingStyle.Linear);
                        v86 = l_TweenService_0:Create(v67.startTimerBar.Bar.Fill, v94, {
                            Size = UDim2.fromScale(1, 1)
                        });
                        v86:Play();
                        v67.queueDump:Add(v86);
                        return;
                    end;
                end;
            end, true));
            v67.queueDump:Add(v67:_onChanged("Players", function(v95) --[[ Line: 445 ]]
                -- upvalues: v67 (ref), v31 (ref), v18 (ref), v14 (ref)
                for v96 = 1, #v67._playerFrames do
                    local v97 = v67._playerFrames[v96];
                    local v98 = v95[v96];
                    if not v98 then
                        v97.Icon.Image = "";
                        v97.Visible = false;
                    else
                        v31:Get(v98, "PlayerStats"):andThen(function(v99) --[[ Line: 456 ]]
                            -- upvalues: v97 (copy), v18 (ref)
                            local v100 = v99.Prestige or 0;
                            local v101 = v99.Level or 1;
                            v97.PlayerLevel.Prestige.Image = v18:GetPrestigeIcon(v100, v101);
                            v97.PlayerLevel.Prestige.Visible = v100 >= 1;
                            v97.PlayerLevel.UIPadding:SetAttribute("OriginalPaddingRight", UDim.new(0, v100 >= 1 and 30 or 0));
                        end);
                        v97.Icon.Image = string.format(v14.PLAYER_IMAGE_URL, v98.UserId);
                        v97.Visible = true;
                    end;
                end;
            end, true));
            v67.queueDump:Add(v67:_onChanged("PlayerLevels", function(v102) --[[ Line: 471 ]]
                -- upvalues: v67 (ref)
                for v103 = 1, #v67._playerFrames do
                    local v104 = v67._playerFrames[v103];
                    local v105 = v102[v103];
                    if v105 then
                        v104.PlayerLevel.PlayerLevel.Text = ("LVL %*"):format(v105);
                    end;
                end;
            end, true));
            v67.queueDump:Add(v67.rewardsVisualizer);
            v74:AddCleanupTask(function() --[[ Line: 486 ]]
                -- upvalues: v55 (ref), v67 (ref), v32 (ref)
                v55:Destroy();
                if v67.queueDump then
                    v67.queueDump:Destroy();
                end;
                if v67._bossViewport then
                    v67._bossViewport:Destroy();
                    v67._bossViewport = nil;
                end;
                v67.rewardsVisualizer = nil;
                v67.firstTimeRewardsVisualizer = nil;
                v67._currentBoss = nil;
                v32:Toggle(script.Name, false);
            end);
            return;
        end;
    end);
end;
v54.Closed = function(v106) --[[ Line: 507 ]] --[[ Name: Closed ]]
    v106.selectionScreen.Visible = true;
    v106.startScreen.Visible = false;
    if v106.conditionTooltip then
        v106.conditionTooltip:Destroy();
    end;
    for v107, _ in v106._taggedRarityVisuals do
        v107:RemoveTag("VisualizeRarity");
        v107:SetAttribute("Rarity");
    end;
    table.clear(v106._taggedRarityVisuals);
    v106.stagesScroll.CanvasPosition = Vector2.zero;
end;
v54.SelectBoss = function(v109, v110, v111) --[[ Line: 526 ]] --[[ Name: SelectBoss ]]
    -- upvalues: v53 (copy), v10 (copy), v33 (ref), v32 (ref), l_GuiService_0 (copy)
    local l_v53_State_0 = v53:GetState();
    if not v111 and l_v53_State_0.selectionData.Boss == v110 then
        if v110 then
            v10:Warn("Already selected boss", v110);
        end;
        return;
    else
        v109.mode = v109.defaultMode;
        v53:Dispatch(v53.Actions.SetSelectionData({
            Boss = v110, 
            Tier = 1
        }));
        if v33:IsConsole() and v32:GetToggleState(script.Name) then
            task.defer(function() --[[ Line: 549 ]]
                -- upvalues: l_GuiService_0 (ref), v109 (copy)
                l_GuiService_0.SelectedObject = v109._chapterButtons["1"];
            end);
        end;
        return;
    end;
end;
v54.SelectTier = function(_, v114, _) --[[ Line: 555 ]] --[[ Name: SelectTier ]]
    -- upvalues: v53 (copy), v10 (copy)
    local l_v53_State_1 = v53:GetState();
    if l_v53_State_1.selectionData.Tier == v114 then
        v10:Warn("Already selected tier", v114);
        return;
    else
        v53:Dispatch(v53.Actions.SetSelectionData({
            Boss = l_v53_State_1.selectionData.Boss or 1, 
            Tier = v114 or 1
        }));
        return;
    end;
end;
v54.SelectDifficulty = function(v117, v118) --[[ Line: 570 ]] --[[ Name: SelectDifficulty ]]
    -- upvalues: v53 (copy), v10 (copy), v14 (copy)
    local l_v53_State_2 = v53:GetState();
    if l_v53_State_2.selectionData.difficulty == v118 then
        v10:Warn("Already selected difficulty", v14.DIFFICULTY_NAMES[v118]);
        return;
    else
        v117.mode = v117.defaultMode;
        v53:Dispatch(v53.Actions.SetSelectionData({
            world = l_v53_State_2.selectionData.world or 1, 
            chapter = l_v53_State_2.selectionData.chapter or 1, 
            difficulty = v118 or 1, 
            endless = false
        }));
        return;
    end;
end;
v54.GetClearsData = function(v120) --[[ Line: 589 ]] --[[ Name: GetClearsData ]]
    -- upvalues: v53 (copy), v13 (copy)
    local l_v53_State_3 = v53:GetState();
    local v122 = l_v53_State_3.selectionData.Boss or 1;
    local v123 = l_v53_State_3.selectionData.Tier or 1;
    local l_v13_BossNameFromIndex_0 = v13:GetBossNameFromIndex(v122);
    local v125 = {
        TotalClears = 0, 
        Stars = 0, 
        FastestClear = "N/A", 
        StarsEarned = {}
    };
    return v120._myCompletions and v120._myCompletions[l_v13_BossNameFromIndex_0] and v120._myCompletions[l_v13_BossNameFromIndex_0][tostring(v123)] or v125;
end;
v54.IsNightmareUnlocked = function(v126) --[[ Line: 608 ]] --[[ Name: IsNightmareUnlocked ]]
    -- upvalues: v53 (copy), v14 (copy)
    local v127 = false;
    local l_v53_State_4 = v53:GetState();
    local v129 = l_v53_State_4.selectionData.world or 1;
    local v130 = l_v53_State_4.selectionData.chapter or 1;
    local v131 = l_v53_State_4.selectionData.difficulty or 1;
    local v132 = v126._chapterNightmareUnlocked[v129];
    if v132 then
        v127 = v132[v130] == true;
    end;
    local _ = v14.DIFFICULTY_NAMES[v131];
    return v127;
end;
v54.UpdateNightmareUnlocks = function(v134) --[[ Line: 631 ]] --[[ Name: UpdateNightmareUnlocks ]]
    -- upvalues: v18 (copy)
    for v135, v136 in v134._myCompletions.Worlds do
        v134._chapterNightmareUnlocked[v135] = {};
        for v137 in v136 do
            v137 = tonumber(v137);
            local v138 = v18:CanPlayNightmare(v134._myCompletions, v135, v137);
            v134._chapterNightmareUnlocked[v135][v137] = v138;
        end;
    end;
end;
v54.UpdateInfoScreen = function(v139, v140) --[[ Line: 644 ]] --[[ Name: UpdateInfoScreen ]]
    -- upvalues: v53 (copy), v10 (copy), v13 (copy), v16 (copy), v18 (copy)
    local l_v53_State_5 = v53:GetState();
    local v142 = if v140 then v139.queueReplica.Data.Boss else l_v53_State_5.selectionData.Boss or 1;
    local v143 = if v140 then v139.queueReplica.Data.Tier else l_v53_State_5.selectionData.Tier or 1;
    if v140 then
        v139:SelectBoss(v142, true);
    end;
    if not v142 or not v143 then
        v10:Warn("Missing one of the following: Boss or Tier");
        return;
    else
        local l_v13_BossFromIndex_0 = v13:GetBossFromIndex(v142);
        if not l_v13_BossFromIndex_0 or not l_v13_BossFromIndex_0.BossDifficultyTier then
            local _ = 1;
        end;
        local v146 = l_v13_BossFromIndex_0 and l_v13_BossFromIndex_0.Name;
        local v147 = v146 and (v16:GetUnitValue(v146, "FullName") or v146);
        if not l_v13_BossFromIndex_0 then
            warn("Failed to get boss info for boss index:", v142);
            return;
        else
            local v148 = l_v13_BossFromIndex_0.Tiers[v143];
            local l_v139_ClearsData_0 = v139:GetClearsData();
            local l_TotalClears_0 = l_v139_ClearsData_0.TotalClears;
            local l_FastestClear_0 = l_v139_ClearsData_0.FastestClear;
            local _ = l_v139_ClearsData_0.Stars;
            local v153 = l_v139_ClearsData_0.StarsEarned or {};
            local v154 = l_FastestClear_0 or "N/A";
            if typeof(v154) == "number" then
                v154 = v18:FormatTimeFromSeconds(v154);
            end;
            v139.selectInfo.Content.DifficultyGradient.Offset = Vector2.new(0, 1);
            local v155 = v139._worldButtons[tostring(v142)];
            if v155 then
                v139.selectInfo.Content.DifficultyGradient.Color = v155.Content.WorldImage.UIGradient.Color;
            end;
            v139.difficultyGradientTween:Play();
            v139:_renderBossViewport({
                Name = v146
            });
            v139.selectContent.ChapterTitle.Chapter.ChapterOrder.Text = ("%* - %*"):format(v147, (v18:IntToRoman(v143)));
            v139.selectContent.ChapterTitle.Chapter.ChapterName.Text = v148 and v148.TierDisplayName or "";
            v139.selectContent.Info.FastestClear.Amount.Text = v154;
            v139.selectContent.Info.TotalClears.Amount.Text = l_TotalClears_0 or 0;
            v139.selectContent.Rewards.Main.FirstTimeClear.Reward.Earned.Visible = l_TotalClears_0 > 0;
            local v156 = l_v13_BossFromIndex_0 and l_v13_BossFromIndex_0.StarConditions;
            v18:IterateClass(v139.selectContent.Stars, "Frame", function(v157) --[[ Line: 707 ]]
                -- upvalues: v153 (copy), v156 (copy), v139 (copy)
                local v158 = tonumber(v157.Name);
                local v159 = v153[v157.Name] or false;
                local v160 = v156[v158];
                if v160 then
                    if v160.TimeLimit then
                        v157.Description.Text = ("Under %* Minutes"):format((math.floor(v160.TimeLimit / 60)));
                    elseif v160.RarityLimit then
                        v157.Description.Text = v160.RarityLimit;
                        v157.Description:RemoveTag("VisualizeRarity");
                        v157.Description.UIStroke:RemoveTag("VisualizeRarity");
                        v157.Description:SetAttribute("Rarity", v160.RarityLimit);
                        v157.Description:AddTag("VisualizeRarity");
                        v139._taggedRarityVisuals[v157.Description] = true;
                    end;
                end;
                v157.Star.ImageColor3 = if v159 then Color3.new(1, 1, 1) else Color3.new(0, 0, 0);
                v157.Star.ImageTransparency = v159 and 0 or 0.5;
            end);
            return;
        end;
    end;
end;
v54.UpdateStartScreen = function(v161) --[[ Line: 733 ]] --[[ Name: UpdateStartScreen ]]
    -- upvalues: v13 (copy), v16 (copy), v18 (copy), v10 (copy), v7 (copy), v31 (ref), v5 (copy), v14 (copy), v29 (copy)
    if not v161.queueReplica then
        return;
    else
        local v162 = v161.queueReplica.Data.Boss or 1;
        local v163 = v161.queueReplica.Data.Tier or 1;
        local l_v13_BossFromIndex_1 = v13:GetBossFromIndex(v162);
        l_v13_BossFromIndex_1 = l_v13_BossFromIndex_1 and l_v13_BossFromIndex_1.Tiers[v163];
        local l_v13_BossNameFromIndex_1 = v13:GetBossNameFromIndex(v162);
        local v166 = l_v13_BossNameFromIndex_1 and (v16:GetUnitValue(l_v13_BossNameFromIndex_1, "FullName") or l_v13_BossNameFromIndex_1);
        local l_LevelRequirement_0 = v161.startInfo.Info.Inner.LevelRequirement;
        local _ = l_LevelRequirement_0.Title;
        l_LevelRequirement_0.Visible = false;
        v161.startInfo.Info.Inner.ChapterOrder.Text = ("%* - %*"):format(v166, (v18:IntToRoman(v163)));
        v161.startInfo.Info.Inner.ChapterName.Text = l_v13_BossFromIndex_1.TierDisplayName or "";
        v161.startInfo.Unsorted.Conditions.Visible = false;
        local l_v13_Rewards_0, v170, _ = v13:GetRewards(v162, v163);
        if not l_v13_Rewards_0 then
            v10:Warn("Failed to get possible rewards;", v162, v163);
            return;
        else
            if v170 and #v170 == 1 then
                v170[1].feature = 1;
            end;
            local v173 = v170 and v7.Filter(v170, function(v172) --[[ Line: 774 ]]
                return v172.feature == true;
            end);
            local v175 = v170 and v7.Filter(v170, function(v174) --[[ Line: 778 ]]
                return not v174.feature;
            end);
            if v173 then
                table.sort(v173, function(v176, v177) --[[ Line: 784 ]]
                    return v176.weight < v177.weight;
                end);
                for _, v179 in v173 do
                    local v180 = #l_v13_Rewards_0;
                    if v179.showFirst then
                        v180 = 1;
                    end;
                    table.insert(l_v13_Rewards_0, v180, v179);
                end;
            end;
            local v181 = v31:Get(v5.Player, v14.TURF_WARS.DATA_KEY):expect();
            if v181 and v29.util.IsQuestCompleted(v181, v29.TOTAL_QUESTS) then
                local v182 = v14.TURF_WARS.STARDOM_EARNINGS.BossBattle[v162];
                table.insert(l_v13_Rewards_0, {
                    type = "Stardom", 
                    amount = v182
                });
            end;
            if v175 and #v175 > 0 then
                v161:_renderUnfeaturedLoot(v175, v161.startInfo.Rewards.Bin, v161.queueDump);
            end;
            if v161.isLobbyOwner then
                v161.rewardsVisualizer:Reparent(v161.startInfo.Rewards.Bin);
                return;
            else
                v161.rewardsVisualizer:ChangeRewards(l_v13_Rewards_0, v161.startInfo.Rewards.Bin);
                return;
            end;
        end;
    end;
end;
v54.ShowStartScreen = function(v183) --[[ Line: 822 ]] --[[ Name: ShowStartScreen ]]
    -- upvalues: v33 (ref), v32 (ref), l_GuiService_0 (copy)
    v183:UpdateStartScreen();
    v183.selectionScreen.Visible = false;
    v183.startScreen.Visible = true;
    v183.startOptions.Start.Visible = v183.isLobbyOwner;
    local l_startOptions_0 = v183.startOptions;
    local v185 = true;
    if v183.mode ~= "Story" then
        v185 = v183.mode == "Endless";
    end;
    l_startOptions_0.Visible = v185;
    v183.main.BackgroundTransparency = 1;
    if v33:IsConsole() and v32:GetToggleState(script.Name) and v183.isLobbyOwner then
        l_GuiService_0.SelectedObject = v183.startOptions.Start;
    end;
end;
v54.UpdateLockedLevelStates = function(v186, v187) --[[ Line: 839 ]] --[[ Name: UpdateLockedLevelStates ]]
    -- upvalues: v18 (copy), v53 (copy), v13 (copy)
    if (v187 or {
        UpdateWorlds = true, 
        UpdateChapters = true
    }).UpdateWorlds then
        for v188, v189 in v186._worldButtons do
            local v190 = v18:IsBossUnlocked(v186._myCompletions, (tonumber(v188)));
            v189:SetAttribute("IS_UNLOCKED", v190);
            v189.Content.Locked.Visible = not v190;
        end;
    end;
    local v191 = v53:GetState().selectionData.Boss or 1;
    local l_v13_BossFromIndex_2 = v13:GetBossFromIndex(v191);
    local v193 = l_v13_BossFromIndex_2 and l_v13_BossFromIndex_2.Name;
    local v194 = v186._myCompletions and v186._myCompletions[v193];
    for v195, v196 in v186._chapterButtons do
        local v197 = tonumber(v195);
        if v197 then
            local v198 = v194 and v194[v195] and v194[v195].Stars or 0;
            local v199 = v18:IsTierUnlocked(v186._myCompletions, v191, v197);
            v196:SetAttribute("IS_UNLOCKED", v199);
            v196.Content.Locked.Visible = not v199;
            v18:IterateClass(v196.Content.Stars, "ImageLabel", function(v200) --[[ Line: 874 ]]
                -- upvalues: v198 (copy)
                local v201 = tonumber(v200.Name);
                v200.ImageColor3 = v201 <= v198 and Color3.new(1, 1, 1) or Color3.new(0, 0, 0);
                v200.ImageTransparency = v201 <= v198 and 0 or 0.5;
            end);
        end;
    end;
end;
v54.GetTotalStars = function(v202, v203) --[[ Line: 882 ]] --[[ Name: GetTotalStars ]]
    -- upvalues: v13 (copy), v7 (copy)
    local v204 = 0;
    local v205 = 0;
    local l_v13_BossFromIndex_3 = v13:GetBossFromIndex(v203);
    local v207 = l_v13_BossFromIndex_3 and l_v13_BossFromIndex_3.Tiers;
    if not l_v13_BossFromIndex_3 or not v207 then
        return v204, v205;
    else
        local v208 = #v7.Keys(v207);
        v205 = v208 * 3;
        if not v202._myCompletions or not v202._myCompletions[l_v13_BossFromIndex_3.Name] then
            return v204, v205;
        else
            for v209 = 1, v208 do
                local v210 = v202._myCompletions[l_v13_BossFromIndex_3.Name][tostring(v209)];
                if v210 and v210.Stars then
                    v204 = v204 + v210.Stars;
                end;
            end;
            return v204, v205;
        end;
    end;
end;
v54._onChanged = function(v211, v212, v213, v214) --[[ Line: 912 ]] --[[ Name: _onChanged ]]
    if not v211.queueReplica then
        return;
    else
        if v214 and v211.queueReplica.Data[v212] ~= nil then
            v213(v211.queueReplica.Data[v212]);
        end;
        return v211.queueReplica:ListenToChange(v212, v213);
    end;
end;
v54._fireServer = function(v215, v216, ...) --[[ Line: 925 ]] --[[ Name: _fireServer ]]
    if v215.queueReplica then
        v215.queueReplica:FireServer(v216, ...);
    end;
end;
v54._isKickPlayerInput = function(_, v218) --[[ Line: 932 ]] --[[ Name: _isKickPlayerInput ]]
    if not v218 then
        return false;
    elseif v218.UserInputType == Enum.UserInputType.MouseButton2 then
        return true;
    elseif v218.UserInputType == Enum.UserInputType.Touch then
        return true;
    elseif v218.KeyCode == Enum.KeyCode.ButtonR2 then
        return true;
    else
        return false;
    end;
end;
v54._connectLobbyOptions = function(v219) --[[ Line: 949 ]] --[[ Name: _connectLobbyOptions ]]
    -- upvalues: v32 (ref), v53 (copy), v54 (copy), v33 (ref)
    v32:HandleButton(v219.readyButton, function() --[[ Line: 950 ]]
        -- upvalues: v53 (ref), v219 (copy)
        local l_v53_State_6 = v53:GetState();
        v219:_fireServer("ConfirmBoss", {
            Boss = l_v53_State_6.selectionData.Boss or 1, 
            Tier = l_v53_State_6.selectionData.Tier or 1
        });
    end);
    v32:HandleButton(v219.leaveButton, function() --[[ Line: 959 ]]
        -- upvalues: v54 (ref)
        v54:_fireServer("LeaveQueue");
    end);
    v33:ObserveGamepadButtonPress(Enum.KeyCode.ButtonB, function() --[[ Line: 963 ]]
        -- upvalues: v54 (ref)
        v54:_fireServer("LeaveQueue");
    end);
    v32:HandleButton(v219.friendsOnlyButton, function() --[[ Line: 967 ]]
        -- upvalues: v219 (copy)
        v219:_fireServer("ToggleFriendsOnly");
    end);
end;
v54._connectWorldButtons = function(v221) --[[ Line: 973 ]] --[[ Name: _connectWorldButtons ]]
    -- upvalues: v24 (copy), v32 (ref)
    for _, v224 in v24(v221.stagesScroll, function(v222) --[[ Line: 974 ]] --[[ Name: predicate ]]
        return v222.Name ~= "ComingSoon";
    end) do
        local _ = v224.Name;
        local v226 = v224:GetAttribute("IS_UNLOCKED") or false;
        local v227 = tonumber(string.match(v224.Name, "%d+"));
        if not v227 then
            --[[ close >= 8 ]]
        else
            local l_v221_TotalStars_0, v229 = v221:GetTotalStars(v227);
            v224.Content.StarsEarned.Amount.Text = ("%*/%*"):format(l_v221_TotalStars_0 or 0, v229 or 0);
            do
                local l_v226_0 = v226;
                v224:GetAttributeChangedSignal("IS_UNLOCKED"):Connect(function() --[[ Line: 995 ]]
                    -- upvalues: l_v226_0 (ref), v224 (copy)
                    l_v226_0 = v224:GetAttribute("IS_UNLOCKED") or false;
                end);
                v224.SelectionOrder = v224.LayoutOrder;
                v32:HandleButton(v224, function() --[[ Line: 1001 ]]
                    -- upvalues: l_v226_0 (ref), v221 (copy), v227 (copy)
                    if not l_v226_0 then
                        return;
                    else
                        v221:SelectBoss(v227);
                        return;
                    end;
                end);
                v221._worldButtons[tostring(v227)] = v224;
            end;
        end;
    end;
end;
v54._connectChapterButtons = function(v231) --[[ Line: 1014 ]] --[[ Name: _connectChapterButtons ]]
    -- upvalues: v24 (copy), v32 (ref)
    (function(v232) --[[ Line: 1015 ]] --[[ Name: handleButtons ]]
        -- upvalues: v24 (ref), v32 (ref), v231 (copy)
        for _, v234 in v24(v232) do
            local v235 = v234:GetAttribute("IS_UNLOCKED") or false;
            local v236 = tonumber(string.match(v234.Name, "%d+")) or v234.Name;
            do
                local l_v235_0 = v235;
                v234:GetAttributeChangedSignal("IS_UNLOCKED"):Connect(function() --[[ Line: 1020 ]]
                    -- upvalues: l_v235_0 (ref), v234 (copy)
                    l_v235_0 = v234:GetAttribute("IS_UNLOCKED") or false;
                end);
                v32:HandleButton(v234, function() --[[ Line: 1024 ]]
                    -- upvalues: l_v235_0 (ref), v231 (ref), v236 (copy)
                    if not l_v235_0 then
                        return;
                    else
                        v231:SelectTier(v236, false);
                        return;
                    end;
                end);
                v231._chapterButtons[tostring(v236)] = v234;
            end;
        end;
    end)(v231.chapterSelect);
end;
v54._connectDifficultyButtons = function(v238) --[[ Line: 1043 ]] --[[ Name: _connectDifficultyButtons ]]
    -- upvalues: v24 (copy), v14 (copy), v32 (ref)
    v238._difficultyButtons = {};
end;
v54._listenToStateChanges = function(v239) --[[ Line: 1074 ]] --[[ Name: _listenToStateChanges ]]
    -- upvalues: v53 (copy), v58 (copy), v60 (copy), v10 (copy), v13 (copy), v31 (ref), v5 (copy), v14 (copy), v29 (copy), v7 (copy), v55 (copy)
    v53:Watch(v58, function(v240) --[[ Line: 1076 ]]
        -- upvalues: v239 (copy)
        v239.friendsOnlyButton.Content.IsEnabled.Visible = v240;
    end);
    v53:Watch(v60, function(v241) --[[ Line: 1080 ]]
        -- upvalues: v10 (ref), v239 (copy), v13 (ref), v31 (ref), v5 (ref), v14 (ref), v29 (ref), v7 (ref), v55 (ref)
        local l_Boss_0 = v241.Boss;
        local l_Tier_0 = v241.Tier;
        if not l_Boss_0 or not l_Tier_0 then
            v10:Warn("Missing one of the following (boss, tier):", l_Boss_0, l_Tier_0);
            return;
        else
            v239:UpdateInfoScreen();
            for v244, v245 in v239._worldButtons do
                if not v245:GetAttribute("IS_UNLOCKED") then
                    v245.Content.Deselected.Visible = false;
                else
                    v245.Content.Deselected.Visible = v244 ~= tostring(l_Boss_0);
                end;
            end;
            for v246, v247 in v239._chapterButtons do
                if not v247:GetAttribute("IS_UNLOCKED") then
                    v247.Content.Deselected.Visible = false;
                else
                    v247.Content.Deselected.Visible = v246 ~= tostring(l_Tier_0);
                end;
            end;
            if not l_Boss_0 or not l_Tier_0 then
                v10:Warn("Missing one of the following (boss, tier):", l_Boss_0, l_Tier_0);
                return;
            else
                v239:UpdateInfoScreen();
                v239:UpdateLockedLevelStates({
                    UpdateChapters = true
                });
                local l_v13_Rewards_1, v249, v250 = v13:GetRewards(l_Boss_0, l_Tier_0);
                if not l_v13_Rewards_1 then
                    return;
                else
                    local v251 = v31:Get(v5.Player, v14.TURF_WARS.DATA_KEY):expect();
                    if v251 and v251.quest == v29.TOTAL_QUESTS then
                        local v252 = v14.TURF_WARS.STARDOM_EARNINGS.BossBattle[l_Boss_0];
                        table.insert(l_v13_Rewards_1, {
                            type = "Stardom", 
                            amount = v252
                        });
                    end;
                    if v249 then
                        v249 = v7.Copy(v249, true);
                        if #v249 == 1 then
                            v249[1].feature = true;
                        end;
                        v251 = v7.Filter(v249, function(v253) --[[ Line: 1142 ]]
                            return v253.feature == true;
                        end);
                        table.sort(v251, function(v254, v255) --[[ Line: 1147 ]]
                            return v254.weight < v255.weight;
                        end);
                        for _, v257 in v251 do
                            local v258 = #l_v13_Rewards_1;
                            if v257.showFirst then
                                v258 = 1;
                            end;
                            table.insert(l_v13_Rewards_1, v258, v257);
                        end;
                    end;
                    v239.selectContent.Rewards.Main.FirstTimeClear.Visible = v250 ~= nil;
                    v239.rewardsVisualizer:ChangeRewards(l_v13_Rewards_1, v239.rewardsBin);
                    v251 = v249 and v7.Filter(v249, function(v259) --[[ Line: 1165 ]]
                        return not v259.feature;
                    end);
                    v55:Destroy();
                    if v251 and #v251 > 0 then
                        v239:_renderUnfeaturedLoot(v251, v239.rewardsBin, v55);
                    end;
                    if v239.firstTimeRewardsVisualizer then
                        v239.firstTimeRewardsVisualizer:ChangeRewards(v250);
                    end;
                    return;
                end;
            end;
        end;
    end);
end;
v54._initSelectionScreen = function(v260) --[[ Line: 1182 ]] --[[ Name: _initSelectionScreen ]]
    v260:_connectLobbyOptions();
    v260:_connectWorldButtons();
    v260:_connectChapterButtons();
    v260:_connectDifficultyButtons();
    v260:_listenToStateChanges();
    v260:UpdateLockedLevelStates();
end;
v54._initStartScreen = function(v261) --[[ Line: 1191 ]] --[[ Name: _initStartScreen ]]
    -- upvalues: v32 (ref), v54 (copy), v24 (copy)
    v32:HandleButton(v261.startOptions.Start, function() --[[ Line: 1193 ]]
        -- upvalues: v261 (copy)
        v261:_fireServer("StartGame");
    end);
    v32:HandleButton(v261.startOptions.Leave, function() --[[ Line: 1197 ]]
        -- upvalues: v54 (ref)
        v54:_fireServer("LeaveQueue");
    end);
    v24(v261.startPlayers, nil, function(v262) --[[ Line: 1201 ]]
        -- upvalues: v261 (copy)
        local v263 = tonumber(string.match(v262.Name, "%d+"));
        if not v263 then
            return;
        else
            v262.Visible = false;
            v261._playerFrames[v263] = v262;
            return;
        end;
    end);
end;
v54._renderBossViewport = function(v264, v265) --[[ Line: 1215 ]] --[[ Name: _renderBossViewport ]]
    -- upvalues: v10 (copy), v20 (copy), l_TweenService_0 (copy)
    if not v265 then
        return;
    elseif not v264.isLobbyOwner then
        v10:Warn("Not generating boss viewport since client is not the Queue owner");
        return;
    else
        local v266 = v265.Name or v265.UnitName;
        if v264._currentBoss == v266 then
            return;
        else
            v264._currentBoss = v266;
            if v264._bossViewport and v264._bossViewport.Destroy then
                v264._bossViewport:Destroy();
            end;
            v264._bossViewport = v20.new(v264.selectInfo.Content.Boss, v266, {
                isEnemy = true, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.fromScale(1.25, 1), 
                Position = UDim2.fromScale(0.5, 0), 
                positionAttribute = "QueueOffset", 
                angleAttribute = "QueueOrientation"
            });
            if v264._bossViewport then
                v264._bossViewport.viewHandler.viewport.Position = UDim2.fromScale(0.75, 0);
                task.delay(0.1, function() --[[ Line: 1249 ]]
                    -- upvalues: v264 (copy), l_TweenService_0 (ref)
                    if v264._bossViewport and v264._bossViewport.viewHandler and v264._bossViewport.viewHandler.viewport then
                        l_TweenService_0:Create(v264._bossViewport.viewHandler.viewport, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                            Position = UDim2.fromScale(0.5, 0)
                        }):Play();
                    end;
                end);
            end;
            return;
        end;
    end;
end;
v54._renderUnfeaturedLoot = function(v267, v268, v269, v270) --[[ Line: 1259 ]] --[[ Name: _renderUnfeaturedLoot ]]
    -- upvalues: v18 (copy), v26 (copy), v25 (copy), v17 (copy), v64 (copy), v32 (ref), v22 (copy)
    local v271 = v267.rewardTemplate:Clone();
    v271.Name = "LOOT_ITEM_REWARDS";
    v271.LayoutOrder = -999999;
    v271.Visible = true;
    v271.Content.Inner.Mystery.Visible = true;
    v271.Parent = v269;
    local v272 = 0;
    local v273 = #v268;
    local v274 = {
        v271.Content.Backdrop, 
        v271.Content.Glow
    };
    local function v282() --[[ Line: 1275 ]] --[[ Name: renderLootItem ]]
        -- upvalues: v268 (copy), v272 (ref), v18 (ref), v271 (copy), v26 (ref), v25 (ref), v17 (ref), v64 (ref), v274 (copy)
        local v275 = v268[v272];
        local v276 = v18:GetRewardRarity(v275) or "Common";
        local v277 = v275.extraData or v275.ExtraData;
        v271.Content.Inner.Shiny.Visible = v277 and v277.Shiny or false;
        v271.Content.Inner.Wumbo.Visible = v277 and v277.Mega or v277.Wumbo or false;
        if v275.type == "Unit" then
            v276 = select(2, v26:GetRarity(v275.name));
            v25:SetImage(v271.Content.Inner.Icon, v275.name);
        else
            local l_v18_IconFromRewardData_1 = v18:GetIconFromRewardData(v275);
            v271.Content.Inner.Icon.ScaleType = Enum.ScaleType.Fit;
            v271.Content.Inner.Icon.ImageRectOffset = Vector2.zero;
            v271.Content.Inner.Icon.ImageRectSize = Vector2.zero;
            v271.Content.Inner.Icon.Image = l_v18_IconFromRewardData_1 or "";
        end;
        local v279 = v18:Color3ToHex(v17.Solid.Gold);
        v271.Content.Inner.Amount.RichText = true;
        v271.Content.Inner.Amount.Text = ("x%* <font color=\"%*\">%%%*</font>"):format(v275.amount or 1, v279, (v64(v275.weight or 1)));
        for _, v281 in v274 do
            v281:RemoveTag("VisualizeRarity");
            v281:SetAttribute("Rarity", v276);
            v281:AddTag("VisualizeRarity");
        end;
    end;
    v270:Add(v32:HandleButton(v271));
    v270:Add(v271);
    v270:Add(v22.Simple(1, function() --[[ Line: 1316 ]]
        -- upvalues: v272 (ref), v273 (copy), v282 (copy)
        v272 = v272 + 1;
        if v273 < v272 then
            v272 = 1;
        end;
        v282();
    end, true));
end;
return v54;