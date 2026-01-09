local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v7 = require(l_ReplicatedStorage_0.Packages.Silo);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v10 = require(l_ReplicatedStorage_0.ReplicaController);
local v11 = require(l_ReplicatedStorage_0.Levels);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local _ = require(l_ReplicatedStorage_0.Shared.Data.EnemyShared);
local v15 = require(l_ReplicatedStorage_0.Shared.Data.CraftingData);
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
local v28 = require(v4.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v29 = require(l_ReplicatedStorage_0.Shared.Data.Missions);
local v30 = require(l_ReplicatedFirst_0.GetLoadingScreen);
local v31 = require(l_ReplicatedStorage_0.Shared.Data.TurfWarsQuests);
local v32 = require(l_ReplicatedStorage_0.TraitsData);
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v50 = v7.new({
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
    SetFriendsMode = function(v40, v41) --[[ Line: 74 ]]
        v40.friendsMode = v41;
    end, 
    SetWorld = function(v42, v43) --[[ Line: 77 ]]
        v42.selectedWorld = v43;
    end, 
    SetChapter = function(v44, v45) --[[ Line: 80 ]]
        v44.selectedChapter = v45;
    end, 
    SetDifficulty = function(v46, v47) --[[ Line: 83 ]]
        v46.selectedDifficulty = v47;
    end, 
    SetSelectionData = function(v48, v49) --[[ Line: 86 ]]
        v48.selectionData = v49;
    end
});
local v51 = {
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
local v52 = v5.new();
local function _() --[[ Line: 110 ]] --[[ Name: leaveLobby ]]
    -- upvalues: v51 (copy)
    v51:_fireServer("LeaveQueue");
end;
local function v55(v54) --[[ Line: 115 ]] --[[ Name: selectFriendsMode ]]
    return v54.friendsMode;
end;
local function v57(v56) --[[ Line: 119 ]] --[[ Name: selectSelectionData ]]
    return v56.selectionData;
end;
v51.Init = function(v58, v59) --[[ Line: 123 ]] --[[ Name: Init ]]
    -- upvalues: v33 (ref), v4 (copy), v34 (ref), v35 (ref), v36 (ref), v37 (ref), v38 (ref), l_TweenService_0 (copy)
    v33 = v4.GetController("DataController");
    v34 = v4.GetController("UIController");
    v35 = v4.GetController("DeviceTypeController");
    v36 = v4.GetController("EventController");
    v37 = v4.GetController("MissionController");
    v38 = v4.GetController("NPEController");
    v58.ui = v59;
    v58.main = v59.Main;
    v58.selectionScreen = v58.main.SelectionScreen;
    v58.selectionMain = v58.selectionScreen.Main;
    v58.stageSelect = v58.selectionMain.StageSelect;
    v58.stageTimerBar = v58.selectionMain.TimerBar;
    v58.selectionContent = v58.stageSelect.WorldSelect.Content;
    v58.stagesScroll = v58.selectionContent.Stages;
    v58.chapterSelect = v58.stageSelect.ChapterSelect;
    v58.firstOpenBackground = v58.stageSelect.FirstOpenBackground;
    v58.selectInfo = v58.stageSelect.Info;
    v58.difficultyButtons = v58.selectInfo.Content.Difficulties;
    v58.worldInfo = v58.selectInfo.Content.Info;
    v58.selectRewardsBin = v58.selectInfo.Content.Rewards;
    v58.optionsButtons = v58.selectionMain.Options;
    v58.readyButton = v58.selectionMain.Options.Options.Confirm;
    v58.leaveButton = v58.selectionMain.Options.Options.Leave;
    v58.friendsOnlyButton = v58.selectionMain.Options.FriendsOption.Toggle;
    v58.rewardsBin = v58.selectInfo.Content.Rewards.Main.Bin.Inner;
    v58.firstTimeBin = v58.selectInfo.Content.Rewards.Main.FirstTimeClear;
    v58.rewardTemplate = v58.rewardsBin.Template;
    v58.rewardTemplate.Parent = nil;
    v58.rewardTemplate:SetAttribute("InvertClick", true);
    v58.startScreen = v58.main.StartScreen;
    v58.startMain = v58.startScreen.Main;
    v58.startOptions = v58.startMain.Options;
    v58.startPlayers = v58.startMain.Players;
    v58.startInfo = v58.startMain.StageInfo.Inner;
    v58.startTimerBar = v58.startMain.TimerBar;
    v58.teamFrame = v58.main.Team;
    v58.loadoutFrame = v58.teamFrame.Loadout;
    v58.loadoutTemplate = v58.loadoutFrame.Template:Clone();
    v58.loadoutFrame.Template:Destroy();
    v58.conditionsFrame = v58.startInfo.Unsorted.Conditions;
    v58.conditionTemplate = v58.conditionsFrame.Template:Clone();
    v58.conditionsFrame.Template:Destroy();
    v58.difficultyGradientTween = l_TweenService_0:Create(v58.selectInfo.Content.DifficultyGradient, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Offset = Vector2.new(0, 0.2)
    });
    v58:_setupReadyButtonVisual();
end;
v51.Start = function(v60, _) --[[ Line: 190 ]] --[[ Name: Start ]]
    -- upvalues: v39 (ref), v34 (ref), v33 (ref), v4 (copy), v10 (copy), v5 (copy), v50 (copy), v17 (copy), v16 (copy), v24 (copy), v27 (copy), v20 (copy), v35 (ref), l_GuiService_0 (copy), v12 (copy), l_TweenService_0 (copy), v52 (copy)
    v39 = v34:GetModuleAsync("Achievements"):expect();
    v60._myCompletions = v33:Get(v4.Player, "Completion"):expect();
    v60._myChapterClears = v33:Get(v4.Player, "ChapterClears"):expect();
    v33:OnChanged(v4.Player, "Completion", function(v62) --[[ Line: 196 ]]
        -- upvalues: v60 (copy)
        v60._myCompletions = v62;
        v60:UpdateLockedLevelStates({
            UpdateWorlds = true
        });
        v60:UpdateDifficultyUnlocks();
    end, true);
    v33:OnChanged(v4.Player, "ChapterClears", function(v63) --[[ Line: 202 ]]
        -- upvalues: v60 (copy)
        v60._myChapterClears = v63;
    end);
    v60:_initSelectionScreen();
    v60:_initStartScreen();
    local v64 = {
        "BossBattle", 
        "Roguelike", 
        "TowerOfKarate"
    };
    v10.NewReplicaSignal:Connect(function(v65) --[[ Line: 216 ]]
        -- upvalues: v64 (copy), v60 (copy), v5 (ref), v4 (ref), v50 (ref), v17 (ref), v16 (ref), v24 (ref), v27 (ref), v20 (ref), v35 (ref), v34 (ref), l_GuiService_0 (ref), v12 (ref), l_TweenService_0 (ref), v33 (ref), v52 (ref)
        local l_Class_0 = v65.Class;
        if string.split(l_Class_0, "_")[1] ~= "Queue" then
            return;
        else
            local l_Mode_0 = v65.Data.Mode;
            if table.find(v64, l_Mode_0) ~= nil then
                return;
            else
                v60.queueDump = v5.new();
                v60.queueReplica = v65;
                v60.isLobbyOwner = v65.Data.LobbyOwner == v4.Player;
                v60.mode = l_Mode_0;
                v60.defaultMode = v60.mode;
                local function v74(v68, v69) --[[ Line: 237 ]] --[[ Name: renderReward ]]
                    -- upvalues: v50 (ref), v60 (ref), v17 (ref), v16 (ref), v24 (ref), v27 (ref)
                    local v70 = v50:GetState().selectionData.endless or v60.mode == "Endless";
                    local v71 = v69.extraData or v69.ExtraData;
                    v68.Content.Inner.Shiny.Visible = v71 and v71.Shiny or false;
                    v68.Content.Inner.Wumbo.Visible = v71 and v71.Wumbo or false;
                    if v69.weight and v69.weight < 100 then
                        local v72 = v17:Color3ToHex(v16.Solid.Gold);
                        v68.Content.Inner.Amount.RichText = true;
                        v68.Content.Inner.Amount.Text = ("x%* <font color=\"%*\">%%%*</font>"):format(v69.amount, v72, v69.weight or 1);
                    elseif not v70 then
                        local v73 = ("x%*"):format(v69.amount or 1);
                        if v69.amountRange then
                            v73 = if v69.amountRange.Min ~= v69.amountRange.Max then ("x%* ~ %*"):format(v69.amountRange.Min, v69.amountRange.Max) else ("x%*"):format(v69.amountRange.Min);
                        end;
                        v68.Content.Inner.Amount.Text = v73;
                    elseif v70 then
                        v68.Content.Inner.Amount.Text = "";
                    end;
                    if v69.type == "Unit" then
                        v24:SetImage(v68.Content.Inner.Icon, v69.name);
                        v68.LayoutOrder = -999999;
                    elseif v69.type == "Pet" then
                        v27:SetImage(v68.Content.Inner.Icon, v69.name);
                        v68.LayoutOrder = -999999;
                    else
                        v17:SetRewardIcon(v69, v68.Content.Inner.Icon);
                    end;
                    return {
                        v68.Content.Backdrop, 
                        v68.Content.Glow
                    };
                end;
                v60.rewardsVisualizer = v20.new({}, {
                    template = v60.rewardTemplate, 
                    parent = if v60.isLobbyOwner then v60.rewardsBin else v60.startInfo.Rewards.Bin, 
                    renderMethod = v74
                });
                if v60.isLobbyOwner then
                    v60.firstTimeRewardsVisualizer = v20.new({}, {
                        template = v60.rewardTemplate, 
                        parent = v60.firstTimeBin.Reward, 
                        Size = UDim2.fromScale(1, 1), 
                        Position = UDim2.fromScale(0.5, 0.55), 
                        renderMethod = v74
                    });
                    v60.queueDump:Add(v60.firstTimeRewardsVisualizer);
                end;
                if v60.isLobbyOwner then
                    v60.startScreen.Visible = false;
                    v60.selectionScreen.Visible = true;
                    v60.main.BackgroundTransparency = 0.5;
                    v60:UpdateInfoScreen(true);
                    task.delay(0.2, function() --[[ Line: 310 ]]
                        -- upvalues: v35 (ref), v34 (ref), l_GuiService_0 (ref), v60 (ref)
                        if v35:IsConsole() and v34:GetToggleState(script.Name) then
                            l_GuiService_0.SelectedObject = v60._worldButtons.ConchStreet;
                        end;
                    end);
                else
                    v60:ShowStartScreen();
                end;
                v34:Toggle(script.Name, true);
                v60.queueDump:Add(v60:_onChanged("FriendsOnly", function(v75) --[[ Line: 322 ]]
                    -- upvalues: v50 (ref)
                    v50:Dispatch(v50.Actions.SetFriendsMode(v75));
                end, true));
                local v76 = nil;
                local v77 = nil;
                v60.startTimerBar.Bar.Fill.Size = UDim2.fromScale(0, 1);
                v60.queueDump:Add(v60:_onChanged("selectionTimeLeft", function(v78) --[[ Line: 331 ]]
                    -- upvalues: v60 (ref), v17 (ref), v76 (ref), v12 (ref), l_TweenService_0 (ref)
                    v60.stageTimerBar.Bar.Timer.Text = v17:FormatTimeFromSeconds(math.max(0, v78) or 0);
                    if v76 then
                        return;
                    else
                        local v79 = math.clamp(1 - v78 / v12.QUEUE.MAX_SELECTION_TIME, 0, v12.QUEUE.MAX_SELECTION_TIME);
                        v60.stageTimerBar.Bar.Fill.Size = UDim2.fromScale(v79, 1);
                        local v80 = TweenInfo.new(v78, Enum.EasingStyle.Linear);
                        v76 = l_TweenService_0:Create(v60.stageTimerBar.Bar.Fill, v80, {
                            Size = UDim2.fromScale(1, 1)
                        });
                        v76:Play();
                        v60.queueDump:Add(v76);
                        return;
                    end;
                end, true));
                local v81 = 0;
                v60.queueDump:Add(v60:_onChanged("startTimeLeft", function(v82) --[[ Line: 355 ]]
                    -- upvalues: v60 (ref), v17 (ref), v81 (ref), v77 (ref), l_TweenService_0 (ref)
                    if not v60.queueReplica.Data.confirmedMap then
                        return;
                    else
                        local v83 = math.max(0, v82.timeLeft - (workspace:GetServerTimeNow() - v82.sent));
                        v60.startTimerBar.Bar.Timer.Text = v17:FormatTimeFromSeconds(v83 or 0);
                        if v82.max == v81 then
                            return;
                        else
                            v81 = v82.max;
                            if v77 then
                                v77:Cancel();
                                v77:Destroy();
                            end;
                            local v84 = math.clamp(1 - v83 / v82.max, 0, v82.max);
                            v60.startTimerBar.Bar.Fill.Size = UDim2.fromScale(v84, 1);
                            local v85 = TweenInfo.new(v83, Enum.EasingStyle.Linear);
                            v77 = l_TweenService_0:Create(v60.startTimerBar.Bar.Fill, v85, {
                                Size = UDim2.fromScale(1, 1)
                            });
                            v77:Play();
                            v60.queueDump:Add(v77);
                            return;
                        end;
                    end;
                end, true));
                v60.queueDump:Add(v60:_onChanged("confirmedMap", function(v86) --[[ Line: 389 ]]
                    -- upvalues: v60 (ref)
                    if not v86 or v60.startScreen.Visible then
                        return;
                    else
                        v60:ShowStartScreen();
                        return;
                    end;
                end, true));
                v60.queueDump:Add(v60:_onChanged("Players", function(v87) --[[ Line: 398 ]]
                    -- upvalues: v60 (ref), v33 (ref), v17 (ref), v12 (ref)
                    for v88 = 1, #v60._playerFrames do
                        local v89 = v60._playerFrames[v88];
                        local v90 = v87[v88];
                        if not v90 then
                            v89.Icon.Image = "";
                            v89.Visible = false;
                        else
                            v33:Get(v90, "PlayerStats"):andThen(function(v91) --[[ Line: 409 ]]
                                -- upvalues: v89 (copy), v17 (ref)
                                local v92 = v91.Prestige or 0;
                                local v93 = v91.Level or 1;
                                v89.PlayerLevel.Prestige.Image = v17:GetPrestigeIcon(v92, v93);
                                v89.PlayerLevel.Prestige.Visible = v92 >= 1;
                                v89.PlayerLevel.UIPadding:SetAttribute("OriginalPaddingRight", UDim.new(0, v92 >= 1 and 30 or 0));
                            end);
                            v89.Icon.Image = string.format(v12.PLAYER_IMAGE_URL, v90.UserId);
                            v89.Visible = true;
                        end;
                    end;
                end, true));
                v60.queueDump:Add(v60:_onChanged("PlayerLevels", function(v94) --[[ Line: 424 ]]
                    -- upvalues: v60 (ref)
                    for v95 = 1, #v60._playerFrames do
                        local v96 = v60._playerFrames[v95];
                        local v97 = v94[v95];
                        if v97 then
                            v96.PlayerLevel.PlayerLevel.Text = ("LVL %*"):format(v97);
                        end;
                    end;
                end, true));
                v60.queueDump:Add(v60.rewardsVisualizer);
                v65:AddCleanupTask(function() --[[ Line: 439 ]]
                    -- upvalues: v52 (ref), v60 (ref), v34 (ref)
                    v52:Destroy();
                    if v60.queueDump then
                        v60.queueDump:Destroy();
                    end;
                    if v60._bossViewport then
                        v60._bossViewport:Destroy();
                        v60._bossViewport = nil;
                    end;
                    v60.rewardsVisualizer = nil;
                    v60.firstTimeRewardsVisualizer = nil;
                    v60._currentBoss = nil;
                    v34:Toggle(script.Name, false);
                end);
                return;
            end;
        end;
    end);
end;
v51.Opened = function(v98) --[[ Line: 460 ]] --[[ Name: Opened ]]
    -- upvalues: v39 (ref)
    for v99, v100 in v98._worldButtons do
        local v101 = v39:IsWorldAchievementCompleted(v99) or false;
        v100.Content.Achievement.Visible = v101;
    end;
    v98.firstOpenBackground.Visible = true;
    v98.optionsButtons.Visible = false;
    v98.chapterSelect.Visible = false;
    v98.selectInfo.Visible = false;
end;
v51.Closed = function(v102) --[[ Line: 472 ]] --[[ Name: Closed ]]
    v102.selectionScreen.Visible = true;
    v102.startScreen.Visible = false;
    if v102.conditionTooltip then
        v102.conditionTooltip:Destroy();
    end;
    v102.stagesScroll.CanvasPosition = Vector2.zero;
end;
v51.SelectWorld = function(v103, v104, v105) --[[ Line: 484 ]] --[[ Name: SelectWorld ]]
    -- upvalues: v50 (copy), v9 (copy), v35 (ref), v34 (ref), l_GuiService_0 (copy)
    v103.firstOpenBackground.Visible = false;
    v103.optionsButtons.Visible = true;
    v103.chapterSelect.Visible = true;
    v103.selectInfo.Visible = true;
    local l_v50_State_0 = v50:GetState();
    if not v105 and l_v50_State_0.selectionData.world == v104 then
        if v104 then
            v9:Warn("Already selected world", v104);
        end;
        return;
    else
        v103.mode = v103.defaultMode;
        v50:Dispatch(v50.Actions.SetSelectionData({
            world = v104 or 1, 
            chapter = 1, 
            difficulty = 1, 
            endless = false
        }));
        if v35:IsConsole() and v34:GetToggleState(script.Name) then
            task.defer(function() --[[ Line: 510 ]]
                -- upvalues: l_GuiService_0 (ref), v103 (copy)
                l_GuiService_0.SelectedObject = v103._chapterButtons["1"];
            end);
        end;
        return;
    end;
end;
v51.SelectChapter = function(v107, v108, v109) --[[ Line: 516 ]] --[[ Name: SelectChapter ]]
    -- upvalues: v50 (copy), v9 (copy), v12 (copy)
    local l_v50_State_1 = v50:GetState();
    local l_chapter_0 = l_v50_State_1.selectionData.chapter;
    local l_endless_0 = l_v50_State_1.selectionData.endless;
    if l_chapter_0 == v108 and l_endless_0 == v109 then
        v9:Warn("Already selected chapter", v108);
        return;
    else
        v107.mode = v109 and "Endless" or v107.defaultMode;
        v50:Dispatch(v50.Actions.SetSelectionData({
            world = l_v50_State_1.selectionData.world or 1, 
            chapter = v108 or 1, 
            difficulty = if v109 then v12.QUEUE.ENDLESS_DIFFICULTY else 1, 
            endless = v109 or false
        }));
        return;
    end;
end;
v51.SelectDifficulty = function(v113, v114) --[[ Line: 537 ]] --[[ Name: SelectDifficulty ]]
    -- upvalues: v50 (copy), v9 (copy), v12 (copy)
    local l_v50_State_2 = v50:GetState();
    if l_v50_State_2.selectionData.difficulty == v114 then
        v9:Warn("Already selected difficulty", v12.DIFFICULTY_NAMES[v114]);
        return;
    else
        v113.mode = v113.defaultMode;
        v50:Dispatch(v50.Actions.SetSelectionData({
            world = l_v50_State_2.selectionData.world or 1, 
            chapter = l_v50_State_2.selectionData.chapter or 1, 
            difficulty = v114 or 1, 
            endless = false
        }));
        return;
    end;
end;
v51.GetClearsData = function(v116) --[[ Line: 556 ]] --[[ Name: GetClearsData ]]
    -- upvalues: v50 (copy)
    local l_v50_State_3 = v50:GetState();
    local v118 = l_v50_State_3.selectionData.world or 1;
    local v119 = l_v50_State_3.selectionData.chapter or 1;
    local v120 = l_v50_State_3.selectionData.difficulty or 1;
    local v121 = {
        TotalClears = 0, 
        FastestClear = "N/A", 
        BestEndlessWaves = 0, 
        BestEndlessTime = "N/A"
    };
    local v122 = v116._myChapterClears[v118];
    if not v122 then
        return v121;
    else
        local v123 = v122[tostring(v119)];
        if not v123 then
            return v121;
        else
            return v123[tostring(v120)] or v121;
        end;
    end;
end;
v51.IsNightmareUnlocked = function(v124) --[[ Line: 585 ]] --[[ Name: IsNightmareUnlocked ]]
    -- upvalues: v50 (copy), v12 (copy)
    local v125 = false;
    local l_v50_State_4 = v50:GetState();
    local v127 = l_v50_State_4.selectionData.world or 1;
    local v128 = l_v50_State_4.selectionData.chapter or 1;
    local v129 = l_v50_State_4.selectionData.difficulty or 1;
    local v130 = v124._chapterNightmareUnlocked[v127];
    if v130 then
        v125 = v130[v128] == true;
    end;
    local v131 = v12.DIFFICULTY_NAMES[v129];
    v124.difficultyButtons.Nightmare.Content.Unselected.Visible = v125 and v131 ~= "Nightmare";
    v124.difficultyButtons.Nightmare.Content.Locked.Visible = not v125;
    return v125;
end;
v51.IsDavyJonesUnlocked = function(v132) --[[ Line: 607 ]] --[[ Name: IsDavyJonesUnlocked ]]
    -- upvalues: v50 (copy), v12 (copy)
    local v133 = false;
    local l_v50_State_5 = v50:GetState();
    local v135 = l_v50_State_5.selectionData.world or 1;
    local v136 = l_v50_State_5.selectionData.chapter or 1;
    local v137 = l_v50_State_5.selectionData.difficulty or 1;
    local v138 = v132._chapterDavyJonesUnlocked[v135];
    if v138 then
        v133 = v138[v136] == true;
    end;
    local v139 = v12.DIFFICULTY_NAMES[v137];
    v132.difficultyButtons.DavyJones.Content.Unselected.Visible = v133 and v139 ~= "Davy Jones";
    v132.difficultyButtons.DavyJones.Content.Locked.Visible = not v133;
    return v133;
end;
v51.UpdateDifficultyUnlocks = function(v140) --[[ Line: 630 ]] --[[ Name: UpdateDifficultyUnlocks ]]
    -- upvalues: v17 (copy)
    for v141, v142 in v140._myCompletions.Worlds do
        v140._chapterNightmareUnlocked[v141] = {};
        v140._chapterDavyJonesUnlocked[v141] = {};
        for v143 in v142 do
            v143 = tonumber(v143);
            local v144 = v17:CanPlayNightmare(v140._myCompletions, v141, v143);
            local v145 = v17:CanPlayDavyJones(v140._myCompletions, v141, v143);
            v140._chapterNightmareUnlocked[v141][v143] = v144;
            v140._chapterDavyJonesUnlocked[v141][v143] = v145;
        end;
    end;
end;
v51.UpdateInfoScreen = function(v146, v147) --[[ Line: 646 ]] --[[ Name: UpdateInfoScreen ]]
    -- upvalues: v50 (copy), v11 (copy), v6 (copy), v9 (copy), v17 (copy), v12 (copy), v16 (copy), v30 (copy)
    local l_v50_State_6 = v50:GetState();
    local v149 = if v147 then v146.queueReplica.Data.Stage else l_v50_State_6.selectionData.world or 1;
    local v150 = if v147 then v146.queueReplica.Data.Chapter else l_v50_State_6.selectionData.chapter or 1;
    local v151 = if v147 then v146.queueReplica.Data.Difficulty else l_v50_State_6.selectionData.difficulty or 1;
    local v152 = if v147 then v146.mode == "Endless" else l_v50_State_6.selectionData.endless or false;
    local v153 = v150 == 1 and "A" or "B";
    local v154 = v150 < 6 and 1 or 2;
    if v152 and v153 == "B" then
        v154 = 2;
    end;
    if v147 then
        v146:SelectWorld(v149, true);
    end;
    if not v151 or not v149 or not v150 then
        return;
    else
        local l_v11_WorldData_0 = v11:GetWorldData(v146.mode, v149);
        local l_v11_ChapterData_0 = v11:GetChapterData(v146.mode, v149, v150);
        local l_Timeline_0 = l_v11_ChapterData_0.Waves[#l_v11_ChapterData_0.Waves].Timeline;
        l_Timeline_0 = v6.Filter(l_Timeline_0, function(v158, _) --[[ Line: 674 ]]
            return v158.IsBoss == true;
        end);
        l_Timeline_0 = l_Timeline_0 and l_Timeline_0[1];
        if not l_Timeline_0 then
            v9:Warn((("No boss found in chapter %* of world %*!"):format(v150, v149)));
        end;
        v146:_renderBossViewport(l_Timeline_0);
        v146:IsNightmareUnlocked();
        v146:IsDavyJonesUnlocked();
        local l_v146_ClearsData_0 = v146:GetClearsData();
        local v161 = l_v146_ClearsData_0[v152 and "BestEndlessTime" or "FastestClear"] or "N/A";
        if typeof(v161) == "number" then
            v161 = v17:FormatTimeFromSeconds(v161);
        end;
        local v162 = if v152 then l_v11_WorldData_0.DisplayName else ("%* - %*"):format(l_v11_WorldData_0.DisplayName, v150);
        v146.selectInfo.Content.ChapterTitle.Chapter.ChapterOrder.Text = v162;
        v146.selectInfo.Content.ChapterTitle.Chapter.ChapterName.Text = if v152 then ("Endless (%*)"):format(v153) else l_v11_ChapterData_0.DisplayName;
        v146.worldInfo.TotalClears.Amount.Text = l_v146_ClearsData_0[v152 and "BestEndlessWaves" or "TotalClears"] or "0";
        v146.worldInfo.TotalClears.Title.Text = v152 and "Best Waves:" or "Total Cleared:";
        v146.worldInfo.FastestClear.Amount.Text = v161;
        v146.firstTimeBin.Reward.Earned.Visible = l_v146_ClearsData_0.TotalClears >= 1;
        v146.selectInfo.Content.Difficulties.Visible = not v152;
        v146.firstTimeBin.Visible = not v152;
        local v163 = v12.DIFFICULTY_NAMES[v151] or "Normal";
        v146.selectInfo.Content.DifficultyGradient.Offset = Vector2.new(0, 1);
        v146.selectInfo.Content.DifficultyGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, v16.Solid[v163]), 
            ColorSequenceKeypoint.new(1, v16.Solid[v163])
        });
        v146.difficultyGradientTween:Play();
        v17:IterateClass(v146.selectInfo.Content.ChapterTitle.Icon, "Frame", function(v164) --[[ Line: 723 ]]
            -- upvalues: v149 (copy)
            v164.Visible = v164.Name == v149;
        end);
        local v165 = v30.Get("Game", l_v11_WorldData_0.WorldName, v154);
        if not v165 then
            local v166 = l_v11_ChapterData_0.WorldImage or l_v11_WorldData_0.WorldImage;
            for v167, v168 in v166 do
                v146.selectInfo.WorldImage[v167] = v168;
            end;
            v146.selectInfo.WorldImage.ImageColor3 = Color3.new(1, 1, 1);
            return;
        else
            for v169, v170 in {
                Image = "background", 
                ImageColor3 = "backgroundColor"
            } do
                v146.selectInfo.WorldImage[v169] = v165[v170];
            end;
            v146.selectInfo.WorldImage.ImageRectOffset = Vector2.new(0, 125);
            v146.selectInfo.WorldImage.ImageRectSize = Vector2.new(1000, 400);
            return;
        end;
    end;
