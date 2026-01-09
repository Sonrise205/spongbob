local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v7 = require(l_ReplicatedStorage_0.Packages.Silo);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v10 = require(l_ReplicatedStorage_0.ReplicaController);
local v11 = require(l_ReplicatedStorage_0.Levels);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local _ = require(l_ReplicatedStorage_0.Shared.Data.EnemyShared);
local _ = require(l_ReplicatedStorage_0.Shared.Data.CraftingData);
local v16 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v17 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Util.TimeFormat);
local v19 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v20 = require(v4.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v21 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Util.SetProps);
local v23 = require(l_ReplicatedStorage_0.Shared.Util.GetButtons);
local v24 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v25 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v26 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v27 = require(l_ReplicatedStorage_0.Shared.Data.PetImages);
local _ = require(v4.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Missions);
local v30 = require(l_ReplicatedFirst_0.GetLoadingScreen);
local _ = require(l_ReplicatedStorage_0.Shared.Data.TurfWarsQuests);
local _ = require(l_ReplicatedStorage_0.TraitsData);
local v33 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.Constants);
local v34 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.FloorsUtil);
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v52 = v7.new({
    friendsMode = false, 
    selectedWorld = nil, 
    selectedChapter = nil, 
    selectedDifficulty = nil, 
    selectionData = {
        world = nil, 
        chapter = nil, 
        difficulty = nil, 
        endless = false
    }
}, {
    SetFriendsMode = function(v42, v43) --[[ Line: 76 ]]
        v42.friendsMode = v43;
    end, 
    SetWorld = function(v44, v45) --[[ Line: 79 ]]
        v44.selectedWorld = v45;
    end, 
    SetChapter = function(v46, v47) --[[ Line: 82 ]]
        v46.selectedChapter = v47;
    end, 
    SetDifficulty = function(v48, v49) --[[ Line: 85 ]]
        v48.selectedDifficulty = v49;
    end, 
    SetSelectionData = function(v50, v51) --[[ Line: 88 ]]
        v50.selectionData = v51;
    end
});
local v53 = {
    primaryMenu = true, 
    blur = false, 
    _worldButtons = {}, 
    _chapterButtons = {}, 
    _playerFrames = {}, 
    _myCompletions = {}, 
    _myChapterClears = {}, 
    _chapterNightmareUnlocked = {}, 
    _chapterDavyJonesUnlocked = {}, 
    ToggleAll = {}
};
local v54 = v5.new();
local function _() --[[ Line: 112 ]] --[[ Name: leaveLobby ]]
    -- upvalues: v53 (copy)
    v53:_fireServer("LeaveQueue");
end;
local function v57(v56) --[[ Line: 117 ]] --[[ Name: selectFriendsMode ]]
    return v56.friendsMode;
end;
local function v59(v58) --[[ Line: 121 ]] --[[ Name: selectSelectionData ]]
    return v58.selectionData;
end;
v53.Init = function(v60, v61) --[[ Line: 125 ]] --[[ Name: Init ]]
    -- upvalues: v35 (ref), v4 (copy), v36 (ref), v37 (ref), v38 (ref), v39 (ref), v40 (ref), l_TweenService_0 (copy)
    v35 = v4.GetController("DataController");
    v36 = v4.GetController("UIController");
    v37 = v4.GetController("DeviceTypeController");
    v38 = v4.GetController("EventController");
    v39 = v4.GetController("MissionController");
    v40 = v4.GetController("NPEController");
    v60.ui = v61;
    v60.main = v61.Main;
    v60.selectionScreen = v60.main.SelectionScreen;
    v60.selectionMain = v60.selectionScreen.Main;
    v60.stageSelect = v60.selectionMain.StageSelect;
    v60.stageTimerBar = v60.selectionMain.TimerBar;
    v60.selectInfo = v60.stageSelect.Info;
    v60.difficultyButtons = v60.selectInfo.Content.Milestones;
    v60.worldInfo = v60.selectInfo.Content.Info;
    v60.selectRewardsBin = v60.selectInfo.Content.Rewards;
    v60.optionsButtons = v60.selectionMain.Options;
    v60.readyButton = v60.selectionMain.Options.Options.Confirm;
    v60.leaveButton = v60.selectionMain.Options.Options.Leave;
    v60.friendsOnlyButton = v60.selectionMain.Options.FriendsOption.Toggle;
    v60.rewardsBin = v60.selectInfo.Content.Rewards.Main.Bin.Inner;
    v60.firstTimeBin = v60.selectInfo.Content.Rewards.Main.DailyCompletion;
    v60.rewardTemplate = v60.rewardsBin.Template;
    v60.rewardTemplate.Parent = nil;
    v60.rewardTemplate:SetAttribute("InvertClick", true);
    v60.startScreen = v60.main.StartScreen;
    v60.startMain = v60.startScreen.Main;
    v60.startOptions = v60.startMain.Options;
    v60.startPlayers = v60.startMain.Players;
    v60.startInfo = v60.startMain.StageInfo.Inner;
    v60.startTimerBar = v60.startMain.TimerBar;
    v60.conditionsFrame = v60.startInfo.Unsorted.Conditions;
    v60.conditionTemplate = v60.conditionsFrame.Template:Clone();
    v60.conditionsFrame.Template:Destroy();
    v60.difficultyGradientTween = l_TweenService_0:Create(v60.selectInfo.Content.DifficultyGradient, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Offset = Vector2.new(0, 0.2)
    });
    v60:_setupReadyButtonVisual();
