local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = require(l_ReplicatedStorage_0.Packages.Knit);
local v7 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v8 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Packages.Fusion);
local v10 = require(l_ReplicatedStorage_0.Packages.Tree);
local v11 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v14 = require(v6.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v15 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v16 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.TurfWarsQuests);
local v18 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v19 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v20 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v21 = require(v6.Player.PlayerScripts.Knit.Controllers.UIController.Util.HighlandUIUtil);
local v22 = require(v6.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v23 = require(l_ReplicatedFirst_0.PlaceIds);
local v24 = require(l_ReplicatedStorage_0.Levels);
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local l_TURF_WARS_0 = v13.TURF_WARS;
local l_TOTAL_QUESTS_0 = v17.TOTAL_QUESTS;
local v34 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v35 = {
    [true] = {
        ["Content/UIGradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#ffea00")), 
            ColorSequenceKeypoint.new(1, Color3.fromHex("#c74900"))
        }), 
        ["Content/UIStroke"] = Color3.fromHex("#58290a"), 
        ["Content/Title/UIStroke"] = Color3.fromHex("#58290a")
    }, 
    [false] = {
        ["Content/UIGradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#948800")), 
            ColorSequenceKeypoint.new(1, Color3.fromHex("#6a2700"))
        }), 
        ["Content/UIStroke"] = Color3.fromHex("#58290a"), 
        ["Content/Title/UIStroke"] = Color3.fromHex("#58290a")
    }
};
local v36 = {
    "Spongebob", 
    "Patrick", 
    "Squidward", 
    "Sandy", 
    "RealisticFishHead", 
    "BubbleBass", 
    "MrKrabs"
};
local v37 = {};
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = false;
local v43 = v7.new();
local v44 = v7.new();
local v45 = v7.new();
local v46 = v7.new();
local v47 = v23:IsLobby() and l_ReplicatedStorage_0.TurfWarsViewModels;
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    Init = function(v48, v49, v50) --[[ Line: 131 ]] --[[ Name: Init ]]
        -- upvalues: v25 (ref), v6 (copy), v26 (ref), v27 (ref), v28 (ref), v29 (ref), v30 (ref), l_TweenService_0 (copy)
        v25 = v6.GetController("UIController");
        v26 = v6.GetController("EventController");
        v27 = v6.GetController("DataController");
        v28 = v6.GetService("UnitService");
        v29 = v6.GetService("TurfWarsService");
        v30 = v6.GetController("AudioController");
        v48.currentMode = v50;
        v48.ui = v49;
        v48.main = v49.Main;
        local l_Window_0 = v48.main.Window;
        v48.exitButton = l_Window_0.Exit;
        local l_Backdrop_0 = l_Window_0.Backdrop;
        v48.topBackdrop = l_Backdrop_0.Top;
        v48.bottomBackdrop = l_Backdrop_0.Bottom;
        local l_Bar_0 = l_Window_0.TimerBar.Bar;
        v48.timerBarFill = l_Bar_0.Fill;
        v48.timerBarLabel = l_Bar_0.Timer;
        v48.timerBarTitle = l_Bar_0.Title;
        v48.content = l_Window_0.Content;
        local l_Buttons_0 = v48.content.Top.Buttons;
        v48.dialog = v48.content.Dialog;
        v48.speakerLabel = v48.dialog.Title.Title;
        v48.dialogLabel = v48.dialog.Dialog;
        v48.startQuestButton = v48.dialog.Confirm;
        v48.viewportsContainer = v48.dialog.Viewports;
        v48.viewportGradient = v48.viewportsContainer.UIGradient;
        local l_Quests_0 = v48.content.Quests;
        v48.questsContainer = l_Quests_0.Bin;
        v48.questTemplate = v48.questsContainer.Template:Clone();
        v48.pickTeamTemplate = v48.questsContainer.PickTeam:Clone();
        local l_Standings_0 = v48.content.Standings;
        v48.chooseTeamFrame = l_Standings_0.ChooseTeam;
        v48.grandPrizeFrame = l_Standings_0.GrandPrize;
        v48.versusBar = l_Standings_0.VersusBar;
        v48.scoreRefreshBar = v48.versusBar.Refresh;
        v48.winningTeamFrame = l_Standings_0.WinningTeam;
        v48.winningTeamLabel = v48.winningTeamFrame.Title;
        v48.winningTeamInfo = v48.winningTeamFrame.Info;
        v48.tiedFrame = l_Standings_0.Tied;
        v48.versusBarFrames = {
            Spongebob = v48.versusBar.Bar.Spongebob, 
            Patrick = v48.versusBar.Bar.Patrick
        };
        v48.teamSelectButtons = {
            Spongebob = l_Standings_0.Spongebob, 
            Patrick = l_Standings_0.Patrick
        };
        v48.stardomFrame = v48.questsContainer.Stardom;
        local l_Info_0 = v48.stardomFrame.Content.Info;
        local l_Bar_1 = l_Info_0.ProgressBar.Bar;
        v48.stardomAmountLabel = l_Info_0.Amount.Title;
        v48.progressRewards = l_Bar_1.Rewards;
        v48.progressRewardTemplate = v48.progressRewards.Template:Clone();
        v48.progressFill = l_Bar_1.Fill.UIGradient;
        v48.progressLines = l_Bar_1.ProgressLines;
        v48.progressLineTemplate = v48.progressLines.Template:Clone();
        v48.stardomFrame.Visible = false;
        v48.pages = {
            Overview = v48.content.Overview, 
            Quests = l_Quests_0, 
            Standings = l_Standings_0
        };
        v48.tabButtons = {
            Overview = l_Buttons_0.Overview, 
            Quests = l_Buttons_0.Quests, 
            Standings = l_Buttons_0.Standings
        };
        v48.questTemplate.Content.Claimed.Visible = false;
        v48.progressRewards.Template:Destroy();
        v48.progressLines.Template:Destroy();
        v48.questsContainer.Template:Destroy();
        v48.questsContainer.PickTeam:Destroy();
        v48.backdropTweens = {
            top = l_TweenService_0:Create(v48.topBackdrop, TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                Position = UDim2.fromScale(0, -1)
            }), 
            bottom = l_TweenService_0:Create(v48.bottomBackdrop, TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                Position = UDim2.fromScale(0, 0)
            })
        };
    end, 
    Start = function(v59) --[[ Line: 245 ]] --[[ Name: Start ]]
        -- upvalues: v31 (ref), v25 (ref), l_RunService_0 (copy), v36 (copy), l_UserInputService_0 (copy), v8 (copy), l_TURF_WARS_0 (copy), v26 (ref), v15 (copy), v29 (ref)
        v31 = v25:GetModuleAsync("Notification"):expect();
        v59:SetPage("Overview");
        if l_RunService_0:IsStudio() then
            local v60 = 0;
            local v61 = {};
            for _, v63 in v36 do
                table.insert(v61, {
                    speaker = v63, 
                    message = ("Test dialog for %*"):format(v63)
                });
            end;
            local l_v61_0 = v61 --[[ copy: 2 -> 8 ]];
            do
                local l_v60_0 = v60;
                l_UserInputService_0.InputBegan:Connect(function(v66, v67) --[[ Line: 261 ]]
                    -- upvalues: v25 (ref), l_v60_0 (ref), l_v61_0 (copy), v59 (copy)
                    if v67 then
                        return;
                    elseif v66.KeyCode == Enum.KeyCode.RightBracket then
                        local v68 = not v25:GetToggleState(script.Name);
                        v25:Toggle(script.Name, v68);
                        return;
                    else
                        if v66.KeyCode == Enum.KeyCode.LeftBracket then
                            l_v60_0 = l_v60_0 + 1;
                            if l_v60_0 > #l_v61_0 then
                                l_v60_0 = 1;
                            end;
                            v59:_updateDialog(l_v61_0[l_v60_0]);
                        end;
                        return;
                    end;
                end);
            end;
        end;
        v25:HandleButton(v59.exitButton, function() --[[ Line: 280 ]]
            -- upvalues: v25 (ref)
            v25:Toggle(script.Name, false);
        end);
        for v69 = 1, #v8.Keys(l_TURF_WARS_0.STARDOM_REWARDS[next(l_TURF_WARS_0.STARDOM_REWARDS)]) - 1 do
            local v70 = v59.progressLineTemplate:Clone();
            v70.Name = v69;
            v70.Parent = v59.progressLines;
        end;
        local l_v26_Timestamps_0, v72 = v26:GetTimestamps();
        l_v26_Timestamps_0 = l_v26_Timestamps_0.UnixTimestamp;
        v72 = v72.UnixTimestamp;
        v26:ObserveTimeLeft(function(v73, _, v75) --[[ Line: 294 ]]
            -- upvalues: v59 (copy), v15 (ref), v72 (ref), l_v26_Timestamps_0 (ref)
            if v75 then
                return;
            else
                v59.timerBarLabel.Text = v15:FormatTimeFromSeconds(v73 or 0);
                local v76 = math.clamp(1 - v73 / (v72 - l_v26_Timestamps_0), 0, 1);
                v59.timerBarFill.Size = UDim2.fromScale(v76, 1);
                return;
            end;
        end);
        v29.Reset:Connect(function(v77) --[[ Line: 307 ]]
            -- upvalues: v59 (copy), v25 (ref), v31 (ref)
            v59:SetPage("Overview");
            v25:Toggle(script.Name, false);
            if v77 then
                return;
            else
                v31:Notify({
                    message = "Turf Wars data has been reset!", 
                    duration = 4
                });
                return;
            end;
        end);
    end, 
    Opening = function(v78) --[[ Line: 322 ]] --[[ Name: Opening ]]
        -- upvalues: v27 (ref), v6 (copy), l_TURF_WARS_0 (copy), v47 (copy), l_ContentProvider_0 (copy), v43 (copy), v25 (ref), v29 (ref), v42 (ref), v31 (ref), l_TOTAL_QUESTS_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), v17 (copy), v45 (copy), v15 (copy), v24 (copy), v7 (copy), v14 (copy), v30 (ref), v11 (copy), v38 (ref), v37 (copy), v46 (copy), v22 (copy), v20 (copy), v16 (copy)
        local v79 = v27:Get(v6.Player, l_TURF_WARS_0.DATA_KEY):expect();
        if not v78.preloadedViewModels then
            local l_v47_Children_0 = v47:GetChildren();
            task.spawn(l_ContentProvider_0.PreloadAsync, l_ContentProvider_0, l_v47_Children_0);
            v78.preloadedViewModels = true;
        end;
        v78.topBackdrop.Position = UDim2.fromScale(0, 0);
        v78.bottomBackdrop.Position = UDim2.fromScale(0, 1);
        v43:Add(function() --[[ Line: 335 ]]
            -- upvalues: v78 (copy)
            for _, v82 in v78.backdropTweens do
                v82:Cancel();
            end;
        end);
        for _, v84 in v78.backdropTweens do
            v84:Play();
        end;
        local v85 = v79.quest > 0;
        v78.startQuestButton.Visible = not v85;
        v78.tabButtons.Quests.Content.Locked.Visible = not v85;
        if not v85 then
            v43:Add(v25:HandleButton(v78.startQuestButton, function() --[[ Line: 351 ]]
                -- upvalues: v29 (ref), v85 (ref), v78 (copy), v42 (ref)
                v29:StartQuest():andThen(function(v86) --[[ Line: 352 ]]
                    -- upvalues: v85 (ref), v78 (ref), v42 (ref)
                    if not v86 then
                        return;
                    else
                        v85 = true;
                        v78.startQuestButton.Visible = false;
                        v78.tabButtons.Quests.Content.Locked.Visible = false;
                        v42 = true;
                        return;
                    end;
                end);
            end));
        end;
        v43:Add(v25:HandleButton(v78.tabButtons.Overview, function() --[[ Line: 366 ]]
            -- upvalues: v78 (copy)
            v78:SetPage("Overview");
        end));
        v43:Add(v25:HandleButton(v78.tabButtons.Standings, function() --[[ Line: 370 ]]
            -- upvalues: v79 (ref), v31 (ref), v78 (copy)
            if not v79.team then
                v31:Notify({
                    message = "Complete the Starter Quests first!", 
                    isPositive = false, 
                    duration = 4
                });
                return;
            else
                v78:SetPage("Standings");
                return;
            end;
        end));
        v43:Add(v25:HandleButton(v78.tabButtons.Quests, function() --[[ Line: 384 ]]
            -- upvalues: v85 (ref), v31 (ref), v78 (copy)
            if not v85 then
                v31:Notify({
                    message = "You need to start the quest first!", 
                    isPositive = false, 
                    duration = 4
                });
                return;
            else
                v78:SetPage("Quests");
                return;
            end;
        end));
        local v87 = {};
        local function _() --[[ Line: 400 ]] --[[ Name: updateQuestDialog ]]
            -- upvalues: v78 (copy), v79 (ref)
            v78:_updateDialog({
                questData = v79
            });
        end;
        local function v96(v89, v90, v91) --[[ Line: 404 ]] --[[ Name: toggleQuestDetails ]]
            -- upvalues: l_TOTAL_QUESTS_0 (ref)
            local l_Content_0 = v89.frame.Content;
            local l_Claim_0 = l_Content_0.Info.Claim;
            if not v91 then
                l_Content_0.Title.Visible = v90;
            end;
            l_Claim_0.Visible = v90;
            if v89.index == l_TOTAL_QUESTS_0 then
                return;
            else
                for _, v95 in v89.rewardVisualizers do
                    v95:GetButton(1).Interactable = v90;
                end;
                return;
            end;
        end;
        local function _() --[[ Line: 423 ]] --[[ Name: scrollToActiveQuest ]]
            -- upvalues: v87 (copy), v79 (ref), l_RunService_0 (ref), v78 (copy), l_TweenService_0 (ref)
            local v97 = v87[v79.quest];
            if not v97 then
                return;
            else
                local l_frame_0 = v97.frame;
                l_RunService_0.PreRender:Once(function() --[[ Line: 431 ]]
                    -- upvalues: v78 (ref), l_frame_0 (copy), l_TweenService_0 (ref)
                    local v99 = v78.questsContainer.CanvasPosition.Y + l_frame_0.AbsolutePosition.Y - v78.questsContainer.AbsolutePosition.Y - (v78.questsContainer.AbsoluteWindowSize.Y / 2 - l_frame_0.AbsoluteSize.Y / 2);
                    if v99 < 0 or v78.questsContainer.AbsoluteCanvasSize.Y < v99 then
                        v99 = 0;
                    end;
                    local v100 = l_TweenService_0:Create(v78.questsContainer, TweenInfo.new(0.2), {
                        CanvasPosition = Vector2.new(0, v99)
                    });
                    v100.Completed:Once(function() --[[ Line: 446 ]]
                        -- upvalues: v100 (copy)
                        v100:Destroy();
                    end);
                    v100:Play();
                end);
                return;
            end;
        end;
        local function v108(v102) --[[ Line: 454 ]] --[[ Name: updateQuestState ]]
            -- upvalues: v87 (copy), v17 (ref), v79 (ref), v96 (copy)
            local v103 = v87[v102];
            if not v103 then
                return;
            else
                local l_Content_1 = v103.frame.Content;
                local v105 = v17.util.IsQuestCompleted(v79, v102);
                if v105 then
                    l_Content_1.Claimed.Visible = true;
                    v96(v103, false, true);
                end;
                if v102 <= v79.quest then
                    l_Content_1.Blocked.Visible = false;
                    if not v105 then
                        v96(v103, true);
                    end;
                    return;
                elseif v105 then
                    return;
                else
                    local v106 = v102 - 1;
                    if v17.util.GetQuestInfo(v79, v106) then
                        local v107 = v17.util.IsQuestCompleted(v79, v106);
                        l_Content_1.Blocked.Visible = not v107;
                        v96(v103, v107);
                        if not v107 then
                            return;
                        end;
                    end;
                    v96(v103, true);
                    return;
                end;
            end;
        end;
        local function _() --[[ Line: 506 ]] --[[ Name: updateAllQuestStates ]]
            -- upvalues: v87 (copy), v108 (copy)
            for v109 in v87 do
                v108(v109);
            end;
        end;
        local function v151() --[[ Line: 512 ]] --[[ Name: refreshQuests ]]
            -- upvalues: v45 (ref), v78 (copy), v87 (copy), v17 (ref), v79 (ref), l_TOTAL_QUESTS_0 (ref), v15 (ref), v24 (ref), v7 (ref), v14 (ref), l_TURF_WARS_0 (ref), v27 (ref), v6 (ref), v29 (ref), v31 (ref), v96 (copy), v30 (ref), v25 (ref), v108 (copy), v11 (ref)
            v45:Destroy();
            v45:Add(function() --[[ Line: 514 ]]
                -- upvalues: v78 (ref), v87 (ref)
                v78:_clearQuests();
                table.clear(v87);
            end);
            local v111 = v17.util.IsQuestCompleted(v79, l_TOTAL_QUESTS_0);
            v78.stardomFrame.Visible = v111;
            if v111 then
                return;
            else
                local function v145(v112, v113) --[[ Line: 525 ]] --[[ Name: addQuest ]]
                    -- upvalues: v79 (ref), v17 (ref), v78 (ref), v15 (ref), v24 (ref), v7 (ref), v14 (ref), v87 (ref), l_TURF_WARS_0 (ref), v27 (ref), v6 (ref), v29 (ref), v31 (ref), v96 (ref), v30 (ref), v25 (ref), v108 (ref)
                    local v114 = if v79.team then v113 + v17.TOTAL_PROLOGUE_QUESTS else v113;
                    local l_objective_0 = v112.objective;
                    local v116 = if not l_objective_0 then v78.pickTeamTemplate:Clone() else v78.questTemplate:Clone();
                    local l_Content_2 = v116.Content;
                    if l_objective_0 then
                        v116.Name = ("Quest_%*"):format(v114);
                        local v118 = string.upper((("Quest %*"):format((string.format("%0.2i", v114)))));
                        l_Content_2.Title.Title.Text = ("%* - %*"):format(v118, v112.name);
                        while true do
                            local v119, v120 = string.find(l_objective_0, "<rich>.-</rich>");
                            if v119 and v120 then
                                local v121 = utf8.len(l_objective_0);
                                l_objective_0 = ("%*</font>%*"):format(string.sub(l_objective_0, 1, v119 - 1) .. ("<font color=\"#ebff33\">%*"):format((string.sub(l_objective_0, v119 + 6, v120 - 7))), (string.sub(l_objective_0, v120 + 1, v121)));
                            else
                                break;
                            end;
                        end;
                        l_objective_0 = string.gsub(l_objective_0, "<amount>", v15:CommaNumber(v112.required));
                        if v112.map then
                            local v122 = nil;
                            for _, v124 in v24.Stages do
                                for v125, v126 in v124 do
                                    if v125 == v112.map then
                                        v122 = v126.DisplayName;
                                        break;
                                    end;
                                end;
                            end;
                            l_objective_0 = string.gsub(l_objective_0, "<map>", v122);
                        end;
                        l_Content_2.Info.Description.Text = l_objective_0;
                    end;
                    local v127 = v7.new();
                    v127:AttachTo(v116);
                    local v128 = {};
                    table.insert(v128, v14.new({
                        v112.rewards[1]
                    }, {
                        template = l_Content_2.Rewards.Primary, 
                        parent = l_Content_2.Rewards, 
                        hideOwnedAmount = #v112.rewards > 1, 
                        hideExistCount = true, 
                        retainLayoutOrder = true, 
                        tooltipPredicate = function(v129) --[[ Line: 588 ]] --[[ Name: tooltipPredicate ]]
                            return v129.Interactable;
                        end
                    }));
                    if #v112.rewards > 1 then
                        table.insert(v128, v14.new({
                            v112.rewards[2]
                        }, {
                            template = l_Content_2.Rewards.Secondary, 
                            parent = l_Content_2.Rewards, 
                            hideOwnedAmount = true, 
                            hideExistCount = true, 
                            retainLayoutOrder = true, 
                            tooltipPredicate = function(v130) --[[ Line: 603 ]] --[[ Name: tooltipPredicate ]]
                                return v130.Interactable;
                            end
                        }));
                    end;
                    for _, v132 in v128 do
                        v127:Add(v132);
                    end;
                    v116.Parent = v78.questsContainer;
                    local v133 = {
                        index = v114, 
                        frame = v116, 
                        questInfo = v112, 
                        rewardVisualizers = v128
                    };
                    v87[v114] = v133;
                    local l_Claim_1 = l_Content_2.Info.Claim;
                    if l_objective_0 then
                        local l_NotCompleted_0 = l_Claim_1.Content.NotCompleted;
                        local l_Fill_0 = l_NotCompleted_0.Fill;
                        local l_Amount_0 = l_NotCompleted_0.Amount;
                        local v138 = {
                            l_TURF_WARS_0.DATA_KEY, 
                            "progress", 
                            v114
                        };
                        local l_l_NotCompleted_0_0 = l_NotCompleted_0 --[[ copy: 10 -> 18 ]];
                        v127:Add(v27:OnChanged(v6.Player, v138, function(v140) --[[ Line: 634 ]]
                            -- upvalues: l_l_NotCompleted_0_0 (copy), v112 (copy), l_Fill_0 (copy), l_Amount_0 (copy), v15 (ref), v78 (ref), v79 (ref)
                            l_l_NotCompleted_0_0.Visible = v140 < v112.required;
                            l_Fill_0.Size = UDim2.fromScale(v140 / v112.required, 1);
                            l_Amount_0.Text = ("%*/%*"):format(v15:CommaNumber(v140), (v15:CommaNumber(v112.required)));
                            if v140 == v112.required then
                                v78:_updateDialog({
                                    questData = v79
                                });
                            end;
                        end, true));
                    end;
                    local function _(v141) --[[ Line: 645 ]] --[[ Name: claimQuest ]]
                        -- upvalues: v29 (ref), v31 (ref), l_Content_2 (copy), l_Claim_1 (copy), v96 (ref), v133 (copy), v30 (ref)
                        v29:ClaimQuest(v141):andThen(function(v142) --[[ Line: 646 ]]
                            -- upvalues: v31 (ref), l_Content_2 (ref), l_Claim_1 (ref), v96 (ref), v133 (ref), v30 (ref)
                            if not v142 then
                                v31:Notify({
                                    message = "Something went wrong!", 
                                    isPositive = false, 
                                    duration = 4
                                });
                                return;
                            else
                                l_Content_2.Claimed.Visible = true;
                                l_Claim_1.Visible = false;
                                v96(v133, false, true);
                                v30:PlaySound({
                                    name = "UI.Success", 
                                    soundGroup = "Master.SFX.UI"
                                });
                                return;
                            end;
                        end);
                    end;
                    v25:HandleButton(l_Claim_1, function() --[[ Line: 668 ]]
                        -- upvalues: v17 (ref), v79 (ref), v114 (copy), v112 (copy), v78 (ref), v31 (ref), v29 (ref), l_Content_2 (copy), l_Claim_1 (copy), v96 (ref), v133 (copy), v30 (ref)
                        if v17.util.IsQuestCompleted(v79, v114) then
                            return;
                        elseif v112.selectTeam then
                            v78:SetPage("Standings");
                            return;
                        elseif v17.util.GetProgress(v79, v114) < v112.required then
                            v31:Notify({
                                message = "Quest not complete!", 
                                isPositive = false, 
                                duration = 4
                            });
                            return;
                        else
                            v29:ClaimQuest(nil):andThen(function(v144) --[[ Line: 646 ]]
                                -- upvalues: v31 (ref), l_Content_2 (ref), l_Claim_1 (ref), v96 (ref), v133 (ref), v30 (ref)
                                if not v144 then
                                    v31:Notify({
                                        message = "Something went wrong!", 
                                        isPositive = false, 
                                        duration = 4
                                    });
                                    return;
                                else
                                    l_Content_2.Claimed.Visible = true;
                                    l_Claim_1.Visible = false;
                                    v96(v133, false, true);
                                    v30:PlaySound({
                                        name = "UI.Success", 
                                        soundGroup = "Master.SFX.UI"
                                    });
                                    return;
                                end;
                            end);
                            return;
                        end;
                    end);
                    v108(v114);
                end;
                local v146 = false;
                v45:Add(function() --[[ Line: 697 ]]
                    -- upvalues: v146 (ref)
                    v146 = true;
                end);
                v11.each(v17.util.GetQuests(v79), function(v147, v148) --[[ Line: 703 ]]
                    -- upvalues: v11 (ref), v146 (ref), v145 (copy)
                    return v11.defer(function(v149, v150) --[[ Line: 704 ]]
                        -- upvalues: v146 (ref), v145 (ref), v147 (copy), v148 (copy)
                        if v146 then
                            return v150();
                        else
                            v149(v145(v147, v148));
                            return;
                        end;
                    end);
                end);
                return;
            end;
        end;
        local v152 = v38 ~= "Quests";
        v37.Quests = function() --[[ Line: 716 ]]
            -- upvalues: v152 (ref), v151 (copy), v78 (copy), v79 (ref), v87 (copy), l_RunService_0 (ref), l_TweenService_0 (ref)
            if v152 then
                v151();
                v152 = false;
            end;
            v78:_updateDialog({
                questData = v79
            });
            local v153 = v87[v79.quest];
            if not v153 then
                return;
            else
                local l_frame_1 = v153.frame;
                l_RunService_0.PreRender:Once(function() --[[ Line: 431 ]]
                    -- upvalues: v78 (ref), l_frame_1 (copy), l_TweenService_0 (ref)
                    local v155 = v78.questsContainer.CanvasPosition.Y + l_frame_1.AbsolutePosition.Y - v78.questsContainer.AbsolutePosition.Y - (v78.questsContainer.AbsoluteWindowSize.Y / 2 - l_frame_1.AbsoluteSize.Y / 2);
                    if v155 < 0 or v78.questsContainer.AbsoluteCanvasSize.Y < v155 then
                        v155 = 0;
                    end;
                    local v156 = l_TweenService_0:Create(v78.questsContainer, TweenInfo.new(0.2), {
                        CanvasPosition = Vector2.new(0, v155)
                    });
                    v156.Completed:Once(function() --[[ Line: 446 ]]
                        -- upvalues: v156 (copy)
                        v156:Destroy();
                    end);
                    v156:Play();
                end);
                return;
            end;
        end;
        v43:Add(v27:OnChanged(v6.Player, {
            l_TURF_WARS_0.DATA_KEY, 
            "quest"
        }, function() --[[ Line: 726 ]]
            -- upvalues: v79 (ref), v27 (ref), v6 (ref), l_TURF_WARS_0 (ref), v87 (copy), v108 (copy), v38 (ref), v78 (copy), l_RunService_0 (ref), l_TweenService_0 (ref), v42 (ref)
            v79 = v27:Get(v6.Player, l_TURF_WARS_0.DATA_KEY):expect();
            for v157 in v87 do
                v108(v157);
            end;
            if v38 == "Quests" then
                v78:_updateDialog({
                    questData = v79
                });
                local v158 = v87[v79.quest];
                if v158 then
                    local l_frame_2 = v158.frame;
                    l_RunService_0.PreRender:Once(function() --[[ Line: 431 ]]
                        -- upvalues: v78 (ref), l_frame_2 (copy), l_TweenService_0 (ref)
                        local v160 = v78.questsContainer.CanvasPosition.Y + l_frame_2.AbsolutePosition.Y - v78.questsContainer.AbsolutePosition.Y - (v78.questsContainer.AbsoluteWindowSize.Y / 2 - l_frame_2.AbsoluteSize.Y / 2);
                        if v160 < 0 or v78.questsContainer.AbsoluteCanvasSize.Y < v160 then
                            v160 = 0;
                        end;
                        local v161 = l_TweenService_0:Create(v78.questsContainer, TweenInfo.new(0.2), {
                            CanvasPosition = Vector2.new(0, v160)
                        });
                        v161.Completed:Once(function() --[[ Line: 446 ]]
                            -- upvalues: v161 (copy)
                            v161:Destroy();
                        end);
                        v161:Play();
                    end);
                end;
            end;
            if v42 then
                v78:SetPage("Quests");
                v42 = false;
            end;
            v78.tabButtons.Standings.Content.Locked.Visible = v79.team == false;
        end));
        v43:Add(v27:OnChanged(v6.Player, {
            l_TURF_WARS_0.DATA_KEY, 
            "completion", 
            l_TOTAL_QUESTS_0
        }, function(v162) --[[ Line: 746 ]]
            -- upvalues: v151 (copy)
            if v162 then
                v151();
            end;
        end));
        if v38 == "Quests" then
            v151();
            v78:_updateDialog({
                questData = v79
            });
            local v163 = v87[v79.quest];
            if v163 then
                local l_frame_3 = v163.frame;
                l_RunService_0.PreRender:Once(function() --[[ Line: 431 ]]
                    -- upvalues: v78 (copy), l_frame_3 (copy), l_TweenService_0 (ref)
                    local v165 = v78.questsContainer.CanvasPosition.Y + l_frame_3.AbsolutePosition.Y - v78.questsContainer.AbsolutePosition.Y - (v78.questsContainer.AbsoluteWindowSize.Y / 2 - l_frame_3.AbsoluteSize.Y / 2);
                    if v165 < 0 or v78.questsContainer.AbsoluteCanvasSize.Y < v165 then
                        v165 = 0;
                    end;
                    local v166 = l_TweenService_0:Create(v78.questsContainer, TweenInfo.new(0.2), {
                        CanvasPosition = Vector2.new(0, v165)
                    });
                    v166.Completed:Once(function() --[[ Line: 446 ]]
                        -- upvalues: v166 (copy)
                        v166:Destroy();
                    end);
                    v166:Play();
                end);
            end;
        end;
        v78.tabButtons.Standings.Content.Locked.Visible = v79.team == false;
        v37.Standings = function() --[[ Line: 761 ]]
            -- upvalues: v46 (ref), v79 (ref), v78 (copy), v22 (ref), v25 (ref), v29 (ref), v31 (ref), v151 (copy), v37 (ref), v20 (ref), v14 (ref), l_TURF_WARS_0 (ref), v15 (ref), v16 (ref)
            v46:Destroy();
            local v167 = v79.team ~= false;
            v78.chooseTeamFrame.Visible = not v167;
            v78.grandPrizeFrame.Visible = v167;
            v78.versusBar.Visible = v167;
            v78.winningTeamFrame.Visible = v167;
            if not v167 then
                for v168, v169 in v78.teamSelectButtons do
                    local l_Viewport_0 = v169.Content.Viewport;
                    local v171 = nil;
                    local l_Model_0 = l_Viewport_0.WorldModel:FindFirstChildOfClass("Model");
                    local l_Name_0 = l_Model_0.Name;
                    local v174 = ("Select_%*"):format(l_Name_0);
                    do
                        local l_v171_0 = v171;
                        local function v177() --[[ Line: 780 ]] --[[ Name: animateViewmodel ]]
                            -- upvalues: v22 (ref), l_Name_0 (copy), l_Model_0 (copy), v46 (ref), v174 (copy), l_v171_0 (ref)
                            local v176 = v22.new(l_Name_0, l_Model_0, "Friendlies");
                            if not v176 then
                                return;
                            else
                                v176:Play(l_Model_0:GetAttribute("Animation") or "Idle");
                                if v46:Get(v174) then
                                    v46:Remove(v174);
                                end;
                                v46:Add(v176, v174);
                                l_v171_0 = v176;
                                return;
                            end;
                        end;
                        v46:Add(v25:HandleButton(v169, function() --[[ Line: 820 ]]
                            -- upvalues: v29 (ref), v168 (copy), v31 (ref), v79 (ref), v151 (ref), v37 (ref)
                            v29:SelectTeam(v168):andThen(function(v178) --[[ Line: 821 ]]
                                -- upvalues: v31 (ref), v79 (ref), v168 (ref), v151 (ref), v37 (ref)
                                if not v178 then
                                    v31:Notify({
                                        message = "Failed to select team!", 
                                        isPositive = false, 
                                        duration = 4
                                    });
                                    return;
                                else
                                    v79.team = v168;
                                    v151();
                                    v37.Standings();
                                    return;
                                end;
                            end);
                        end, {
                            MouseEnter = function() --[[ Line: 838 ]] --[[ Name: MouseEnter ]]
                                -- upvalues: v177 (copy)
                                v177();
                            end, 
                            MouseLeave = function() --[[ Line: 842 ]] --[[ Name: MouseLeave ]]
                                -- upvalues: l_v171_0 (ref), v46 (ref), v174 (copy)
                                if l_v171_0 then
                                    v46:Remove(v174);
                                    l_v171_0 = nil;
                                end;
                            end
                        }));
                    end;
                end;
                return;
            else
                for _, v180 in v78.teamSelectButtons do
                    v180.Content.Viewport.ImageColor3 = v20.Solid.White;
                end;
                v46:Add(v14.new({
                    l_TURF_WARS_0.GRAND_PRIZE
                }, {
                    template = v78.grandPrizeFrame.Reward, 
                    parent = v78.grandPrizeFrame, 
                    hideOwnedAmount = true, 
                    retainLayoutOrder = true
                }));
                for v181, v182 in v78.versusBarFrames do
                    v182.YourTeam.Visible = v181 == v79.team;
                end;
                v46:Add(v29.Standings:Observe(function(v183) --[[ Line: 876 ]]
                    -- upvalues: v78 (ref), v15 (ref), v16 (ref), l_TURF_WARS_0 (ref)
                    for v184, v185 in v183 do
                        v78.versusBarFrames[v184].Points.Text = v15:CommaNumber(v185);
                    end;
                    local v186 = true;
                    local v187 = nil;
                    for _, v189 in v183 do
                        if not v187 then
                            v187 = v189;
                        elseif v189 ~= v187 then
                            v186 = false;
                            break;
                        end;
                    end;
                    if v186 then
                        v78.winningTeamFrame.Visible = false;
                        v78.tiedFrame.Visible = true;
                        return;
                    else
                        local v190 = nil;
                        for v191, v192 in v183 do
                            if not v190 or v183[v190] < v192 then
                                v190 = v191;
                            end;
                        end;
                        local v193 = nil;
                        for v194 in v183 do
                            if v194 ~= v190 then
                                v193 = v194;
                                break;
                            end;
                        end;
                        local v195 = {};
                        for v196 in v183 do
                            v195[v196] = v16:GetUnitValue(v196, "FullName");
                        end;
                        local v197 = v183[v190] - v183[v193];
                        local v198 = v15:SuffixNumber(v197, true);
                        local v199 = v15:Pluralize("Point", v197, false);
                        v78.winningTeamLabel.Text = ("Team %*"):format(v195[v190]);
                        v78.winningTeamInfo.Text = ("They have %* more %* than %*!"):format(v198, v199, v195[v193]);
                        v78.winningTeamLabel.TextColor3 = l_TURF_WARS_0.TEAM_COLORS[v190];
                        v78.winningTeamLabel.Title.TextColor3 = l_TURF_WARS_0.TEAM_COLORS[v190];
                        v78.tiedFrame.Visible = false;
                        v78.winningTeamFrame.Visible = true;
                        return;
                    end;
                end));
                local v200 = nil;
                v46:Add(v29.NextRefresh:Observe(function(v201) --[[ Line: 936 ]]
                    -- upvalues: l_TURF_WARS_0 (ref), v200 (ref), v78 (ref), v15 (ref)
                    local v202 = v201 - workspace:GetServerTimeNow();
                    local v203 = v202 / l_TURF_WARS_0.STANDINGS_UPDATE_RATE;
                    if v200 then
                        v200:Cancel();
                    end;
                    v78.scoreRefreshBar.Size = UDim2.fromScale(0.5 * v203, 0.1);
                    v200 = v15:Tween(v78.scoreRefreshBar, TweenInfo.new(v202, Enum.EasingStyle.Linear), {
                        Size = UDim2.fromScale(0, 0.1)
                    });
                end));
                return;
            end;
        end;
        if v38 == "Standings" then
            v37.Standings();
        end;
        v37.Overview = function() --[[ Line: 959 ]]
            -- upvalues: v78 (copy)
            v78:_updateDialog({
                message = "SpongeBob and Patrick are fightin\226\128\153 for turf! Finish some quests, then pick a side and join the battle. Let\226\128\153s make some profit!"
            });
        end;
        if v38 == "Overview" then
            v37.Overview();
        end;
        v43:Add(function() --[[ Line: 967 ]]
            -- upvalues: v37 (ref)
            table.clear(v37);
        end);
        local function v219(v204) --[[ Line: 972 ]] --[[ Name: updateStardom ]]
            -- upvalues: l_TURF_WARS_0 (ref), v78 (copy), v15 (ref), v43 (ref), v14 (ref), v27 (ref), v6 (ref)
            local v205 = l_TURF_WARS_0.STARDOM_REWARDS[v204];
            local v206 = #v205;
            for v207, v208 in v205 do
                local v209 = v78.progressRewardTemplate:Clone();
                v209.Name = ("Reward_%*"):format(v207);
                local v210 = v207 / v206;
                v209.Position = UDim2.fromScale(v210, 0.3);
                v209.LayoutOrder = v207;
                v209.Unsorted.Amount.Title.Text = v15:SuffixNumber(v208.amount);
                v209.Parent = v78.progressRewards;
                v43:Add(v209);
                local v211 = v14.new({
                    v208.reward
                }, {
                    template = v209.Primary, 
                    retainLayoutOrder = true, 
                    hideExistCount = true, 
                    parent = v209
                });
                v43:Add(v211);
            end;
            v43:Add(v27:OnChanged(v6.Player, {
                l_TURF_WARS_0.DATA_KEY, 
                "stardom"
            }, function(v212) --[[ Line: 1002 ]]
                -- upvalues: v15 (ref), v78 (ref), v205 (copy), v206 (copy)
                local v213 = v15:CommaNumber(v212);
                v78.stardomAmountLabel.Text = ("%* EARNED"):format(v213);
                local v214 = 0;
                for _, v216 in v205 do
                    v214 = v214 + 1;
                    if v212 < v216.amount then
                        break;
                    end;
                end;
                local l_amount_0 = v205[v214].amount;
                local v218 = (v214 - 1) / v206 + v212 / l_amount_0 * (1 / v206);
                v78.progressFill.Offset = Vector2.new(-(1 - v218), 0);
            end, true));
        end;
        v43:Add(v27:Get(v6.Player, {
            l_TURF_WARS_0.DATA_KEY, 
            "team"
        }):andThen(function(v220) --[[ Line: 1027 ]]
            -- upvalues: v219 (copy)
            if v220 then
                v219(v220);
            end;
        end));
        v43:Add(v29.TeamSelected:Connect(v219));
    end, 
    Closed = function(_) --[[ Line: 1036 ]] --[[ Name: Closed ]]
        -- upvalues: v43 (copy), v44 (copy), v45 (copy), v46 (copy), v40 (ref), v39 (ref), v42 (ref)
        v43:Destroy();
        v44:Destroy();
        v45:Destroy();
        v46:Destroy();
        v40 = nil;
        v39 = nil;
        v42 = false;
    end, 
    SetPage = function(v222, v223) --[[ Line: 1048 ]] --[[ Name: SetPage ]]
        -- upvalues: v38 (ref), v37 (copy), v46 (copy), v35 (copy), v10 (copy)
        if not v222.pages[v223] then
            return;
        elseif v38 == v223 then
            return;
        else
            v38 = v223;
            local v224 = v37[v38];
            if v224 then
                v224();
            end;
            v222.dialog.Visible = v38 ~= "Standings";
            if v38 ~= "Standings" then
                v46:Destroy();
            end;
            for v225, v226 in v222.pages do
                v226.Visible = v225 == v223;
            end;
            for v227, v228 in v222.tabButtons do
                local l_v35_0 = v35;
                local v230 = v227 == v223;
                for v231, v232 in l_v35_0[v230] do
                    if v10.Exists(v228, v231) then
                        v10.Find(v228, v231).Color = v232;
                    end;
                end;
            end;
            return;
        end;
    end, 
    _updateDialog = function(v233, v234) --[[ Line: 1087 ]] --[[ Name: _updateDialog ]]
        -- upvalues: v17 (copy), v39 (ref), v40 (ref), v19 (copy), v47 (copy), v15 (copy), v34 (copy), v41 (ref), v43 (copy), v44 (copy), v16 (copy), v18 (copy)
        local l_message_0 = v234.message;
        local v236 = v234.speaker or "MrKrabs";
        if v234.questData then
            local v237 = v17.util.GetQuestInfo(v234.questData);
            local v238 = v17.util.IsQuestFinished(v234.questData);
            local v239 = v238 and "complete" or "intro";
            l_message_0 = v237.dialogue[v239] or v237.dialogue.intro;
            v236 = if v238 then v237.dialogue.outroSpeaker or v237.dialogue.speaker else v237.dialogue.speaker;
        end;
        if not l_message_0 or v39 == l_message_0 and v40 == v236 then
            return;
        else
            if v236 ~= v40 then
                local v240 = v19.new(v233.viewportsContainer, v236, {
                    container = v47, 
                    AnchorPoint = Vector2.zero, 
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(-1, 0)
                });
                local l_viewport_0 = v240.viewHandler.viewport;
                v233.viewportGradient:Clone().Parent = l_viewport_0;
                v15:Tween(l_viewport_0, v34, {
                    Position = UDim2.new()
                });
                if v41 then
                    local l_v41_0 = v41;
                    local l_viewport_1 = l_v41_0.viewHandler.viewport;
                    v15:Tween(l_viewport_1, v34, {
                        Position = UDim2.fromScale(1, 0)
                    }, function() --[[ Line: 1146 ]]
                        -- upvalues: l_v41_0 (copy)
                        l_v41_0:Destroy();
                    end);
                end;
                v41 = v240;
                if v43:Get("DialogViewportCleanup") then
                    v43:Remove("DialogViewportCleanup", true);
                end;
                v43:Add(function() --[[ Line: 1158 ]]
                    -- upvalues: v240 (copy), v41 (ref)
                    v240:Destroy();
                    v41 = nil;
                end, "DialogViewportCleanup");
            end;
            v44:Destroy();
            v39 = l_message_0;
            v40 = v236;
            local v244 = utf8.len(l_message_0) * 0.025;
            v233.dialogLabel.Text = l_message_0;
            v233.dialogLabel.MaxVisibleGraphemes = 0;
            v233.speakerLabel.Text = v16:GetUnitValue(v236, "FullName");
            local v246 = v18("IntValue", 0, TweenInfo.new(v244, Enum.EasingStyle.Linear), {
                Value = utf8.len(v233.dialogLabel.Text)
            }, function(v245) --[[ Line: 1182 ]]
                -- upvalues: v233 (copy)
                v233.dialogLabel.MaxVisibleGraphemes = v245;
            end);
            v44:Add(v246);
            return;
        end;
    end, 
    _clearQuests = function(v247) --[[ Line: 1190 ]] --[[ Name: _clearQuests ]]
        -- upvalues: v21 (copy)
        v21.deferClearBrowser(v247.questsContainer, {
            filterClass = "Frame", 
            forceDefer = true, 
            predicate = function(v248) --[[ Line: 1196 ]] --[[ Name: predicate ]]
                -- upvalues: v247 (copy)
                return v248 ~= v247.stardomFrame;
            end
        });
    end
};