end;
v51.UpdateStartScreen = function(v171) --[[ Line: 751 ]] --[[ Name: UpdateStartScreen ]]
    -- upvalues: v12 (copy), v11 (copy), v30 (copy), v24 (copy), v25 (copy), v32 (copy), v28 (copy), v17 (copy), v9 (copy), v6 (copy), v37 (ref), v29 (copy), v15 (copy), v33 (ref), v4 (copy), v31 (copy)
    if not v171.queueReplica then
        return;
    else
        local l_Stage_0 = v171.queueReplica.Data.Stage;
        local l_Chapter_0 = v171.queueReplica.Data.Chapter;
        local l_Difficulty_0 = v171.queueReplica.Data.Difficulty;
        local v175 = v12.DIFFICULTY_NAMES[l_Difficulty_0];
        local v176 = v171.mode == "Endless";
        local v177 = l_Chapter_0 == 1 and "A" or "B";
        local v178 = l_Chapter_0 < 6 and 1 or 2;
        if v176 and v177 == "B" then
            v178 = 2;
        end;
        local l_v11_WorldData_1 = v11:GetWorldData(v171.mode, l_Stage_0);
        local l_v11_ChapterData_1 = v11:GetChapterData(v171.mode, l_Stage_0, l_Chapter_0);
        local v181 = nil;
        v181 = if v171.mode == "Challenge" then v12.CHALLENGES.REQUIRED_LEVEL else l_v11_ChapterData_1.UnlockCondition and l_v11_ChapterData_1.UnlockCondition.PlayerLevel;
        local v182 = false;
        if v181 ~= nil then
            v182 = v181 > 1;
        end;
        local l_LevelRequirement_0 = v171.startInfo.Info.Inner.LevelRequirement;
        local l_Title_0 = l_LevelRequirement_0.Title;
        l_LevelRequirement_0.Visible = v182;
        if v182 then
            l_Title_0.Text = ("Level %* Required"):format(v181);
            l_Title_0.AutomaticSize = Enum.AutomaticSize.X;
        end;
        v171.startInfo.Info.Inner.Difficulties.Visible = v171.mode ~= "Event";
        v171.startInfo.Info.Inner.ChapterOrder.Text = l_v11_WorldData_1.DisplayName;
        v171.startInfo.Info.Inner.ChapterName.Text = if v176 then ("Endless (%*)"):format(v177) else l_v11_ChapterData_1.DisplayName;
        if v171.mode == "Story" and not v176 then
            local l_ChapterOrder_0 = v171.startInfo.Info.Inner.ChapterOrder;
            l_ChapterOrder_0.Text = l_ChapterOrder_0.Text .. " - " .. l_Chapter_0;
        end;
        local v186 = v30.Get("Game", l_v11_WorldData_1.WorldName, v178);
        if not v186 then
            local v187 = l_v11_ChapterData_1.WorldImage or l_v11_WorldData_1.WorldImage;
            for v188, v189 in v187 do
                v171.startInfo.Info.WorldImage[v188] = v189;
            end;
            v171.startInfo.Info.WorldImage.ImageColor3 = Color3.new(1, 1, 1);
            return;
        else
            for v190, v191 in {
                Image = "background", 
                ImageColor3 = "backgroundColor"
            } do
                v171.startInfo.Info.WorldImage[v190] = v186[v191];
            end;
            v171.startInfo.Info.WorldImage.ImageRectOffset = Vector2.new(0, 125);
            v171.startInfo.Info.WorldImage.ImageRectSize = Vector2.new(1000, 400);
            for _, v193 in v171.startInfo.Info.Inner.Difficulties:GetChildren() do
                if v193:IsA("Frame") then
                    if v176 then
                        v193.Visible = false;
                    else
                        v193.Visible = v193.Name == v175;
                    end;
                end;
            end;
            v171.teamFrame.Visible = l_v11_ChapterData_1.PresetLoadout ~= nil;
            if l_v11_ChapterData_1.PresetLoadout then
                for _, v195 in l_v11_ChapterData_1.PresetLoadout do
                    local v196 = v171.loadoutTemplate:Clone();
                    v196.Name = v195.UnitName;
                    local l_Content_0 = v196.Content;
                    local l_TowerInfo_0 = l_Content_0.TowerInfo;
                    v24:SetImage(l_TowerInfo_0.Icon, v195.UnitName);
                    l_TowerInfo_0.Icon.Visible = true;
                    local v199 = select(2, v25:GetRarity(v195.UnitName));
                    if v199 then
                        l_TowerInfo_0.Backdrop:SetAttribute("Rarity", v199);
                        l_TowerInfo_0.Backdrop:AddTag("VisualizeRarity");
                        l_Content_0.Glow:SetAttribute("Rarity", v199);
                        l_Content_0.Glow:AddTag("VisualizeRarity");
                    end;
                    local v200 = v195.ExtraData or {};
                    l_TowerInfo_0.Shiny.Visible = v200.Shiny or false;
                    l_TowerInfo_0.Wumbo.Visible = v200.Mega or v200.Wumbo or false;
                    l_TowerInfo_0.Level.Text = ("LVL <font color=\"#FFFF00\">%*</font>"):format(v200.Level or 1);
                    l_Content_0.Trait.Visible = v200.Trait ~= nil;
                    l_Content_0.Trait2.Visible = v200.Trait2 ~= nil;
                    if v200.Trait ~= nil then
                        v32:CreateTraitIcon(v200.Trait.Name, l_Content_0.Trait);
                    end;
                    if v200.Trait2 ~= nil then
                        v32:CreateTraitIcon(v200.Trait2.Name, l_Content_0.Trait2);
                    end;
                    l_TowerInfo_0.Stars.Visible = if v200.Stars then v200.Stars > 0 else false;
                    if v200.Stars and v200.Stars > 0 then
                        l_TowerInfo_0.Stars.Main.Amount.Text = v200.Stars;
                        l_TowerInfo_0.Stars[tostring(2)].Visible = v200.Stars >= 2;
                        l_TowerInfo_0.Stars[tostring(3)].Visible = v200.Stars >= 3;
                        l_TowerInfo_0.Stars[tostring(4)].Visible = v200.Stars >= 4;
                        l_TowerInfo_0.Stars[tostring(5)].Visible = v200.Stars >= 5;
                    end;
                    v28.new(v196, {
                        Name = v195.UnitName, 
                        IsUnit = true, 
                        ExtraData = v200
                    });
                    v196.Parent = v171.loadoutFrame;
                end;
                v171.queueDump:Add(function() --[[ Line: 894 ]]
                    -- upvalues: v171 (copy)
                    v171.teamFrame.Visible = false;
                    for _, v202 in v171.loadoutFrame:GetChildren() do
                        if v202:IsA("TextButton") then
                            v202:Destroy();
                        end;
                    end;
                end);
            end;
            local l_Conditions_0 = v171.queueReplica.Data.Conditions;
            if l_Conditions_0 then
                v17:IterateClass(v171.conditionsFrame, "TextButton", function(v204) --[[ Line: 908 ]]
                    -- upvalues: l_Conditions_0 (copy)
                    local v205 = string.match(v204.Name, "^(.-)_");
                    if not table.find(l_Conditions_0, v205) then
                        v204:Destroy();
                    end;
                end);
                for _, v207 in l_Conditions_0 do
                    local v208 = nil;
                    local v209 = nil;
                    local v210 = nil;
                    if typeof(v207) == "table" then
                        v208 = v207.name;
                        if v207.tier then
                            v210 = v207.tier;
                            v209 = ("%*_%*"):format(v208, v210);
                        else
                            v209 = v208;
                        end;
                    else
                        v208 = v207;
                        v209 = v207;
                    end;
                    if not v171.conditionsFrame:FindFirstChild(v209) then
                        local l_v17_ConditionData_0 = v17:GetConditionData(v208);
                        if l_v17_ConditionData_0 then
                            local v212 = v171.conditionTemplate:Clone();
                            v212.Icon.Image = l_v17_ConditionData_0.icon;
                            v212.UIGradient.Color = l_v17_ConditionData_0.colors;
                            v212.Name = v209;
                            v212.Visible = true;
                            v212.Tier.Visible = v210 ~= nil;
                            if v210 then
                                v212.Tier.Text = v17:IntToRoman(v210);
                            end;
                            v212.Parent = v171.conditionsFrame;
                            v28.new(v212, {
                                IsCondition = true, 
                                Name = v208, 
                                Tier = v210
                            });
                        end;
                    end;
                end;
            else
                v17:IterateClass(v171.conditionsFrame, "TextButton", function(v213) --[[ Line: 960 ]]
                    v213:Destroy();
                end);
            end;
            local l_v11_Rewards_0, v215 = v11:GetRewards(v171.mode, l_Stage_0, l_Chapter_0, l_Difficulty_0);
            if not l_v11_Rewards_0 then
                v9:Warn("Failed to get possible rewards;", l_Stage_0, l_Chapter_0, l_Difficulty_0);
                return;
            else
                local v217 = v215 and v6.Filter(v215, function(v216) --[[ Line: 972 ]]
                    return v216.feature == true;
                end);
                local v219 = v215 and v6.Filter(v215, function(v218) --[[ Line: 976 ]]
                    return not v218.feature;
                end);
                if v217 then
                    table.sort(v217, function(v220, v221) --[[ Line: 982 ]]
                        return v220.weight < v221.weight;
                    end);
                    for _, v223 in v217 do
                        local v224 = #l_v11_Rewards_0;
                        if v223.showFirst then
                            v224 = 1;
                        end;
                        table.insert(l_v11_Rewards_0, v224, v223);
                    end;
                end;
                local l_v37_Data_0 = v37:GetData();
                local v226 = v29.util.GetQuestInfo(l_v37_Data_0);
                local v227 = v29.util.GetProgress(l_v37_Data_0);
                local v228 = v29.util.IsQuestStarted(l_v37_Data_0);
                if not v29.util.IsQuestlineExpired(l_v37_Data_0) and v228 and l_Stage_0 == v226.map and v226.collect and v227 < v226.required then
                    table.insert(l_v11_Rewards_0, 1, {
                        type = "Inventory", 
                        name = v226.collect.name, 
                        amount = v226.collect.amount, 
                        weight = v226.collect.chance
                    });
                end;
                l_v37_Data_0 = v15.Config.BASIC_MATERIAL_DROP_CHANCES[v171.mode];
                v226 = v15.Config.BASIC_MATERIAL_LOCATIONS[l_Stage_0];
                if v226 and (l_v37_Data_0 or v171.mode == "Endless") then
                    for v229, v230 in v226 do
                        table.insert(l_v11_Rewards_0, 1, {
                            type = "Inventory", 
                            name = v229, 
                            amount = v230, 
                            weight = l_v37_Data_0
                        });
                    end;
                end;
                l_v37_Data_0 = v33:Get(v4.Player, v12.TURF_WARS.DATA_KEY):expect();
                if l_v37_Data_0 and v31.util.IsQuestCompleted(l_v37_Data_0, v31.TOTAL_QUESTS) then
                    v226 = v12.TURF_WARS.STARDOM_EARNINGS[v171.mode];
                    if v226 then
                        v227 = v226[v175];
                        table.insert(l_v11_Rewards_0, {
                            type = "Stardom", 
                            amount = v227
                        });
                    end;
                end;
                if v219 and #v219 > 0 then
                    v171:_renderUnfeaturedLoot(v219, v171.startInfo.Rewards.Bin, v171.queueDump);
                end;
                l_v37_Data_0 = {
                    "Normal", 
                    "Shiny", 
                    "Wumbo", 
                    "ShinyWumbo"
                };
                if v12.SEA_RHINO_DROP_CHANCES[v171.mode] then
                    v226 = {};
                    for _, v232 in l_v37_Data_0 do
                        local v233 = v12.SEA_RHINO_DROP_CHANCES[v171.mode][v232];
                        local v234 = {
                            type = "Unit", 
                            name = "SeaRhino", 
                            weight = v233
                        };
                        local v235 = {};
                        local v236 = true;
                        if v232 ~= "ShinyWumbo" then
                            v236 = v232 == "Shiny";
                        end;
                        v235.Shiny = v236;
                        v236 = true;
                        if v232 ~= "ShinyWumbo" then
                            v236 = v232 == "Wumbo";
                        end;
                        v235.Mega = v236;
                        v234.extraData = v235;
                        table.insert(v226, v234);
                    end;
                    if #v226 > 0 then
                        v171:_renderUnfeaturedLoot(v226, v171.startInfo.Rewards.Bin, v171.queueDump);
                    end;
                end;
                if v171.isLobbyOwner then
                    v171.rewardsVisualizer:Reparent(v171.startInfo.Rewards.Bin);
                    return;
                else
                    v171.rewardsVisualizer:ChangeRewards(l_v11_Rewards_0, v171.startInfo.Rewards.Bin);
                    return;
                end;
            end;
        end;
    end;