end;
v53.Start = function(v62, _) --[[ Line: 192 ]] --[[ Name: Start ]]
    -- upvalues: v41 (ref), v36 (ref), v35 (ref), v4 (copy), v10 (copy), v5 (copy), v52 (copy), v33 (copy), v17 (copy), v16 (copy), v24 (copy), v27 (copy), v20 (copy), v37 (ref), l_GuiService_0 (copy), v12 (copy), l_TweenService_0 (copy), v54 (copy)
    v41 = v36:GetModuleAsync("Achievements"):expect();
    v62._myCompletions = v35:Get(v4.Player, "Completion"):expect();
    v62._myChapterClears = v35:Get(v4.Player, "ChapterClears"):expect();
    v62._karateClears = v35:Get(v4.Player, "TowerOfKarate.CompletedFloors"):expect();
    v62._karateData = v35:Get(v4.Player, "TowerOfKarate"):expect();
    v35:OnChanged(v4.Player, "Completion", function(v64) --[[ Line: 201 ]]
        -- upvalues: v62 (copy)
        v62._myCompletions = v64;
        v62:UpdateLockedLevelStates({
            UpdateWorlds = true
        });
        v62:UpdateDifficultyUnlocks();
    end, true);
    v35:OnChanged(v4.Player, "ChapterClears", function(v65) --[[ Line: 207 ]]
        -- upvalues: v62 (copy)
        v62._myChapterClears = v65;
    end);
    v35:OnChanged(v4.Player, "TowerOfKarate.CompletedFloors", function(v66) --[[ Line: 211 ]]
        -- upvalues: v62 (copy)
        v62._karateClears = v66;
        v62:UpdateLockedLevelStates({
            UpdateFloors = true
        });
    end);
    v35:OnChanged(v4.Player, "TowerOfKarate", function(v67) --[[ Line: 216 ]]
        -- upvalues: v62 (copy)
        v62._karateData = v67;
    end);
    v62:_initSelectionScreen();
    v62:_initStartScreen();
    v10.NewReplicaSignal:Connect(function(v68) --[[ Line: 224 ]]
        -- upvalues: v62 (copy), v5 (ref), v4 (ref), v52 (ref), v33 (ref), v17 (ref), v16 (ref), v24 (ref), v27 (ref), v20 (ref), v37 (ref), v36 (ref), l_GuiService_0 (ref), v12 (ref), l_TweenService_0 (ref), v35 (ref), v54 (ref)
        local l_Class_0 = v68.Class;
        if string.split(l_Class_0, "_")[1] ~= "Queue" then
            return;
        else
            local l_Mode_0 = v68.Data.Mode;
            if l_Mode_0 ~= "TowerOfKarate" then
                return;
            else
                v62.queueDump = v5.new();
                v62.queueReplica = v68;
                v62.isLobbyOwner = v68.Data.LobbyOwner == v4.Player;
                v62.mode = l_Mode_0;
                v62.defaultMode = v62.mode;
                v62.queueDump:Add(function() --[[ Line: 245 ]]
                    -- upvalues: v62 (ref)
                    if v62.dailyDelayThread then
                        task.cancel(v62.dailyDelayThread);
                        v62.dailyDelayThread = nil;
                    end;
                end);
                local function v78(v71, v72) --[[ Line: 252 ]] --[[ Name: renderReward ]]
                    -- upvalues: v52 (ref), v62 (ref), v33 (ref), v17 (ref), v16 (ref), v24 (ref), v27 (ref)
                    local l_v52_State_0 = v52:GetState();
                    local v74 = l_v52_State_0.selectionData.endless or v62.mode == "Endless" or l_v52_State_0.selectionData.world > v33.MAX_FLOORS;
                    local v75 = v72.extraData or v72.ExtraData;
                    v71.Content.Inner.Shiny.Visible = v75 and v75.Shiny or false;
                    v71.Content.Inner.Wumbo.Visible = v75 and v75.Wumbo or false;
                    if v72.weight and v72.weight < 100 then
                        local v76 = v17:Color3ToHex(v16.Solid.Gold);
                        v71.Content.Inner.Amount.RichText = true;
                        v71.Content.Inner.Amount.Text = ("x%* <font color=\"%*\">%%%*</font>"):format(v72.amount, v76, v72.weight or 1);
                    elseif not v74 and v72.amount then
                        local v77 = ("x%*"):format(v72.amount);
                        if v72.amountRange then
                            v77 = if v72.amountRange.Min ~= v72.amountRange.Max then ("x%* ~ %*"):format(v72.amountRange.Min, v72.amountRange.Max) else ("x%*"):format(v72.amountRange.Min);
                        end;
                        v71.Content.Inner.Amount.Text = v77;
                    else
                        v71.Content.Inner.Amount.Text = "";
                    end;
                    if v72.type == "Unit" then
                        v24:SetImage(v71.Content.Inner.Icon, v72.name);
                        v71.LayoutOrder = -999999;
                    elseif v72.type == "Pet" then
                        v27:SetImage(v71.Content.Inner.Icon, v72.name);
                        v71.LayoutOrder = -999999;
                    else
                        v17:SetRewardIcon(v72, v71.Content.Inner.Icon);
                    end;
                    return {
                        v71.Content.Backdrop, 
                        v71.Content.Glow
                    };
                end;
                v62.rewardsVisualizer = v20.new({}, {
                    template = v62.rewardTemplate, 
                    parent = if v62.isLobbyOwner then v62.rewardsBin else v62.startInfo.Rewards.Bin, 
                    renderMethod = v78
                });
                if v62.isLobbyOwner then
                    v62.firstTimeRewardsVisualizer = v20.new({}, {
                        template = v62.rewardTemplate, 
                        parent = v62.firstTimeBin.Reward, 
                        Size = UDim2.fromScale(1, 1), 
                        Position = UDim2.fromScale(0.5, 0.55), 
                        renderMethod = v78
                    });
                    v62.queueDump:Add(v62.firstTimeRewardsVisualizer);
                end;
                if v62.isLobbyOwner then
                    v62.startScreen.Visible = false;
                    v62.selectionScreen.Visible = true;
                    v62.main.BackgroundTransparency = 0.5;
                    v62:UpdateInfoScreen(true);
                    task.delay(0.2, function() --[[ Line: 325 ]]
                        -- upvalues: v37 (ref), v36 (ref), l_GuiService_0 (ref), v62 (ref)
                        if v37:IsConsole() and v36:GetToggleState(script.Name) then
                            l_GuiService_0.SelectedObject = v62._worldButtons["1"];
                        end;
                    end);
                else
                    v62:ShowStartScreen();
                end;
                v36:Toggle(script.Name, true);
                v62.queueDump:Add(v62:_onChanged("FriendsOnly", function(v79) --[[ Line: 337 ]]
                    -- upvalues: v52 (ref)
                    v52:Dispatch(v52.Actions.SetFriendsMode(v79));
                end, true));
                local v80 = nil;
                local v81 = nil;
                v62.startTimerBar.Bar.Fill.Size = UDim2.fromScale(0, 1);
                v62.queueDump:Add(v62:_onChanged("selectionTimeLeft", function(v82) --[[ Line: 346 ]]
                    -- upvalues: v62 (ref), v17 (ref), v80 (ref), v12 (ref), l_TweenService_0 (ref)
                    v62.stageTimerBar.Bar.Timer.Text = v17:FormatTimeFromSeconds(math.max(0, v82) or 0);
                    if v80 then
                        return;
                    else
                        local v83 = math.clamp(1 - v82 / v12.QUEUE.MAX_SELECTION_TIME, 0, v12.QUEUE.MAX_SELECTION_TIME);
                        v62.stageTimerBar.Bar.Fill.Size = UDim2.fromScale(v83, 1);
                        local v84 = TweenInfo.new(v82, Enum.EasingStyle.Linear);
                        v80 = l_TweenService_0:Create(v62.stageTimerBar.Bar.Fill, v84, {
                            Size = UDim2.fromScale(1, 1)
                        });
                        v80:Play();
                        v62.queueDump:Add(v80);
                        return;
                    end;
                end, true));
                local v85 = 0;
                v62.queueDump:Add(v62:_onChanged("startTimeLeft", function(v86) --[[ Line: 370 ]]
                    -- upvalues: v62 (ref), v17 (ref), v85 (ref), v81 (ref), l_TweenService_0 (ref)
                    if v62.queueReplica.Data.Mode == "TowerOfKarate" then
                        if not v62.queueReplica.Data.confirmedFloor then
                            return;
                        end;
                    elseif not v62.queueReplica.Data.confirmedMap then
                        return;
                    end;
                    local v87 = math.max(0, v86.timeLeft - (workspace:GetServerTimeNow() - v86.sent));
                    v62.startTimerBar.Bar.Timer.Text = v17:FormatTimeFromSeconds(v87 or 0);
                    if v86.max == v85 then
                        return;
                    else
                        v85 = v86.max;
                        if v81 then
                            v81:Cancel();
                            v81:Destroy();
                        end;
                        local v88 = math.clamp(1 - v87 / v86.max, 0, v86.max);
                        v62.startTimerBar.Bar.Fill.Size = UDim2.fromScale(v88, 1);
                        local v89 = TweenInfo.new(v87, Enum.EasingStyle.Linear);
                        v81 = l_TweenService_0:Create(v62.startTimerBar.Bar.Fill, v89, {
                            Size = UDim2.fromScale(1, 1)
                        });
                        v81:Play();
                        v62.queueDump:Add(v81);
                        return;
                    end;
                end, true));
                v62.queueDump:Add(v62:_onChanged("confirmedFloor", function(v90) --[[ Line: 410 ]]
                    -- upvalues: v62 (ref)
                    if not v90 or v62.startScreen.Visible then
                        return;
                    else
                        v62:ShowStartScreen();
                        return;
                    end;
                end, true));
                v62.queueDump:Add(v62:_onChanged("Players", function(v91) --[[ Line: 419 ]]
                    -- upvalues: v62 (ref), v35 (ref), v17 (ref), v12 (ref)
                    for v92 = 1, #v62._playerFrames do
                        local v93 = v62._playerFrames[v92];
                        local v94 = v91[v92];
                        if not v94 then
                            v93.Icon.Image = "";
                            v93.Visible = false;
                        else
                            v35:Get(v94, "PlayerStats"):andThen(function(v95) --[[ Line: 430 ]]
                                -- upvalues: v93 (copy), v17 (ref)
                                local v96 = v95.Prestige or 0;
                                local v97 = v95.Level or 1;
                                v93.PlayerLevel.Prestige.Image = v17:GetPrestigeIcon(v96, v97);
                                v93.PlayerLevel.Prestige.Visible = v96 >= 1;
                                v93.PlayerLevel.UIPadding:SetAttribute("OriginalPaddingRight", UDim.new(0, v96 >= 1 and 30 or 0));
                            end);
                            v93.Icon.Image = string.format(v12.PLAYER_IMAGE_URL, v94.UserId);
                            v93.Visible = true;
                        end;
                    end;
                end, true));
                v62.queueDump:Add(v62:_onChanged("PlayerLevels", function(v98) --[[ Line: 445 ]]
                    -- upvalues: v62 (ref)
                    for v99 = 1, #v62._playerFrames do
                        local v100 = v62._playerFrames[v99];
                        local v101 = v98[v99];
                        if v101 then
                            v100.PlayerLevel.PlayerLevel.Text = ("LVL %*"):format(v101);
                        end;
                    end;
                end, true));
                v62.queueDump:Add(v62.rewardsVisualizer);
                v68:AddCleanupTask(function() --[[ Line: 460 ]]
                    -- upvalues: v54 (ref), v62 (ref), v36 (ref)
                    v54:Destroy();
                    if v62.queueDump then
                        v62.queueDump:Destroy();
                    end;
                    if v62._bossViewport then
                        v62._bossViewport:Destroy();
                        v62._bossViewport = nil;
                    end;
                    v62.rewardsVisualizer = nil;
                    v62.firstTimeRewardsVisualizer = nil;
                    v62._currentBoss = nil;
                    v36:Toggle(script.Name, false);
                end);
                return;
            end;
        end;
    end);
