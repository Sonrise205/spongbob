local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TeleportService_0 = game:GetService("TeleportService");
local _ = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v6 = require(l_ReplicatedStorage_0.Packages.Knit);
local v7 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v11 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v14 = require(v6.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v15 = require(v6.Player.PlayerScripts.Knit.Modules.UIMenuAnimatedNPC);
local v16 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local _ = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local _ = require(l_ReplicatedStorage_0.Shared.Data.SpritesheetAtlas);
local v20 = require(l_ReplicatedStorage_0.Shared.Data.SurviveLaunchQuests);
local _ = require(l_ReplicatedStorage_0.Levels);
local _ = require(l_ReplicatedFirst_0.PlaceIds);
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local _ = {
    [true] = {
        ["Content/UIGradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#10092c")), 
            ColorSequenceKeypoint.new(1, Color3.fromHex("#2adea2"))
        }), 
        ["Content/UIStroke"] = Color3.fromHex("#3cab82"), 
        ["Content/Title/UIStroke"] = Color3.fromHex("#233858")
    }, 
    [false] = {
        ["Content/UIGradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#10092c")), 
            ColorSequenceKeypoint.new(1, Color3.fromHex("#dedede"))
        }), 
        ["Content/UIStroke"] = Color3.fromHex("#ababab"), 
        ["Content/Title/UIStroke"] = Color3.fromHex("#3a393d")
    }
};
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    Init = function(v31, v32, v33) --[[ Line: 88 ]] --[[ Name: Init ]]
        -- upvalues: v23 (ref), v6 (copy), v24 (ref), v25 (ref), v26 (ref), v27 (ref), v7 (copy)
        v23 = v6.GetController("UIController");
        v24 = v6.GetController("SurviveLaunchQuestsController");
        v25 = v6.GetService("SurviveQuestsService");
        v26 = v6.GetController("DataController");
        v27 = v6.GetController("AudioController");
        v31.currentMode = v33;
        v31.ui = v32;
        v31.main = v32.Main;
        local l_Window_0 = v31.main.Window;
        v31.exitButton = l_Window_0.Exit;
        local l_Bar_0 = l_Window_0.ProgressBar.Bar;
        v31.progressRewards = l_Bar_0.Rewards;
        v31.progressRewardTemplate = v31.progressRewards.Template:Clone();
        v31.progressFill = l_Bar_0.Fill.UIGradient;
        v31.progressLines = l_Bar_0.ProgressLines;
        v31.progressLineTemplate = v31.progressLines.Template:Clone();
        local l_Bar_1 = l_Window_0.TimerBar.Bar;
        v31.timerBarFill = l_Bar_1.Fill;
        v31.timerBarLabel = l_Bar_1.Timer;
        v31.timerBarTitle = l_Bar_1.Title;
        v31.content = l_Window_0.Content;
        v31.questsContainer = v31.content.Quests;
        v31.questTemplate = v31.questsContainer.Template:Clone();
        v31.progressRewards.Template:Destroy();
        v31.progressLines.Template:Destroy();
        v31.dumpster = v7.new();
    end, 
    Start = function(v37) --[[ Line: 160 ]] --[[ Name: Start ]]
        -- upvalues: v28 (ref), v23 (ref), v29 (ref), v6 (copy), l_TeleportService_0 (copy), v20 (copy), v25 (ref)
        v28 = v23:GetModuleAsync("Notification"):expect();
        v29 = v23:GetModuleAsync("MessagePrompt"):expect();
        v37.sbbPlaytime = v6.Player:GetAttribute("DailySBBPlaytime");
        v6.Player:GetAttributeChangedSignal("DailySBBPlaytime"):Connect(function() --[[ Line: 179 ]]
            -- upvalues: v37 (copy), v6 (ref)
            v37.sbbPlaytime = v6.Player:GetAttribute("DailySBBPlaytime") or 0;
        end);
        v23:HandleButton(v37.exitButton, function() --[[ Line: 183 ]]
            -- upvalues: v23 (ref)
            v23:Toggle(script.Name, false);
        end);
        v23:HandleButton(v37.main.Window.Content.Teleport.Confirm, function() --[[ Line: 187 ]]
            -- upvalues: v29 (ref), l_TeleportService_0 (ref)
            v29:Prompt({
                message = "Are you sure you want to teleport to Survive The Bikini Bottom?", 
                options = {
                    {
                        text = "Yes", 
                        callback = function() --[[ Line: 193 ]] --[[ Name: callback ]]
                            -- upvalues: l_TeleportService_0 (ref)
                            l_TeleportService_0:Teleport(111471464387284);
                        end
                    }, 
                    {
                        text = "No"
                    }
                }
            });
        end);
        local l_v20_LatestQuestline_0, v39 = v20:GetLatestQuestline();
        v37.questlineInfo = l_v20_LatestQuestline_0;
        v37.questlineIndex = v39;
        v37.totalQuests = 0;
        for _, v41 in v37.questlineInfo.batches do
            for _ in v41.quests do
                v37.totalQuests = v37.totalQuests + 1;
            end;
        end;
        for v43 = 1, v37.totalQuests - 1 do
            local v44 = v37.progressLineTemplate:Clone();
            v44.Name = v43;
            v44.Parent = v37.progressLines;
        end;
        v37.batchButtons = {};
        v25.TimeChanged:Connect(function(v45) --[[ Line: 228 ]]
            -- upvalues: v20 (ref)
            v20.timeOverride = v45;
        end);
    end, 
    Opening = function(v46) --[[ Line: 233 ]] --[[ Name: Opening ]]
        -- upvalues: v24 (ref), v15 (copy), v16 (copy), v20 (copy), v11 (copy), v14 (copy), v7 (copy), v26 (ref), v6 (copy), v23 (ref), v28 (ref), v25 (ref), v27 (ref)
        local l_v24_Data_0 = v24:GetData();
        v46.dumpster:Add(v15(v46.content));
        v46.dumpster:Add(v16.Simple(1, function() --[[ Line: 285 ]]
            -- upvalues: v20 (ref), l_v24_Data_0 (ref), v46 (copy), v11 (ref)
            local v48 = v20.util.GetQuestlineInfo(l_v24_Data_0);
            local l_v20_LatestBatch_0, v50 = v20:GetLatestBatch();
            local l_start_0 = l_v20_LatestBatch_0.start;
            local v52 = v48 and v48.expire or l_v20_LatestBatch_0.expire;
            local l_v20_Now_0 = v20:GetNow();
            local v54 = nil;
            if l_v24_Data_0.batch == v50 + 1 or v52 < l_v20_Now_0 then
                local v55 = v50 + 1;
                local l_v20_BatchInfo_0 = v20:GetBatchInfo(v46.questlineIndex, v55);
                if not l_v20_BatchInfo_0 then
                    v46.dumpster:Remove("BatchTimer");
                    v46.timerBarLabel.Visible = false;
                    v46.timerBarFill.Size = UDim2.fromScale(1, 1);
                    v46.timerBarTitle.Text = "No New Missions Available";
                    return;
                else
                    v54 = l_v20_BatchInfo_0.start - l_v20_Now_0;
                    local v57 = l_v20_BatchInfo_0.start - v52;
                    local v58 = v57 - v54;
                    v46.timerBarTitle.Text = ("Week %* Missions Start In"):format(v55);
                    v46.timerBarFill.Size = UDim2.fromScale(math.clamp(v58 / v57, 0, 1), 1);
                end;
            else
                v54 = v52 - l_v20_Now_0;
                v46.timerBarTitle.Text = "Event Ends In";
                v46.timerBarFill.Size = UDim2.fromScale(1 - v54 / (v52 - l_start_0), 1);
            end;
            v46.timerBarLabel.Text = v11:FormatTimeFromSeconds(v54);
        end, true), "BatchTimer");
        local v59 = {};
        local v60 = l_v24_Data_0.completion[v46.questlineIndex];
        local l_v20_CompletionRewards_0 = v20:GetCompletionRewards(v46.questlineIndex);
        local v62 = v20.util.GetCompletedQuests(l_v24_Data_0);
        v46.progressFill.Offset = Vector2.new(-(1 - v62 / v46.totalQuests), 0);
        for v63, v64 in l_v20_CompletionRewards_0 do
            local v65 = v46.progressRewardTemplate:Clone();
            v65.Name = ("Reward_%*"):format(v63);
            local v66 = (v64.required - 1) / v46.totalQuests + 1 / v46.totalQuests / 2;
            v65.Position = UDim2.fromScale(v66, 0.5);
            v65.Parent = v46.progressRewards;
            v46.dumpster:Add(v65);
            local v67 = v64.rewards[1];
            local v68 = v14.new({
                v67
            }, {
                template = v65.Primary, 
                retainLayoutOrder = true, 
                parent = v65
            });
            local l_v68_Button_0 = v68:GetButton(1);
            local v70 = {};
            if l_v68_Button_0 then
                if v60.completionRewards[v63] then
                    l_v68_Button_0.Content.Claimed.Visible = true;
                end;
                table.insert(v70, l_v68_Button_0);
                v59[v63] = v70;
            end;
            v46.dumpster:Add(v68);
            if #v64.rewards > 1 then
                local v71 = v64.rewards[2];
                v65.Plus.Visible = true;
                local v72 = v14.new({
                    v71
                }, {
                    template = v65.Secondary, 
                    retainLayoutOrder = true, 
                    parent = v65
                });
                local l_v72_Button_0 = v72:GetButton(1);
                if l_v72_Button_0 then
                    table.insert(v70, l_v72_Button_0);
                    if v60.completionRewards[v63] then
                        l_v72_Button_0.Content.Claimed.Visible = true;
                    end;
                end;
                v46.dumpster:Add(v72);
            end;
        end;
        v60 = nil;
        l_v20_CompletionRewards_0 = {};
        v62 = function(v74, v75, v76) --[[ Line: 451 ]] --[[ Name: toggleQuestDetails ]]
            local l_Content_0 = v74.frame.Content;
            local l_Claim_0 = l_Content_0.Info.Claim;
            if not v76 then
                l_Content_0.Title.Visible = v75;
                l_Content_0.Badge.Visible = v75;
                l_Content_0.Info.Unsorted.Playtime.Visible = v75;
            end;
            l_Claim_0.Visible = v75;
            if v74.rewardVisualizer:GetButton(1) then
                v74.rewardVisualizer:GetButton(1).Interactable = v75;
            end;
        end;
        local function v90(v79) --[[ Line: 469 ]] --[[ Name: updateQuestState ]]
            -- upvalues: l_v20_CompletionRewards_0 (copy), v20 (ref), l_v24_Data_0 (ref), v60 (ref), v46 (copy)
            local v80 = l_v20_CompletionRewards_0[v79];
            if not v80 then
                return;
            else
                local l_Content_1 = v80.frame.Content;
                if v20.util.IsQuestCompleted(l_v24_Data_0, v60, v79) then
                    l_Content_1.Claimed.Visible = true;
                    l_Content_1.Info.Unsorted.Playtime.Visible = false;
                    v80.frame.Content.Info.Claim.Visible = false;
                    if v80.rewardVisualizer:GetButton(1) then
                        v80.rewardVisualizer:GetButton(1).Interactable = false;
                    end;
                    return;
                else
                    local v82 = if v79 == 1 then v60 - 1 else v60;
                    local v83 = v79 == 1 and 3 or v79 - 1;
                    if v20:GetQuestInfo(v46.questlineIndex, v82, v83) then
                        local v84 = v20.util.IsQuestCompleted(l_v24_Data_0, v82, v83);
                        l_Content_1.Blocked.Visible = not v84;
                        local l_Content_2 = v80.frame.Content;
                        local l_Claim_1 = l_Content_2.Info.Claim;
                        l_Content_2.Title.Visible = v84;
                        l_Content_2.Badge.Visible = v84;
                        l_Content_2.Info.Unsorted.Playtime.Visible = v84;
                        l_Claim_1.Visible = v84;
                        if v80.rewardVisualizer:GetButton(1) then
                            v80.rewardVisualizer:GetButton(1).Interactable = v84;
                        end;
                        if not v84 then
                            return;
                        end;
                    end;
                    local v87 = v20:GetNow() >= v80.questInfo.start;
                    l_Content_1.Countdown.Visible = not v87;
                    local l_Content_3 = v80.frame.Content;
                    local l_Claim_2 = l_Content_3.Info.Claim;
                    l_Content_3.Title.Visible = v87;
                    l_Content_3.Badge.Visible = v87;
                    l_Content_3.Info.Unsorted.Playtime.Visible = v87;
                    l_Claim_2.Visible = v87;
                    if v80.rewardVisualizer:GetButton(1) then
                        v80.rewardVisualizer:GetButton(1).Interactable = v87;
                    end;
                    return;
                end;
            end;
        end;
        local function _() --[[ Line: 520 ]] --[[ Name: updateAllQuestStates ]]
            -- upvalues: l_v20_CompletionRewards_0 (copy), v90 (copy)
            for v91 in l_v20_CompletionRewards_0 do
                v90(v91);
            end;
        end;
        v46._questDump = v7.new();
        local function v118(v93) --[[ Line: 528 ]] --[[ Name: showBatch ]]
            -- upvalues: v60 (ref), v46 (copy), l_v20_CompletionRewards_0 (copy), v20 (ref), v7 (ref), v14 (ref), v26 (ref), v6 (ref), v23 (ref), l_v24_Data_0 (ref), v28 (ref), v25 (ref), v27 (ref), v16 (ref), v11 (ref), v90 (copy)
            if v93 == v60 then
                return;
            else
                v60 = v93;
                v46:_clearQuests();
                table.clear(l_v20_CompletionRewards_0);
                for v94, v95 in v20:GetBatchInfo(v46.questlineIndex, v93).quests do
                    local v96 = v46.questTemplate:Clone();
                    v96.Name = ("Quest_%*"):format(v94);
                    local l_Content_4 = v96.Content;
                    l_Content_4.Title.Title.Text = string.upper((("Mission %*: %*"):format(string.format("%0.2i", v94), v95.name)));
                    local l_objective_0 = v95.objective;
                    while true do
                        local v99, v100 = string.find(l_objective_0, "<rich>.-</rich>");
                        if v99 and v100 then
                            local v101 = utf8.len(l_objective_0);
                            l_objective_0 = ("%*</font>%*"):format(string.sub(l_objective_0, 1, v99 - 1) .. ("<font color=\"#ebff33\">%*"):format((string.sub(l_objective_0, v99 + 6, v100 - 7))), (string.sub(l_objective_0, v100 + 1, v101)));
                        else
                            break;
                        end;
                    end;
                    l_objective_0 = string.gsub(l_objective_0, "<amount>", v95.required);
                    l_Content_4.Badge.Icon.Image = v95.collect.badgeIcon or "";
                    l_Content_4.Info.Description.Text = l_objective_0;
                    local v102 = v7.new();
                    v102:AttachTo(v96);
                    local v104 = v14.new(v95.rewards, {
                        template = l_Content_4.Reward.Template, 
                        parent = l_Content_4.Reward, 
                        tooltipPredicate = function(v103) --[[ Line: 627 ]] --[[ Name: tooltipPredicate ]]
                            return v103.Interactable;
                        end
                    });
                    v102:Add(v104);
                    v96.Parent = v46.questsContainer;
                    local v105 = {
                        frame = v96, 
                        questInfo = v95, 
                        rewardVisualizer = v104
                    };
                    l_v20_CompletionRewards_0[v94] = v105;
                    local l_Claim_3 = l_Content_4.Info.Claim;
                    local l_NotCompleted_0 = l_Claim_3.Content.NotCompleted;
                    local l_Fill_0 = l_NotCompleted_0.Fill;
                    local l_Amount_0 = l_NotCompleted_0.Amount;
                    local v110 = {
                        "SurviveLaunchQuests", 
                        "progress", 
                        v46.questlineIndex, 
                        v93, 
                        v94
                    };
                    v102:Add(v26:OnChanged(v6.Player, v110, function(v111) --[[ Line: 651 ]]
                        -- upvalues: l_NotCompleted_0 (copy), v95 (copy), l_Fill_0 (copy), l_Amount_0 (copy)
                        l_NotCompleted_0.Visible = v111 < v95.required;
                        l_Fill_0.Size = UDim2.fromScale(v111 / v95.required, 1);
                        l_Amount_0.Text = "NEED BADGE";
                    end, true));
                    local function _() --[[ Line: 675 ]] --[[ Name: formatPlaytime ]]
                        -- upvalues: l_Content_4 (copy)
                        l_Content_4.Info.Unsorted.Playtime.Text = "";
                    end;
                    l_Content_4.Info.Unsorted.Playtime.Text = "";
                    v23:HandleButton(l_Claim_3, function() --[[ Line: 696 ]]
                        -- upvalues: v20 (ref), l_v24_Data_0 (ref), v93 (copy), v94 (copy), v95 (copy), v28 (ref), v25 (ref), l_Content_4 (copy), l_Claim_3 (copy), v105 (copy), v27 (ref)
                        if v20.util.IsQuestCompleted(l_v24_Data_0, v93, v94) then
                            return;
                        elseif v20.util.GetProgress(l_v24_Data_0, v93, v94) < v95.required then
                            v28:Notify({
                                message = "You are missing the badge!", 
                                isPositive = false, 
                                duration = 4
                            });
                            return;
                        else
                            v25:CompleteQuest():andThen(function(v113) --[[ Line: 723 ]]
                                -- upvalues: v28 (ref), l_Content_4 (ref), l_Claim_3 (ref), v105 (ref), v27 (ref)
                                if not v113 then
                                    v28:Notify({
                                        message = "Something went wrong!", 
                                        isPositive = false, 
                                        duration = 4
                                    });
                                    return;
                                else
                                    l_Content_4.Info.Unsorted.Playtime.Visible = false;
                                    l_Content_4.Claimed.Visible = true;
                                    l_Claim_3.Visible = false;
                                    local l_v105_0 = v105;
                                    l_v105_0.frame.Content.Info.Claim.Visible = false;
                                    if l_v105_0.rewardVisualizer:GetButton(1) then
                                        l_v105_0.rewardVisualizer:GetButton(1).Interactable = false;
                                    end;
                                    v27:PlaySound({
                                        name = "UI.Success", 
                                        soundGroup = "Master.SFX.UI"
                                    });
                                    return;
                                end;
                            end);
                            return;
                        end;
                    end);
                    local l_v20_Now_1 = v20:GetNow();
                    do
                        local l_l_v20_Now_1_0 = l_v20_Now_1;
                        if l_l_v20_Now_1_0 < v95.start then
                            v102:Add(v16.Simple(1, function() --[[ Line: 748 ]]
                                -- upvalues: l_l_v20_Now_1_0 (ref), v20 (ref), v95 (copy), l_Content_4 (copy), v11 (ref), v102 (copy), v90 (ref), v94 (copy)
                                l_l_v20_Now_1_0 = v20:GetNow();
                                local v117 = math.max(v95.start - l_l_v20_Now_1_0, 0);
                                l_Content_4.Countdown.Timer.Text = v11:SecondsToClock(v117);
                                if v117 == 0 then
                                    if v102:Get("QuestCountdown") then
                                        v102:Remove("QuestCountdown");
                                    end;
                                    v90(v94);
                                end;
                            end, true), "QuestCountdown");
                        end;
                        v90(v94);
                    end;
                end;
                return;
            end;
        end;
        v118(l_v24_Data_0.batch);
        v46.dumpster:Add(v26:OnChanged(v6.Player, "SurviveLaunchQuests.batch", function(v119) --[[ Line: 789 ]]
            -- upvalues: l_v24_Data_0 (ref), v26 (ref), v6 (ref), v118 (copy)
            l_v24_Data_0 = v26:Get(v6.Player, "SurviveLaunchQuests"):expect();
            v118(v119);
        end));
        v46.dumpster:Add(v26:OnChanged(v6.Player, "SurviveLaunchQuests.quest", function() --[[ Line: 794 ]]
            -- upvalues: l_v24_Data_0 (ref), v26 (ref), v6 (ref), l_v20_CompletionRewards_0 (copy), v90 (copy)
            l_v24_Data_0 = v26:Get(v6.Player, "SurviveLaunchQuests"):expect();
            for v120 in l_v20_CompletionRewards_0 do
                v90(v120);
            end;
        end));
        local v121 = {
            "SurviveLaunchQuests", 
            "completion", 
            v46.questlineIndex
        };
        v46.dumpster:Add(v26:OnChanged(v6.Player, v121, function(v122) --[[ Line: 802 ]]
            -- upvalues: l_v24_Data_0 (ref), v26 (ref), v6 (ref), v20 (ref), v46 (copy), v59 (copy)
            l_v24_Data_0 = v26:Get(v6.Player, "SurviveLaunchQuests"):expect();
            local v123 = v20.util.GetCompletedQuests(l_v24_Data_0);
            v46.progressFill.Offset = Vector2.new(-(1 - v123 / v46.totalQuests), 0);
            for v124, v125 in v122.completionRewards do
                for _, v127 in v59[v124] do
                    v127.Content.Claimed.Visible = v125;
                end;
            end;
        end));
    end, 
    Closed = function(v128) --[[ Line: 816 ]] --[[ Name: Closed ]]
        v128.dumpster:Destroy();
        v128:_clearQuests();
        if v128._questDump then
            v128._questDump:Destroy();
            v128._questDump = nil;
        end;
    end, 
    _clearQuests = function(v129) --[[ Line: 830 ]] --[[ Name: _clearQuests ]]
        -- upvalues: v11 (copy)
        v11:IterateClass(v129.questsContainer, "Frame", function(v130) --[[ Line: 831 ]]
            v130:Destroy();
        end, true);
    end
};