end;
v51.ShowStartScreen = function(v237) --[[ Line: 1080 ]] --[[ Name: ShowStartScreen ]]
    -- upvalues: v35 (ref), v34 (ref), l_GuiService_0 (copy)
    v237:UpdateStartScreen();
    v237.selectionScreen.Visible = false;
    v237.startScreen.Visible = true;
    v237.startOptions.Start.Visible = v237.isLobbyOwner;
    local l_startOptions_0 = v237.startOptions;
    local v239 = true;
    if v237.mode ~= "Story" then
        v239 = v237.mode == "Endless";
    end;
    l_startOptions_0.Visible = v239;
    v237.main.BackgroundTransparency = 1;
    if v35:IsConsole() and v34:GetToggleState(script.Name) and v237.isLobbyOwner then
        l_GuiService_0.SelectedObject = v237.startOptions.Start;
    end;
end;
v51.UpdateLockedLevelStates = function(v240, v241) --[[ Line: 1097 ]] --[[ Name: UpdateLockedLevelStates ]]
    -- upvalues: v38 (ref), v33 (ref), v4 (copy), v12 (copy), v17 (copy), v50 (copy)
    local v242 = v38:IsInNPE() and v33:Get(v4.Player, "NPEStage"):expect() < v12.NPE.FINISHED_STAGE;
    if (v241 or {
        UpdateWorlds = true, 
        UpdateChapters = true
    }).UpdateWorlds then
        for v243, v244 in v240._worldButtons do
            local v245 = v17:IsWorldUnlocked(v240._myCompletions, v243) and (not v242 or v243 == "ConchStreet");
            v244:SetAttribute("IS_UNLOCKED", v245);
            v244.Content.Locked.Visible = not v245;
            local l_v17_ClearedChapters_0, v247 = v17:GetClearedChapters(v240._myCompletions, v243);
            v244.Content.LevelsCleared.Amount.Text = ("%*/%*"):format(l_v17_ClearedChapters_0, v247);
        end;
    end;
    local v248 = v50:GetState().selectionData.world or 1;
    for v249, v250 in v240._chapterButtons do
        if not tonumber(v249) then
            local v251 = v249 == "Endless_A" and 5 or 10;
            local v252 = v17:IsChapterCompleted(v240._myCompletions, v248, v251);
            v250:SetAttribute("IS_UNLOCKED", v252);
            v250.Content.Locked.Visible = not v252;
        else
            local v253 = v17:IsChapterUnlocked(v240._myCompletions, v248, (tonumber(v249)));
            v250:SetAttribute("IS_UNLOCKED", v253);
            v250.Content.Locked.Visible = not v253;
        end;
    end;
