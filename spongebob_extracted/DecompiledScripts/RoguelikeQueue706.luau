local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_TweenService_0 = game:GetService("TweenService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_ReplicatedStorage_0.ReplicaController);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v6 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v7 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v8 = require(l_ReplicatedStorage_0.Packages.Knit);
local v9 = require(v8.Player.PlayerScripts.Knit.Modules.RewardVisuals);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v11 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v12 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v14 = require(l_ReplicatedFirst_0.GetLoadingScreen);
local v15 = require(l_ReplicatedStorage_0.Levels);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v18 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v19 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local _ = v5.ROGUELIKE;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    _loadoutVisuals = {}, 
    _viewportHandlers = {}
};
local function v35(v32, v33) --[[ Line: 58 ]] --[[ Name: formatDecimal ]]
    v33 = v33 or 3;
    if typeof(v32) ~= "number" then
        return (tostring(v32));
    else
        local v34 = string.format("%." .. v33 .. "f", v32);
        v34 = string.gsub(v34, "%.?0+$", "");
        if v34:sub(-1) == "." then
            v34 = v34:sub(1, -2);
        end;
        return v34;
    end;
end;
v31.Init = function(v36, v37, v38) --[[ Line: 80 ]] --[[ Name: Init ]]
    -- upvalues: v21 (ref), v8 (copy), v23 (ref), v25 (ref), v26 (ref), v27 (ref), v7 (copy)
    v21 = v8.GetController("DeviceTypeController");
    v23 = v8.GetController("DataController");
    v25 = v8.GetController("UIController");
    v26 = v8.GetService("UnitService");
    v27 = v8.GetService("MatchmakingService");
    v36.ui = v37;
    v36.main = v36.ui.Main;
    v36.selectionScreen = v36.main.SelectionScreen;
    v36.stageInfo = v36.selectionScreen.Main.StageSelect.Info;
    v36.rewardsBin = v36.stageInfo.Content.Rewards.Main.Bin.Inner;
    v36.firstTimeBin = v36.stageInfo.Content.Rewards.Main.FirstTimeClear;
    v36.firstTimeBin.Visible = true;
    v36.confirmButton = v36.selectionScreen.Main.Options.Options.Confirm;
    v36.leaveButton = v36.selectionScreen.Main.Options.Options.Leave;
    v36.rewardTemplate = v36.rewardsBin.Template;
    v36.rewardTemplate.Parent = nil;
    v36.rewardTemplate:SetAttribute("InvertClick", true);
    v36.instructionsFrame = v36.selectionScreen.Main.StageSelect.Instructions.Inner;
    v36.rulesButton = v36.instructionsFrame.Hint.Rules;
    v36.loadoutFrame = v36.instructionsFrame.Loadout;
    v36.unitDropChanceButton = v36.rewardsBin.UnitDropChances;
    v36.dumpster = v7.new();
    v36.currentMode = v38;