end;
v53.Opened = function(v102) --[[ Line: 481 ]] --[[ Name: Opened ]]
    v102.optionsButtons.Visible = true;
    v102.selectInfo.Visible = true;
end;
v53.Closed = function(v103) --[[ Line: 488 ]] --[[ Name: Closed ]]
    v103.selectionScreen.Visible = true;
    v103.startScreen.Visible = false;
    if v103.conditionTooltip then
        v103.conditionTooltip:Destroy();
    end;
end;
v53.SelectWorld = function(v104, v105, v106) --[[ Line: 500 ]] --[[ Name: SelectWorld ]]
    -- upvalues: v52 (copy), v9 (copy), v34 (copy), v33 (copy)
    v104.optionsButtons.Visible = true;
    v104.selectInfo.Visible = true;
    local l_v52_State_1 = v52:GetState();
    if not v106 and l_v52_State_1.selectionData.world == v105 then
        if v105 then
            v9:Warn("Already selected world", v105);
        end;
        return;
    elseif not v34.isFloorUnlocked(v105, v104._karateData) then
        v9:Warn("Floor not unlocked", v105);
        return;
    else
        v104.mode = v104.defaultMode;
        v52:Dispatch(v52.Actions.SetSelectionData({
            world = v105 or 1, 
            StartFloor = v105, 
            chapter = 1, 
            difficulty = l_v52_State_1.selectionData.difficulty or 1, 
            endless = v33.MAX_FLOORS < v105
        }));
        return;
    end;
