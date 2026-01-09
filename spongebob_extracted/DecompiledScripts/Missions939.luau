local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v7 = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v13 = require(v5.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v14 = require(v5.Player.PlayerScripts.Knit.Modules.UIMenuAnimatedNPC);
local v15 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v16 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v18 = require(l_ReplicatedStorage_0.Shared.Data.SpritesheetAtlas);
local v19 = require(l_ReplicatedStorage_0.Shared.Data.Missions);
local v20 = require(l_ReplicatedStorage_0.Levels);
local _ = require(l_ReplicatedFirst_0.PlaceIds);
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = {
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
    Init = function(v29, v30, v31) --[[ Line: 85 ]] --[[ Name: Init ]]
        -- upvalues: v22 (ref), v5 (copy), v23 (ref), v24 (ref), v25 (ref), v26 (ref), v6 (copy)
        v22 = v5.GetController("UIController");
        v23 = v5.GetController("MissionController");
        v24 = v5.GetService("MissionService");
        v25 = v5.GetController("DataController");
        v26 = v5.GetController("AudioController");
        v29.currentMode = v31;
        v29.ui = v30;
        v29.main = v30.Main;
        local l_Window_0 = v29.main.Window;
        v29.titleLabel = l_Window_0.Title.TitleContainer.Title;
        v29.exitButton = l_Window_0.Exit;
        local l_Backdrop_0 = l_Window_0.Backdrop;
        v29.topBackdrop = l_Backdrop_0.Top;
        v29.bottomBackdrop = l_Backdrop_0.Bottom;
        local l_Bar_0 = l_Window_0.ProgressBar.Bar;
        v29.progressRewards = l_Bar_0.Rewards;
        v29.progressRewardTemplate = v29.progressRewards.Template:Clone();
        v29.progressFill = l_Bar_0.Fill.UIGradient;
        v29.progressLines = l_Bar_0.ProgressLines;
        v29.progressLineTemplate = v29.progressLines.Template:Clone();
        local l_Bar_1 = l_Window_0.TimerBar.Bar;
        v29.timerBarFill = l_Bar_1.Fill;
        v29.timerBarLabel = l_Bar_1.Timer;
        v29.timerBarTitle = l_Bar_1.Title;
        v29.content = l_Window_0.Content;
        v29.batchButtonsFrame = v29.content.Top.Buttons;
        local l_Dialog_0 = v29.content.Dialog;
        v29.speakerLabel = l_Dialog_0.Title.Title;
        v29.dialogLabel = l_Dialog_0.Dialog;
        v29.questsContainer = v29.content.Quests;
        v29.questTemplate = v29.questsContainer.Template:Clone();
        v29.progressRewards.Template:Destroy();
        v29.progressLines.Template:Destroy();
        v29.questsContainer.Template:Destroy();
        v29.dumpster = v6.new();
    end, 
    Start = function(v37) --[[ Line: 157 ]] --[[ Name: Start ]]
        -- upvalues: v27 (ref), v22 (ref), v19 (copy), v10 (copy), v24 (ref)
        v27 = v22:GetModuleAsync("Notification"):expect();
        v22:HandleButton(v37.exitButton, function() --[[ Line: 173 ]]
            -- upvalues: v22 (ref)
            v22:Toggle(script.Name, false);
        end);
        local l_v19_LatestQuestline_0, v39 = v19:GetLatestQuestline();
        v37.questlineInfo = l_v19_LatestQuestline_0;
        v37.questlineIndex = v39;
        v37.titleLabel.Text = v37.questlineInfo.name;
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
        v10:IterateClass(v37.batchButtonsFrame, "TextButton", function(v45) --[[ Line: 198 ]]
            -- upvalues: v37 (copy)
            local v46 = tonumber(v45.Name);
            v37.batchButtons[v46] = v45;
        end, true);
        v24.TimeChanged:Connect(function(v47) --[[ Line: 203 ]]
            -- upvalues: v19 (ref)
            v19.timeOverride = v47;
        end);
    end, 
    Opening = function(v48) --[[ Line: 208 ]] --[[ Name: Opening ]]
        -- upvalues: v23 (ref), v14 (copy), v19 (copy), v16 (copy), v15 (copy), v10 (copy), l_TweenService_0 (copy), v13 (copy), v28 (copy), v7 (copy), v17 (copy), v18 (copy), v20 (copy), v6 (copy), v25 (ref), v5 (copy), v22 (ref), v27 (ref), v24 (ref), v26 (ref)
        local l_v23_Data_0 = v23:GetData();
        v48.dumpster:Add(v14(v48.content));
        local v50 = v48.dumpster:Extend();
        local function v61() --[[ Line: 216 ]] --[[ Name: updateDialog ]]
            -- upvalues: v50 (copy), v19 (ref), l_v23_Data_0 (ref), v48 (copy), v16 (ref)
            v50:Destroy();
            local v51 = v19.util.GetQuestInfo(l_v23_Data_0);
            local v52 = v19.util.IsQuestStarted(l_v23_Data_0);
            local v53 = v19.util.GetProgress(l_v23_Data_0);
            local v54 = nil;
            local v55 = nil;
            if v52 then
                local v56 = v53 < v51.required and "intro" or "complete";
                local v57 = v51.dialogue[v56][1];
                v54 = v57.Speaker or v48.questlineInfo.speaker;
                v55 = v57.Dialog;
            else
                v54 = v48.questlineInfo.speaker;
                v55 = "I'm gathering intel for your next operation...";
            end;
            v48.speakerLabel.Text = v54;
            v48.dialogLabel.Text = v55;
            v48.dialogLabel.MaxVisibleGraphemes = 0;
            local v58 = utf8.len(v55);
            local v60 = v16("IntValue", 0, TweenInfo.new(v58 * 0.025, Enum.EasingStyle.Linear), {
                Value = utf8.len(v48.dialogLabel.Text)
            }, function(v59) --[[ Line: 245 ]]
                -- upvalues: v48 (ref)
                v48.dialogLabel.MaxVisibleGraphemes = v59;
            end);
            v50:Add(v60);
        end;
        v61();
        v48.dumpster:Add(v15.Simple(1, function() --[[ Line: 256 ]]
            -- upvalues: v19 (ref), l_v23_Data_0 (ref), v48 (copy), v10 (ref)
            local v62 = v19.util.GetQuestlineInfo(l_v23_Data_0);
            local l_v19_LatestBatch_0, v64 = v19:GetLatestBatch();
            local l_start_0 = l_v19_LatestBatch_0.start;
            local v66 = v62 and v62.expire or l_v19_LatestBatch_0.expire;
            local l_v19_Now_0 = v19:GetNow();
            local v68 = nil;
            if l_v23_Data_0.batch == v64 + 1 or v66 < l_v19_Now_0 then
                local v69 = v64 + 1;
                local l_v19_BatchInfo_0 = v19:GetBatchInfo(v48.questlineIndex, v69);
                if not l_v19_BatchInfo_0 then
                    v48.dumpster:Remove("BatchTimer");
                    v48.timerBarLabel.Visible = false;
                    v48.timerBarFill.Size = UDim2.fromScale(1, 1);
                    v48.timerBarTitle.Text = "No New Missions Available";
                    return;
                else
                    v68 = l_v19_BatchInfo_0.start - l_v19_Now_0;
                    local v71 = l_v19_BatchInfo_0.start - v66;
                    local v72 = v71 - v68;
                    v48.timerBarTitle.Text = ("Week %* Missions Start In"):format(v69);
                    v48.timerBarFill.Size = UDim2.fromScale(math.clamp(v72 / v71, 0, 1), 1);
                end;
            else
                v68 = v66 - l_v19_Now_0;
                v48.timerBarTitle.Text = "Event Ends In";
                v48.timerBarFill.Size = UDim2.fromScale(1 - v68 / (v66 - l_start_0), 1);
            end;
            v48.timerBarLabel.Text = v10:FormatTimeFromSeconds(v68);
            for v73, v74 in v48.batchButtons do
                local v75 = not (v19:IsBatchStarted(v48.questlineIndex, v73) or l_v23_Data_0.batch == v73);
                if v74.Content.Locked.Visible ~= v75 then
                    v74.Content.Locked.Visible = v75;
                end;
            end;
        end, true), "BatchTimer");
        v48.topBackdrop.Position = UDim2.fromScale(0, 0);
        v48.bottomBackdrop.Position = UDim2.fromScale(0, 1);
        local v76 = l_TweenService_0:Create(v48.topBackdrop, TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
            Position = UDim2.fromScale(0, -1)
        });
        local v77 = l_TweenService_0:Create(v48.bottomBackdrop, TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
            Position = UDim2.fromScale(0, 0)
        });
        local l_v76_0 = v76 --[[ copy: 4 -> 22 ]];
        local l_v77_0 = v77 --[[ copy: 5 -> 23 ]];
        v48.dumpster:Add(function() --[[ Line: 333 ]]
            -- upvalues: l_v76_0 (copy), l_v77_0 (copy)
            l_v76_0:Cancel();
            l_v76_0:Destroy();
            l_v77_0:Cancel();
            l_v77_0:Destroy();
        end);
        v76:Play();
        v77:Play();
        v76 = {};
        v77 = l_v23_Data_0.completion[v48.questlineIndex];
        local l_v19_CompletionRewards_0 = v19:GetCompletionRewards(v48.questlineIndex);
        local v81 = v19.util.GetCompletedQuests(l_v23_Data_0);
        v48.progressFill.Offset = Vector2.new(-(1 - v81 / v48.totalQuests), 0);
        for v82, v83 in l_v19_CompletionRewards_0 do
            local v84 = v48.progressRewardTemplate:Clone();
            v84.Name = ("Reward_%*"):format(v82);
            local v85 = (v83.required - 1) / v48.totalQuests + 1 / v48.totalQuests / 2;
            v84.Position = UDim2.fromScale(v85, 0.5);
            v84.Parent = v48.progressRewards;
            v48.dumpster:Add(v84);
            local v86 = v83.rewards[1];
            local v87 = v13.new({
                v86
            }, {
                template = v84.Primary, 
                retainLayoutOrder = true, 
                parent = v84
            });
            local l_v87_Button_0 = v87:GetButton(1);
            local v89 = {};
            if l_v87_Button_0 then
                if v77.completionRewards[v82] then
                    l_v87_Button_0.Content.Claimed.Visible = true;
                end;
                table.insert(v89, l_v87_Button_0);
                v76[v82] = v89;
            end;
            v48.dumpster:Add(v87);
            if #v83.rewards > 1 then
                local v90 = v83.rewards[2];
                v84.Plus.Visible = true;
                local v91 = v13.new({
                    v90
                }, {
                    template = v84.Secondary, 
                    retainLayoutOrder = true, 
                    parent = v84
                });
                local l_v91_Button_0 = v91:GetButton(1);
                if l_v91_Button_0 then
                    table.insert(v89, l_v91_Button_0);
                    if v77.completionRewards[v82] then
                        l_v91_Button_0.Content.Claimed.Visible = true;
                    end;
                end;
                v48.dumpster:Add(v91);
            end;
        end;
        v77 = nil;
        l_v19_CompletionRewards_0 = {};
        v81 = function(v93, v94, v95) --[[ Line: 421 ]] --[[ Name: toggleQuestDetails ]]
            local l_Content_0 = v93.frame.Content;
            local l_Claim_0 = l_Content_0.Info.Claim;
            if not v95 then
                l_Content_0.Title.Visible = v94;
            end;
            l_Claim_0.Visible = v94;
            local l_ItemObjective_0 = l_Content_0.ItemObjective;
            local v99 = false;
            if v93.questInfo.collect ~= nil then
                v99 = v94;
            end;
            l_ItemObjective_0.Visible = v99;
            if v93.rewardVisualizer:GetButton(1) then
                v93.rewardVisualizer:GetButton(1).Interactable = v94;
            end;
        end;
        local function v118(v100) --[[ Line: 437 ]] --[[ Name: updateQuestState ]]
            -- upvalues: l_v19_CompletionRewards_0 (copy), v19 (ref), l_v23_Data_0 (ref), v77 (ref), v48 (copy)
            local v101 = l_v19_CompletionRewards_0[v100];
            if not v101 then
                return;
            else
                local l_Content_1 = v101.frame.Content;
                if v19.util.IsQuestCompleted(l_v23_Data_0, v77, v100) then
                    l_Content_1.Claimed.Visible = true;
                    local l_Content_2 = v101.frame.Content;
                    l_Content_2.Info.Claim.Visible = false;
                    local l_ItemObjective_1 = l_Content_2.ItemObjective;
                    local v105 = false;
                    if v101.questInfo.collect ~= nil then
                        v105 = false;
                    end;
                    l_ItemObjective_1.Visible = v105;
                    if v101.rewardVisualizer:GetButton(1) then
                        v101.rewardVisualizer:GetButton(1).Interactable = false;
                    end;
                    return;
                else
                    local v106 = if v100 == 1 then v77 - 1 else v77;
                    local v107 = v100 == 1 and 3 or v100 - 1;
                    if v19:GetQuestInfo(v48.questlineIndex, v106, v107) then
                        local v108 = v19.util.IsQuestCompleted(l_v23_Data_0, v106, v107);
                        l_Content_1.Blocked.Visible = not v108;
                        local l_Content_3 = v101.frame.Content;
                        local l_Claim_1 = l_Content_3.Info.Claim;
                        l_Content_3.Title.Visible = v108;
                        l_Claim_1.Visible = v108;
                        local l_ItemObjective_2 = l_Content_3.ItemObjective;
                        local v112 = false;
                        if v101.questInfo.collect ~= nil then
                            v112 = v108;
                        end;
                        l_ItemObjective_2.Visible = v112;
                        if v101.rewardVisualizer:GetButton(1) then
                            v101.rewardVisualizer:GetButton(1).Interactable = v108;
                        end;
                        if not v108 then
                            return;
                        end;
                    end;
                    local v113 = v19:GetNow() >= v101.questInfo.start;
                    l_Content_1.Countdown.Visible = not v113;
                    local l_Content_4 = v101.frame.Content;
                    local l_Claim_2 = l_Content_4.Info.Claim;
                    l_Content_4.Title.Visible = v113;
                    l_Claim_2.Visible = v113;
                    local l_ItemObjective_3 = l_Content_4.ItemObjective;
                    local v117 = false;
                    if v101.questInfo.collect ~= nil then
                        v117 = v113;
                    end;
                    l_ItemObjective_3.Visible = v117;
                    if v101.rewardVisualizer:GetButton(1) then
                        v101.rewardVisualizer:GetButton(1).Interactable = v113;
                    end;
                    return;
                end;
            end;
        end;
        local function _() --[[ Line: 487 ]] --[[ Name: updateAllQuestStates ]]
            -- upvalues: l_v19_CompletionRewards_0 (copy), v118 (copy)
            for v119 in l_v19_CompletionRewards_0 do
                v118(v119);
            end;
        end;
        local function v159(v121) --[[ Line: 493 ]] --[[ Name: showBatch ]]
            -- upvalues: v77 (ref), v48 (copy), l_v19_CompletionRewards_0 (copy), v28 (ref), v7 (ref), v19 (ref), v17 (ref), v10 (ref), v18 (ref), v20 (ref), v6 (ref), v13 (ref), v25 (ref), v5 (ref), v22 (ref), l_v23_Data_0 (ref), v27 (ref), v24 (ref), v26 (ref), v15 (ref), v118 (copy), v61 (copy)
            if v121 == v77 then
                return;
            else
                v77 = v121;
                v48:_clearQuests();
                table.clear(l_v19_CompletionRewards_0);
                for v122, v123 in v48.batchButtons do
                    local v124 = v28[v122 == v121];
                    if v122 == v121 then
                        v123.Content.Locked.Visible = false;
                    end;
                    for v125, v126 in v124 do
                        if v7.Exists(v123, v125) then
                            v7.Find(v123, v125).Color = v126;
                        end;
                    end;
                end;
                for v127, v128 in v19:GetBatchInfo(v48.questlineIndex, v121).quests do
                    local v129 = v48.questTemplate:Clone();
                    v129.Name = ("Quest_%*"):format(v127);
                    local l_Content_5 = v129.Content;
                    l_Content_5.Title.Title.Text = string.upper((("Mission %*: %*"):format(string.format("%0.2i", v127), v128.name)));
                    local l_objective_0 = v128.objective;
                    while true do
                        local v132, v133 = string.find(l_objective_0, "<rich>.-</rich>");
                        if v132 and v133 then
                            local v134 = utf8.len(l_objective_0);
                            l_objective_0 = ("%*</font>%*"):format(string.sub(l_objective_0, 1, v132 - 1) .. ("<font color=\"#ebff33\">%*"):format((string.sub(l_objective_0, v132 + 6, v133 - 7))), (string.sub(l_objective_0, v133 + 1, v134)));
                        else
                            break;
                        end;
                    end;
                    l_objective_0 = string.gsub(l_objective_0, "<amount>", v128.required);
                    if v128.collect then
                        local l_v17_DisplayName_0 = v17:GetDisplayName(v128.collect.name);
                        l_v17_DisplayName_0 = v10:Pluralize(l_v17_DisplayName_0, v128.required);
                        v18:SetImage(l_Content_5.ItemObjective.Icon, v128.collect.name, "OperationEvil");
                        l_objective_0 = string.gsub(l_objective_0, "<objective>", l_v17_DisplayName_0);
                    else
                        l_Content_5.ItemObjective.Visible = false;
                    end;
                    if v128.map then
                        local v136 = nil;
                        for _, v138 in v20.Stages do
                            for v139, v140 in v138 do
                                if v139 == v128.map then
                                    v136 = v140.DisplayName;
                                    break;
                                end;
                            end;
                        end;
                        l_objective_0 = string.gsub(l_objective_0, "<map>", v136);
                    end;
                    l_Content_5.Info.Description.Text = l_objective_0;
                    local v141 = v6.new();
                    v141:AttachTo(v129);
                    local v143 = v13.new(v128.rewards, {
                        template = l_Content_5.Reward.Template, 
                        parent = l_Content_5.Reward, 
                        tooltipPredicate = function(v142) --[[ Line: 592 ]] --[[ Name: tooltipPredicate ]]
                            return v142.Interactable;
                        end
                    });
                    v141:Add(v143);
                    v129.Parent = v48.questsContainer;
                    local v144 = {
                        frame = v129, 
                        questInfo = v128, 
                        rewardVisualizer = v143
                    };
                    l_v19_CompletionRewards_0[v127] = v144;
                    local l_Claim_3 = l_Content_5.Info.Claim;
                    local l_NotCompleted_0 = l_Claim_3.Content.NotCompleted;
                    local l_Fill_0 = l_NotCompleted_0.Fill;
                    local l_Amount_0 = l_NotCompleted_0.Amount;
                    local v149 = {
                        "Missions", 
                        "progress", 
                        v48.questlineIndex, 
                        v121, 
                        v127
                    };
                    v141:Add(v25:OnChanged(v5.Player, v149, function(v150) --[[ Line: 616 ]]
                        -- upvalues: l_NotCompleted_0 (copy), v128 (copy), l_Fill_0 (copy), l_Amount_0 (copy)
                        l_NotCompleted_0.Visible = v150 < v128.required;
                        l_Fill_0.Size = UDim2.fromScale(v150 / v128.required, 1);
                        l_Amount_0.Text = ("%*/%*"):format(v150, v128.required);
                    end, true));
                    v22:HandleButton(l_Claim_3, function() --[[ Line: 622 ]]
                        -- upvalues: v19 (ref), l_v23_Data_0 (ref), v121 (copy), v127 (copy), v128 (copy), v27 (ref), v24 (ref), l_Content_5 (copy), l_Claim_3 (copy), v144 (copy), v26 (ref)
                        if v19.util.IsQuestCompleted(l_v23_Data_0, v121, v127) then
                            return;
                        elseif v19.util.GetProgress(l_v23_Data_0, v121, v127) < v128.required then
                            v27:Notify({
                                message = "Mission not complete!", 
                                isPositive = false, 
                                duration = 4
                            });
                            return;
                        else
                            v24:CompleteQuest():andThen(function(v151) --[[ Line: 638 ]]
                                -- upvalues: v27 (ref), l_Content_5 (ref), l_Claim_3 (ref), v144 (ref), v26 (ref)
                                if not v151 then
                                    v27:Notify({
                                        message = "Something went wrong!", 
                                        isPositive = false, 
                                        duration = 4
                                    });
                                    return;
                                else
                                    l_Content_5.Claimed.Visible = true;
                                    l_Claim_3.Visible = false;
                                    local l_v144_0 = v144;
                                    local l_Content_6 = l_v144_0.frame.Content;
                                    l_Content_6.Info.Claim.Visible = false;
                                    local l_ItemObjective_4 = l_Content_6.ItemObjective;
                                    local v155 = false;
                                    if l_v144_0.questInfo.collect ~= nil then
                                        v155 = false;
                                    end;
                                    l_ItemObjective_4.Visible = v155;
                                    if l_v144_0.rewardVisualizer:GetButton(1) then
                                        l_v144_0.rewardVisualizer:GetButton(1).Interactable = false;
                                    end;
                                    v26:PlaySound({
                                        name = "UI.Success", 
                                        soundGroup = "Master.SFX.UI"
                                    });
                                    return;
                                end;
                            end);
                            return;
                        end;
                    end);
                    local l_v19_Now_1 = v19:GetNow();
                    do
                        local l_l_v19_Now_1_0 = l_v19_Now_1;
                        if l_l_v19_Now_1_0 < v128.start then
                            v141:Add(v15.Simple(1, function() --[[ Line: 662 ]]
                                -- upvalues: l_l_v19_Now_1_0 (ref), v19 (ref), v128 (copy), l_Content_5 (copy), v10 (ref), v141 (copy), v118 (ref), v127 (copy), v61 (ref)
                                l_l_v19_Now_1_0 = v19:GetNow();
                                local v158 = math.max(v128.start - l_l_v19_Now_1_0, 0);
                                l_Content_5.Countdown.Timer.Text = v10:SecondsToClock(v158);
                                if v158 == 0 then
                                    if v141:Get("QuestCountdown") then
                                        v141:Remove("QuestCountdown");
                                    end;
                                    v118(v127);
                                    v61();
                                end;
                            end, true), "QuestCountdown");
                        end;
                        v118(v127);
                    end;
                end;
                return;
            end;
        end;
        v159(l_v23_Data_0.batch);
        for v160, v161 in v48.batchButtons do
            v48.dumpster:Add(v22:HandleButton(v161, function() --[[ Line: 685 ]]
                -- upvalues: v19 (ref), v48 (copy), v160 (copy), l_v23_Data_0 (ref), v27 (ref), v159 (copy)
                if not (v19:IsBatchStarted(v48.questlineIndex, v160) or l_v23_Data_0.batch == v160) then
                    v27:Notify({
                        message = ("Week %* is not available yet!"):format(v160), 
                        isPositive = false, 
                        duration = 4
                    });
                    return;
                else
                    v159(v160);
                    return;
                end;
            end));
        end;
        v48.dumpster:Add(v25:OnChanged(v5.Player, "Missions.batch", function(v162) --[[ Line: 703 ]]
            -- upvalues: l_v23_Data_0 (ref), v25 (ref), v5 (ref), v159 (copy)
            l_v23_Data_0 = v25:Get(v5.Player, "Missions"):expect();
            v159(v162);
        end));
        v48.dumpster:Add(v25:OnChanged(v5.Player, "Missions.quest", function() --[[ Line: 708 ]]
            -- upvalues: l_v23_Data_0 (ref), v25 (ref), v5 (ref), l_v19_CompletionRewards_0 (copy), v118 (copy), v61 (copy)
            l_v23_Data_0 = v25:Get(v5.Player, "Missions"):expect();
            for v163 in l_v19_CompletionRewards_0 do
                v118(v163);
            end;
            v61();
        end));
        local v164 = {
            "Missions", 
            "completion", 
            v48.questlineIndex
        };
        v48.dumpster:Add(v25:OnChanged(v5.Player, v164, function(v165) --[[ Line: 716 ]]
            -- upvalues: l_v23_Data_0 (ref), v25 (ref), v5 (ref), v19 (ref), v48 (copy), v76 (copy)
            l_v23_Data_0 = v25:Get(v5.Player, "Missions"):expect();
            local v166 = v19.util.GetCompletedQuests(l_v23_Data_0);
            v48.progressFill.Offset = Vector2.new(-(1 - v166 / v48.totalQuests), 0);
            for v167, v168 in v165.completionRewards do
                for _, v170 in v76[v167] do
                    v170.Content.Claimed.Visible = v168;
                end;
            end;
        end));
    end, 
    Closed = function(v171) --[[ Line: 730 ]] --[[ Name: Closed ]]
        v171.dumpster:Destroy();
        v171:_clearQuests();
    end, 
    _clearQuests = function(v172) --[[ Line: 739 ]] --[[ Name: _clearQuests ]]
        -- upvalues: v10 (copy)
        v10:IterateClass(v172.questsContainer, "Frame", function(v173) --[[ Line: 740 ]]
            v173:Destroy();
        end, true);
    end
};