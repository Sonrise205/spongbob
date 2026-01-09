local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v7 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v8 = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v11 = require(v4.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v12 = require(v4.Player.PlayerScripts.Knit.Modules.UIMenuAnimatedNPC);
local v13 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v15 = require(l_ReplicatedStorage_0.Shared.Data.BemmyQuestlineInfo);
local v16 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v17 = require(l_ReplicatedStorage_0.Levels);
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local l_BEMMY_0 = v10.BEMMY;
local v27 = #v15:GetQuests();
local v28 = TweenInfo.new(0.8, Enum.EasingStyle.Quint);
local v29 = {
    [true] = {
        ["Content/UIGradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#00eaff")), 
            ColorSequenceKeypoint.new(1, Color3.fromHex("#004cc7"))
        }), 
        ["Content/UIStroke"] = Color3.fromHex("#122a58"), 
        ["Content/Title/UIStroke"] = Color3.fromHex("#122a58")
    }, 
    [false] = {
        ["Content/UIGradient"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("#7d92c5")), 
            ColorSequenceKeypoint.new(1, Color3.fromHex("#2d3c6a"))
        }), 
        ["Content/UIStroke"] = Color3.fromHex("#233858"), 
        ["Content/Title/UIStroke"] = Color3.fromHex("#233858")
    }
};
local v30 = v7:scoped();
local v31 = v30:Value();
local v32 = {};
local v33 = nil;
local v34 = nil;
local v35 = v5.new();
local v36 = v5.new();
local v37 = v5.new();
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    Init = function(v38, v39, v40) --[[ Line: 101 ]] --[[ Name: Init ]]
        -- upvalues: v18 (ref), v4 (copy), v19 (ref), v20 (ref), v21 (ref), v22 (ref), v23 (ref), l_TweenService_0 (copy)
        v18 = v4.GetController("UIController");
        v19 = v4.GetController("EventController");
        v20 = v4.GetController("DataController");
        v21 = v4.GetService("UnitService");
        v22 = v4.GetService("BemmyBuddyService");
        v23 = v4.GetController("AudioController");
        v38.currentMode = v40;
        v38.ui = v39;
        v38.main = v39.Main;
        local l_Window_0 = v38.main.Window;
        v38.exitButton = l_Window_0.Exit;
        local l_Backdrop_0 = l_Window_0.Backdrop;
        v38.topBackdrop = l_Backdrop_0.Top;
        v38.bottomBackdrop = l_Backdrop_0.Bottom;
        local l_Bar_0 = l_Window_0.ProgressBar.Bar;
        v38.progressRewards = l_Bar_0.Rewards;
        v38.progressRewardTemplate = v38.progressRewards.Template:Clone();
        v38.progressFill = l_Bar_0.Fill.UIGradient;
        v38.progressLines = l_Bar_0.ProgressLines;
        v38.progressLineTemplate = v38.progressLines.Template:Clone();
        local l_Bar_1 = l_Window_0.TimerBar.Bar;
        v38.timerBarFill = l_Bar_1.Fill;
        v38.timerBarLabel = l_Bar_1.Timer;
        v38.timerBarTitle = l_Bar_1.Title;
        v38.content = l_Window_0.Content;
        local l_Buttons_0 = v38.content.Top.Buttons;
        local l_Dialog_0 = v38.content.Dialog;
        v38.speakerLabel = l_Dialog_0.Title.Title;
        v38.dialogLabel = l_Dialog_0.Dialog;
        v38.startQuestButton = l_Dialog_0.Confirm;
        v38.levelFrame = v38.content.Level;
        v38.levelLabel = v38.levelFrame.Level;
        local l_XPBar_0 = v38.levelFrame.XPBar;
        v38.xpBarFill = l_XPBar_0.Fill;
        v38.xpBarLabel = l_XPBar_0.Progression;
        v38.questsContainer = v38.content.Quests.Bin;
        v38.questTemplate = v38.questsContainer.Template:Clone();
        v38.finalRewardsTemplate = v38.questsContainer.Final:Clone();
        v38.pages = {
            Overview = v38.content.Overview, 
            Quests = v38.content.Quests
        };
        v38.tabButtons = {
            Overview = l_Buttons_0.Overview, 
            Quests = l_Buttons_0.Quests
        };
        v38.progressRewards.Template:Destroy();
        v38.progressLines.Template:Destroy();
        v38.questsContainer.Template:Destroy();
        v38.questsContainer.Final:Destroy();
        v38.backdropTweens = {
            top = l_TweenService_0:Create(v38.topBackdrop, TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                Position = UDim2.fromScale(0, -1)
            }), 
            bottom = l_TweenService_0:Create(v38.bottomBackdrop, TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                Position = UDim2.fromScale(0, 0)
            })
        };
    end, 
    Start = function(v48) --[[ Line: 188 ]] --[[ Name: Start ]]
        -- upvalues: v24 (ref), v18 (ref), v25 (ref), v6 (copy), l_BEMMY_0 (copy), v19 (ref), v13 (copy), v20 (ref), v4 (copy), v31 (copy), v21 (ref), v22 (ref)
        v24 = v18:GetModuleAsync("Notification"):expect();
        v25 = v18:GetModuleAsync("Units"):expect();
        v48:SetPage("Overview");
        v18:HandleButton(v48.exitButton, function() --[[ Line: 207 ]]
            -- upvalues: v18 (ref)
            v18:Toggle(script.Name, false);
        end);
        for v49 = 1, #v6.Keys(l_BEMMY_0.MILESTONES) - 1 do
            local v50 = v48.progressLineTemplate:Clone();
            v50.Name = v49;
            v50.Parent = v48.progressLines;
        end;
        local l_v19_Timestamps_0, v52 = v19:GetTimestamps();
        l_v19_Timestamps_0 = l_v19_Timestamps_0.UnixTimestamp;
        v52 = v52.UnixTimestamp;
        v19:ObserveTimeLeft(function(v53, _, v55) --[[ Line: 221 ]]
            -- upvalues: v48 (copy), v13 (ref), v52 (ref), l_v19_Timestamps_0 (ref)
            if v55 then
                return;
            else
                v48.timerBarLabel.Text = v13:FormatTimeFromSeconds(v53 or 0);
                local v56 = math.clamp(1 - v53 / (v52 - l_v19_Timestamps_0), 0, 1);
                v48.timerBarFill.Size = UDim2.fromScale(v56, 1);
                return;
            end;
        end);
        local v57 = v20:Get(v4.Player, "Units"):expect()[l_BEMMY_0.UNIT_NAME];
        if v57 then
            for _, v59 in v57 do
                if v59.Temporary then
                    v31:set(v59);
                    break;
                end;
            end;
        end;
        v21.UnitDataUpdated:Connect(function(_, v61) --[[ Line: 249 ]]
            -- upvalues: l_BEMMY_0 (ref), v31 (ref)
            if v61.Name == l_BEMMY_0.UNIT_NAME and v61.Temporary then
                v31:set(v61);
            end;
        end);
        v21.UnitsAdded:Connect(function(v62) --[[ Line: 255 ]]
            -- upvalues: l_BEMMY_0 (ref), v31 (ref)
            for _, v64 in v62 do
                if v64.Name == l_BEMMY_0.UNIT_NAME and v64.Temporary then
                    v31:set(v64);
                    return;
                end;
            end;
        end);
        v22.Reset:Connect(function(v65) --[[ Line: 265 ]]
            -- upvalues: v48 (copy), v31 (ref), v18 (ref), v24 (ref)
            v48:SetPage("Overview");
            v31:set(nil);
            v18:Toggle(script.Name, false);
            if v65 then
                return;
            else
                v24:Notify({
                    message = "Bemmy Buddy has been reset!", 
                    duration = 4
                });
                return;
            end;
        end);
    end, 
    Opening = function(v66) --[[ Line: 281 ]] --[[ Name: Opening ]]
        -- upvalues: v20 (ref), v4 (copy), l_BEMMY_0 (copy), v35 (copy), v12 (copy), v15 (copy), v11 (copy), v30 (copy), v31 (copy), v7 (copy), v14 (copy), l_TweenService_0 (copy), v28 (copy), v18 (ref), v22 (ref), v24 (ref), v32 (copy), v33 (ref), v27 (copy), l_RunService_0 (copy), v37 (copy), v13 (copy), v17 (copy), v5 (copy), v23 (ref), v25 (ref)
        local v67 = v20:Get(v4.Player, l_BEMMY_0.DATA_KEY):expect();
        v35:Add(v12(v66.content));
        v66.topBackdrop.Position = UDim2.fromScale(0, 0);
        v66.bottomBackdrop.Position = UDim2.fromScale(0, 1);
        v35:Add(function() --[[ Line: 290 ]]
            -- upvalues: v66 (copy)
            for _, v69 in v66.backdropTweens do
                v69:Cancel();
            end;
        end);
        for _, v71 in v66.backdropTweens do
            v71:Play();
        end;
        for v72, v73 in v15.milestones do
            local v74 = v66.progressRewardTemplate:Clone();
            v74.Name = ("Reward_%*"):format(v72);
            local v75 = v72 / v15.totalMilestones;
            v74.Position = UDim2.fromScale(v75, 0.35);
            v74.LayoutOrder = v72;
            v74.Unsorted.Level.Text = ("LVL %*"):format(v73.level);
            v74.Parent = v66.progressRewards;
            v35:Add(v74);
            local v76 = v11.new({
                v73.reward
            }, {
                template = v74.Primary, 
                retainLayoutOrder = true, 
                parent = v74
            });
            v35:Add(v76);
        end;
        v30:Observer(v31):onBind(function() --[[ Line: 323 ]]
            -- upvalues: v7 (ref), v31 (ref), v66 (copy), v14 (ref), v15 (ref), l_TweenService_0 (ref), v28 (ref)
            local v77 = v7.peek(v31);
            if not v77 then
                v66.levelFrame.Visible = false;
                v66.progressFill.Offset = Vector2.new(-1, 0);
                return;
            else
                local l_v14_NextLevelCost_0 = v14:GetNextLevelCost(v77);
                v66.xpBarFill.Size = UDim2.fromScale(v77.Experience / l_v14_NextLevelCost_0, 1);
                v66.xpBarLabel.Text = ("%*/%*"):format(v77.Experience, l_v14_NextLevelCost_0);
                v66.levelLabel.Text = ("LVL %*"):format(v77.Level);
                v66.levelFrame.Visible = true;
                local v79 = 0;
                local v80 = 0;
                for _, v82 in v15.milestones do
                    v79 = v79 + 1;
                    if v77.Level <= v82.level then
                        v80 = v82.level;
                        break;
                    end;
                end;
                local v83 = (v79 - 1) / v15.totalMilestones + v77.Level / v80 * (1 / v15.totalMilestones);
                l_TweenService_0:Create(v66.progressFill, v28, {
                    Offset = Vector2.new(-(1 - v83), 0)
                }):Play();
                return;
            end;
        end);
        local v84 = v67.quest > 0;
        v66.startQuestButton.Visible = not v84;
        v66.tabButtons.Quests.Content.Locked.Visible = not v84;
        if not v84 then
            v35:Add(v18:HandleButton(v66.startQuestButton, function() --[[ Line: 367 ]]
                -- upvalues: v22 (ref), v84 (ref), v66 (copy), v24 (ref)
                v22:StartQuest():andThen(function(v85) --[[ Line: 368 ]]
                    -- upvalues: v84 (ref), v66 (ref), v24 (ref)
                    if not v85 then
                        return;
                    else
                        v84 = true;
                        v66.startQuestButton.Visible = false;
                        v66.tabButtons.Quests.Content.Locked.Visible = false;
                        v24:Notify({
                            message = "Quest started! Check out the Quests tab", 
                            isPositive = true, 
                            duration = 5
                        });
                        return;
                    end;
                end);
            end));
        end;
        v32.Overview = function() --[[ Line: 387 ]]
            -- upvalues: v66 (copy)
            v66:_updateDialog({
                message = "I wanna be your friend\226\128\148but you gotta earn it! If we're not close by the end, I'm outta here!"
            });
        end;
        if v33 == "Overview" then
            v66:_updateDialog({
                message = "I wanna be your friend\226\128\148but you gotta earn it! If we're not close by the end, I'm outta here!"
            });
        end;
        v35:Add(function() --[[ Line: 395 ]]
            -- upvalues: v32 (ref)
            table.clear(v32);
        end);
        v35:Add(v18:HandleButton(v66.tabButtons.Overview, function() --[[ Line: 399 ]]
            -- upvalues: v66 (copy)
            v66:SetPage("Overview");
        end));
        v35:Add(v18:HandleButton(v66.tabButtons.Quests, function() --[[ Line: 403 ]]
            -- upvalues: v84 (ref), v24 (ref), v66 (copy)
            if not v84 then
                v24:Notify({
                    message = "You need to start the quest first!", 
                    isPositive = false, 
                    duration = 4
                });
                return;
            else
                v66:SetPage("Quests");
                return;
            end;
        end));
        local v86 = {};
        local function _() --[[ Line: 419 ]] --[[ Name: updateQuestDialog ]]
            -- upvalues: v66 (copy), v67 (ref)
            v66:_updateDialog({
                bemmyData = v67
            });
        end;
        local function v95(v88, v89, v90) --[[ Line: 423 ]] --[[ Name: toggleQuestDetails ]]
            -- upvalues: v27 (ref)
            local l_Content_0 = v88.frame.Content;
            local l_Claim_0 = l_Content_0.Info.Claim;
            if not v90 then
                l_Content_0.Title.Visible = v89;
            end;
            l_Claim_0.Visible = v89;
            if v88.index == v27 then
                return;
            else
                for _, v94 in v88.rewardVisualizers do
                    v94:GetButton(1).Interactable = v89;
                end;
                return;
            end;
        end;
        local function _() --[[ Line: 442 ]] --[[ Name: scrollToActiveQuest ]]
            -- upvalues: v86 (copy), v67 (ref), l_RunService_0 (ref), v66 (copy), l_TweenService_0 (ref)
            local v96 = v86[v67.quest];
            if not v96 then
                return;
            else
                local l_frame_0 = v96.frame;
                l_RunService_0.PreRender:Once(function() --[[ Line: 450 ]]
                    -- upvalues: v66 (ref), l_frame_0 (copy), l_TweenService_0 (ref)
                    local v98 = v66.questsContainer.CanvasPosition.Y + l_frame_0.AbsolutePosition.Y - v66.questsContainer.AbsolutePosition.Y - (v66.questsContainer.AbsoluteWindowSize.Y / 2 - l_frame_0.AbsoluteSize.Y / 2);
                    if v98 < 0 or v66.questsContainer.AbsoluteCanvasSize.Y < v98 then
                        v98 = 0;
                    end;
                    local v99 = l_TweenService_0:Create(v66.questsContainer, TweenInfo.new(0.2), {
                        CanvasPosition = Vector2.new(0, v98)
                    });
                    v99.Completed:Once(function() --[[ Line: 465 ]]
                        -- upvalues: v99 (copy)
                        v99:Destroy();
                    end);
                    v99:Play();
                end);
                return;
            end;
        end;
        local function v107(v101) --[[ Line: 473 ]] --[[ Name: updateQuestState ]]
            -- upvalues: v86 (copy), v15 (ref), v67 (ref), v95 (copy)
            local v102 = v86[v101];
            if not v102 then
                return;
            else
                local l_Content_1 = v102.frame.Content;
                local v104 = v15.util.IsQuestCompleted(v67, v101);
                if v104 then
                    l_Content_1.Claimed.Visible = true;
                    v95(v102, false, true);
                end;
                if v101 <= v67.quest then
                    l_Content_1.Blocked.Visible = false;
                    if not v104 then
                        v95(v102, true);
                    end;
                    return;
                elseif v104 then
                    return;
                else
                    local v105 = v101 - 1;
                    if v15:GetQuestInfo(v105) then
                        local v106 = v15.util.IsQuestCompleted(v67, v105);
                        l_Content_1.Blocked.Visible = not v106;
                        v95(v102, v106);
                        if not v106 then
                            return;
                        end;
                    end;
                    v95(v102, true);
                    return;
                end;
            end;
        end;
        local function _() --[[ Line: 524 ]] --[[ Name: updateAllQuestStates ]]
            -- upvalues: v86 (copy), v107 (copy)
            for v108 in v86 do
                v107(v108);
            end;
        end;
        local function v149() --[[ Line: 530 ]] --[[ Name: populateQuests ]]
            -- upvalues: v37 (ref), v66 (copy), v86 (copy), v15 (ref), v13 (ref), v17 (ref), v5 (ref), v11 (ref), l_BEMMY_0 (ref), v20 (ref), v4 (ref), v67 (ref), v22 (ref), v24 (ref), v95 (copy), v23 (ref), v18 (ref), v25 (ref), v107 (copy), l_RunService_0 (ref), l_TweenService_0 (ref)
            v37:Destroy();
            v37:Add(function() --[[ Line: 532 ]]
                -- upvalues: v66 (ref), v86 (ref)
                v66:_clearQuests();
                table.clear(v86);
            end);
            for v110, v111 in v15:GetQuests() do
                local l_objective_0 = v111.objective;
                local v113 = if not l_objective_0 then v66.finalRewardsTemplate:Clone() else v66.questTemplate:Clone();
                local l_Content_2 = v113.Content;
                if l_objective_0 then
                    v113.Name = ("Quest_%*"):format(v110);
                    l_Content_2.Title.Title.Text = string.upper((("Quest %*"):format((string.format("%0.2i", v110)))));
                    while true do
                        local v115, v116 = string.find(l_objective_0, "<rich>.-</rich>");
                        if v115 and v116 then
                            local v117 = utf8.len(l_objective_0);
                            l_objective_0 = ("%*</font>%*"):format(string.sub(l_objective_0, 1, v115 - 1) .. ("<font color=\"#ebff33\">%*"):format((string.sub(l_objective_0, v115 + 6, v116 - 7))), (string.sub(l_objective_0, v116 + 1, v117)));
                        else
                            break;
                        end;
                    end;
                    l_objective_0 = string.gsub(l_objective_0, "<amount>", v13:CommaNumber(v111.required));
                    if v111.map then
                        local v118 = nil;
                        for _, v120 in v17.Stages do
                            for v121, v122 in v120 do
                                if v121 == v111.map then
                                    v118 = v122.DisplayName;
                                    break;
                                end;
                            end;
                        end;
                        l_objective_0 = string.gsub(l_objective_0, "<map>", v118);
                    end;
                    l_Content_2.Info.Description.Text = l_objective_0;
                end;
                local v123 = v5.new();
                v123:AttachTo(v113);
                local v124 = {};
                if l_objective_0 then
                    table.insert(v124, v11.new({
                        v111.rewards[1]
                    }, {
                        template = l_Content_2.Rewards.Primary, 
                        parent = l_Content_2.Rewards, 
                        tooltipPredicate = function(v125) --[[ Line: 593 ]] --[[ Name: tooltipPredicate ]]
                            return v125.Interactable;
                        end
                    }));
                    if #v111.rewards > 1 then
                        table.insert(v124, v11.new({
                            v111.rewards[2]
                        }, {
                            template = l_Content_2.Rewards.Secondary, 
                            parent = l_Content_2.Rewards, 
                            hideOwnedAmount = true, 
                            tooltipPredicate = function(v126) --[[ Line: 606 ]] --[[ Name: tooltipPredicate ]]
                                return v126.Interactable;
                            end
                        }));
                    end;
                else
                    table.insert(v124, v11.new(v111.rewards, {
                        template = l_Content_2.Rewards.Primary, 
                        parent = l_Content_2.Rewards, 
                        tooltipPredicate = function(v127) --[[ Line: 618 ]] --[[ Name: tooltipPredicate ]]
                            return v127.Interactable;
                        end
                    }));
                end;
                for _, v129 in v124 do
                    v123:Add(v129);
                end;
                v113.Parent = v66.questsContainer;
                local v130 = {
                    index = v110, 
                    frame = v113, 
                    questInfo = v111, 
                    rewardVisualizers = v124
                };
                v86[v110] = v130;
                local l_Claim_1 = l_Content_2.Info.Claim;
                if l_objective_0 then
                    local l_NotCompleted_0 = l_Claim_1.Content.NotCompleted;
                    local l_Fill_0 = l_NotCompleted_0.Fill;
                    local l_Amount_0 = l_NotCompleted_0.Amount;
                    local v135 = {
                        l_BEMMY_0.DATA_KEY, 
                        "progress", 
                        v110
                    };
                    local l_l_NotCompleted_0_0 = l_NotCompleted_0 --[[ copy: 12 -> 19 ]];
                    v123:Add(v20:OnChanged(v4.Player, v135, function(v137) --[[ Line: 648 ]]
                        -- upvalues: l_l_NotCompleted_0_0 (copy), v111 (copy), l_Fill_0 (copy), v13 (ref), l_Amount_0 (copy), v66 (ref), v67 (ref)
                        l_l_NotCompleted_0_0.Visible = v137 < v111.required;
                        l_Fill_0.Size = UDim2.fromScale(v137 / v111.required, 1);
                        local v138 = v111.unitExchange and "SELECT UNITS" or "";
                        local v139 = ("%*/%*"):format(v13:CommaNumber(v137), (v13:CommaNumber(v111.required)));
                        if v111.unitExchange then
                            v139 = (" (%*)"):format(v139);
                        end;
                        l_Amount_0.Text = ("%*%*"):format(v138, v139);
                        if v137 == v111.required then
                            v66:_updateDialog({
                                bemmyData = v67
                            });
                        end;
                    end, true));
                end;
                local function _(v140) --[[ Line: 666 ]] --[[ Name: completeQuest ]]
                    -- upvalues: v22 (ref), v24 (ref), l_Content_2 (copy), l_Claim_1 (copy), v95 (ref), v130 (copy), v23 (ref)
                    v22:CompleteQuest(v140):andThen(function(v141) --[[ Line: 667 ]]
                        -- upvalues: v24 (ref), l_Content_2 (ref), l_Claim_1 (ref), v95 (ref), v130 (ref), v23 (ref)
                        if not v141 then
                            v24:Notify({
                                message = "Something went wrong!", 
                                isPositive = false, 
                                duration = 4
                            });
                            return;
                        else
                            l_Content_2.Claimed.Visible = true;
                            l_Claim_1.Visible = false;
                            v95(v130, false, true);
                            v23:PlaySound({
                                name = "UI.Success", 
                                soundGroup = "Master.SFX.UI"
                            });
                            return;
                        end;
                    end);
                end;
                v18:HandleButton(l_Claim_1, function() --[[ Line: 689 ]]
                    -- upvalues: v15 (ref), v67 (ref), v110 (copy), v111 (copy), v25 (ref), v24 (ref), v22 (ref), l_Content_2 (copy), l_Claim_1 (copy), v95 (ref), v130 (copy), v23 (ref)
                    local v143 = v15.util.GetProgress(v67, v110);
                    if v111.unitExchange and v143 < v111.required then
                        v25:OpenWithState("ExchangeSelection");
                        return;
                    elseif v15.util.IsQuestCompleted(v67, v110) then
                        return;
                    elseif v143 < v111.required then
                        v24:Notify({
                            message = "Quest not complete!", 
                            isPositive = false, 
                            duration = 4
                        });
                        return;
                    else
                        v22:CompleteQuest(nil):andThen(function(v144) --[[ Line: 667 ]]
                            -- upvalues: v24 (ref), l_Content_2 (ref), l_Claim_1 (ref), v95 (ref), v130 (ref), v23 (ref)
                            if not v144 then
                                v24:Notify({
                                    message = "Something went wrong!", 
                                    isPositive = false, 
                                    duration = 4
                                });
                                return;
                            else
                                l_Content_2.Claimed.Visible = true;
                                l_Claim_1.Visible = false;
                                v95(v130, false, true);
                                v23:PlaySound({
                                    name = "UI.Success", 
                                    soundGroup = "Master.SFX.UI"
                                });
                                return;
                            end;
                        end);
                        return;
                    end;
                end);
                v107(v110);
            end;
            v66:_updateDialog({
                bemmyData = v67
            });
            local v145 = v86[v67.quest];
            if not v145 then
                return;
            else
                local l_frame_1 = v145.frame;
                l_RunService_0.PreRender:Once(function() --[[ Line: 450 ]]
                    -- upvalues: v66 (ref), l_frame_1 (copy), l_TweenService_0 (ref)
                    local v147 = v66.questsContainer.CanvasPosition.Y + l_frame_1.AbsolutePosition.Y - v66.questsContainer.AbsolutePosition.Y - (v66.questsContainer.AbsoluteWindowSize.Y / 2 - l_frame_1.AbsoluteSize.Y / 2);
                    if v147 < 0 or v66.questsContainer.AbsoluteCanvasSize.Y < v147 then
                        v147 = 0;
                    end;
                    local v148 = l_TweenService_0:Create(v66.questsContainer, TweenInfo.new(0.2), {
                        CanvasPosition = Vector2.new(0, v147)
                    });
                    v148.Completed:Once(function() --[[ Line: 465 ]]
                        -- upvalues: v148 (copy)
                        v148:Destroy();
                    end);
                    v148:Play();
                end);
                return;
            end;
        end;
        v32.Quests = v149;
        v35:Add(v20:OnChanged(v4.Player, {
            l_BEMMY_0.DATA_KEY, 
            "quest"
        }, function() --[[ Line: 724 ]]
            -- upvalues: v67 (ref), v20 (ref), v4 (ref), l_BEMMY_0 (ref), v86 (copy), v107 (copy), v33 (ref), v66 (copy), l_RunService_0 (ref), l_TweenService_0 (ref)
            v67 = v20:Get(v4.Player, l_BEMMY_0.DATA_KEY):expect();
            for v150 in v86 do
                v107(v150);
            end;
            if v33 == "Quests" then
                v66:_updateDialog({
                    bemmyData = v67
                });
                local v151 = v86[v67.quest];
                if not v151 then
                    return;
                else
                    local l_frame_2 = v151.frame;
                    l_RunService_0.PreRender:Once(function() --[[ Line: 450 ]]
                        -- upvalues: v66 (ref), l_frame_2 (copy), l_TweenService_0 (ref)
                        local v153 = v66.questsContainer.CanvasPosition.Y + l_frame_2.AbsolutePosition.Y - v66.questsContainer.AbsolutePosition.Y - (v66.questsContainer.AbsoluteWindowSize.Y / 2 - l_frame_2.AbsoluteSize.Y / 2);
                        if v153 < 0 or v66.questsContainer.AbsoluteCanvasSize.Y < v153 then
                            v153 = 0;
                        end;
                        local v154 = l_TweenService_0:Create(v66.questsContainer, TweenInfo.new(0.2), {
                            CanvasPosition = Vector2.new(0, v153)
                        });
                        v154.Completed:Once(function() --[[ Line: 465 ]]
                            -- upvalues: v154 (copy)
                            v154:Destroy();
                        end);
                        v154:Play();
                    end);
                end;
            end;
        end));
        if v33 == "Quests" then
            v149();
        end;
    end, 
    Closed = function(_) --[[ Line: 739 ]] --[[ Name: Closed ]]
        -- upvalues: v35 (copy), v36 (copy), v37 (copy), v34 (ref)
        v35:Destroy();
        v36:Destroy();
        v37:Destroy();
        v34 = nil;
    end, 
    SetPage = function(v156, v157) --[[ Line: 748 ]] --[[ Name: SetPage ]]
        -- upvalues: v33 (ref), v32 (copy), v29 (copy), v8 (copy)
        if not v156.pages[v157] then
            return;
        elseif v33 == v157 then
            return;
        else
            v33 = v157;
            local v158 = v32[v33];
            if v158 then
                v158();
            end;
            for v159, v160 in v156.pages do
                v160.Visible = v159 == v157;
            end;
            for v161, v162 in v156.tabButtons do
                local l_v29_0 = v29;
                local v164 = v161 == v157;
                for v165, v166 in l_v29_0[v164] do
                    if v8.Exists(v162, v165) then
                        v8.Find(v162, v165).Color = v166;
                    end;
                end;
            end;
            return;
        end;
    end, 
    _updateDialog = function(v167, v168) --[[ Line: 782 ]] --[[ Name: _updateDialog ]]
        -- upvalues: v15 (copy), v34 (ref), v36 (copy), v23 (ref), v16 (copy)
        local l_message_0 = v168.message;
        local l_soundPath_0 = v168.soundPath;
        if v168.bemmyData then
            local v171 = v15.util.GetQuestInfo(v168.bemmyData);
            local v172 = v15.util.IsQuestFinished(v168.bemmyData);
            local v173 = v172 and "complete" or "intro";
            l_message_0 = v171.dialogue[v173] or v171.dialogue.intro;
            l_soundPath_0 = ("Bemmy.Quests.%*.%*"):format(v168.bemmyData.quest, v172 and "Complete" or "Intro");
        end;
        if not l_message_0 or v34 == l_message_0 then
            return;
        else
            v36:Destroy();
            v34 = l_message_0;
            local v174 = utf8.len(l_message_0) * 0.025;
            if l_soundPath_0 then
                task.wait();
                local v175 = v23:PlaySound({
                    name = l_soundPath_0, 
                    soundGroup = "Master.SFX.UI", 
                    duckMusic = true
                });
                if v175 then
                    v174 = v175.TimeLength * 0.925;
                    v36:Add(v175);
                end;
            end;
            v167.dialogLabel.Text = l_message_0;
            v167.dialogLabel.MaxVisibleGraphemes = 0;
            local v177 = v16("IntValue", 0, TweenInfo.new(v174, Enum.EasingStyle.Linear), {
                Value = utf8.len(v167.dialogLabel.Text)
            }, function(v176) --[[ Line: 838 ]]
                -- upvalues: v167 (copy)
                v167.dialogLabel.MaxVisibleGraphemes = v176;
            end);
            v36:Add(v177);
            return;
        end;
    end, 
    _clearQuests = function(v178) --[[ Line: 846 ]] --[[ Name: _clearQuests ]]
        -- upvalues: v13 (copy)
        v13:IterateClass(v178.questsContainer, "Frame", function(v179) --[[ Line: 847 ]]
            v179:Destroy();
        end, true);
    end
};