end;
v31.Start = function(v39) --[[ Line: 112 ]] --[[ Name: Start ]]
    -- upvalues: v28 (ref), v25 (ref), v24 (ref), v22 (ref), v29 (ref), v30 (ref), v23 (ref), v8 (copy), v4 (copy), v7 (copy), v10 (copy), v12 (copy), v35 (copy), v13 (copy), v5 (copy), v6 (copy), v9 (copy), v21 (ref), l_GuiService_0 (copy)
    if v39.currentMode ~= "Lobby" then
        return;
    else
        v28 = v25:GetModuleAsync("Units"):expect();
        v24 = v25:GetModuleAsync("MessagePrompt"):expect();
        v22 = v25:GetModuleAsync("ChestDrops"):expect();
        v29 = v25:GetModuleAsync("Notification"):expect();
        v30 = v25:GetModuleAsync("HUD"):expect();
        v39._gotFirstTimeRewards = false;
        v23:OnChanged(v8.Player, "_gotRogueOneTimeRewards1", function(v40) --[[ Line: 124 ]]
            -- upvalues: v39 (copy)
            v39._gotFirstTimeRewards = v40;
            v39.firstTimeBin.Reward.Earned.Visible = v40;
        end, true);
        v39._roguelikeStats = 0;
        v23:OnChanged(v8.Player, "RoguelikeStats", function(v41) --[[ Line: 130 ]]
            -- upvalues: v39 (copy)
            v39._roguelikeStats = v41;
            v39:_updatePlayerStats();
        end, true);
        v4.NewReplicaSignal:Connect(function(v42) --[[ Line: 135 ]]
            -- upvalues: v39 (copy), v7 (ref), v8 (ref), v10 (ref), v12 (ref), v35 (ref), v13 (ref), v5 (ref), v6 (ref), v9 (ref), v21 (ref), v25 (ref), l_GuiService_0 (ref)
            local l_Class_0 = v42.Class;
            if string.split(l_Class_0, "_")[1] ~= "Queue" then
                return;
            elseif v42.Data.Mode ~= "Roguelike" then
                return;
            else
                v39.queueDump = v7.new();
                v39.queueReplica = v42;
                v39.isLobbyOwner = v42.Data.LobbyOwner == v8.Player;
                v39:_updateWorldData(v42);
                local function v49(v44, v45) --[[ Line: 151 ]] --[[ Name: renderReward ]]
                    -- upvalues: v10 (ref), v12 (ref), v35 (ref), v13 (ref)
                    local v46 = v45.extraData or v45.ExtraData;
                    v44.Content.Inner.Shiny.Visible = v46 and v46.Shiny or false;
                    v44.Content.Inner.Wumbo.Visible = v46 and v46.Wumbo or false;
                    if v45.type == "Unit" then
                        v44.LayoutOrder = -999999;
                    end;
                    if v45.weight then
                        local v47 = v10:Color3ToHex(v12.Solid.Gold);
                        v44.Content.Inner.Amount.RichText = true;
                        v44.Content.Inner.Amount.Text = ("x%* <font color=\"%*\">%%%*</font>"):format(v45.amount or 1, v47, (v35(v45.weight or 1)));
                    end;
                    v44.Content.Inner.Amount.Text = "";
                    if v45.type == "Unit" then
                        v13:SetImage(v44.Content.Inner.Icon, v45.name);
                    else
                        local l_v10_IconFromRewardData_0 = v10:GetIconFromRewardData(v45);
                        v44.Content.Inner.Icon.Image = l_v10_IconFromRewardData_0 or "";
                    end;
                    return {
                        v44.Content.Backdrop, 
                        v44.Content.Glow
                    };
                end;
                local l_MILESTONE_REWARDS_0 = v5.ROGUELIKE.MILESTONE_REWARDS;
                local v51 = {};
                for _, v53 in l_MILESTONE_REWARDS_0 do
                    for _, v55 in v53.rewards do
                        local v56 = ("%*-%*"):format(v55.type, v55.name);
                        local v57 = v51[v56];
                        if v57 then
                            v57.amount = v57.amount + v55.amount;
                        else
                            v51[v56] = table.clone(v55);
                        end;
                    end;
                end;
                table.insert(v51, {
                    type = "Inventory", 
                    name = "RogueCrate", 
                    amount = 1
                });
                v51 = v6.Values(v51);
                local v58 = {};
                for _, v60 in l_MILESTONE_REWARDS_0 do
                    if v60.oneTimeRewards then
                        for _, v62 in v60.oneTimeRewards do
                            table.insert(v58, table.clone(v62));
                        end;
                    end;
                end;
                v58 = v6.Values(v58);
                v39.rewardsVisualizer = v9.new(v51, {
                    template = v39.rewardTemplate, 
                    parent = v39.rewardsBin, 
                    renderMethod = v49
                });
                v39.queueDump:Add(v39.rewardsVisualizer);
                v39.firstTimeRewardsVisualizer = v9.new(v58, {
                    template = v39.rewardTemplate, 
                    parent = v39.firstTimeBin.Reward, 
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(0.5, 0.55), 
                    renderMethod = v49
                });
                v39.queueDump:Add(v39.firstTimeRewardsVisualizer);
                if v39.isLobbyOwner then
                    v39.selectionScreen.Visible = true;
                    task.delay(0.2, function() --[[ Line: 227 ]]
                        -- upvalues: v21 (ref), v25 (ref), l_GuiService_0 (ref), v39 (ref)
                        if v21:IsConsole() and v25:GetToggleState(script.Name) then
                            l_GuiService_0.SelectedObject = v39.confirmButton;
                        end;
                    end);
                end;
                v25:Toggle(script.Name, true);
                v42:AddCleanupTask(function() --[[ Line: 235 ]]
                    -- upvalues: v39 (ref), v25 (ref)
                    if v39.queueDump then
                        v39.queueDump:Destroy();
                    end;
                    if v39._bossViewport then
                        v39._bossViewport:Destroy();
                        v39._bossViewport = nil;
                    end;
                    v39.rewardsVisualizer = nil;
                    v39.firstTimeRewardsVisualizer = nil;
                    v25:Toggle(script.Name, false);
                end);
                return;
            end;
        end);
        v39:_setupSelectionScreen();
        return;
    end;