end;
v53.SelectDifficulty = function(v108, v109) --[[ Line: 531 ]] --[[ Name: SelectDifficulty ]]
    -- upvalues: v52 (copy), v9 (copy), v12 (copy), v33 (copy)
    local l_v52_State_2 = v52:GetState();
    if l_v52_State_2.selectionData.difficulty == v109 then
        v9:Warn("Already selected difficulty", v12.DIFFICULTY_NAMES[v109]);
        return;
    else
        v108.mode = v108.defaultMode;
        v52:Dispatch(v52.Actions.SetSelectionData({
            floor = l_v52_State_2.selectionData.StartFloor or 1, 
            world = l_v52_State_2.selectionData.world or 1, 
            chapter = l_v52_State_2.selectionData.chapter or 1, 
            difficulty = v109 or 1, 
            endless = l_v52_State_2.selectionData.StartFloor > v33.MAX_FLOORS
        }));
        return;
    end;
end;
v53.GetClearsData = function(v111) --[[ Line: 551 ]] --[[ Name: GetClearsData ]]
    -- upvalues: v52 (copy)
    local l_v52_State_3 = v52:GetState();
    local v113 = l_v52_State_3.selectionData.StartFloor or 1;
    local v114 = l_v52_State_3.selectionData.difficulty or 1;
    local v115 = {
        TotalCompletions = 0, 
        FastestClear = "N/A", 
        BestEndlessWaves = 0, 
        BestEndlessTime = "N/A"
    };
    local v116 = v111._karateClears[tostring(v113)];
    return v116 and v116[tostring(v114)] or v115;
end;
v53.IsNightmareUnlocked = function(v117) --[[ Line: 570 ]] --[[ Name: IsNightmareUnlocked ]]
    -- upvalues: v52 (copy), v34 (copy), v12 (copy)
    local l_v52_State_4 = v52:GetState();
    local v119 = l_v52_State_4.selectionData.StartFloor or 1;
    local v120 = l_v52_State_4.selectionData.difficulty or 1;
    local v121 = v117._karateClears[tostring(v119)];
    local v122 = v34.isDifficultyUnlocked(3, v121);
    local v123 = v12.DIFFICULTY_NAMES[v120];
    v117.difficultyButtons.Nightmare.Content.Unselected.Visible = v122 and v123 ~= "Nightmare";
    v117.difficultyButtons.Nightmare.Content.Locked.Visible = not v122;
    return v122;
end;
v53.IsDavyJonesUnlocked = function(v124) --[[ Line: 584 ]] --[[ Name: IsDavyJonesUnlocked ]]
    -- upvalues: v52 (copy), v34 (copy), v12 (copy)
    local l_v52_State_5 = v52:GetState();
    local v126 = l_v52_State_5.selectionData.StartFloor or 1;
    local v127 = l_v52_State_5.selectionData.difficulty or 1;
    local v128 = v124._karateClears[tostring(v126)];
    local v129 = v34.isDifficultyUnlocked(4, v128);
    local v130 = v12.DIFFICULTY_NAMES[v127];
    v124.difficultyButtons.DavyJones.Content.Unselected.Visible = v129 and v130 ~= "Davy Jones";
    v124.difficultyButtons.DavyJones.Content.Locked.Visible = not v129;
    return v129;
end;
v53.UpdateDifficultyUnlocks = function(v131) --[[ Line: 599 ]] --[[ Name: UpdateDifficultyUnlocks ]]
    -- upvalues: v17 (copy)
    for v132, v133 in v131._myCompletions.Worlds do
        v131._chapterNightmareUnlocked[v132] = {};
        v131._chapterDavyJonesUnlocked[v132] = {};
        for v134 in v133 do
            v134 = tonumber(v134);
            local v135 = v17:CanPlayNightmare(v131._myCompletions, v132, v134);
            local v136 = v17:CanPlayDavyJones(v131._myCompletions, v132, v134);
            v131._chapterNightmareUnlocked[v132][v134] = v135;
            v131._chapterDavyJonesUnlocked[v132][v134] = v136;
        end;
    end;
