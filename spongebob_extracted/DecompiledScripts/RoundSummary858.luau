local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local v8 = require(l_ReplicatedStorage_0.Packages.Knit);
local v9 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v12 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v14 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v15 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v16 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v18 = require(l_ReplicatedStorage_0.Levels);
local _ = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v21 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v22 = require(v8.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v23 = require(l_ReplicatedStorage_0.Shared.Data.EnemyShared);
local v24 = require(l_ReplicatedFirst_0.GetLoadingScreen);
local v25 = require(l_ReplicatedStorage_0.BossBattleData);
local v26 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.Constants);
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = Color3.fromRGB(255, 241, 46);
local l_Red_0 = v16.Solid.Red;
local v40 = {
    primaryMenu = true, 
    ignoreClosePrimaryMenus = true, 
    blur = true
};
local function v41(v42, v43, v44) --[[ Line: 88 ]] --[[ Name: animateXPBar ]]
    -- upvalues: l_TweenService_0 (copy), v41 (copy)
    if not v42 or not v42.Parent then
        return;
    else
        v43 = v43 - 1;
        local v45 = v43 >= 0;
        v42.Size = UDim2.fromScale(0, 1);
        local v46 = if v45 then TweenInfo.new(0.5) else TweenInfo.new(1.5);
        local v47 = v45 and 1 or v44;
        local v48 = l_TweenService_0:Create(v42, v46, {
            Size = UDim2.fromScale(v47, 1)
        });
        v48.Completed:Once(function(v49) --[[ Line: 102 ]]
            -- upvalues: v48 (copy), v45 (copy), v41 (ref), v42 (copy), v43 (ref), v44 (copy)
            v48:Destroy();
            if v49 ~= Enum.PlaybackState.Completed then
                return;
            else
                if v45 then
                    v41(v42, v43, v44);
                end;
                return;
            end;
        end);
        v48:Play();
        return;
    end;
end;
v40.Init = function(v50, v51, v52) --[[ Line: 118 ]] --[[ Name: Init ]]
    -- upvalues: v27 (ref), v8 (copy), v28 (ref), v29 (ref), v30 (ref), v31 (ref), v32 (ref), v33 (ref), v34 (ref), v35 (ref), v36 (ref), v9 (copy)
    v27 = v8.GetController("UIController");
    v28 = v8.GetService("GameService");
    v29 = v8.GetController("DataController");
    v30 = v8.GetController("AudioController");
    v31 = v8.GetController("PlaceTeleportController");
    v32 = v8.GetController("TowerController");
    v33 = v8.GetController("DeviceTypeController");
    v34 = v8.GetService("BarnacleService");
    v35 = v8.GetService("RobloxEventService");
    v36 = v8.GetService("TowerKarateService");
    v50.currentMode = v52;
    v50.ui = v51;
    v50.main = v51.Main;
    v50.title = v50.main.Title;
    v50.content = v50.main.Content;
    v50.roundData = v50.content.RoundData;
    v50.unitsXP = v50.content.UnitsXP;
    v50.unitTemplate = v50.unitsXP.Template:Clone();
    v50.unitsXP.Template:Destroy();
    v50.stageInfo = v50.roundData.StageInfo;
    v50.starsFrame = v50.stageInfo.Stars;
    v50.roundStats = v50.roundData.RoundStats;
    v50.rewards = v50.roundData.Rewards.Bin;
    v50.rewardTemplate = v50.rewards.Template;
    v50.rewardTemplate.Parent = nil;
    local l_Actions_0 = v50.content.Actions;
    v50.nextBtn = l_Actions_0.Next;
    v50.replayBtn = l_Actions_0.Replay;
    v50.returnBtn = v50.content.Return;
    v50.eventBtn = l_Actions_0.Event;
    v50.world = 0;
    v50.chapter = 1;
    v50.dumpster = v9.new();