end;
v31.Opening = function(_) --[[ Line: 255 ]] --[[ Name: Opening ]]
    -- upvalues: v27 (ref)
    v27.AttemptCreateRoguelikeQueue:Fire();
end;
v31.Opened = function(_) --[[ Line: 259 ]] --[[ Name: Opened ]]

end;
v31.Closed = function(v65) --[[ Line: 262 ]] --[[ Name: Closed ]]
    v65.queueReplica:FireServer("LeaveQueue");
    v65._currentBoss = nil;
end;
v31._setupSelectionScreen = function(v66) --[[ Line: 268 ]] --[[ Name: _setupSelectionScreen ]]
    -- upvalues: v25 (ref), v22 (ref), v24 (ref), v23 (ref), v8 (copy), v28 (ref), v10 (copy), v17 (copy), v29 (ref), v26 (ref), v30 (ref), v18 (copy), v19 (copy), v11 (copy)
    v66.selectionScreen.Visible = true;
    v25:HandleButton(v66.confirmButton, function() --[[ Line: 272 ]]
        -- upvalues: v66 (copy)
        v66.queueReplica:FireServer("StartGame");
    end);
    v25:HandleButton(v66.leaveButton, function() --[[ Line: 276 ]]
        -- upvalues: v25 (ref)
        v25:Toggle(script.Name, false);
    end);
    v25:HandleButton(v66.unitDropChanceButton, function() --[[ Line: 280 ]]
        -- upvalues: v22 (ref)
        v22:ShowDropChances("RogueCrate", script.Name);
    end);
    v25:HandleButton(v66.rulesButton, function() --[[ Line: 284 ]]
        -- upvalues: v24 (ref)
        v24:Prompt({
            message = "LOADOUT RULES\nYou may equip up to:\n\n \226\128\162 (1) Exotic/Secret Unit\n \226\128\162 (2) Limited/Mythic Units\n \226\128\162 (3) All Other Rarity Units\n \226\128\162 No Resource Units", 
            options = {
                {
                    text = "Confirm"
                }
            }
        });
    end);
    local v67 = {};
    for _, v69 in v66.loadoutFrame:GetChildren() do
        if v69.Name == "Hotbar" then
            for _, v71 in v69:GetChildren() do
                if v71:IsA("TextButton") then
                    local v72 = tonumber(v71.Name);
                    if v72 then
                        v67[v72] = v71;
                        v66._loadoutVisuals[v71] = {};
                        v25:HandleButton(v71, function() --[[ Line: 313 ]]
                            -- upvalues: v23 (ref), v8 (ref), v28 (ref), v10 (ref), v72 (copy), v17 (ref), v29 (ref), v26 (ref), v25 (ref)
                            local v73 = v23:Get(v8.Player, "RoguelikeLoadout"):expect();
                            v28:OpenWithState("GeneralSelection", {
                                selectionText = ("Select Unit For Rogue Loadout Slot %*"):format((v10:Highlight(v72))), 
                                filter = {
                                    ExcludeRoguelikeLoadout = true
                                }, 
                                returnToMenu = "RoguelikeQueue", 
                                callback = function(v74) --[[ Line: 322 ]] --[[ Name: callback ]]
                                    -- upvalues: v17 (ref), v73 (copy), v72 (ref), v29 (ref), v26 (ref), v25 (ref)
                                    if not v74 then
                                        return;
                                    else
                                        local v75, v76 = v17:ValidateRogueUnitSelection(v73, v74.Name, v72);
                                        if not v75 then
                                            v29:Notify({
                                                message = v76, 
                                                isPositive = false, 
                                                duration = 3
                                            });
                                            return;
                                        else
                                            v26:EquipRogueUnit(v74.Name, v74.UID, v72);
                                            v25:Toggle("RoguelikeQueue", true);
                                            return;
                                        end;
                                    end;
                                end
                            });
                        end);
                    end;
                end;
            end;
        end;
    end;
    local function v95(v77) --[[ Line: 347 ]] --[[ Name: updateLoadout ]]
        -- upvalues: v23 (ref), v8 (ref), v10 (ref), v67 (copy), v17 (ref), v66 (copy), v30 (ref), v18 (ref), v19 (ref), v11 (ref)
        local v78 = v23:Get(v8.Player, "PlayerStats"):expect();
        local l_v10_MaxLoadoutSlot_0 = v10:GetMaxLoadoutSlot(v78);
        v77 = v77 or v23:Get(v8.Player, "RoguelikeLoadout"):expect();
        local v80 = v23:Get(v8.Player, "Units"):expect();
        for v81, v82 in v67 do
            local v83 = v81 <= l_v10_MaxLoadoutSlot_0;
            local v84 = v77[v81] or "";
            local v85, v86 = v17:ParseLoadout(v84);
            v82.Content.TowerInfo.Visible = v83;
            v82.Content.LockedState.Visible = not v83;
            if v83 then
                local v87 = true;
                if v84 ~= "" then
                    v87 = v85 == "";
                end;
                local l_v82_Attribute_0 = v82:GetAttribute("LastUnit");
                local v89 = l_v82_Attribute_0 ~= v84;
                if l_v82_Attribute_0 ~= nil and (v87 or v89) then
                    if v66._viewportHandlers[v82] then
                        v66._viewportHandlers[v82]:Destroy();
                        v66._viewportHandlers[v82] = nil;
                    end;
                    if v66._loadoutVisuals[v82] then
                        for _, v91 in v66._loadoutVisuals[v82] do
                            v91:Destroy();
                        end;
                        table.clear(v66._loadoutVisuals[v82]);
                    end;
                end;
                if v87 then
                    v82.Content.TowerInfo.Icon.Image = "";
                    v82.Content.TowerInfo.Cost.Visible = false;
                    v82.Content.TowerInfo.Level.Text = "";
                    v82:SetAttribute("LastUnit", "");
                    v30:_updateTrait(v82);
                    v30:_updateShinyWumbo(v82);
                    v30:_updateStars(v82);
                    v82.Content.Relic.Visible = false;
                else
                    local v92 = v80[v85] and v80[v85][v86];
                    if not v92 then
                        v18:Warn("Missing unit data for ", v85, v86);
                    else
                        v82:SetAttribute("LastUnit", v84);
                        v30:_updateTrait(v82, v92.Trait);
                        v30:_updateTrait(v82, v92.Trait2, true);
                        v30:_updateShinyWumbo(v82, v92);
                        v30:_updateStars(v82, v92.Stars);
                        v82.Content.Relic.Visible = v92.Relic ~= nil;
                        if v92.Relic then
                            v10:CreateRelicIcon(v82.Content.Relic, v92.Relic);
                        end;
                        v82.Content.TowerInfo.Level.Text = ("LVL <font color = \"#FFFF00\">%*</font>"):format(v92.Level or 1);
                        if v89 then
                            local _, v94 = v17:GetRarity(v85);
                            table.insert(v66._loadoutVisuals[v82], v19.new(v82.Content.TowerInfo.Backdrop, v94));
                            table.insert(v66._loadoutVisuals[v82], v19.new(v82.Content.Glow, v94));
                            v82.Content.TowerInfo.Cost.Visible = true;
                            v82.Content.TowerInfo.Cost.Amount.Text = v17:GetUnitValue(v85, "Cost");
                            v66._viewportHandlers[v82] = v11.new(v82.Content.TowerInfo, v85);
                        end;
                    end;
                end;
            end;
        end;
    end;
    v23:OnChanged(v8.Player, "RoguelikeLoadout", v95, true);