end;
v53.UpdateInfoScreen = function(v137, v138) --[[ Line: 615 ]] --[[ Name: UpdateInfoScreen ]]
    -- upvalues: v52 (copy), v11 (copy), v17 (copy), v33 (copy), v12 (copy), v16 (copy), v30 (copy)
    local l_v52_State_6 = v52:GetState();
    local v140 = if v138 then v137.queueReplica.Data.Stage else l_v52_State_6.selectionData.world or 1;
    local v141 = if v138 then v137.queueReplica.Data.StartFloor else l_v52_State_6.selectionData.StartFloor or 1;
    local v142 = if v138 then v137.queueReplica.Data.Chapter else l_v52_State_6.selectionData.chapter or 1;
    local v143 = if v138 then v137.queueReplica.Data.Difficulty else l_v52_State_6.selectionData.difficulty or 1;
    local v144 = if v138 then v137.mode == "Endless" else l_v52_State_6.selectionData.endless or false;
    local v145 = v142 == 1 and "A" or "B";
    local v146 = 1;
    if v144 and v145 == "B" then
        v146 = 2;
    end;
    if v138 then
        v137:SelectWorld(v141, true);
    end;
    if not v143 or not v140 or not v142 then
        return;
    else
        local l_v11_WorldData_0 = v11:GetWorldData(v137.mode, v140);
        local l_v11_ChapterData_0 = v11:GetChapterData(v137.mode, v140, v142);
        v137:IsNightmareUnlocked();
        v137:IsDavyJonesUnlocked();
        local v149 = v137:GetClearsData()[v144 and "BestEndlessTime" or "FastestClear"] or "N/A";
        if typeof(v149) == "number" then
            v149 = v17:FormatTimeFromSeconds(v149);
        end;
        local v150 = v33.MAX_FLOORS < v141;
        if v150 then
            v137.selectInfo.Content.ChapterTitle.Chapter.ChapterOrder.Text = "Floors 101+";
            v137.difficultyButtons.Visible = false;
            v137.firstTimeBin.Visible = false;
        else
            v137.selectInfo.Content.ChapterTitle.Chapter.ChapterOrder.Text = ("Floors %* - %*"):format(v141, v141 + 10 - 1);
            v137.difficultyButtons.Visible = true;
            v137.firstTimeBin.Visible = true;
        end;
        v137.selectInfo.Content.ChapterTitle.Chapter.ChapterName.Text = v33.SECTION_NAMES[v141];
        v137.worldInfo.TotalClears.Amount.Text = v17:CommaNumber(v137._karateData.HighestFloor);
        v137.worldInfo.TotalClears.Title.Text = v150 and "Best Floor:" or "Total Cleared:";
        v137.worldInfo.FastestClear.Amount.Text = v149;
        v137.worldInfo.FastestClear.Visible = not v150;
        local v151 = v12.DIFFICULTY_NAMES[v143] or "Normal";
        v137.selectInfo.Content.DifficultyGradient.Offset = Vector2.new(0, 1);
        v137.selectInfo.Content.DifficultyGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, v16.Solid[v151]), 
            ColorSequenceKeypoint.new(1, v16.Solid[v151])
        });
        v137.difficultyGradientTween:Play();
        local v152 = v30.Get("Game", "TowerOfKarate", 1);
        if not v152 then
            local v153 = l_v11_ChapterData_0.WorldImage or l_v11_WorldData_0.WorldImage;
            for v154, v155 in v153 do
                v137.selectInfo.WorldImage[v154] = v155;
            end;
            v137.selectInfo.WorldImage.ImageColor3 = Color3.new(1, 1, 1);
            return;
        else
            for v156, v157 in {
                Image = "background", 
                ImageColor3 = "backgroundColor"
            } do
                v137.selectInfo.WorldImage[v156] = v152[v157];
            end;
            v137.selectInfo.WorldImage.ImageRectOffset = Vector2.new(0, 125);
            v137.selectInfo.WorldImage.ImageRectSize = Vector2.new(1000, 400);
            return;
        end;
    end;
end;
v53.UpdateStartScreen = function(v158) --[[ Line: 729 ]] --[[ Name: UpdateStartScreen ]]
    -- upvalues: v12 (copy), v33 (copy), v11 (copy), v30 (copy), v17 (copy), v34 (copy)
    if not v158.queueReplica then
        return;
    else
        local l_StartFloor_0 = v158.queueReplica.Data.StartFloor;
        local l_Stage_0 = v158.queueReplica.Data.Stage;
        local l_Chapter_0 = v158.queueReplica.Data.Chapter;
        local l_Difficulty_0 = v158.queueReplica.Data.Difficulty;
        local v163 = v12.DIFFICULTY_NAMES[l_Difficulty_0];
        local v164 = true;
        if v158.mode ~= "Endless" then
            v164 = v33.MAX_FLOORS < l_StartFloor_0;
        end;
        local v165 = l_Chapter_0 == 1 and "A" or "B";
        local v166 = 2;
        if v164 and v165 == "B" then
            v166 = 2;
        end;
        local l_v11_WorldData_1 = v11:GetWorldData(v158.mode, l_Stage_0);
        local l_v11_ChapterData_1 = v11:GetChapterData(v158.mode, l_Stage_0, l_Chapter_0);
        local l_LevelRequirement_0 = v158.startInfo.Info.Inner.LevelRequirement;
        local _ = l_LevelRequirement_0.Title;
        l_LevelRequirement_0.Visible = false;
        v158.startInfo.Info.Inner.Difficulties.Visible = true;
        if l_StartFloor_0 < v33.MAX_FLOORS then
            v158.startInfo.Info.Inner.ChapterOrder.Text = ("Floors %* - %*"):format(l_StartFloor_0, l_StartFloor_0 + 10 - 1);
        else
            v158.startInfo.Info.Inner.ChapterOrder.Text = "Floors 101+";
        end;
        v158.startInfo.Info.Inner.ChapterName.Text = v33.SECTION_NAMES[l_StartFloor_0];
        local v171 = v30.Get("Game", "TowerOfKarate", 1);
        if not v171 then
            local v172 = l_v11_ChapterData_1.WorldImage or l_v11_WorldData_1.WorldImage;
            for v173, v174 in v172 do
                v158.startInfo.Info.WorldImage[v173] = v174;
            end;
            v158.startInfo.Info.WorldImage.ImageColor3 = Color3.new(1, 1, 1);
            return;
        else
            for v175, v176 in {
                Image = "background", 
                ImageColor3 = "backgroundColor"
            } do
                v158.startInfo.Info.WorldImage[v175] = v171[v176];
            end;
            v158.startInfo.Info.WorldImage.ImageRectOffset = Vector2.new(0, 125);
            v158.startInfo.Info.WorldImage.ImageRectSize = Vector2.new(1000, 400);
            for _, v178 in v158.startInfo.Info.Inner.Difficulties:GetChildren() do
                if v178:IsA("Frame") then
                    if v164 then
                        v178.Visible = false;
                    else
                        v178.Visible = v178.Name == v163;
                    end;
                end;
            end;
            v17:IterateClass(v158.conditionsFrame, "TextButton", function(v179) --[[ Line: 811 ]]
                v179:Destroy();
            end);
            local v180 = {};
            local v181 = v34.getCoinEarningsForTower(l_StartFloor_0, l_Difficulty_0);
            table.insert(v180, {
                type = "Currency", 
                name = "Swashbucks", 
                amount = 10
            });
            table.insert(v180, {
                type = "Currency", 
                name = "KarateCoins", 
                amount = v181
            });
            table.insert(v180, {
                type = "Misc", 
                name = "BeltXP"
            });
            if v158.isLobbyOwner then
                v158.rewardsVisualizer:Reparent(v158.startInfo.Rewards.Bin);
                return;
            else
                v158.rewardsVisualizer:ChangeRewards(v180, v158.startInfo.Rewards.Bin);
                return;
            end;
        end;
    end;