end;
v51._onChanged = function(v254, v255, v256, v257) --[[ Line: 1134 ]] --[[ Name: _onChanged ]]
    if not v254.queueReplica then
        return;
    else
        if v257 and v254.queueReplica.Data[v255] ~= nil then
            v256(v254.queueReplica.Data[v255]);
        end;
        return v254.queueReplica:ListenToChange(v255, v256);
    end;
end;
v51._fireServer = function(v258, v259, ...) --[[ Line: 1147 ]] --[[ Name: _fireServer ]]
    if v258.queueReplica then
        v258.queueReplica:FireServer(v259, ...);
    end;
end;
v51._isKickPlayerInput = function(_, v261) --[[ Line: 1154 ]] --[[ Name: _isKickPlayerInput ]]
    if not v261 then
        return false;
    elseif v261.UserInputType == Enum.UserInputType.MouseButton2 then
        return true;
    elseif v261.UserInputType == Enum.UserInputType.Touch then
        return true;
    elseif v261.KeyCode == Enum.KeyCode.ButtonR2 then
        return true;
    else
        return false;
    end;
end;
v51._connectLobbyOptions = function(v262) --[[ Line: 1171 ]] --[[ Name: _connectLobbyOptions ]]
    -- upvalues: v34 (ref), v50 (copy), v51 (copy), v35 (ref)
    v34:HandleButton(v262.readyButton, function() --[[ Line: 1172 ]]
        -- upvalues: v50 (ref), v262 (copy)
        local l_v50_State_7 = v50:GetState();
        local v264 = l_v50_State_7.selectionData.world or 1;
        local v265 = l_v50_State_7.selectionData.chapter or 1;
        local v266 = l_v50_State_7.selectionData.difficulty or 1;
        local v267 = l_v50_State_7.selectionData.endless or false;
        v262:_fireServer("ConfirmMap", {
            World = v264, 
            Chapter = v265, 
            Difficulty = v266, 
            Endless = v267
        });
    end);
    v34:HandleButton(v262.leaveButton, function() --[[ Line: 1188 ]]
        -- upvalues: v51 (ref)
        v51:_fireServer("LeaveQueue");
    end);
    v35:ObserveGamepadButtonPress(Enum.KeyCode.ButtonB, function() --[[ Line: 1192 ]]
        -- upvalues: v51 (ref)
        v51:_fireServer("LeaveQueue");
    end);
    v34:HandleButton(v262.friendsOnlyButton, function() --[[ Line: 1196 ]]
        -- upvalues: v262 (copy)
        v262:_fireServer("ToggleFriendsOnly");
    end);