end;
v40.Start = function(v54) --[[ Line: 164 ]] --[[ Name: Start ]]
    -- upvalues: v37 (ref), v27 (ref), v13 (copy), v29 (ref), v8 (copy), v28 (ref), v25 (copy), v23 (copy), v15 (copy), v24 (copy), v18 (copy), v17 (copy), v16 (copy), v12 (copy), v36 (ref), v26 (copy), l_Players_0 (copy), v35 (ref)
    v37 = v27:GetModuleAsync("Dialog"):expect();
    local v55 = {
        Victory = false, 
        Playtime = 80, 
        Takedowns = 1337, 
        TotalDamage = 104000, 
        TotalMoney = 93432, 
        UnitsPlaced = 10, 
        UnitProgression = {}
    };
    v54._loadoutInitialData = {};
    v54._loadoutUIDs = {};
    local l_v13_LoadoutKey_0 = v13:GetLoadoutKey();
    v29:OnChanged(v8.Player, l_v13_LoadoutKey_0, function(v57) --[[ Line: 182 ]]
        -- upvalues: v29 (ref), v8 (ref), v13 (ref), v55 (copy), v54 (copy)
        local v58 = v29:Get(v8.Player, "Units"):expect();
        for _, v60 in v57 do
            if v60 ~= "" then
                local v61, v62 = v13:ParseLoadout(v60);
                local v63 = v58[v61] and v58[v61][v62];
                if v63 then
                    v55.UnitProgression[v61] = 45;
                    v54._loadoutUIDs[v61] = v62;
                    v54._loadoutInitialData[v61] = v63;
                end;
            end;
        end;
    end, true);
    v28.LevelInfo:Observe(function(v64) --[[ Line: 205 ]]
        -- upvalues: v54 (copy), v25 (ref), v23 (ref), v15 (ref), v24 (ref), v18 (ref), v17 (ref), v16 (ref), v12 (ref)
        if not v64 then
            return;
        else
            local l_Mode_0 = v64.Mode;
            local v66 = l_Mode_0 == "Endless";
            local v67 = l_Mode_0 == "BossBattle";
            v54.stageInfo.WorldImage.ImageRectOffset = Vector2.new(0, 125);
            v54.stageInfo.WorldImage.ImageRectSize = Vector2.new(1000, 400);
            if v67 then
                local l_v25_BossFromIndex_0 = v25:GetBossFromIndex(v64.Boss);
                local l_v23_UnitValue_0 = v23:GetUnitValue(l_v25_BossFromIndex_0.Name, "FullName");
                v54.stageInfo.ChapterTitle.Text = ("%* - %*"):format(l_v23_UnitValue_0, (v15:IntToRoman(v64.Tier)));
                v54.stageInfo.WorldTitle.Text = "Boss Battle";
                v54.stageInfo.Difficulty.Visible = false;
                local v70 = v24.Get("Game", v64.WorldName);
                if v70 then
                    for v71, v72 in {
                        Image = "background", 
                        ImageColor3 = "backgroundColor"
                    } do
                        v54.stageInfo.WorldImage[v71] = v70[v72];
                    end;
                end;
                return;
            else
                local l_v18_WorldDataByWorldOrder_0 = v18:GetWorldDataByWorldOrder(l_Mode_0, v64.Stage);
                local l_v18_ChapterData_0 = v18:GetChapterData(l_Mode_0, l_v18_WorldDataByWorldOrder_0.WorldName, v64.Act or 1);
                local v75 = v17.DIFFICULTY_NAMES[v64.Difficulty] or 1;
                v54.world = l_v18_WorldDataByWorldOrder_0.WorldName;
                v54.chapter = v64.Act or 1;
                v54.stageInfo.WorldTitle.Text = l_v18_WorldDataByWorldOrder_0.DisplayName;
                if l_Mode_0 == "Story" then
                    local l_WorldTitle_0 = v54.stageInfo.WorldTitle;
                    l_WorldTitle_0.Text = l_WorldTitle_0.Text .. (" - %*"):format(v64.Act or 1);
                end;
                v54.stageInfo.ChapterTitle.Text = v66 and "Endless" or l_v18_ChapterData_0.DisplayName;
                v54.stageInfo.Difficulty.Text = v75;
                v54.stageInfo.Difficulty.UIGradient.Color = v16.Gradient[v75];
                local l_Difficulty_0 = v54.stageInfo.Difficulty;
                local v78 = false;
                if l_Mode_0 ~= "Endless" then
                    v78 = l_Mode_0 ~= "Event";
                end;
                l_Difficulty_0.Visible = v78;
                l_Difficulty_0 = v54.chapter < 6 and 1 or 2;
                if v66 and v54.chapter > 1 then
                    l_Difficulty_0 = 2;
                end;
                v78 = v24.Get("Game", l_v18_WorldDataByWorldOrder_0.WorldName, l_Difficulty_0);
                if not v78 then
                    local l_v18_WorldImageData_0 = v18:GetWorldImageData(l_Mode_0, l_v18_WorldDataByWorldOrder_0.WorldName);
                    if not l_v18_WorldImageData_0 then
                        v12:Warn("No world image data found for world: " .. l_v18_WorldDataByWorldOrder_0.WorldName);
                        return;
                    else
                        for v80, v81 in l_v18_WorldImageData_0 do
                            v54.stageInfo.WorldImage[v80] = v81;
                        end;
                        v54.stageInfo.WorldImage.ImageColor3 = Color3.new(1, 1, 1);
                        return;
                    end;
                else
                    for v82, v83 in {
                        Image = "background", 
                        ImageColor3 = "backgroundColor"
                    } do
                        v54.stageInfo.WorldImage[v82] = v78[v83];
                    end;
                    return;
                end;
            end;
        end;
    end);
    v36.LevelInfo:Observe(function(v84) --[[ Line: 287 ]]
        -- upvalues: v17 (ref), v54 (copy), v26 (ref), v16 (ref), v24 (ref)
        if not v84 then
            return;
        else
            local v85 = v17.DIFFICULTY_NAMES[v84.Difficulty] or "Normal";
            v54.stageInfo.ChapterTitle.Text = v26.SECTION_NAMES[math.min(v84.Floor or 1, 101)];
            v54.stageInfo.Difficulty.Text = v85;
            v54.stageInfo.Difficulty.UIGradient.Color = v16.Gradient[v85];
            v54.stageInfo.Difficulty.Visible = true;
            v54.stageInfo.WorldTitle.Text = "Floors: ";
            if v84.Floor > v26.MAX_FLOORS then
                local l_WorldTitle_1 = v54.stageInfo.WorldTitle;
                l_WorldTitle_1.Text = l_WorldTitle_1.Text .. "101+";
            else
                local l_WorldTitle_2 = v54.stageInfo.WorldTitle;
                l_WorldTitle_2.Text = l_WorldTitle_2.Text .. ("%* - %*"):format(v84.Floor or 1, (v84.Floor or 1) + 9);
            end;
            v54.stageInfo.WorldImage.ImageRectOffset = Vector2.new(0, 125);
            v54.stageInfo.WorldImage.ImageRectSize = Vector2.new(1000, 400);
            local v88 = v24.Get("Game", "TowerOfKarate", 1);
            for v89, v90 in {
                Image = "background", 
                ImageColor3 = "backgroundColor"
            } do
                v54.stageInfo.WorldImage[v89] = v88[v90];
            end;
            return;
        end;
    end);
    local function v93() --[[ Line: 319 ]] --[[ Name: playerChanged ]]
        -- upvalues: v28 (ref), v54 (copy), l_Players_0 (ref)
        local v91 = v28.NextVoteCount:Get() or 0;
        local v92 = v28.ReplayVoteCount:Get() or 0;
        v54.nextBtn.Content.Amount.Text = ("Next (%*/%*)"):format(v91, #l_Players_0:GetPlayers());
        v54.replayBtn.Content.Amount.Text = ("Replay (%*/%*)"):format(v92, #l_Players_0:GetPlayers());
    end;
    l_Players_0.PlayerAdded:Connect(v93);
    l_Players_0.PlayerRemoving:Connect(v93);
    v28.NextVoteCount:Observe(function(v94) --[[ Line: 331 ]]
        -- upvalues: v54 (copy), l_Players_0 (ref)
        v54.nextBtn.Content.Amount.Text = ("Next (%*/%*)"):format(v94, #l_Players_0:GetPlayers());
    end);
    v28.ReplayVoteCount:Observe(function(v95) --[[ Line: 336 ]]
        -- upvalues: v54 (copy), l_Players_0 (ref)
        v54.replayBtn.Content.Amount.Text = ("Replay (%*/%*)"):format(v95, #l_Players_0:GetPlayers());
    end);
    v28.RoundSummaryReport:Connect(function(v96, v97, v98) --[[ Line: 340 ]]
        -- upvalues: v54 (copy)
        v54:ShowRoundOutcome(v96, v97, v98);
    end);
    v28.CloseRoundSummary:Connect(function() --[[ Line: 344 ]]
        -- upvalues: v27 (ref)
        v27:Toggle(script.Name, false);
        v27:Toggle("GameUI", true);
        v27:Toggle("HUD", true);
    end);
    v27:HandleButton(v54.nextBtn, function() --[[ Line: 350 ]]
        -- upvalues: v28 (ref)
        v28:EndGameVote("Next");
    end);
    v27:HandleButton(v54.replayBtn, function() --[[ Line: 354 ]]
        -- upvalues: v28 (ref)
        v28:EndGameVote("Replay");
    end);
    v27:HandleButton(v54.returnBtn, function() --[[ Line: 358 ]]
        -- upvalues: v28 (ref)
        v28:ReturningToLobby();
    end);
    v27:HandleButton(v54.eventBtn, function() --[[ Line: 362 ]]
        -- upvalues: v35 (ref)
        v35:OpenUI();
    end);
end;
v40.Opening = function(v99) --[[ Line: 367 ]] --[[ Name: Opening ]]
    -- upvalues: v27 (ref), v32 (ref), l_GuiService_0 (copy), l_GamepadService_0 (copy)
    v27:Toggle("HUD", false);
    v27:Toggle("GameUI", false);
    v27:Toggle("StageInfo", false);
    v27:Toggle("UnitsManager", false);
    v27:Toggle("TowerInfo", false);
    v27:Toggle("BossDialog", false);
    v32:DeselectTower();
    v32:StopTowerPlacement();
    l_GuiService_0.SelectedObject = v99.nextBtn;
    l_GamepadService_0:EnableGamepadCursor(nil);
end;
v40.Closed = function(v100) --[[ Line: 382 ]] --[[ Name: Closed ]]
    v100.dumpster:Destroy();
end;
v40.ShowRoundOutcome = function(v101, v102, _, v104) --[[ Line: 387 ]] --[[ Name: ShowRoundOutcome ]]
    -- upvalues: v30 (ref), v38 (copy), l_Red_0 (copy), v15 (copy), v13 (copy), v17 (copy), v8 (copy), v41 (copy), v16 (copy), v14 (copy), v27 (ref), v33 (ref), l_GuiService_0 (copy)
    if not v102 then
        return;
    else
        local l_Mode_1 = v102.MatchSettings.Mode;
        local l_World_0 = v102.MatchSettings.World;
        local v107 = l_Mode_1 == "BossBattle";
        v30:PlaySound({
            name = ("Game.%*"):format(v102.Victory and "Victory" or "Defeat"), 
            soundGroup = "Master.SFX.UI", 
            duckMusic = true
        });
        local v108 = v102.CanPlayNextChapter or v102.CanFightNextBoss or v102.CanPlayNextTower or false;
        v101.nextBtn.Visible = v108 or l_Mode_1 == "Challenge" and not v102.CanReplay;
        v101.replayBtn.Visible = v102.CanReplay;
        local l_eventBtn_0 = v101.eventBtn;
        local v110 = false;
        if l_Mode_1 == "Event" then
            v110 = l_World_0 == "NewKelpCity";
        end;
        l_eventBtn_0.Visible = v110;
        v101.title.TitleContainer.Title.Text = v102.Victory and "SWEET VICTORY!" or "DEFEAT!";
        v101.title.TitleContainer.Glow.ImageColor3 = if v102.Victory then v38 else l_Red_0;
        v101.roundStats.Playtime.Amount.Text = v15:SecondsToClock(v102.Playtime);
        v101.roundStats.Takedowns.Amount.Text = v15:SuffixNumber(v102.Takedowns or v102.Kills or 0, true);
        v101.roundStats.TotalDamage.Amount.Text = v15:SuffixNumber(v102.TotalDamage or 0, true);
        v101.roundStats.TotalMoney.Amount.Text = v15:SuffixNumber(v102.TotalMoney or 0, true);
        v101.roundStats.UnitsPlaced.Amount.Text = v102.UnitsPlaced or 0;
        v101.roundStats.Waves.Amount.Text = v102.TotalWaves or v102.TotalFloors or 0;
        v101.roundStats.TotalMoney.Visible = not v107;
        v101.roundStats.UnitsPlaced.Visible = not v107;
        v101.roundStats.Waves.Visible = not v107;
        v101.roundStats.Takedowns.Visible = not v107;
        if l_Mode_1 == "TowerOfKarate" then
            v101.roundStats.TotalMoney.Visible = false;
            v101.roundStats.TotalDamage.Visible = false;
            v101.roundStats.UnitsPlaced.Visible = false;
            v101.roundStats.Waves.Title.Text = "Floors:";
            v101.roundStats.Takedowns.Title.Text = "Kills:";
        end;
        v101.starsFrame.Visible = v102.Stars ~= nil;
        if v102.Stars then
            for v111 = 1, 3 do
                local v112 = v111 <= v102.Stars;
                local v113 = v101.starsFrame[tostring(v111)];
                v113.ImageColor3 = if v112 then Color3.new(1, 1, 1) else Color3.new(0, 0, 0);
                v113.ImageTransparency = v112 and 0 or 0.5;
            end;
        end;
        for v114, v115 in v102.UnitProgression do
            local l_v13_UnitValue_0 = v13:GetUnitValue(v114, "Rarity");
            l_v13_UnitValue_0 = l_v13_UnitValue_0 and v17.RARITIES_FROM_INDEX[l_v13_UnitValue_0];
            local v117 = v101.unitTemplate:Clone();
            v117.Name = v114;
            v117.UnitName.Text = v13:GetUnitValue(v114, "FullName");
            v117.Rarity.Text = l_v13_UnitValue_0;
            local l_TowerInfo_0 = v117.Unit.TowerInfo;
            local v119 = v101._loadoutInitialData[v114].Level or 1;
            local v120 = v101._loadoutInitialData[v114].Experience or 0;
            local v121 = {
                Name = v114, 
                Level = v119, 
                Experience = v120, 
                Stars = v101._loadoutInitialData[v114].Stars or 0
            };
            local v122, v123 = v13:AddExperience(v8.Player, v121, v115);
            local l_v13_LevelCost_0 = v13:GetLevelCost(v121, v122 + 1);
            v101._loadoutInitialData[v114].Level = v122;
            v101._loadoutInitialData[v114].Experience = v123;
            local v125 = math.clamp(v123 / l_v13_LevelCost_0, 0, 1);
            v41(v117.XPBar.Bar.Fill, v122 - v119, v125);
            l_TowerInfo_0.Level.Text = ("LVL %*"):format(v122);
            if v119 < v122 then
                local v126 = v15:Color3ToHex(v16.Solid.LightGreen);
                local l_Level_0 = l_TowerInfo_0.Level;
                l_Level_0.Text = l_Level_0.Text .. ("<font color=\"%*\"> +(%*)</font>"):format(v126, v122 - v119);
            end;
            v117.XPBar.Bar.XP.Text = ("+%*"):format(v115);
            v117.Visible = true;
            v117.Parent = v101.unitsXP;
            l_TowerInfo_0.Backdrop:SetAttribute("Rarity", l_v13_UnitValue_0);
            l_TowerInfo_0.Backdrop:AddTag("VisualizeRarity");
            l_TowerInfo_0.Parent.Glow:SetAttribute("Rarity", l_v13_UnitValue_0);
            l_TowerInfo_0.Parent.Glow:AddTag("VisualizeRarity");
            v101.dumpster:Add(v14.new(l_TowerInfo_0, v114));
            v101.dumpster:Add(v117);
        end;
        l_eventBtn_0 = v27:Toggle(script.Name, true);
        if l_eventBtn_0 then
            l_eventBtn_0:andThen(function() --[[ Line: 500 ]]
                -- upvalues: v33 (ref), v108 (copy), l_GuiService_0 (ref), v101 (copy)
                if not v33:IsConsole() then
                    return;
                elseif v108 then
                    l_GuiService_0.SelectedObject = v101.nextBtn;
                    return;
                else
                    l_GuiService_0.SelectedObject = v101.returnBtn;
                    return;
                end;
            end);
        end;
        if v104 then
            v101:DisplayRewards(v104);
        end;
        return;
    end;
end;
v40.DisplayRewards = function(v128, v129) --[[ Line: 519 ]] --[[ Name: DisplayRewards ]]
    -- upvalues: v22 (copy), v21 (copy), v15 (copy)
    v128.dumpster:Construct(v22, v129, {
        parent = v128.rewards, 
        template = v128.rewardTemplate, 
        renderMethod = function(v130, v131) --[[ Line: 524 ]]
            -- upvalues: v21 (ref), v15 (ref)
            if v131.type == "Unit" then
                v21:SetImage(v130.Content.Inner.Icon, v131.name);
                if v131.extraData then
                    v130.Content.Shiny.Visible = v131.extraData.Shiny or false;
                    v130.Content.Wumbo.Visible = v131.extraData.Mega or false;
                end;
                v130.LayoutOrder = -999999;
            else
                v15:SetRewardIcon(v131, v130.Content.Inner.Icon);
            end;
            v130.Content.Inner.Amount.Text = ("x%*"):format(v131.amount or 1);
            return {
                v130.Content.Backdrop, 
                v130.Content.Glow
            };
        end
    });
end;
return v40;