end;
v53.ShowStartScreen = function(v182) --[[ Line: 830 ]] --[[ Name: ShowStartScreen ]]
    -- upvalues: v37 (ref), v36 (ref), l_GuiService_0 (copy)
    v182:UpdateStartScreen();
    v182.selectionScreen.Visible = false;
    v182.startScreen.Visible = true;
    v182.startOptions.Start.Visible = v182.isLobbyOwner;
    v182.startOptions.Visible = true;
    v182.main.BackgroundTransparency = 1;
    if v37:IsConsole() and v36:GetToggleState(script.Name) and v182.isLobbyOwner then
        l_GuiService_0.SelectedObject = v182.startOptions.Start;
    end;
end;
v53.UpdateLockedLevelStates = function(v183, v184) --[[ Line: 847 ]] --[[ Name: UpdateLockedLevelStates ]]
    -- upvalues: v34 (copy)
    if (v184 or {
        UpdateWorlds = true, 
        UpdateChapters = true
    }).UpdateWorlds then
        for v185, v186 in v183._worldButtons do
            local v187 = v34.isFloorUnlocked(tonumber(v185), v183._karateData);
            v186:SetAttribute("IS_UNLOCKED", v187);
            v186.Content.Locked.Visible = not v187;
        end;
    end;
end;
v53._onChanged = function(v188, v189, v190, v191) --[[ Line: 859 ]] --[[ Name: _onChanged ]]
    if not v188.queueReplica then
        return;
    else
        if v191 and v188.queueReplica.Data[v189] ~= nil then
            v190(v188.queueReplica.Data[v189]);
        end;
        return v188.queueReplica:ListenToChange(v189, v190);
    end;
end;
v53._fireServer = function(v192, v193, ...) --[[ Line: 872 ]] --[[ Name: _fireServer ]]
    if v192.queueReplica then
        v192.queueReplica:FireServer(v193, ...);
    end;
end;
v53._isKickPlayerInput = function(_, v195) --[[ Line: 879 ]] --[[ Name: _isKickPlayerInput ]]
    if not v195 then
        return false;
    elseif v195.UserInputType == Enum.UserInputType.MouseButton2 then
        return true;
    elseif v195.UserInputType == Enum.UserInputType.Touch then
        return true;
    elseif v195.KeyCode == Enum.KeyCode.ButtonR2 then
        return true;
    else
        return false;
    end;
end;
v53._connectLobbyOptions = function(v196) --[[ Line: 896 ]] --[[ Name: _connectLobbyOptions ]]
    -- upvalues: v36 (ref), v52 (copy), v33 (copy), v53 (copy), v37 (ref)
    v36:HandleButton(v196.readyButton, function() --[[ Line: 897 ]]
        -- upvalues: v52 (ref), v33 (ref), v196 (copy)
        local l_v52_State_7 = v52:GetState();
        local v198 = l_v52_State_7.selectionData.StartFloor or 1;
        local v199 = v33.MAX_FLOORS < v198 and 2 or l_v52_State_7.selectionData.difficulty or 1;
        v196:_fireServer("ConfirmKarateFloor", {
            StartFloor = v198, 
            Difficulty = v199
        });
    end);
    v36:HandleButton(v196.leaveButton, function() --[[ Line: 914 ]]
        -- upvalues: v53 (ref)
        v53:_fireServer("LeaveQueue");
    end);
    v37:ObserveGamepadButtonPress(Enum.KeyCode.ButtonB, function() --[[ Line: 918 ]]
        -- upvalues: v53 (ref)
        v53:_fireServer("LeaveQueue");
    end);
    v36:HandleButton(v196.friendsOnlyButton, function() --[[ Line: 922 ]]
        -- upvalues: v196 (copy)
        v196:_fireServer("ToggleFriendsOnly");
    end);
end;
v53._connectWorldButtons = function(v200) --[[ Line: 928 ]] --[[ Name: _connectWorldButtons ]]
    -- upvalues: v17 (copy), v36 (ref)
    v17:IterateClass(v200.stageSelect.Map, "TextButton", function(v201) --[[ Line: 929 ]]
        -- upvalues: v200 (copy), v36 (ref)
        v201.Content.Locked.Visible = false;
        local l_v201_Attribute_0 = v201:GetAttribute("Floor");
        v200._worldButtons[tostring(l_v201_Attribute_0)] = v201;
        v36:HandleButton(v201, function() --[[ Line: 935 ]]
            -- upvalues: l_v201_Attribute_0 (copy), v200 (ref)
            if not l_v201_Attribute_0 then
                return;
            else
                v200:SelectWorld(l_v201_Attribute_0);
                return;
            end;
        end);
    end);