end;
v51._connectWorldButtons = function(v268) --[[ Line: 1202 ]] --[[ Name: _connectWorldButtons ]]
    -- upvalues: v23 (copy), v34 (ref)
    for _, v271 in v23(v268.stagesScroll, function(v269) --[[ Line: 1203 ]] --[[ Name: predicate ]]
        return v269.Name ~= "ComingSoon";
    end) do
        local l_Name_0 = v271.Name;
        local v273 = v271:GetAttribute("IS_UNLOCKED") or false;
        if l_Name_0 == "ConchStreet" then
            v273 = true;
        end;
        do
            local l_v273_0 = v273;
            v271:GetAttributeChangedSignal("IS_UNLOCKED"):Connect(function() --[[ Line: 1215 ]]
                -- upvalues: l_v273_0 (ref), v271 (copy)
                l_v273_0 = v271:GetAttribute("IS_UNLOCKED") or false;
            end);
            v271.SelectionOrder = v271.LayoutOrder;
            v34:HandleButton(v271, function() --[[ Line: 1221 ]]
                -- upvalues: l_v273_0 (ref), v268 (copy), l_Name_0 (copy)
                if not l_v273_0 then
                    return;
                else
                    v268:SelectWorld(l_Name_0);
                    return;
                end;
            end);
            v268._worldButtons[l_Name_0] = v271;
        end;
    end;
