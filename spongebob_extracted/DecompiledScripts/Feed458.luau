local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v4 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.FoodShared);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v10 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v11 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v12 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v13 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v14 = require(v1.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v15 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
return {
    primaryMenu = true, 
    FoodAvailableChanged = v4.new(), 
    FoodInQueueChanged = v4.new(), 
    TotalXPChanged = v4.new(), 
    totalXPToGive = 0, 
    _selectedUnitInfo = {
        unitName = nil, 
        uid = nil, 
        data = nil
    }, 
    foodInQueue = {}, 
    foodsAvailable = {}, 
    foodInventory = {}, 
    _foodQueueButtons = {}, 
    _foodOptionButtons = {}, 
    Init = function(v22, v23) --[[ Line: 65 ]] --[[ Name: Init ]]
        -- upvalues: v16 (ref), v1 (copy), v17 (ref), v18 (ref), v20 (ref)
        v16 = v1.GetController("DataController");
        v17 = v1.GetController("UIController");
        v18 = v1.GetService("UnitService");
        v20 = v1.GetService("PetService");
        v22.ui = v23;
        v22.main = v23.Main;
        v22.content = v22.main.Content;
        v22.exitBtn = v22.main.Exit;
        v22.unitStats = v22.content.UnitStats;
        v22.changeUnitBtn = v22.content.ChangeUnit;
        v22.rightSide = v22.content.RightSide;
        v22.feedingFrame = v22.rightSide.Feeding;
        v22.availableFoodFrame = v22.rightSide.AvailableFood;
        v22.feedBin = v22.feedingFrame.Items.Bin;
        v22.addAllBtn = v22.availableFoodFrame.AddAll;
        v22.removeAllBtn = v22.availableFoodFrame.RemoveAll;
        v22.foodBin = v22.availableFoodFrame.Items.Bin;
        v22.feedBtn = v22.feedingFrame.Feed;
        v22.cancelBtn = v22.feedingFrame.Cancel;
        v22.foodTemplate = v22.feedBin.Template:Clone();
        v22.feedBin.Template:Destroy();
        v22.foodBin.Template:Destroy();
    end, 
    Start = function(v24, _) --[[ Line: 103 ]] --[[ Name: Start ]]
        -- upvalues: v17 (ref), v19 (ref), v21 (ref), v9 (copy), v8 (copy), v3 (copy), v18 (ref), v20 (ref), v16 (ref), v1 (copy), v6 (copy)
        local v26 = v17:GetModuleAsync("Units"):expect();
        v19 = v17:GetModuleAsync("HUD"):expect();
        v21 = v17:GetModuleAsync("NumberPrompt"):expect();
        v17:HandleButton(v24.exitBtn, function() --[[ Line: 108 ]]
            -- upvalues: v17 (ref)
            v17:Toggle("Units", true);
        end);
        v17:HandleButton(v24.changeUnitBtn, function() --[[ Line: 113 ]]
            -- upvalues: v26 (copy)
            v26:OpenWithState("FeedSelection");
        end);
        v17:HandleButton(v24.addAllBtn, function() --[[ Line: 118 ]]
            -- upvalues: v24 (copy)
            v24:AddFood(v24.foodsAvailable);
        end);
        v17:HandleButton(v24.removeAllBtn, function() --[[ Line: 122 ]]
            -- upvalues: v24 (copy)
            v24:RemoveFood(v24.foodInQueue);
        end);
        v17:HandleButton(v24.feedBtn, function() --[[ Line: 126 ]]
            -- upvalues: v24 (copy), v9 (ref), v8 (ref), v3 (ref), v18 (ref), v20 (ref)
            if not v24._selectedUnitInfo.unitName or not v24._selectedUnitInfo.uid then
                return;
            else
                local _ = nil;
                if (if v24._selectedUnitInfo.isPet then v9:GetMaxLevel(v24._selectedUnitInfo.data) else v8:GetMaxLevel(v24._selectedUnitInfo.data)) <= v24._selectedUnitInfo.data.Level then
                    return;
                elseif #v3.Keys(v24.foodInQueue) < 1 then
                    return;
                elseif v24._processingFeeding then
                    return;
                else
                    v24._processingFeeding = true;
                    local l_v18_0 = v18;
                    if v24._selectedUnitInfo.isPet then
                        l_v18_0 = v20;
                    end;
                    l_v18_0:FeedUnit(v24._selectedUnitInfo.unitName, v24._selectedUnitInfo.uid, v24.foodInQueue):andThen(function() --[[ Line: 168 ]]
                        -- upvalues: v24 (ref)
                        v24._processingFeeding = false;
                    end):catch(function() --[[ Line: 171 ]]
                        -- upvalues: v24 (ref)
                        v24._processingFeeding = false;
                    end);
                    return;
                end;
            end;
        end);
        v17:HandleButton(v24.cancelBtn, function() --[[ Line: 176 ]]
            -- upvalues: v17 (ref)
            v17:Toggle("Units", true);
        end);
        v16:OnChanged(v1.Player, "Inventory", function(v29) --[[ Line: 182 ]]
            -- upvalues: v24 (copy), v6 (ref)
            v24._inventory = v29;
            table.clear(v24.foodsAvailable);
            table.clear(v24.foodInventory);
            for v30, v31 in v29 do
                if v6:IsFood(v30) then
                    v24.foodsAvailable[v30] = v31;
                    v24.foodInventory[v30] = v31;
                    if not v24._foodOptionButtons[v30] then
                        v24:CreateFoodButton(v30);
                    end;
                end;
            end;
            for v32, v33 in v24._foodOptionButtons do
                if not v24.foodInventory[v32] then
                    v33:Destroy();
                    v24._foodOptionButtons[v32] = nil;
                end;
            end;
            for _, v35 in v24._foodQueueButtons do
                v35:Destroy();
            end;
            table.clear(v24.foodInQueue);
            table.clear(v24._foodQueueButtons);
            v24.totalXPToGive = 0;
            v24.TotalXPChanged:Fire();
        end, true);
        v18.UnitDataUpdated:Connect(function(v36, v37) --[[ Line: 236 ]]
            -- upvalues: v24 (copy), v8 (ref)
            if not v24._selectedUnitInfo then
                return;
            elseif v24._selectedUnitInfo.isPet then
                return;
            else
                local v38, v39 = v8:ParseLoadout(v36);
                if not v38 or not v39 then
                    return;
                else
                    v24._selectedUnitInfo.data = v37;
                    v24:_updateXPBar();
                    return;
                end;
            end;
        end);
        v20.PetDataUpdated:Connect(function(v40, v41) --[[ Line: 255 ]]
            -- upvalues: v24 (copy), v9 (ref)
            if not v24._selectedUnitInfo then
                return;
            elseif not v24._selectedUnitInfo.isPet then
                return;
            else
                local v42, v43 = v9:ParseLoadout(v40);
                if not v42 or not v43 then
                    return;
                else
                    v24._selectedUnitInfo.data = v41;
                    v24:_updateXPBar();
                    return;
                end;
            end;
        end);
        v24.FoodAvailableChanged:Connect(function(v44) --[[ Line: 274 ]]
            -- upvalues: v24 (copy)
            if not v24.foodsAvailable[v44] then
                return;
            else
                local v45 = v24._foodOptionButtons[v44];
                if not v45 then
                    return;
                else
                    v45.Content.Info.Amount.Text = ("x%*"):format(v24.foodsAvailable[v44]);
                    return;
                end;
            end;
        end);
        v24.FoodInQueueChanged:Connect(function(v46) --[[ Line: 288 ]]
            -- upvalues: v24 (copy)
            if not v24.foodInQueue[v46] then
                return;
            else
                local v47 = v24._foodQueueButtons[v46];
                if v24.foodInQueue[v46] < 1 then
                    v24.foodInQueue[v46] = nil;
                    if v47 then
                        v47:Destroy();
                        v47 = nil;
                        v24._foodQueueButtons[v46] = nil;
                    end;
                    return;
                else
                    v47.Content.Info.Amount.Text = ("x%*"):format(v24.foodInQueue[v46]);
                    return;
                end;
            end;
        end);
        v24.TotalXPChanged:Connect(function() --[[ Line: 311 ]]
            -- upvalues: v24 (copy)
            v24.unitStats.XPCount.Text = ("+%* Experience"):format(v24.totalXPToGive);
            v24:_updateXPBar();
        end);
        v24:Closed();
    end, 
    Closed = function(v48) --[[ Line: 319 ]] --[[ Name: Closed ]]
        v48:RemoveUnit();
    end, 
    Opened = function(_) --[[ Line: 331 ]] --[[ Name: Opened ]]
        -- upvalues: v19 (ref)
        v19:ToggleBottomLobbyFrame(false);
    end, 
    Closing = function(_) --[[ Line: 335 ]] --[[ Name: Closing ]]
        -- upvalues: v19 (ref)
        v19:ToggleBottomLobbyFrame(true);
    end, 
    AddFood = function(v51, v52) --[[ Line: 489 ]] --[[ Name: AddFood ]]
        -- upvalues: v9 (copy), v8 (copy), v1 (copy), v7 (copy), v6 (copy), v14 (copy), v17 (ref), v21 (ref), v13 (copy)
        if not v51._selectedUnitInfo.unitName then
            return;
        else
            local v53 = nil;
            v53 = if v51._selectedUnitInfo.isPet then v9:GetMaxLevel(v51._selectedUnitInfo.data) else v8:GetMaxLevel(v51._selectedUnitInfo.data);
            if v53 <= v51._selectedUnitInfo.data.Level then
                return;
            else
                local v54 = nil;
                v54 = if v51._selectedUnitInfo.isPet then select(1, v9:AddExperience(v1.Player, v51._selectedUnitInfo.data, v51.totalXPToGive, true)) else select(1, v8:AddExperience(v1.Player, v51._selectedUnitInfo.data, v51.totalXPToGive, true));
                if v53 <= v54 then
                    return;
                else
                    local v55 = {};
                    for v56, v57 in v52 do
                        table.insert(v55, {
                            name = v56, 
                            count = v57, 
                            xp = v7:GetXP(v56)
                        });
                    end;
                    table.sort(v55, function(v58, v59) --[[ Line: 531 ]]
                        return v58.xp > v59.xp;
                    end);
                    for _, v61 in v55 do
                        if v53 > v54 then
                            local v62 = v61.count or 1;
                            local l_xp_0 = v61.xp;
                            local l_name_0 = v61.name;
                            for _ = 1, v62 do
                                local v66 = v51.totalXPToGive + l_xp_0;
                                local v67 = nil;
                                v67 = if v51._selectedUnitInfo.isPet then select(1, v9:AddExperience(v1.Player, v51._selectedUnitInfo.data, v66, true)) else select(1, v8:AddExperience(v1.Player, v51._selectedUnitInfo.data, v66, true));
                                if v54 < v53 or v54 == v53 - 1 and v67 == v53 then
                                    if not v51.foodInQueue[l_name_0] then
                                        v51.foodInQueue[l_name_0] = 0;
                                    end;
                                    local l_foodInQueue_0 = v51.foodInQueue;
                                    l_foodInQueue_0[l_name_0] = l_foodInQueue_0[l_name_0] + 1;
                                    l_foodInQueue_0 = v51.foodsAvailable;
                                    l_foodInQueue_0[l_name_0] = l_foodInQueue_0[l_name_0] - 1;
                                    v51.totalXPToGive = v51.totalXPToGive + l_xp_0;
                                    l_foodInQueue_0 = v51._foodQueueButtons[l_name_0];
                                    if not l_foodInQueue_0 then
                                        local l_v6_ByItemName_0 = v6:GetByItemName(l_name_0);
                                        l_foodInQueue_0 = v51.foodTemplate:Clone();
                                        l_foodInQueue_0.Name = l_name_0;
                                        l_foodInQueue_0.Content.Info.Icon.Image = l_v6_ByItemName_0 and l_v6_ByItemName_0.icon or "";
                                        l_foodInQueue_0.Parent = v51.feedBin;
                                        v51._foodQueueButtons[l_name_0] = l_foodInQueue_0;
                                        v14.new(l_foodInQueue_0, {
                                            Name = l_name_0
                                        });
                                        local v71 = v17:HandleButton(l_foodInQueue_0, function() --[[ Line: 575 ]]
                                            -- upvalues: v51 (copy), l_name_0 (copy), v21 (ref)
                                            if v51.foodInQueue[l_name_0] == 1 then
                                                v51:RemoveFood({
                                                    [l_name_0] = 1
                                                });
                                                return;
                                            else
                                                v21:Prompt({
                                                    minAmount = 1, 
                                                    maxAmount = v51.foodInQueue[l_name_0], 
                                                    message = ("How many %* would you like to remove?"):format(l_name_0), 
                                                    maxMessage = ("You have x%%s of %* being fed."):format(l_name_0), 
                                                    callback = function(v70) --[[ Line: 587 ]] --[[ Name: callback ]]
                                                        -- upvalues: v51 (ref), l_name_0 (ref)
                                                        if not v70 or v70 < 1 then
                                                            return;
                                                        else
                                                            v51:RemoveFood({
                                                                [l_name_0] = v70
                                                            });
                                                            return;
                                                        end;
                                                    end
                                                });
                                                return;
                                            end;
                                        end);
                                        v71:Add(v13.new(l_foodInQueue_0.Content.Backdrop, l_v6_ByItemName_0.rarity));
                                        v71:Add(v13.new(l_foodInQueue_0.Content.Glow, l_v6_ByItemName_0.rarity));
                                    end;
                                    l_foodInQueue_0.Content.Info.Amount.Text = ("x%*"):format(v51.foodInQueue[l_name_0]);
                                    v51.FoodAvailableChanged:Fire(l_name_0);
                                    v54 = v67;
                                else
                                    break;
                                end;
                            end;
                        else
                            break;
                        end;
                    end;
                    v51.TotalXPChanged:Fire();
                    return;
                end;
            end;
        end;
    end, 
    RemoveFood = function(v72, v73) --[[ Line: 680 ]] --[[ Name: RemoveFood ]]
        -- upvalues: v7 (copy)
        for v74, v75 in v73 do
            local l_foodInQueue_1 = v72.foodInQueue;
            l_foodInQueue_1[v74] = l_foodInQueue_1[v74] - v75;
            v72.totalXPToGive = math.clamp(v72.totalXPToGive - v7:GetXP(v74) * v75, 0, 1e999);
            v72.TotalXPChanged:Fire();
            if v72.foodsAvailable[v74] then
                l_foodInQueue_1 = v72.foodsAvailable;
                l_foodInQueue_1[v74] = l_foodInQueue_1[v74] + v75;
            end;
            v72.FoodInQueueChanged:Fire(v74);
            v72.FoodAvailableChanged:Fire(v74);
        end;
    end, 
    CreateFoodButton = function(v77, v78) --[[ Line: 696 ]] --[[ Name: CreateFoodButton ]]
        -- upvalues: v6 (copy), v15 (copy), v14 (copy), v17 (ref), v21 (ref), v13 (copy)
        local l_v6_ByItemName_1 = v6:GetByItemName(v78);
        local v80 = v77.foodTemplate:Clone();
        v80.Name = v78;
        v80.Content.Info.Icon.Image = l_v6_ByItemName_1 and l_v6_ByItemName_1.icon or "";
        v80.Content.Info.Amount.Text = ("x%*"):format(v77.foodInventory[v78]);
        v80.Parent = v77.foodBin;
        v77._foodOptionButtons[v78] = v80;
        v80.LayoutOrder = v15.RARITIES_FROM_NAME[l_v6_ByItemName_1.rarity] or 0;
        v14.new(v80, {
            Name = v78
        });
        local v82 = v17:HandleButton(v80, function() --[[ Line: 710 ]]
            -- upvalues: v77 (copy), v78 (copy), v21 (ref)
            if v77.foodsAvailable[v78] < 1 then
                return;
            elseif v77.foodsAvailable[v78] == 1 then
                v77:AddFood({
                    [v78] = 1
                });
                return;
            else
                v21:Prompt({
                    minAmount = 1, 
                    maxAmount = v77.foodsAvailable[v78], 
                    hasAmount = v77.foodsAvailable[v78], 
                    message = ("How many %* would you like to feed?"):format(v78), 
                    callback = function(v81) --[[ Line: 727 ]] --[[ Name: callback ]]
                        -- upvalues: v77 (ref), v78 (ref)
                        if not v81 or v81 < 1 then
                            return;
                        else
                            v77:AddFood({
                                [v78] = v81
                            });
                            return;
                        end;
                    end
                });
                return;
            end;
        end);
        v82:Add(v13.new(v80.Content.Backdrop, l_v6_ByItemName_1.rarity));
        v82:Add(v13.new(v80.Content.Glow, l_v6_ByItemName_1.rarity));
    end, 
    SetUnit = function(v83, v84) --[[ Line: 741 ]] --[[ Name: SetUnit ]]
        -- upvalues: v2 (copy), v3 (copy), v9 (copy), v8 (copy), v13 (copy), v10 (copy), v17 (ref)
        local l_Name_0 = v84.Name;
        local l_UID_0 = v84.UID;
        local l_Data_0 = v84.Data;
        v83:RemoveFood(v83.foodInQueue);
        if v83._unitDump then
            v83._unitDump:Destroy();
        end;
        v83._unitDump = v2.new();
        v83._unitDump:Add(function() --[[ Line: 755 ]]
            -- upvalues: v83 (copy)
            v83._unitDump = nil;
        end);
        v83._selectedUnitInfo = {
            unitName = l_Name_0, 
            uid = l_UID_0, 
            data = v3.Copy(l_Data_0, true), 
            isPet = v84.IsPet or v84.isPet or false
        };
        if v83._unitViewport then
            v83._unitViewport:Destroy();
            v83._unitViewport = nil;
        end;
        if not l_Name_0 or not l_UID_0 or not l_Data_0 then
            return;
        else
            local v88 = nil;
            local v89 = nil;
            if v84.IsPet then
                v88 = select(2, v9:GetRarity(l_Name_0));
                v89 = v9:GetPetValue(l_Name_0, "FullName");
            else
                v88 = select(2, v8:GetRarity(l_Name_0));
                v89 = v8:GetUnitValue(l_Name_0, "FullName");
            end;
            v83.changeUnitBtn.Content.Plus.Visible = false;
            v83.changeUnitBtn.Content.TowerName.Text = v89 or l_Name_0;
            v83.changeUnitBtn.Content.TowerName.Visible = true;
            v83._unitDump:Add(v13.new(v83.changeUnitBtn.Content.Glow, v88));
            v83._unitDump:Add(v13.new(v83.changeUnitBtn.Content.Backdrop, v88));
            v83._unitViewport = v10.new(v83.changeUnitBtn.Content.TowerPreview, l_Name_0, {
                IsPet = v84.IsPet
            });
            v83:_updateXPBar();
            v17:Toggle(script.Name, true);
            return;
        end;
    end, 
    RemoveUnit = function(v90) --[[ Line: 799 ]] --[[ Name: RemoveUnit ]]
        if not v90._selectedUnitInfo then
            return;
        else
            if v90._unitDump then
                v90._unitDump:Destroy();
            end;
            if v90._unitViewport then
                v90._unitViewport:Destroy();
                v90._unitViewport = nil;
            end;
            v90:RemoveFood(v90.foodInQueue);
            v90:_updateXPBar();
            v90.changeUnitBtn.Content.Plus.Visible = true;
            v90.changeUnitBtn.Content.TowerName.Visible = false;
            v90._selectedUnitInfo = {
                unitName = nil, 
                uid = nil, 
                data = nil
            };
            return;
        end;
    end, 
    _updateXPBar = function(v91) --[[ Line: 826 ]] --[[ Name: _updateXPBar ]]
        -- upvalues: v3 (copy), v9 (copy), v1 (copy), v8 (copy), v12 (copy), v11 (copy)
        local l_unitName_0 = v91._selectedUnitInfo.unitName;
        local l_data_0 = v91._selectedUnitInfo.data;
        if not l_unitName_0 or not l_data_0 then
            return;
        else
            local v94 = v3.Copy(l_data_0, true);
            local l_Level_0 = v94.Level;
            local v96 = nil;
            local v97 = nil;
            if v91._selectedUnitInfo.isPet then
                local v98, v99 = v9:AddExperience(v1.Player, v94, v91.totalXPToGive or 0, true);
                v96 = v98;
                v97 = v99;
            else
                local v100, v101 = v8:AddExperience(v1.Player, v94, v91.totalXPToGive or 0, true);
                v96 = v100;
                v97 = v101;
            end;
            if not v96 or not v97 then
                return;
            else
                v94.Level = v96;
                v94.Experience = v97;
                local v102 = nil;
                v102 = if v91._selectedUnitInfo.isPet then v9:GetNextLevelCost(v94) or 0 else v8:GetNextLevelCost(v94) or 0;
                local v103 = math.clamp(v97 / v102, 0, 1);
                v91.unitStats.XPBar.Fill.Size = UDim2.fromScale(v103, 1);
                if v103 >= 1 then
                    v91.unitStats.XPBar.Progression.Text = "(MAX)";
                else
                    v91.unitStats.XPBar.Progression.Text = ("%*/%*"):format(v97, v102);
                end;
                v91.unitStats.Level.Text = ("Lvl. %*"):format(v96);
                if l_Level_0 < v96 then
                    local v104 = v12:Color3ToHex(v11.Solid.LightGreen);
                    local l_Level_1 = v91.unitStats.Level;
                    l_Level_1.Text = l_Level_1.Text .. ("<font color=\"%*\"> +(%*)</font>"):format(v104, v96 - l_Level_0);
                end;
                table.clear(v94);
                v94 = nil;
                return;
            end;
        end;
    end
};