end;
v53._connectDifficultyButtons = function(v203) --[[ Line: 946 ]] --[[ Name: _connectDifficultyButtons ]]
    -- upvalues: v23 (copy), v12 (copy), v36 (ref)
    v203._difficultyButtons = v23(v203.difficultyButtons, nil, function(v204) --[[ Line: 947 ]]
        -- upvalues: v12 (ref), v36 (ref), v203 (copy)
        local v205 = v204.Name == "Nightmare";
        local v206 = v204.Name == "DavyJones";
        local v207 = v12.DIFFICULTY_INDEX[v204.Name];
        if v206 then
            v207 = 4;
        end;
        v36:HandleButton(v204, function() --[[ Line: 956 ]]
            -- upvalues: v205 (copy), v203 (ref), v206 (copy), v204 (copy), v207 (ref)
            if v205 and not v203:IsNightmareUnlocked() or v206 and not v203:IsDavyJonesUnlocked() then
                v204.Content.Unselected.Visible = false;
                return;
            else
                v203:SelectDifficulty(v207);
                return;
            end;
        end);
    end, true);
end;
v53._listenToStateChanges = function(v208) --[[ Line: 969 ]] --[[ Name: _listenToStateChanges ]]
    -- upvalues: v52 (copy), v57 (copy), v59 (copy), v12 (copy), v34 (copy), v54 (copy), v33 (copy)
    v52:Watch(v57, function(v209) --[[ Line: 971 ]]
        -- upvalues: v208 (copy)
        v208.friendsOnlyButton.Content.IsEnabled.Visible = v209;
    end);
    v52:Watch(v59, function(v210) --[[ Line: 975 ]]
        -- upvalues: v208 (copy), v12 (ref), v52 (ref), v34 (ref), v54 (ref), v33 (ref)
        local l_StartFloor_1 = v210.StartFloor;
        local _ = v210.world;
        local l_chapter_0 = v210.chapter;
        local l_difficulty_0 = v210.difficulty;
        local l_endless_0 = v210.endless;
        local v216 = l_chapter_0 == 1 and "Endless_A" or "Endless_B";
        if not l_StartFloor_1 or not l_difficulty_0 then
            return;
        else
            v208:UpdateInfoScreen();
            for v217, v218 in v208._worldButtons do
                local v219 = v217 == tostring(l_StartFloor_1);
                v218.Content.Deselected.Visible = not v219;
            end;
            local v220 = v12.DIFFICULTY_NAMES[l_difficulty_0];
            for v221, v222 in v208._difficultyButtons do
                if v222.Content.Locked.Visible then
                    v222.Content.Unselected.Visible = false;
                    v222.Glow.Visible = false;
                else
                    if v221 == "DavyJones" then
                        v221 = "Davy Jones";
                    end;
                    v222.Content.Unselected.Visible = v221 ~= v220;
                    v222.Glow.Visible = v221 == v220;
                end;
            end;
            for v223, v224 in v208._chapterButtons do
                if v223 ~= "1" and not v224:GetAttribute("IS_UNLOCKED") then
                    v224.Content.Size = UDim2.fromScale(1, 1);
                    v224.Content.Deselected.Visible = false;
                else
                    local v225 = if l_endless_0 then v223 == v216 else v223 == tostring(l_chapter_0);
                    v224.Content.Size = if not v225 then UDim2.fromScale(1, 1) else UDim2.fromScale(1.1, 1.1);
                    v224.Content.Deselected.Visible = not v225;
                end;
            end;
            local _ = v52:GetState();
            local v227 = {};
            local v228 = v34.getCoinEarningsForTower(l_StartFloor_1, l_difficulty_0);
            table.insert(v227, {
                type = "Currency", 
                name = "Swashbucks", 
                amount = 10
            });
            table.insert(v227, {
                type = "Currency", 
                name = "KarateCoins", 
                amount = v228
            });
            table.insert(v227, {
                type = "Misc", 
                name = "BeltXP"
            });
            v208.rewardsVisualizer:ChangeRewards(v227, v208.rewardsBin);
            v54:Destroy();
            if v208.firstTimeRewardsVisualizer then
                local v229 = {};
                table.insert(v229, {
                    type = "Currency", 
                    name = "KarateCoins", 
                    amount = math.floor(v228 * 0.5)
                });
                v208.firstTimeRewardsVisualizer:ChangeRewards(v229);
            end;
            if v33.MAX_FLOORS <= l_StartFloor_1 then
                return;
            else
                local v230 = v208._karateClears[tostring(l_StartFloor_1)];
                v230 = v230 and v230[tostring(l_difficulty_0)];
                local v231 = v230 and v230.LastDailyReward or -86400;
                local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                local v233 = l_workspace_ServerTimeNow_0 - v231;
                v208.firstTimeBin.Reward.Earned.Visible = v233 < v33.DAILY_CLEAR_INTERVAL;
                if v208.dailyDelayThread then
                    task.cancel(v208.dailyDelayThread);
                    v208.dailyDelayThread = nil;
                end;
                if not v208.firstTimeBin.Reward.Earned.Visible then
                    return;
                else
                    local v234 = v231 + v33.DAILY_CLEAR_INTERVAL - l_workspace_ServerTimeNow_0;
                    v208.dailyDelayThread = task.delay(v234, function() --[[ Line: 1198 ]]
                        -- upvalues: v208 (ref)
                        v208.firstTimeBin.Reward.Earned.Visible = false;
                        v208.dailyDelayThread = nil;
                    end);
                    return;
                end;
            end;
        end;
    end);
end;
v53._initSelectionScreen = function(v235) --[[ Line: 1206 ]] --[[ Name: _initSelectionScreen ]]
    v235:_connectLobbyOptions();
    v235:_connectWorldButtons();
    v235:_connectDifficultyButtons();
    v235:_listenToStateChanges();
    v235:UpdateLockedLevelStates({
        UpdateWorlds = true
    });
end;
v53._initStartScreen = function(v236) --[[ Line: 1215 ]] --[[ Name: _initStartScreen ]]
    -- upvalues: v36 (ref), v53 (copy), v23 (copy)
    v36:HandleButton(v236.startOptions.Start, function() --[[ Line: 1217 ]]
        -- upvalues: v236 (copy)
        v236:_fireServer("StartGame");
    end);
    v36:HandleButton(v236.startOptions.Leave, function() --[[ Line: 1221 ]]
        -- upvalues: v53 (ref)
        v53:_fireServer("LeaveQueue");
    end);
    v23(v236.startPlayers, nil, function(v237) --[[ Line: 1225 ]]
        -- upvalues: v236 (copy)
        local v238 = tonumber(string.match(v237.Name, "%d+"));
        if not v238 then
            return;
        else
            v237.Visible = false;
            v236._playerFrames[v238] = v237;
            return;
        end;
    end);