end;
v51._connectChapterButtons = function(v275) --[[ Line: 1234 ]] --[[ Name: _connectChapterButtons ]]
    -- upvalues: v23 (copy), v34 (ref)
    local function v285(v276) --[[ Line: 1235 ]] --[[ Name: handleButtons ]]
        -- upvalues: v23 (ref), v34 (ref), v275 (copy)
        for _, v278 in v23(v276.Content) do
            local v279 = v278:GetAttribute("IS_UNLOCKED") or false;
            local v280 = tonumber(string.match(v278.Name, "%d+")) or v278.Name;
            local v281 = string.find(v278.Name, "Endless") ~= nil;
            local v282 = v280 == "Endless_A" and 1 or 2;
            do
                local l_v279_0 = v279;
                v278:GetAttributeChangedSignal("IS_UNLOCKED"):Connect(function() --[[ Line: 1242 ]]
                    -- upvalues: l_v279_0 (ref), v278 (copy)
                    l_v279_0 = v278:GetAttribute("IS_UNLOCKED") or false;
                end);
                local l_Locked_0 = v278.Content.Locked;
                l_Locked_0.UIGradient.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.15), 
                    NumberSequenceKeypoint.new(1, 0)
                });
                l_Locked_0.Icon.Position = UDim2.fromScale(0.5, 0.5);
                l_Locked_0.Icon.Size = UDim2.fromScale(0.8, 0.8);
                v34:HandleButton(v278, function() --[[ Line: 1255 ]]
                    -- upvalues: l_v279_0 (ref), v275 (ref), v281 (copy), v282 (copy), v280 (copy)
                    if not l_v279_0 then
                        return;
                    else
                        v275:SelectChapter(if v281 then v282 else v280, v281);
                        return;
                    end;
                end);
                v275._chapterButtons[tostring(v280)] = v278;
            end;
        end;
    end;
    v285(v275.chapterSelect.Act1_Chapters);
    v285(v275.chapterSelect.Act2_Chapters);