end;
v31._updateWorldData = function(v96, v97) --[[ Line: 438 ]] --[[ Name: _updateWorldData ]]
    -- upvalues: v15 (copy), v14 (copy)
    local l_Stage_0 = v97.Data.Stage;
    local l_v15_WorldData_0 = v15:GetWorldData("Roguelike", l_Stage_0);
    if not l_v15_WorldData_0 then
        return;
    else
        local l_v15_ChapterData_0 = v15:GetChapterData("Roguelike", l_Stage_0, 1);
        local l_ChapterTitle_0 = v96.stageInfo.Content.ChapterTitle;
        l_ChapterTitle_0.Chapter.ChapterName.Text = l_v15_ChapterData_0.DisplayName;
        l_ChapterTitle_0.Chapter.ChapterOrder.Text = l_v15_WorldData_0.DisplayName;
        local v102 = v14.Get("Game", l_v15_WorldData_0.WorldName, 1);
        local l_WorldImage_0 = v96.stageInfo.WorldImage;
        for v104, v105 in {
            Image = "background", 
            ImageColor3 = "backgroundColor"
        } do
            l_WorldImage_0[v104] = v102[v105];
        end;
        l_WorldImage_0.ImageRectOffset = Vector2.new(0, 125);
        l_WorldImage_0.ImageRectSize = Vector2.new(1000, 400);
        v96:_updatePlayerStats();
        v96:_renderBossViewport({
            Name = "CyborgPlanktonLarge"
        });
        return;
    end;