end;
v53._renderBossViewport = function(v239, v240) --[[ Line: 1239 ]] --[[ Name: _renderBossViewport ]]
    -- upvalues: v9 (copy), v19 (copy), l_TweenService_0 (copy)
    if not v240 then
        return;
    elseif not v239.isLobbyOwner then
        v9:Warn("Not generating boss viewport since client is not the Queue owner");
        return;
    else
        local v241 = v240.Name or v240.UnitName;
        if v239._currentBoss == v241 then
            return;
        else
            v239._currentBoss = v241;
            if v239._bossViewport then
                v239._bossViewport:Destroy();
            end;
            v239._bossViewport = v19.new(v239.selectInfo.Content.Boss, v241, {
                isEnemy = true, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.fromScale(1.25, 1), 
                Position = UDim2.fromScale(0.5, 0), 
                positionAttribute = "QueueOffset"
            });
            if v239._bossViewport then
                v239._bossViewport.viewHandler.viewport.Position = UDim2.fromScale(0.75, 0);
                task.delay(0.1, function() --[[ Line: 1272 ]]
                    -- upvalues: v239 (copy), l_TweenService_0 (ref)
                    if v239._bossViewport and v239._bossViewport.viewHandler and v239._bossViewport.viewHandler.viewport then
                        l_TweenService_0:Create(v239._bossViewport.viewHandler.viewport, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                            Position = UDim2.fromScale(0.5, 0)
                        }):Play();
                    end;
                end);
            end;
            return;
        end;
    end;
end;
v53._renderUnfeaturedLoot = function(v242, v243, v244, v245) --[[ Line: 1282 ]] --[[ Name: _renderUnfeaturedLoot ]]
    -- upvalues: v21 (copy), v17 (copy), v25 (copy), v24 (copy), v26 (copy), v27 (copy), v16 (copy), v36 (ref)
    local v246 = 999999;
    for _, v248 in v243 do
        if v248.type == "RandomUnit" or v248.type == "Unit" then
            v246 = v246 * -1;
            break;
        end;
    end;
    local v249 = v242.rewardTemplate:Clone();
    v249.Name = "LOOT_ITEM_REWARDS";
    v249.LayoutOrder = v246;
    v249.Visible = true;
    v249.Content.Inner.Mystery.Visible = true;
    v249.Parent = v244;
    local v250 = 0;
    local v251 = #v243;
    local v252 = {
        v249.Content.Backdrop, 
        v249.Content.Glow
    };
    v245:Add(v21.Simple(1, function() --[[ Line: 1307 ]]
        -- upvalues: v250 (ref), v251 (copy), v243 (copy), v17 (ref), v249 (copy), v25 (ref), v24 (ref), v26 (ref), v27 (ref), v16 (ref), v252 (copy)
        v250 = v250 + 1;
        if v251 < v250 then
            v250 = 1;
        end;
        local v253 = v243[v250];
        local v254 = v17:GetRewardRarity(v253) or "Common";
        local v255 = v253.extraData or v253.ExtraData;
        v249.Content.Inner.Shiny.Visible = v255 and v255.Shiny or false;
        v249.Content.Inner.Wumbo.Visible = v255 and v255.Mega or v255.Wumbo or false;
        if v253.type == "Unit" then
            v254 = select(2, v25:GetRarity(v253.name));
            v24:SetImage(v249.Content.Inner.Icon, v253.name);
        elseif v253.type == "Pet" then
            v254 = select(2, v26:GetRarity(v253.name));
            v27:SetImage(v249.Content.Inner.Icon, v253.name);
        else
            v17:SetRewardIcon(v253, v249.Content.Inner.Icon);
        end;
        local v256 = v17:Color3ToHex(v16.Solid.Gold);
        v249.Content.Inner.Amount.RichText = true;
        v249.Content.Inner.Amount.Text = ("x%* <font color=\"%*\">%%%*</font>"):format(v253.amount or 1, v256, v253.weight or 1);
        for _, v258 in v252 do
            v258:RemoveTag("VisualizeRarity");
            v258:SetAttribute("Rarity", v254);
            v258:AddTag("VisualizeRarity");
        end;
    end, true));
    v245:Add(v36:HandleButton(v249));
    v245:Add(v249);
end;
v53._setupReadyButtonVisual = function(v259) --[[ Line: 1352 ]] --[[ Name: _setupReadyButtonVisual ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_Confirm_0 = v259.optionsButtons.Options.Confirm;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    l_Frame_0.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.Size = UDim2.fromScale(1, 1);
    l_Frame_0.Name = "Highlight";
    l_Frame_0.ZIndex = 99;
    l_Frame_0.Parent = l_Confirm_0;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(0, 18);
    l_UICorner_0.Parent = l_Frame_0;
    local v263 = Vector2.new(-1.5, 0);
    local v264 = Vector2.new(1.5, 0);
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Offset = v263;
    l_UIGradient_0.Rotation = 45;
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.1, 1), 
        NumberSequenceKeypoint.new(0.299, 0.5), 
        NumberSequenceKeypoint.new(0.3, 0.2), 
        NumberSequenceKeypoint.new(0.7, 0.2), 
        NumberSequenceKeypoint.new(0.701, 0.5), 
        NumberSequenceKeypoint.new(0.9, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    l_UIGradient_0.Parent = l_Frame_0;
    local v266 = TweenInfo.new(4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
    local v267 = l_TweenService_0:Create(l_UIGradient_0, v266, {
        Offset = v264
    });
    v267.Completed:Connect(function() --[[ Line: 1388 ]]
        -- upvalues: l_UIGradient_0 (copy), v263 (copy), v267 (copy)
        l_UIGradient_0.Offset = v263;
        task.wait(Random.new():NextNumber(0.2, 2));
        v267:Play();
    end);
    v267:Play();
end;
return v53;