end;
v51._connectDifficultyButtons = function(v286) --[[ Line: 1273 ]] --[[ Name: _connectDifficultyButtons ]]
    -- upvalues: v23 (copy), v12 (copy), v34 (ref)
    v286._difficultyButtons = v23(v286.difficultyButtons, nil, function(v287) --[[ Line: 1274 ]]
        -- upvalues: v12 (ref), v34 (ref), v286 (copy)
        local v288 = v287.Name == "Nightmare";
        local v289 = v287.Name == "DavyJones";
        local v290 = v12.DIFFICULTY_INDEX[v287.Name];
        if v289 then
            v290 = 4;
        end;
        v34:HandleButton(v287, function() --[[ Line: 1283 ]]
            -- upvalues: v288 (copy), v286 (ref), v289 (copy), v287 (copy), v290 (ref)
            if v288 and not v286:IsNightmareUnlocked() or v289 and not v286:IsDavyJonesUnlocked() then
                v287.Content.Unselected.Visible = false;
                return;
            else
                v286:SelectDifficulty(v290);
                return;
            end;
        end);
    end, true);
end;
v51._listenToStateChanges = function(v291) --[[ Line: 1296 ]] --[[ Name: _listenToStateChanges ]]
    -- upvalues: v50 (copy), v55 (copy), v57 (copy), v12 (copy), v11 (copy), v9 (copy), v6 (copy), v37 (ref), v29 (copy), v15 (copy), v33 (ref), v4 (copy), v31 (copy), v52 (copy)
    v50:Watch(v55, function(v292) --[[ Line: 1298 ]]
        -- upvalues: v291 (copy)
        v291.friendsOnlyButton.Content.IsEnabled.Visible = v292;
    end);
    v50:Watch(v57, function(v293) --[[ Line: 1302 ]]
        -- upvalues: v291 (copy), v12 (ref), v11 (ref), v50 (ref), v9 (ref), v6 (ref), v37 (ref), v29 (ref), v15 (ref), v33 (ref), v4 (ref), v31 (ref), v52 (ref)
        local l_world_0 = v293.world;
        local l_chapter_1 = v293.chapter;
        local l_difficulty_0 = v293.difficulty;
        local l_endless_1 = v293.endless;
        local v298 = l_chapter_1 == 1 and "Endless_A" or "Endless_B";
        if not l_world_0 or not l_chapter_1 or not l_difficulty_0 then
            return;
        else
            v291:UpdateInfoScreen();
            v291:UpdateLockedLevelStates({
                UpdateChapters = true, 
                UpdateWorlds = true
            });
            local v299 = v12.DIFFICULTY_NAMES[l_difficulty_0];
            for v300, v301 in v291._difficultyButtons do
                if v301.Content.Locked.Visible then
                    v301.Content.Unselected.Visible = false;
                    v301.Glow.Visible = false;
                else
                    if v300 == "DavyJones" then
                        v300 = "Davy Jones";
                    end;
                    v301.Content.Unselected.Visible = v300 ~= v299;
                    v301.Glow.Visible = v300 == v299;
                end;
            end;
            local l_WorldName_0 = v11:GetWorldData(v291.mode, l_world_0).WorldName;
            for v303, v304 in v291._worldButtons do
                if not v304:GetAttribute("IS_UNLOCKED") then
                    v304.Content.Deselected.Visible = false;
                else
                    v304.Content.Deselected.Visible = v303 ~= l_WorldName_0;
                end;
            end;
            for v305, v306 in v291._chapterButtons do
                if v305 ~= "1" and not v306:GetAttribute("IS_UNLOCKED") then
                    v306.Content.Size = UDim2.fromScale(1, 1);
                    v306.Content.Deselected.Visible = false;
                else
                    local v307 = if l_endless_1 then v305 == v298 else v305 == tostring(l_chapter_1);
                    v306.Content.Size = if not v307 then UDim2.fromScale(1, 1) else UDim2.fromScale(1.1, 1.1);
                    v306.Content.Deselected.Visible = not v307;
                end;
            end;
            local l_v50_State_8 = v50:GetState();
            local l_v11_Rewards_1, v310 = v11:GetRewards(v291.mode, l_world_0, l_chapter_1, l_difficulty_0);
            if not l_v11_Rewards_1 then
                v9:Warn("Failed to get possible rewards;", l_v50_State_8);
                return;
            else
                if v310 then
                    local v312 = v6.Filter(v310, function(v311) --[[ Line: 1374 ]]
                        return v311.feature == true;
                    end);
                    table.sort(v312, function(v313, v314) --[[ Line: 1379 ]]
                        return v313.weight < v314.weight;
                    end);
                    for _, v316 in v312 do
                        local v317 = #l_v11_Rewards_1;
                        if v316.showFirst then
                            v317 = 1;
                        end;
                        table.insert(l_v11_Rewards_1, v317, v316);
                    end;
                end;
                local l_v37_Data_1 = v37:GetData();
                local v319 = v29.util.GetQuestInfo(l_v37_Data_1);
                local v320 = v29.util.GetProgress(l_v37_Data_1);
                local v321 = v29.util.IsQuestStarted(l_v37_Data_1);
                if not v29.util.IsQuestlineExpired(l_v37_Data_1) and v321 and l_world_0 == v319.map and v319.collect and v320 < v319.required then
                    table.insert(l_v11_Rewards_1, 1, {
                        type = "Inventory", 
                        name = v319.collect.name, 
                        amount = v319.collect.amount, 
                        weight = v319.collect.chance
                    });
                end;
                l_v37_Data_1 = v15.Config.BASIC_MATERIAL_DROP_CHANCES[v291.mode];
                v319 = v15.Config.BASIC_MATERIAL_LOCATIONS[l_world_0];
                if v319 and (l_v37_Data_1 or v291.mode == "Endless") then
                    for v322, v323 in v319 do
                        table.insert(l_v11_Rewards_1, 1, {
                            type = "Inventory", 
                            name = v322, 
                            amount = v323, 
                            weight = l_v37_Data_1
                        });
                    end;
                end;
                l_v37_Data_1 = v33:Get(v4.Player, v12.TURF_WARS.DATA_KEY):expect();
                if l_v37_Data_1 and l_v37_Data_1.quest == v31.TOTAL_QUESTS then
                    v319 = v12.TURF_WARS.STARDOM_EARNINGS[v291.mode];
                    if v319 then
                        v320 = v319[v299];
                        table.insert(l_v11_Rewards_1, {
                            type = "Stardom", 
                            amount = v320
                        });
                    end;
                end;
                v291.rewardsVisualizer:ChangeRewards(l_v11_Rewards_1, v291.rewardsBin);
                l_v37_Data_1 = v310 and v6.Filter(v310, function(v324) --[[ Line: 1445 ]]
                    return not v324.feature;
                end);
                v52:Destroy();
                if l_v37_Data_1 and #l_v37_Data_1 > 0 then
                    v291:_renderUnfeaturedLoot(l_v37_Data_1, v291.rewardsBin, v52);
                end;
                v319 = {
                    "Normal", 
                    "Shiny", 
                    "Wumbo", 
                    "ShinyWumbo"
                };
                if v12.SEA_RHINO_DROP_CHANCES[v291.mode] then
                    v320 = {};
                    for _, v326 in v319 do
                        local v327 = v12.SEA_RHINO_DROP_CHANCES[v291.mode][v326];
                        local v328 = {
                            type = "Unit", 
                            name = "SeaRhino", 
                            weight = v327
                        };
                        local v329 = {};
                        local v330 = true;
                        if v326 ~= "ShinyWumbo" then
                            v330 = v326 == "Shiny";
                        end;
                        v329.Shiny = v330;
                        v330 = true;
                        if v326 ~= "ShinyWumbo" then
                            v330 = v326 == "Wumbo";
                        end;
                        v329.Mega = v330;
                        v328.extraData = v329;
                        table.insert(v320, v328);
                    end;
                    if #v320 > 0 then
                        v291:_renderUnfeaturedLoot(v320, v291.rewardsBin, v52);
                    end;
                end;
                if v291.firstTimeRewardsVisualizer then
                    v291.firstTimeRewardsVisualizer:ChangeRewards({
                        v12.FIRST_CLEAR_REWARDS[v299]
                    });
                end;
                return;
            end;
        end;
    end);
