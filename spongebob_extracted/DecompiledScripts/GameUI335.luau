local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v8 = require(l_ReplicatedStorage_0.Packages.Knit);
local v9 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v10 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v11 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v13 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v14 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v15 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v16 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v17 = require(v8.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v18 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v19 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v20 = require(l_ReplicatedStorage_0.Shared.Data.EnemyShared);
local _ = require(l_ReplicatedStorage_0.Shared.Util.DateTimeUtil);
local v22 = require(l_ReplicatedStorage_0.Shared.Modules.ObserveAttribute);
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
return {
    primaryMenu = false, 
    _gameSpeedColors = {}, 
    _speedButtons = {}, 
    Init = function(v34, v35, v36) --[[ Line: 90 ]] --[[ Name: Init ]]
        -- upvalues: v23 (ref), v8 (copy), v24 (ref), v25 (ref), v26 (ref), v27 (ref), v28 (ref), v29 (ref), v30 (ref), v31 (ref), l_TweenService_0 (copy)
        v23 = v8.GetController("UIController");
        v24 = v8.GetService("GameService");
        v25 = v8.GetController("TowerController");
        v26 = v8.GetController("AudioController");
        v27 = v8.GetController("PurchaseController");
        v28 = v8.GetController("DataController");
        v29 = v8.GetController("DeviceTypeController");
        v30 = v8.GetService("EnemyService");
        v31 = v8.GetService("RobloxEventService");
        v34.currentMode = v36;
        v34.ui = v35;
        v34.top = v34.ui.Top;
        v34.gameSpeed = v34.top.Main.GameSpeed;
        v34.mobsLeft = v34.top.Main.MobsLeft;
        v34.skipWaveFrame = v34.top.SkipWave;
        v34.skipWaveFrame.Visible = true;
        v34.stageInfo = v34.top.Main.StageInfo.Inner.Inner;
        v34.addTimeFrame = v34.top.AddTime;
        v34.conditionsFrame = v34.stageInfo.Conditions;
        v34.conditionTemplate = v34.conditionsFrame.Template:Clone();
        v34.conditionsFrame.Template:Destroy();
        v34.voteStartFrame = v34.ui.VoteStart.Main;
        v34.voteStartFrame.Parent.Visible = true;
        v34.rightSide = v34.ui.Right;
        v34.backFrame = v34.ui.Back;
        v34.backFrame.Visible = false;
        v34.backButton = v34.backFrame.Main.Button;
        v34.gamePrompts = v34.ui.GamePrompts;
        v34.narratorDialog = v34.gamePrompts.NarratorDialog;
        v34.narratorDialog.Visible = false;
        v34.antagonistDialog = v34.gamePrompts.EnemyDialog;
        v34.antagonistDialog.Visible = false;
        v34.bossHealthsBin = v34.ui.BossHealths;
        v34.bossHealthsBin.Visible = true;
        v34.bossBattleTop = v34.top.BossBattle;
        v34.bossTimerFrame = v34.bossBattleTop.TimeLeft;
        v34.bossTimerLabel = v34.bossTimerFrame.Amount;
        v34.bossBattleTop.Visible = false;
        v34.top.Main.Visible = false;
        v34.rightSide.Visible = false;
        v34.addTimeFrame.Visible = false;
        v34.bossTimerFrame.AnchorPoint = Vector2.new(0.5, 1);
        v34.addTimeFrame.Button.Position = UDim2.fromScale(0.5, -2);
        v34.bossTimerTweens = {
            [true] = l_TweenService_0:Create(v34.bossTimerFrame, TweenInfo.new(0.3), {
                AnchorPoint = Vector2.new(0.5, 0)
            }), 
            [false] = l_TweenService_0:Create(v34.bossTimerFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                AnchorPoint = Vector2.new(0.5, 1)
            })
        };
        v34.bossAddTimeTweens = {
            [true] = l_TweenService_0:Create(v34.addTimeFrame.Button, TweenInfo.new(0.3), {
                Position = UDim2.fromScale(0.5, 0.25)
            }), 
            [false] = l_TweenService_0:Create(v34.addTimeFrame.Button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Position = UDim2.fromScale(0.5, -2)
            })
        };
        v34.bossHealthTemplate = v34.bossHealthsBin.Template:Clone();
        v34.bossHealthsBin.Template:Destroy();
    end, 
    Start = function(v37) --[[ Line: 179 ]] --[[ Name: Start ]]
        -- upvalues: v32 (ref), v23 (ref), v33 (ref), v9 (copy), v15 (copy), v28 (ref), v8 (copy), v27 (ref), v13 (copy), v24 (ref), l_GuiService_0 (copy), l_Players_0 (copy), v11 (copy), v14 (copy), v16 (copy), v17 (copy), v25 (ref), v26 (ref), v31 (ref), l_ContextActionService_0 (copy), v29 (ref), v22 (copy), v20 (copy), v19 (copy), v18 (copy), l_TweenService_0 (copy), v10 (copy)
        v32 = v23:GetModuleAsync("Notification"):expect();
        v33 = v23:GetModuleAsync("Cards"):expect();
        local v38 = v9.new();
        local v39 = v9.new();
        local v40 = {};
        local v41 = v15.IN_GAME.SPEED_OPTIONS[#v15.IN_GAME.SPEED_OPTIONS];
        v37.myStats = v28:Get(v8.Player, "PlayerStats"):expect();
        local function v46(v42, v43) --[[ Line: 197 ]] --[[ Name: attemptToggleSpeedButtonVisibility ]]
            -- upvalues: v37 (copy), v41 (ref), v27 (ref), v8 (ref)
            local v44 = v37.myStats and v37.myStats.Prestige or 0;
            local v45 = v37.myStats and v37.myStats.Level or 1;
            if tonumber(v43.Name) > v41 then
                v43.Visible = false;
                return;
            elseif v27:HasGamepass(v8.Player, v42) or v44 >= 1 then
                v43.Visible = true;
                return;
            else
                if v44 < 1 then
                    v43.Visible = v45 >= 3;
                end;
                return;
            end;
        end;
        v28:OnChanged(v8.Player, "PlayerStats", function(v47, v48) --[[ Line: 216 ]]
            -- upvalues: v37 (copy), v40 (copy), v46 (copy)
            v37.myStats = v47;
            if not v47 then
                return;
            elseif v48 and v48.Level and v48.Level == v37.myStats.Level then
                return;
            else
                for v49, v50 in v40 do
                    v46(v49, v50);
                end;
                return;
            end;
        end, true);
        for _, v52 in v37.gameSpeed.Options:GetChildren() do
            if v52:IsA("GuiButton") then
                local v53 = tonumber(v52.Name);
                if v53 then
                    local v54 = v15.IN_GAME.SPEED_OPTIONS[v53] or 1;
                    v37._gameSpeedColors[v53] = {
                        Enabled = {
                            [v52.Content.UIGradient] = v52.Content.UIGradient.Color, 
                            [v52.Content.Cost.Title.UIStroke] = v52.Content.Cost.Title.UIStroke.Color
                        }, 
                        Disabled = {
                            [v52.Content.UIGradient] = v13.Gradient.Disabled, 
                            [v52.Content.Cost.Title.UIStroke] = v13.Solid.Disabled
                        }
                    };
                    v37._speedButtons[v53] = v52;
                    v52.Visible = v53 <= 2;
                    local v55 = v24.TripleSpeedUnlocked:Get();
                    if v53 == 3 and v55 then
                        v52.Visible = true;
                    end;
                    if not v55 and v53 == 3 or v53 > 2 then
                        local v56 = "GameSpeed";
                        if v54 == 5 then
                            v56 = "5xGameSpeed";
                        elseif v54 == 7 then
                            v56 = "7xGameSpeed";
                        end;
                        v40[v56] = v52;
                        do
                            local l_v56_0 = v56;
                            if v27:HasGamepass(v8.Player, l_v56_0) then
                                v52.Visible = v53 <= v41;
                            else
                                v27:ListenToGamepassOwned(v8.Player, l_v56_0, function(v58) --[[ Line: 281 ]]
                                    -- upvalues: v52 (copy), v53 (copy), v41 (ref), v46 (copy), l_v56_0 (ref)
                                    if v58 then
                                        v52.Visible = v53 <= v41;
                                        return;
                                    else
                                        v46(l_v56_0, v52);
                                        return;
                                    end;
                                end, true);
                            end;
                        end;
                    end;
                    v23:HandleButton(v52, function() --[[ Line: 294 ]]
                        -- upvalues: l_GuiService_0 (ref), v24 (ref), v53 (copy), v27 (ref), v32 (ref)
                        l_GuiService_0.SelectedObject = nil;
                        v24:ChangeGameSpeed(v53):andThen(function(v59, v60, v61) --[[ Line: 312 ]]
                            -- upvalues: v27 (ref), v32 (ref)
                            if v60 then
                                v27:PromptGamepassPurchase(v61 or "GameSpeed");
                                return;
                            else
                                if not v59 then
                                    v32:Notify({
                                        text = "You are not the party leader!", 
                                        duration = 3, 
                                        isPositive = false
                                    });
                                end;
                                return;
                            end;
                        end);
                    end);
                end;
            end;
        end;
        v27:ListenToGamepassOwned(v8.Player, "GameSpeed", function(v62) --[[ Line: 326 ]]
            -- upvalues: v23 (ref), v24 (ref)
            if not v62 or not v23:GetToggleState(script.Name) then
                return;
            else
                v24:ChangeGameSpeed(3);
                return;
            end;
        end);
        v27:ListenToGamepassOwned(v8.Player, "5xGameSpeed", function(v63) --[[ Line: 334 ]]
            -- upvalues: v23 (ref), v24 (ref)
            if not v63 or not v23:GetToggleState(script.Name) then
                return;
            else
                v24:ChangeGameSpeed(4);
                return;
            end;
        end);
        v27:ListenToGamepassOwned(v8.Player, "7xGameSpeed", function(v64) --[[ Line: 342 ]]
            -- upvalues: v23 (ref), v24 (ref)
            if not v64 or not v23:GetToggleState(script.Name) then
                return;
            else
                v24:ChangeGameSpeed(5);
                return;
            end;
        end);
        v24.GameSpeed:Observe(function(v65) --[[ Line: 350 ]]
            -- upvalues: v37 (copy)
            for v66, v67 in v37._gameSpeedColors do
                local l_Enabled_0 = v67.Enabled;
                if v65[2] ~= v66 then
                    l_Enabled_0 = v67.Disabled;
                end;
                for v69, v70 in l_Enabled_0 do
                    v69.Color = v70;
                end;
            end;
        end);
        local function v73() --[[ Line: 364 ]] --[[ Name: playerChanged ]]
            -- upvalues: v24 (ref), v37 (copy), l_Players_0 (ref), v11 (ref)
            local v71 = v24.SkipRoundVoteCount:Get() or 0;
            local v72 = v24.StartRoundVoteCount:Get() or 0;
            v37.skipWaveFrame.Button.Content.Title.Text = ("Skip Wave (%*/%*)"):format(v71, #l_Players_0:GetPlayers());
            v11.Custom(function() --[[ Line: 370 ]]
                -- upvalues: v37 (ref)
                return v37.levelInfo;
            end):await();
            if v37.levelInfo.Mode == "BossBattle" then
                v37.voteStartFrame.Button.Content.Title.Text = "Start Battle";
                return;
            else
                v37.voteStartFrame.Button.Content.Title.Text = ("Start Wave (%*/%*)"):format(v72, #l_Players_0:GetPlayers());
                return;
            end;
        end;
        l_Players_0.PlayerAdded:Connect(v73);
        l_Players_0.PlayerRemoving:Connect(v73);
        v24.SkipRoundVoteCount:Observe(function(v74) --[[ Line: 384 ]]
            -- upvalues: v37 (copy), l_Players_0 (ref)
            v74 = v74 or 0;
            v37.skipWaveFrame.Button.Content.Title.Text = ("Skip Wave (%*/%*)"):format(v74, #l_Players_0:GetPlayers());
        end);
        v24.StartRoundVoteCount:Observe(function(v75) --[[ Line: 389 ]]
            -- upvalues: v11 (ref), v37 (copy), l_Players_0 (ref)
            v75 = v75 or 0;
            v11.Custom(function() --[[ Line: 392 ]]
                -- upvalues: v37 (ref)
                return v37.levelInfo;
            end):await();
            if not v37.levelInfo then
                return;
            elseif v37.levelInfo.Mode == "BossBattle" then
                v37.voteStartFrame.Button.Content.Title.Text = "Start Battle";
                return;
            else
                v37.voteStartFrame.Button.Content.Title.Text = ("Start Wave (%*/%*)"):format(v75, #l_Players_0:GetPlayers());
                return;
            end;
        end);
        v24.PromptVoteSkip:Connect(function(v76) --[[ Line: 407 ]]
            -- upvalues: v38 (copy), v37 (copy), v15 (ref), v14 (ref)
            v38:Clean();
            v37.skipWaveFrame.Button.Visible = true;
            local v77 = workspace:GetServerTimeNow() - v76;
            local v78 = math.round(v15.IN_GAME.SKIP_TIMEOUT - v77);
            v37.skipWaveFrame.Button.Content.Countdown.Text = ("%*s"):format(v78);
            v38:Add(v14.Simple(1, function() --[[ Line: 416 ]]
                -- upvalues: v78 (ref), v37 (ref), v38 (ref)
                v78 = v78 - 1;
                v37.skipWaveFrame.Button.Content.Countdown.Text = ("%*s"):format(v78);
                if v78 < 1 then
                    v38:Clean();
                    v37.skipWaveFrame.Button.Visible = false;
                end;
            end));
        end);
        v24.HideVoteSkip:Connect(function() --[[ Line: 427 ]]
            -- upvalues: v38 (copy), v37 (copy)
            v38:Clean();
            v37.skipWaveFrame.Button.Visible = false;
        end);
        local function v82(v79) --[[ Line: 432 ]] --[[ Name: showVoteStart ]]
            -- upvalues: v37 (copy), v15 (ref), v39 (copy), v14 (ref)
            v37.voteStartFrame.Button.Visible = true;
            v37.voteStartFrame.Button.Content.Countdown.Visible = true;
            local v80 = workspace:GetServerTimeNow() - v79;
            local v81 = math.round(v15.IN_GAME.AUTO_START - v80);
            v37.voteStartFrame.Button.Content.Countdown.Text = ("%*s"):format(v81);
            v39:Add(v14.Simple(1, function() --[[ Line: 445 ]]
                -- upvalues: v81 (ref), v37 (ref), v39 (ref)
                v81 = v81 - 1;
                v37.voteStartFrame.Button.Content.Countdown.Text = ("%*s"):format(v81);
                if v81 < 1 then
                    v39:Clean();
                    v37.voteStartFrame.Button.Visible = false;
                end;
            end));
        end;
        v24.ToggleVoteStart:Connect(function(v83) --[[ Line: 456 ]]
            -- upvalues: v39 (copy), v82 (copy), v37 (copy)
            v39:Clean();
            if v83.toggle then
                v82(v83.sent);
                return;
            else
                v37.voteStartFrame.Button.Visible = false;
                return;
            end;
        end);
        v24:GetStartVoteStatus():andThen(function(v84, v85) --[[ Line: 466 ]]
            -- upvalues: v82 (copy)
            if v84 then
                v82(v85);
            end;
        end);
        local v86 = v9.new();
        v24.BossBattleStart:Observe(function(v87) --[[ Line: 474 ]]
            -- upvalues: v86 (copy), v37 (copy), v14 (ref), v16 (ref)
            v86:Destroy();
            if not v87 then
                if Vector2.new(0.5, 1) == v37.bossTimerFrame.AnchorPoint then
                    return;
                else
                    v37.bossTimerTweens[false]:Play();
                    v37.bossAddTimeTweens[false]:Play();
                    v37:CloseBackButton();
                    return;
                end;
            else
                if v87 and v87.minutesAdded then
                    local v88 = math.clamp(v87.minutesAdded + 1, 1, 4);
                    v37.addTimeFrame.Button:SetAttribute("PurchaseName", (("AddBossTime%*"):format(v88)));
                end;
                v37.bossTimerTweens[true]:Play();
                v37.bossAddTimeTweens[true]:Play();
                v86:Add(v14.Simple(1, function() --[[ Line: 500 ]]
                    -- upvalues: v87 (copy), v37 (ref), v16 (ref), v86 (ref)
                    local v89 = workspace:GetServerTimeNow() - v87.startTime;
                    local v90 = math.max(0, v87.timeLimit - v89);
                    v37.bossTimerLabel.Text = v16:SecondsToClock(v90, true);
                    if v90 < 1 then
                        v86:Destroy();
                    end;
                end, true));
                return;
            end;
        end);
        local function v102(v91) --[[ Line: 512 ]] --[[ Name: updateConditions ]]
            -- upvalues: v16 (ref), v37 (copy), v17 (ref)
            if not v91 then
                v16:IterateClass(v37.conditionsFrame, "TextButton", function(v92) --[[ Line: 514 ]]
                    v92:Destroy();
                end);
                return;
            else
                v16:IterateClass(v37.conditionsFrame, "TextButton", function(v93) --[[ Line: 521 ]]
                    -- upvalues: v91 (copy)
                    local v94 = string.match(v93.Name, "^(.-)_");
                    if not table.find(v91, v94) then
                        v93:Destroy();
                    end;
                end);
                for _, v96 in v91 do
                    local v97 = nil;
                    local v98 = nil;
                    local v99 = nil;
                    if typeof(v96) == "table" then
                        v97 = v96.name;
                        if v96.tier then
                            v99 = v96.tier;
                            v98 = ("%*_%*"):format(v97, v99);
                        else
                            v98 = v97;
                        end;
                    else
                        v97 = v96;
                        v98 = v96;
                    end;
                    if not v37.conditionsFrame:FindFirstChild(v98) then
                        local l_v16_ConditionData_0 = v16:GetConditionData(v97);
                        if l_v16_ConditionData_0 then
                            local v101 = v37.conditionTemplate:Clone();
                            v101.Icon.Image = l_v16_ConditionData_0.icon;
                            v101.UIGradient.Color = l_v16_ConditionData_0.colors;
                            v101.Name = v98;
                            v101.Tier.Visible = v99 ~= nil;
                            if v99 then
                                v101.Tier.Text = v16:IntToRoman(v99);
                            end;
                            v101.Parent = v37.conditionsFrame;
                            v17.new(v101, {
                                IsCondition = true, 
                                Name = v97, 
                                Tier = v99
                            });
                        end;
                    end;
                end;
                return;
            end;
        end;
        v24.LevelInfo:Observe(function(v103) --[[ Line: 574 ]]
            -- upvalues: v37 (copy), v41 (ref), v102 (copy)
            if not v103 then
                return;
            else
                v37.levelInfo = v103;
                local l_Mode_0 = v103.Mode;
                v37.bossBattleTop.Visible = l_Mode_0 == "BossBattle";
                v37.addTimeFrame.Visible = l_Mode_0 == "BossBattle";
                v37.top.Main.Visible = l_Mode_0 ~= "BossBattle";
                v37.rightSide.Visible = l_Mode_0 ~= "BossBattle";
                v37.rightSide.Cards.Visible = l_Mode_0 == "Roguelike";
                v37.rightSide.Event.Visible = l_Mode_0 == "Event";
                if l_Mode_0 == "BossBattle" then
                    v37.bossHealthsBin.Position = UDim2.fromScale(0.5, 0.79);
                    v37.ui.UIPadding:SetAttribute("OriginalPaddingTop", UDim.new(0, 0));
                    v37.ui.UIPadding.PaddingTop = UDim.new(0, 0);
                    v37.voteStartFrame.Parent.UIPadding:SetAttribute("OriginalPaddingBottom", UDim.new(0, 255));
                    return;
                else
                    v37.stageInfo.WorldTitle.Text = v103.WorldName;
                    if l_Mode_0 == "Endless" then
                        local l_WorldTitle_0 = v37.stageInfo.WorldTitle;
                        l_WorldTitle_0.Text = l_WorldTitle_0.Text .. " - Endless";
                    elseif l_Mode_0 == "Story" then
                        local l_WorldTitle_1 = v37.stageInfo.WorldTitle;
                        l_WorldTitle_1.Text = l_WorldTitle_1.Text .. (" - %*"):format(v103.Act);
                    end;
                    v37.gameSpeed.Visible = v103.ForcedGameSpeed == nil;
                    if v103.MaxGameSpeed then
                        v41 = v103.MaxGameSpeed;
                        for _, v108 in v37.gameSpeed.Options:GetChildren() do
                            if v108:IsA("GuiButton") then
                                v108.Visible = tonumber(v108.Name) <= v103.MaxGameSpeed;
                            end;
                        end;
                    end;
                    v102(v103.Conditions);
                    return;
                end;
            end;
        end);
        v24.Wave:Observe(function(v109) --[[ Line: 626 ]]
            -- upvalues: v37 (copy)
            v37.stageInfo.CurrentWave.Text = ("Wave %*"):format(v109);
        end);
        v24.TotalKills:Observe(function(v110) --[[ Line: 631 ]]
            -- upvalues: v37 (copy)
            v37.rightSide.Takedowns.Content.Amount.Text = v110;
        end);
        v24.EnemiesLeft:Observe(function(v111) --[[ Line: 636 ]]
            -- upvalues: v37 (copy)
            v37.mobsLeft.Amount.Title.Text = v111;
        end);
        local function v115(v112, v113, v114) --[[ Line: 641 ]] --[[ Name: toggleManageUnits ]]
            -- upvalues: v37 (copy), v8 (ref), v25 (ref), v23 (ref), v26 (ref)
            if not v37.levelInfo or v37.levelInfo.Mode == "BossBattle" then
                return;
            elseif v112 ~= "ToggleUnitManager" then
                return;
            elseif v113 ~= Enum.UserInputState.Begin then
                return;
            elseif v8.Player:GetAttribute("Stunned") then
                return;
            elseif v25:IsBuildModeActive() then
                return;
            elseif v23:GetToggleState("Cards") then
                return;
            else
                if v114 then
                    v26:PlaySound({
                        name = "UI.Click", 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                v23:Toggle("UnitsManager");
                return;
            end;
        end;
        local function v119(v116, v117, v118) --[[ Line: 677 ]] --[[ Name: toggleCards ]]
            -- upvalues: v37 (copy), v26 (ref), v33 (ref)
            if not v37.levelInfo or v37.levelInfo.Mode ~= "Roguelike" then
                return;
            elseif v116 ~= "ToggleCards" then
                return;
            elseif v117 ~= Enum.UserInputState.Begin then
                return;
            else
                if v118 then
                    v26:PlaySound({
                        name = "UI.Click", 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                v33:Toggle();
                return;
            end;
        end;
        local function v123(v120, v121, v122) --[[ Line: 700 ]] --[[ Name: toggleEventUI ]]
            -- upvalues: v37 (copy), v26 (ref), v31 (ref)
            if not v37.levelInfo or v37.levelInfo.Mode ~= "Event" then
                return;
            elseif v120 ~= "ToggleEventUI" then
                return;
            elseif v121 ~= Enum.UserInputState.Begin then
                return;
            else
                if v122 then
                    v26:PlaySound({
                        name = "UI.Click", 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                v31:OpenUI();
                return;
            end;
        end;
        v23:HandleButton(v37.rightSide.Units, function() --[[ Line: 724 ]]
            -- upvalues: l_GuiService_0 (ref), v115 (copy)
            l_GuiService_0.SelectedObject = nil;
            v115("ToggleUnitManager", Enum.UserInputState.Begin);
        end);
        l_ContextActionService_0:BindAction("ToggleUnitManager", function(v124, v125) --[[ Line: 732 ]]
            -- upvalues: v115 (copy)
            v115(v124, v125, true);
        end, false, Enum.KeyCode.F);
        v23:HandleButton(v37.rightSide.Cards, function() --[[ Line: 740 ]]
            -- upvalues: l_GuiService_0 (ref), v119 (copy)
            l_GuiService_0.SelectedObject = nil;
            v119("ToggleCards", Enum.UserInputState.Begin);
        end);
        v23:HandleButton(v37.rightSide.Event, function() --[[ Line: 746 ]]
            -- upvalues: l_GuiService_0 (ref), v123 (copy)
            l_GuiService_0.SelectedObject = nil;
            v123("ToggleEventUI", Enum.UserInputState.Begin);
        end);
        l_ContextActionService_0:BindAction("ToggleCards", function(v126, v127) --[[ Line: 754 ]]
            -- upvalues: v119 (copy)
            v119(v126, v127, true);
        end, false, Enum.KeyCode.C);
        l_ContextActionService_0:BindAction("ToggleEventUI", function(v128, v129) --[[ Line: 763 ]]
            -- upvalues: v123 (copy)
            v123(v128, v129, true);
        end, false, Enum.KeyCode.C);
        v23:HandleButton(v37.skipWaveFrame.Button, function() --[[ Line: 770 ]]
            -- upvalues: l_GuiService_0 (ref), v24 (ref)
            l_GuiService_0.SelectedObject = nil;
            v24:VoteSkipRound();
        end);
        local v130 = {
            "UnitsManager", 
            "StageInfo"
        };
        v29:ObserveGamepadButtonPress(Enum.KeyCode.DPadUp, function() --[[ Line: 777 ]]
            -- upvalues: v130 (copy), v23 (ref), l_GuiService_0 (ref), v37 (copy), v24 (ref)
            for _, v132 in v130 do
                if v23:GetToggleState(v132) == true then
                    return;
                end;
            end;
            l_GuiService_0.SelectedObject = nil;
            if v37.voteStartFrame.Button.Visible then
                v24:VoteStartRound();
                return;
            else
                v24:VoteSkipRound();
                return;
            end;
        end);
        v37.skipWaveFrame.Button.Visible = false;
        v23:HandleButton(v37.voteStartFrame.Button, function() --[[ Line: 797 ]]
            -- upvalues: l_GuiService_0 (ref), v24 (ref)
            l_GuiService_0.SelectedObject = nil;
            v24:VoteStartRound();
        end);
        v37.voteStartFrame.Button.Visible = false;
        local l_UISizeConstraint_0 = Instance.new("UISizeConstraint");
        local function v137() --[[ Line: 807 ]] --[[ Name: updateTop ]]
            -- upvalues: l_GuiService_0 (ref), v37 (copy), l_UISizeConstraint_0 (copy)
            local l_TopbarInset_0 = l_GuiService_0.TopbarInset;
            local v135 = Vector2.new(0, l_TopbarInset_0.Height);
            local l_Position_0 = v37.top.Position;
            l_UISizeConstraint_0.MinSize = v135;
            l_UISizeConstraint_0:SetAttribute("OriginalMinSize", v135);
            v37.top.Position = UDim2.new(l_Position_0.X.Scale, 0, 0, l_TopbarInset_0.Min.Y);
        end;
        v137();
        l_UISizeConstraint_0.Parent = v37.top;
        l_GuiService_0:GetPropertyChangedSignal("TopbarInset"):Connect(v137);
        local v138 = 0;
        local v139 = {
            v37.rightSide.Units, 
            v37.rightSide.Cards, 
            v37.rightSide.Event
        };
        v29:ObserveGamepadButtonPress(Enum.KeyCode.DPadRight, function() --[[ Line: 825 ]]
            -- upvalues: v23 (ref), v25 (ref), v138 (ref), v139 (copy), l_GuiService_0 (ref)
            if v23:IsPrimaryMenuOpen() then
                return;
            elseif v25:IsBuildModeActive() then
                return;
            else
                v138 = v138 + 1;
                if v138 > #v139 then
                    v138 = 1;
                end;
                l_GuiService_0.SelectedObject = v139[v138];
                return;
            end;
        end);
        local v140 = true;
        v22(v8.Player, "Setting_Dialog", function(v141) --[[ Line: 846 ]]
            -- upvalues: v140 (ref), v37 (copy)
            v140 = v141;
            if not v141 and v37.dialogDump then
                v37.dialogDump:Destroy();
            end;
        end);
        v24.WaveDialog:Connect(function(v142, v143, v144) --[[ Line: 854 ]]
            -- upvalues: v140 (ref), v37 (copy), v9 (ref), v20 (ref), v19 (ref), v18 (ref), l_TweenService_0 (ref), v14 (ref)
            if not v144 and not v140 then
                return;
            else
                if v37.dialogDump then
                    v37.dialogDump:Destroy();
                end;
                v37.dialogDump = v9.new();
                local v145 = v142.Duration / v143 - task.wait();
                local v146 = math.clamp(v145 / 1.8, 0, v142.Duration);
                local v147 = utf8.len(v142.Dialog);
                local l_narratorDialog_0 = v37.narratorDialog;
                if v142.Antagonist then
                    l_narratorDialog_0 = v37.antagonistDialog;
                end;
                local l_Speaker_0 = v142.Speaker;
                local v150 = v142.Antagonist or false;
                l_Speaker_0 = if v150 then v142.BlackOut and "???" or v20:GetUnitValue(l_Speaker_0, "FullName") or l_Speaker_0 else v19:GetUnitValue(l_Speaker_0, "FullName") or l_Speaker_0;
                v37.dialogDump:Add(v18.new(l_narratorDialog_0.Character, v142.Speaker, {
                    isEnemy = v150, 
                    AnchorPoint = Vector2.new(0.5, 1), 
                    Size = UDim2.fromScale(2, 2), 
                    Position = UDim2.fromScale(0.5, 1), 
                    positionAttribute = "DialogHeadShot", 
                    ImageColor3 = if v142.BlackOut then Color3.fromRGB(10, 10, 10) else Color3.new(1, 1, 1), 
                    Dialog = true
                }));
                l_narratorDialog_0.NameLabel.Text = l_Speaker_0;
                l_narratorDialog_0.DialogBox.Text = v142.Dialog;
                l_narratorDialog_0.DialogBox.MaxVisibleGraphemes = 0;
                local v151 = TweenInfo.new(v146, Enum.EasingStyle.Linear);
                local v152 = l_TweenService_0:Create(l_narratorDialog_0.DialogBox, v151, {
                    MaxVisibleGraphemes = v147
                });
                v37.dialogDump:Add(v152.Completed:Once(function() --[[ Line: 908 ]]
                    -- upvalues: v152 (ref)
                    v152:Destroy();
                    v152 = nil;
                end));
                v152:Play();
                l_narratorDialog_0.Visible = true;
                v37.dialogDump:Add(function() --[[ Line: 917 ]]
                    -- upvalues: v37 (ref)
                    v37.narratorDialog.Visible = false;
                    v37.antagonistDialog.Visible = false;
                    v37.dialogDump = nil;
                end);
                v37.dialogDump:Add(v152);
                v37.dialogDump:Add(v14.Simple(v145, function() --[[ Line: 925 ]]
                    -- upvalues: v37 (ref)
                    if v37.dialogDump then
                        v37.dialogDump:Destroy();
                    end;
                end));
                return;
            end;
        end);
        v37.activeBossHealthFrames = {};
        v37.bossViewports = {};
        local function v157(v153, v154) --[[ Line: 936 ]] --[[ Name: tweenOutBossFrame ]]
            -- upvalues: l_TweenService_0 (ref), v37 (copy)
            local v155 = l_TweenService_0:Create(v154.Inner.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Scale = 0
            });
            v155.Completed:Once(function() --[[ Line: 943 ]]
                -- upvalues: v37 (ref), v153 (copy), v154 (copy), v155 (ref)
                local v156 = v37.bossViewports[v153];
                if v156 and typeof(v156) == "table" and v156.Destroy then
                    v156:Destroy();
                    v156 = nil;
                end;
                v37.bossViewports[v153] = nil;
                v154:Destroy();
                v37.activeBossHealthFrames[v153] = nil;
                v155:Destroy();
                v155 = nil;
            end);
            v155:Play();
        end;
        local function v178(v158) --[[ Line: 963 ]] --[[ Name: bossInfoChanged ]]
            -- upvalues: v37 (copy), v157 (copy), v18 (ref), l_TweenService_0 (ref), v16 (ref), v10 (ref)
            if not v158 or #v158 < 1 then
                for v159, v160 in pairs(v37.activeBossHealthFrames) do
                    v157(v159, v160);
                end;
                return;
            else
                local v161 = {};
                for _, v163 in ipairs(v158) do
                    local l_UID_0 = v163.UID;
                    v161[l_UID_0] = true;
                    if not v37.activeBossHealthFrames[l_UID_0] then
                        local v165 = v37.bossHealthTemplate:Clone();
                        v165.Name = "BossHealth_" .. l_UID_0;
                        v165.Visible = true;
                        v165.Parent = v37.bossHealthsBin;
                        local v166 = v18.new(v165.Inner.Boss.Character, v163.BossName, {
                            isEnemy = true, 
                            positionAttribute = "BossViewport", 
                            angleAttribute = "BossViewportAngle"
                        });
                        v37.bossViewports[l_UID_0] = v166;
                        v165.Inner.UIScale.Scale = 0;
                        local v167 = l_TweenService_0:Create(v165.Inner.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                            Scale = 1
                        });
                        do
                            local l_v167_0 = v167;
                            l_v167_0.Completed:Once(function() --[[ Line: 1007 ]]
                                -- upvalues: l_v167_0 (ref)
                                l_v167_0:Destroy();
                                l_v167_0 = nil;
                            end);
                            l_v167_0:Play();
                            v37.activeBossHealthFrames[l_UID_0] = v165;
                        end;
                    end;
                    local l_Inner_0 = v37.activeBossHealthFrames[l_UID_0].Inner;
                    local l_Health_0 = v163.Health;
                    local v171 = l_Health_0.Base.Current / l_Health_0.Base.Max;
                    local v172 = 0;
                    if l_Health_0.Armor then
                        v172 = l_Health_0.Armor.Current > 0 and l_Health_0.Armor.Max > 0 and l_Health_0.Armor.Current / l_Health_0.Armor.Max or 0;
                    end;
                    local v173 = v172 > 0 and "ARMOR" or "HP";
                    l_Inner_0.HealthFill.Size = UDim2.fromScale(v171, 1);
                    if l_Inner_0:FindFirstChild("ArmorFill") then
                        l_Inner_0.ArmorFill.Size = UDim2.fromScale(v172, 1);
                        l_Inner_0.ArmorFill.Visible = v172 > 0;
                    end;
                    l_Inner_0.BossName.Text = v163.FullName;
                    local v174 = math.round(v172 > 0 and l_Health_0.Armor and l_Health_0.Armor.Current or l_Health_0.Base.Current);
                    local v175 = math.round(v172 > 0 and l_Health_0.Armor and l_Health_0.Armor.Max or l_Health_0.Base.Max);
                    l_Inner_0.Amount.Text = string.format("%s/%s %s", v16:CommaNumber(v174), v16:CommaNumber(v175), v173);
                end;
                for v176, v177 in pairs(v10.Copy(v37.activeBossHealthFrames)) do
                    if not v161[v176] then
                        v157(v176, v177);
                    end;
                end;
                return;
            end;
        end;
        v24.BossInfo:Observe(function(v179) --[[ Line: 1062 ]]
            -- upvalues: v178 (copy)
            v178(v179);
        end);
        v23:HandleButton(v37.addTimeFrame.Button, function() --[[ Line: 1067 ]]
            -- upvalues: v37 (copy), v27 (ref)
            local l_Attribute_0 = v37.addTimeFrame.Button:GetAttribute("PurchaseName");
            if not l_Attribute_0 then
                return;
            else
                v27:PromptProductPurchase(l_Attribute_0);
                return;
            end;
        end);
        v23:HandleButton(v37.backButton, function() --[[ Line: 1077 ]]
            -- upvalues: v37 (copy)
            if v37.backCallback then
                v37.backCallback();
                v37.backCallback = nil;
            end;
            v37.backFrame.Visible = false;
        end);
        v8.Player:GetAttributeChangedSignal("Stunned"):Connect(function() --[[ Line: 1087 ]]
            -- upvalues: v8 (ref), v37 (copy), v23 (ref)
            local v181 = v8.Player:GetAttribute("Stunned") or false;
            v37.rightSide.Units.Visible = not v181;
            v37.ui.Stunned.Visible = v181;
            if v181 then
                v23:Toggle("UnitsManager", false);
            end;
        end);
    end, 
    Closed = function(_) --[[ Line: 1178 ]] --[[ Name: Closed ]]

    end, 
    ToggleGameInfoBar = function(v183, v184) --[[ Line: 1182 ]] --[[ Name: ToggleGameInfoBar ]]
        if v184 == nil then
            v184 = not v183.rightSide.Visible;
        end;
        v183.rightSide.Visible = v184;
    end, 
    BindBackButton = function(v185, v186) --[[ Line: 1190 ]] --[[ Name: BindBackButton ]]
        v185.backCallback = v186;
        v185.backFrame.Visible = true;
    end, 
    CloseBackButton = function(v187, v188) --[[ Line: 1195 ]] --[[ Name: CloseBackButton ]]
        if not v188 and v187.backCallback then
            v187.backCallback();
            v187.backCallback = nil;
        end;
        v187.backFrame.Visible = false;
    end
};