end;
v31._updatePlayerStats = function(v106) --[[ Line: 466 ]] --[[ Name: _updatePlayerStats ]]
    -- upvalues: v10 (copy)
    local l__roguelikeStats_0 = v106._roguelikeStats;
    v106.stageInfo.Content.Info.FastestClear.Amount.Text = l__roguelikeStats_0.FastestClear == 0 and "N/A" or v10:FormatTimeFromSeconds(math.max(0, l__roguelikeStats_0.FastestClear) or 0);
    v106.stageInfo.Content.Info.HighestWave.Amount.Text = tostring(l__roguelikeStats_0.HighestWave or 0);
end;
v31._renderBossViewport = function(v108, v109) --[[ Line: 477 ]] --[[ Name: _renderBossViewport ]]
    -- upvalues: v11 (copy), l_TweenService_0 (copy)
    if not v109 then
        return;
    else
        local v110 = v109.Name or v109.UnitName;
        if v108._currentBoss == v110 then
            return;
        else
            v108._currentBoss = v110;
            if v108._bossViewport and v108._bossViewport.Destroy then
                v108._bossViewport:Destroy();
            end;
            v108._bossViewport = v11.new(v108.stageInfo.Content.Boss, v110, {
                isEnemy = true, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.fromScale(1.25, 1), 
                Position = UDim2.fromScale(0.5, 0), 
                positionAttribute = "QueueOffset", 
                angleAttribute = "QueueOrientation"
            });
            if v108._bossViewport then
                v108._bossViewport.viewHandler.viewport.Position = UDim2.fromScale(0.75, 0);
                task.delay(0.1, function() --[[ Line: 505 ]]
                    -- upvalues: v108 (copy), l_TweenService_0 (ref)
                    if v108._bossViewport and v108._bossViewport.viewHandler and v108._bossViewport.viewHandler.viewport then
                        l_TweenService_0:Create(v108._bossViewport.viewHandler.viewport, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                            Position = UDim2.fromScale(0.5, 0)
                        }):Play();
                    end;
                end);
            end;
            return;
        end;
    end;
end;
return v31;