end;
v51._initSelectionScreen = function(v331) --[[ Line: 1484 ]] --[[ Name: _initSelectionScreen ]]
    v331:_connectLobbyOptions();
    v331:_connectWorldButtons();
    v331:_connectChapterButtons();
    v331:_connectDifficultyButtons();
    v331:_listenToStateChanges();
    v331:UpdateLockedLevelStates({
        UpdateWorlds = true
    });
end;
v51._initStartScreen = function(v332) --[[ Line: 1493 ]] --[[ Name: _initStartScreen ]]
    -- upvalues: v34 (ref), v51 (copy), v23 (copy)
    v34:HandleButton(v332.startOptions.Start, function() --[[ Line: 1495 ]]
        -- upvalues: v332 (copy)
        v332:_fireServer("StartGame");
    end);
    v34:HandleButton(v332.startOptions.Leave, function() --[[ Line: 1499 ]]
        -- upvalues: v51 (ref)
        v51:_fireServer("LeaveQueue");
    end);
    v23(v332.startPlayers, nil, function(v333) --[[ Line: 1503 ]]
        -- upvalues: v332 (copy)
        local v334 = tonumber(string.match(v333.Name, "%d+"));
        if not v334 then
            return;
        else
            v333.Visible = false;
            v332._playerFrames[v334] = v333;
            return;
        end;
    end);
end;
v51._renderBossViewport = function(v335, v336) --[[ Line: 1517 ]] --[[ Name: _renderBossViewport ]]
    -- upvalues: v9 (copy), v19 (copy), l_TweenService_0 (copy)
    if not v336 then
        return;
    elseif not v335.isLobbyOwner then
        v9:Warn("Not generating boss viewport since client is not the Queue owner");
        return;
    else
        local v337 = v336.Name or v336.UnitName;
        if v335._currentBoss == v337 then
            return;
        else
            v335._currentBoss = v337;
            if v335._bossViewport then
                v335._bossViewport:Destroy();
            end;
            v335._bossViewport = v19.new(v335.selectInfo.Content.Boss, v337, {
                isEnemy = true, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.fromScale(1.25, 1), 
                Position = UDim2.fromScale(0.5, 0), 
                positionAttribute = "QueueOffset"
            });
            if v335._bossViewport then
                v335._bossViewport.viewHandler.viewport.Position = UDim2.fromScale(0.75, 0);
                task.delay(0.1, function() --[[ Line: 1550 ]]
                    -- upvalues: v335 (copy), l_TweenService_0 (ref)
                    if v335._bossViewport and v335._bossViewport.viewHandler and v335._bossViewport.viewHandler.viewport then
                        l_TweenService_0:Create(v335._bossViewport.viewHandler.viewport, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                            Position = UDim2.fromScale(0.5, 0)
                        }):Play();
                    end;
                end);
            end;
            return;
        end;
    end;
end;
v51._renderUnfeaturedLoot = function(v338, v339, v340, v341) --[[ Line: 1560 ]] --[[ Name: _renderUnfeaturedLoot ]]
    -- upvalues: v21 (copy), v17 (copy), v25 (copy), v24 (copy), v26 (copy), v27 (copy), v16 (copy), v34 (ref)
    local v342 = 999999;
    for _, v344 in v339 do
        if v344.type == "RandomUnit" or v344.type == "Unit" then
            v342 = v342 * -1;
            break;
        end;
    end;
    local v345 = v338.rewardTemplate:Clone();
    v345.Name = "LOOT_ITEM_REWARDS";
    v345.LayoutOrder = v342;
    v345.Visible = true;
    v345.Content.Inner.Mystery.Visible = true;
    v345.Parent = v340;
    local v346 = 0;
    local v347 = #v339;
    local v348 = {
        v345.Content.Backdrop, 
        v345.Content.Glow
    };
    v341:Add(v21.Simple(1, function() --[[ Line: 1585 ]]
        -- upvalues: v346 (ref), v347 (copy), v339 (copy), v17 (ref), v345 (copy), v25 (ref), v24 (ref), v26 (ref), v27 (ref), v16 (ref), v348 (copy)
        v346 = v346 + 1;
        if v347 < v346 then
            v346 = 1;
        end;
        local v349 = v339[v346];
        local v350 = v17:GetRewardRarity(v349) or "Common";
        local v351 = v349.extraData or v349.ExtraData;
        v345.Content.Inner.Shiny.Visible = v351 and v351.Shiny or false;
        v345.Content.Inner.Wumbo.Visible = v351 and v351.Mega or v351.Wumbo or false;
        if v349.type == "Unit" then
            v350 = select(2, v25:GetRarity(v349.name));
            v24:SetImage(v345.Content.Inner.Icon, v349.name);
        elseif v349.type == "Pet" then
            v350 = select(2, v26:GetRarity(v349.name));
            v27:SetImage(v345.Content.Inner.Icon, v349.name);
        else
            v17:SetRewardIcon(v349, v345.Content.Inner.Icon);
        end;
        local v352 = v17:Color3ToHex(v16.Solid.Gold);
        v345.Content.Inner.Amount.RichText = true;
        v345.Content.Inner.Amount.Text = ("x%* <font color=\"%*\">%%%*</font>"):format(v349.amount or 1, v352, v349.weight or 1);
        for _, v354 in v348 do
            v354:RemoveTag("VisualizeRarity");
            v354:SetAttribute("Rarity", v350);
            v354:AddTag("VisualizeRarity");
        end;
    end, true));
    v341:Add(v34:HandleButton(v345));
    v341:Add(v345);
end;
v51._setupReadyButtonVisual = function(v355) --[[ Line: 1630 ]] --[[ Name: _setupReadyButtonVisual ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_Confirm_0 = v355.optionsButtons.Options.Confirm;
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
    local v359 = Vector2.new(-1.5, 0);
    local v360 = Vector2.new(1.5, 0);
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Offset = v359;
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
    local v362 = TweenInfo.new(4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
    local v363 = l_TweenService_0:Create(l_UIGradient_0, v362, {
        Offset = v360
    });
    v363.Completed:Connect(function() --[[ Line: 1666 ]]
        -- upvalues: l_UIGradient_0 (copy), v359 (copy), v363 (copy)
        l_UIGradient_0.Offset = v359;
        task.wait(Random.new():NextNumber(0.2, 2));
        v363:Play();
    end);
    v363:Play();
end;
return v51;