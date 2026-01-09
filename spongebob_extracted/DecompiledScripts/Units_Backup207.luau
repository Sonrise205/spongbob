local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v7 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v8 = require(l_ReplicatedStorage_0.Packages.Silo);
local v9 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v13 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v14 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v16 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v17 = require(v5.Player.PlayerScripts.Knit.Controllers.UIController.Util.HighlandUIUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.AnimatedSprite);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v20 = require(l_ReplicatedStorage_0.TraitsData);
local v21 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisualBatch);
local v22 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v23 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v24 = require(v5.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v25 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v26 = require(script.TeamsManager);
local v27 = require(l_ReplicatedStorage_0.Shared.Data.BemmyQuestlineInfo);
local _ = require(l_ReplicatedStorage_0.Shared.Data.SpritesheetAtlas);
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
local v46 = {
    "HUD", 
    "Notification"
};
local v47 = UDim2.fromScale(0.54, 0.45);
local v48 = {
    TraitSelection = true, 
    FeedSelection = true, 
    FusionSelection = true, 
    TradingSelection = true, 
    ExchangeSelection = true, 
    TeamSelection = true, 
    GeneralSelection = true
};
local v49 = {
    Select = true, 
    Cancel = true
};
local v50 = {
    primaryMenu = true, 
    blur = true, 
    _selectedUnit = nil, 
    _uidsForSale = {}, 
    _tradingUnits = {}, 
    _totalSalePrice = 0, 
    _unitButtons = {}, 
    _filteredUnits = nil, 
    _currentFilter = {}, 
    _equippedBest = false, 
    EditOptionChanged = v9.new(), 
    GeneratedUnitButtons = v9.new(), 
    ToggleAll = v46, 
    rgbHandler = v21.new(), 
    updatedUnitData = {}
};
local v55 = v8.new({
    Mode = "Normal", 
    UIDsForSale = {}
}, {
    SetMode = function(v51, v52) --[[ Line: 124 ]]
        v51.Mode = v52;
    end, 
    SetUIDsForSale = function(v53, v54) --[[ Line: 128 ]]
        v53.UIDsForSale = v54;
    end
});
v50.Init = function(v56, v57, v58) --[[ Line: 135 ]] --[[ Name: Init ]]
    -- upvalues: v29 (ref), v5 (copy), v30 (ref), v31 (ref), v32 (ref), v33 (ref), v34 (ref), v35 (ref), v36 (ref), v37 (ref), v38 (ref), v26 (copy)
    v29 = v5.GetController("UIController");
    v30 = v5.GetController("DataController");
    v31 = v5.GetService("UnitService");
    v32 = v5.GetController("UnitViewerController");
    v33 = v5.GetController("UnitController");
    v34 = v5.GetController("DeviceTypeController");
    v35 = v5.GetController("GlobalUnitTrackerController");
    v36 = v5.GetController("GlobalMintController");
    v37 = v5.GetService("BemmyBuddyService");
    v38 = v5.GetController("PetController");
    v56.currentMode = v58;
    v56.ui = v57;
    v56.filterFrame = v56.ui.FilterOverlay;
    v56.filterMain = v56.filterFrame.Main;
    v56.filterContent = v56.filterMain.Content;
    v56.filterOptions = v56.filterContent.Options;
    v56.main = v57.Main;
    v56.content = v56.main.Content;
    v56.unitsBin = v56.content.Bin.Bin;
    v56.unitTemplate = v56.unitsBin.Template:Clone();
    v56.unitTemplate:SetAttribute("InvertClick", true);
    v56.unitsBin.Template:Destroy();
    v56.topBar = v56.content.Top;
    v56.bottomBar = v56.content.Bottom;
    v56.searchBar = v56.topBar.SearchBar.TextBox;
    v56.unitCountLabel = v56.main.UnitsCount.Count;
    v56.exitBtn = v56.main.Exit;
    v56.hoverTooltip = v56.content.HoverTooltip;
    v56.previewFrame = v56.main.Content.Preview;
    v56.selectUnitPreview = v56.previewFrame.FirstOpenBackground;
    v56.unitInfoFrame = v56.previewFrame.UnitInfo;
    v56.starsContainer = v56.unitInfoFrame.Content.Unsorted.Stars;
    v56.toggleFavoriteBtn = v56.unitInfoFrame.Content.Unsorted.ToggleFavorite;
    v56.hoverTooltip.Visible = false;
    v56.previewFrame.ExistingCount.Visible = false;
    v26:Init(v57);
end;
v50.Start = function(v59) --[[ Line: 187 ]] --[[ Name: Start ]]
    -- upvalues: v26 (copy), v39 (ref), v29 (ref), v40 (ref), v41 (ref), v43 (ref), v44 (ref), v45 (ref), v42 (ref), v7 (copy), v31 (ref), v6 (copy), v55 (copy), v27 (copy), v30 (ref), v5 (copy), v14 (copy), v46 (copy), v47 (copy), v12 (copy), v37 (ref), v38 (ref), l_RunService_0 (copy), v25 (copy), l_TweenService_0 (copy)
    task.spawn(function() --[[ Line: 188 ]]
        -- upvalues: v26 (ref)
        v26:Start();
    end);
    v26.ToggledSignal:Connect(function(v60) --[[ Line: 192 ]]
        -- upvalues: v59 (copy)
        v59.main.Visible = not v60;
    end);
    v39 = v29:GetModuleAsync("Traits"):expect();
    v40 = v29:GetModuleAsync("Feed"):expect();
    v41 = v29:GetModuleAsync("Fusions"):expect();
    v43 = v29:GetModuleAsync("Notification"):expect();
    v44 = v29:GetModuleAsync("MessagePrompt"):expect();
    v45 = v29:GetModuleAsync("HUD"):expect();
    if v59.currentMode == "Trading" then
        v42 = v29:GetModuleAsync("Trade"):expect();
    end;
    v59.unitsBin.CanvasPosition = Vector2.new(0, 0);
    v59.filterFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 209 ]]
        -- upvalues: v59 (copy), v45 (ref)
        v59.main.Visible = not v59.filterFrame.Visible;
        if v59.filterFrame.Visible then
            v45:ToggleUnitsBar(false, 0);
            return;
        else
            v45:ToggleUnitsBar(true, 0.2);
            return;
        end;
    end);
    v29:HandleButton(v59.bottomBar.Sell.ConfirmSell, function() --[[ Line: 219 ]]
        -- upvalues: v7 (ref), v59 (copy), v44 (ref), v31 (ref)
        local v61 = v7.Keys(v59._uidsForSale);
        if #v61 < 1 then
            return;
        else
            v44:Prompt({
                message = "Are you sure you want to sell these units?", 
                options = {
                    {
                        text = "Yes", 
                        callback = function() --[[ Line: 232 ]] --[[ Name: callback ]]
                            -- upvalues: v31 (ref), v61 (copy)
                            v31:SellUnits(v61);
                        end
                    }, 
                    {
                        text = "No"
                    }
                }
            });
            v44:BindToClose(function() --[[ Line: 242 ]]
                -- upvalues: v59 (ref)
                v59:SetState("Normal");
            end);
            return;
        end;
    end, {
        MouseEnter = function() --[[ Line: 246 ]] --[[ Name: MouseEnter ]]
            -- upvalues: v59 (copy)
            v59:HideHoverTooltip();
            v59.hoverCancelTag = "ConfirmSell";
        end, 
        MouseLeave = function() --[[ Line: 250 ]] --[[ Name: MouseLeave ]]
            -- upvalues: v59 (copy)
            if v59.hoverCancelTag == "ConfirmSell" then
                v59.hoverCancelTag = nil;
            end;
        end
    });
    v29:HandleButton(v59.bottomBar.Sell.CancelSell, function() --[[ Line: 257 ]]
        -- upvalues: v59 (copy)
        v59:SetState("Normal");
    end, {
        MouseEnter = function() --[[ Line: 260 ]] --[[ Name: MouseEnter ]]
            -- upvalues: v59 (copy)
            v59:HideHoverTooltip();
            v59.hoverCancelTag = "CancelSell";
        end, 
        MouseLeave = function() --[[ Line: 264 ]] --[[ Name: MouseLeave ]]
            -- upvalues: v59 (copy)
            if v59.hoverCancelTag == "CancelSell" then
                v59.hoverCancelTag = nil;
            end;
        end
    });
    v59.hoverCancelTag = nil;
    v29:HandleButton(v59.bottomBar.Default.EquipBest, function() --[[ Line: 273 ]]
        -- upvalues: v59 (copy), v31 (ref)
        v59._equippedBest = true;
        v31:EquipBest();
    end, {
        MouseEnter = function() --[[ Line: 277 ]] --[[ Name: MouseEnter ]]
            -- upvalues: v59 (copy)
            v59:HideHoverTooltip();
            v59.hoverCancelTag = "EquipBest";
        end, 
        MouseLeave = function() --[[ Line: 281 ]] --[[ Name: MouseLeave ]]
            -- upvalues: v59 (copy)
            if v59.hoverCancelTag == "EquipBest" then
                v59.hoverCancelTag = nil;
            end;
        end
    });
    v29:HandleButton(v59.bottomBar.Default.UnequipAll, function() --[[ Line: 288 ]]
        -- upvalues: v31 (ref)
        v31:UnequipAll();
    end, {
        MouseEnter = function() --[[ Line: 291 ]] --[[ Name: MouseEnter ]]
            -- upvalues: v59 (copy)
            v59:HideHoverTooltip();
            v59.hoverCancelTag = "UnequipAll";
        end, 
        MouseLeave = function() --[[ Line: 295 ]] --[[ Name: MouseLeave ]]
            -- upvalues: v59 (copy)
            if v59.hoverCancelTag == "UnequipAll" then
                v59.hoverCancelTag = nil;
            end;
        end
    });
    v29:HandleButton(v59.topBar.Filter, function() --[[ Line: 302 ]]
        -- upvalues: v59 (copy)
        v59:ShowFilterMenu();
    end);
    if v59.topBar:FindFirstChild("Team") then
        v29:HandleButton(v59.topBar.Team, function() --[[ Line: 307 ]]
            -- upvalues: v59 (copy)
            v59:ShowTeamsFrame();
        end);
    end;
    v29:HandleButton(v59.bottomBar.Default.SellMode, function() --[[ Line: 312 ]]
        -- upvalues: v59 (copy)
        v59:SetState("Sell");
    end, {
        MouseEnter = function() --[[ Line: 315 ]] --[[ Name: MouseEnter ]]
            -- upvalues: v59 (copy)
            v59:HideHoverTooltip();
            v59.hoverCancelTag = "SellMode";
        end, 
        MouseLeave = function() --[[ Line: 319 ]] --[[ Name: MouseLeave ]]
            -- upvalues: v59 (copy)
            if v59.hoverCancelTag == "SellMode" then
                v59.hoverCancelTag = nil;
            end;
        end
    });
    local function v63(v62) --[[ Line: 326 ]] --[[ Name: selectMode ]]
        return v62.Mode;
    end;
    local v64 = v6.new();
    v55:Watch(v63, function(v65) --[[ Line: 332 ]]
        -- upvalues: v59 (copy), v64 (copy), v27 (ref), v30 (ref), v5 (ref), v14 (ref), v29 (ref), v46 (ref), v47 (ref)
        if v65 == "FocusOnUnit" then
            local v66 = v59._selectedUnit and v59._selectedUnit.Button;
            for _, v68 in v59._unitButtons do
                for _, v70 in v68 do
                    v70.Content.Darken.Visible = v70 ~= v66;
                end;
            end;
        end;
        v59.bottomBar.Sell.Visible = v65 == "Sell";
        v59.bottomBar.Default.Visible = v65 == "Normal";
        v59.bottomBar.Fusions.Visible = v65 == "FusionSelection";
        v59.bottomBar.Traits.Visible = v65 == "TraitSelection";
        v59.bottomBar.Trading.Visible = v65 == "TradingSelection";
        v59.bottomBar.Exchange.Visible = v65 == "ExchangeSelection";
        v59.bottomBar.Teams.Visible = v65 == "TeamSelection";
        v59.bottomBar.UnitSelection.Visible = v65 == "GeneralSelection";
        if v59._stateData and v59._stateData.selectionText then
            v59.bottomBar.UnitSelection.Text = v59._stateData.selectionText;
        else
            v59.bottomBar.UnitSelection.Visible = false;
        end;
        v59.topBar.Filter.Visible = v65 ~= "ExchangeSelection";
        v64:Destroy();
        if v65 == "ExchangeSelection" then
            local l_v27_QuestInfo_0 = v27:GetQuestInfo(5);
            v64:Add(v30:OnChanged(v5.Player, {
                v14.BEMMY.DATA_KEY, 
                "progress", 
                5
            }, function(v72) --[[ Line: 370 ]]
                -- upvalues: l_v27_QuestInfo_0 (copy), v59 (ref)
                local v73 = ("<font color=\"#ebff33\">(Progress: %*/%*)</font>"):format(v72, l_v27_QuestInfo_0.required);
                v59.bottomBar.Exchange.Text = ("Select units to give to Bemmy %*"):format(v73);
            end, true));
        end;
        v59.topBar.Team.Visible = v65 == "Normal";
        if v65 == "FusionSelection" then
            v59._filterBackup = table.clone(v59._currentFilter);
            v59._currentFilter.ExcludeFavoriteUnits = true;
            v59:FilterUnits(v59._currentFilter);
        end;
        if v65 == "TraitSelection" then
            v59._filterBackup = table.clone(v59._currentFilter);
            v59._currentFilter.ExcludeResourceUnits = true;
            v59:FilterUnits(v59._currentFilter);
        end;
        if v65 == "GeneralSelection" and v59._stateData and v59._stateData.filter then
            v59._filterBackup = table.clone(v59._currentFilter);
            v59:FilterUnits(v59._stateData.filter);
        end;
        if v65 == "Sell" then
            v59:DeselectUnit();
        end;
        table.clear(v59._uidsForSale);
        v59._totalSalePrice = 0;
        v59.bottomBar.Sell.ConfirmSell.Content.Title.Text = "Sell (x0)";
        v59.bottomBar.Sell.ConfirmSell.Content.Currency.Amount.Text = "+0";
        for v74, v75 in v59._unitButtons do
            for v76 in v75 do
                v59:UpdateUnitButton(v74, v76, v65);
            end;
        end;
        if v65 == "Normal" then
            if v59.HiddenUI then
                v29:RevertFromToggleAll(table.clone(v59.HiddenUI), true);
                v59.HiddenUI = nil;
            end;
            v59.highPriority = false;
            v59.ToggleAll = v46;
            v59.main.Position = v47;
            v59._currentFilter.ExcludeResourceUnits = nil;
            if v59._filterBackup then
                v59._currentFilter = table.clone(v59._filterBackup);
                v59._filterBackup = nil;
                v59:FilterUnits(v59._currentFilter);
            end;
        end;
    end);
    v29:HandleButton(v59.unitInfoFrame.Content.Options.Equip, function() --[[ Line: 447 ]]
        -- upvalues: v59 (copy), v12 (ref), v31 (ref), v45 (ref), v29 (ref)
        if not v59._selectedUnit then
            return;
        else
            local l_v12_LoadoutString_0 = v12:CreateLoadoutString(v59._selectedUnit.Info.Name, v59._selectedUnit.Info.UID);
            for v78 = 1, #v59._loadout do
                if v59._loadout[v78] == l_v12_LoadoutString_0 then
                    v31:UnequipUnit(v78);
                    return;
                end;
            end;
            local v79 = nil;
            for v80 = 1, v59:_getMaxLoadoutSlot() do
                if v59._loadout[v80] == "" then
                    v79 = v80;
                    break;
                end;
            end;
            if not v79 then
                v45:ToggleUnitReplacement(true, v59._selectedUnit.Info);
                v29:Toggle(script.Name, false);
                return;
            else
                v31:EquipUnit(v59._selectedUnit.Info.Name, v59._selectedUnit.Info.UID, v79);
                return;
            end;
        end;
    end);
    v29:HandleButton(v59.unitInfoFrame.Content.Options.Feed, function() --[[ Line: 488 ]]
        -- upvalues: v59 (copy), v40 (ref)
        if not v59._selectedUnit then
            return;
        else
            v40:SetUnit(v59._selectedUnit.Info.Name, v59._selectedUnit.Info.UID, v59._selectedUnit.Info.Data);
            return;
        end;
    end);
    v29:HandleButton(v59.unitInfoFrame.Content.Options.Select, function() --[[ Line: 496 ]]
        -- upvalues: v59 (copy), v55 (ref), v39 (ref), v40 (ref), v41 (ref), v26 (ref), v43 (ref), v42 (ref), v37 (ref), v29 (ref)
        if not v59._selectedUnit then
            return;
        else
            local l_v55_State_0 = v55:GetState();
            if l_v55_State_0.Mode == "TraitSelection" then
                v39:SelectUnit(v59._selectedUnit.Info);
                return;
            elseif l_v55_State_0.Mode == "FeedSelection" then
                v40:SetUnit(v59._selectedUnit.Info.Name, v59._selectedUnit.Info.UID, v59._selectedUnit.Info.Data);
                return;
            elseif l_v55_State_0.Mode == "FusionSelection" then
                v41:SelectUnit(v59._selectedUnit.Info);
                return;
            elseif l_v55_State_0.Mode == "TeamSelection" then
                v26:CallToAddUnit(v59._selectedUnit.Info);
                return;
            elseif l_v55_State_0.Mode == "GeneralSelection" then
                v59._stateData.callback(v59._selectedUnit.Info);
                return;
            elseif l_v55_State_0.Mode == "TradingSelection" then
                if v59._selectedUnit.Info.Data.Untradable or v59._selectedUnit.Info.Data.Temporary then
                    v43:Notify({
                        message = "You cannot trade this unit", 
                        duration = 3, 
                        isPositive = false
                    });
                    return;
                elseif v59:ToggleTradingUnit(v59._selectedUnit.Info, true) then
                    v42:TradeUnit(v59._selectedUnit.Info);
                    return;
                else
                    v43:Notify({
                        message = "You are already trading this unit!", 
                        duration = 3, 
                        isPositive = false
                    });
                    return;
                end;
            else
                if l_v55_State_0.Mode == "ExchangeSelection" then
                    v37:GiveUnit(v59._selectedUnit.Info):andThen(function(v82, v83) --[[ Line: 540 ]]
                        -- upvalues: v43 (ref), v29 (ref)
                        if v82 then
                            v43:Notify({
                                message = "Unit successfully given to Bemmy!", 
                                duration = 3, 
                                isPositive = true
                            });
                        end;
                        if v83 then
                            v29:Toggle(script.Name, false);
                            return;
                        else
                            return;
                        end;
                    end);
                end;
                return;
            end;
        end;
    end);
    v29:HandleButton(v59.exitBtn, function() --[[ Line: 558 ]]
        -- upvalues: v29 (ref), v5 (ref), v14 (ref)
        v29:Toggle(script.Name, false):andThen(function() --[[ Line: 559 ]]
            -- upvalues: v5 (ref), v14 (ref), v29 (ref)
            if v5.Player:GetAttribute(v14.TRADING.ATTRIBUTE) then
                v29:Toggle("Trade", true);
            end;
        end);
    end);
    v29:HandleButton(v59.toggleFavoriteBtn, function() --[[ Line: 566 ]]
        -- upvalues: v59 (copy), v31 (ref)
        if not v59._selectedUnit then
            return;
        else
            v31:ToggleFavorite(v59._selectedUnit.Info.Name, v59._selectedUnit.Info.UID);
            return;
        end;
    end);
    v59._totalUnits = 0;
    v59._maxUnits = 100;
    v30:OnChanged(v5.Player, "MaxUnits", function(v84) --[[ Line: 580 ]]
        -- upvalues: v59 (copy)
        v59._maxUnits = v84;
        v59:_updateUnitCount();
    end, true);
    v59._units = v30:Get(v5.Player, "Units"):expect();
    v59._loadout = v30:Get(v5.Player, "Loadout"):expect();
    v59._unitsArray = {};
    local l_v38_EquippedPets_0 = v38:GetEquippedPets();
    for v86, v87 in v59._units do
        local l_v12_UnitValue_0 = v12:GetUnitValue(v86, "Type");
        for v89, v90 in v87 do
            local l__unitsArray_0 = v59._unitsArray;
            local v92 = {
                Name = v86, 
                UID = v89, 
                Data = v90, 
                Rarity = select(2, v12:GetRarity(v86))
            };
            local v93 = {};
            local v94 = false;
            if l_v12_UnitValue_0 ~= "Resource" then
                v94 = v12:GetTotalDamage(v90, nil, nil, l_v38_EquippedPets_0);
            end;
            v93.DMG = v94;
            v94 = false;
            if l_v12_UnitValue_0 ~= "Resource" then
                v94 = v12:GetRange(v90, nil, nil, nil, l_v38_EquippedPets_0);
            end;
            v93.RNG = v94;
            v94 = false;
            if l_v12_UnitValue_0 ~= "Resource" then
                v94 = v12:GetAttackCooldown(v90, nil, nil, nil, l_v38_EquippedPets_0);
            end;
            v93.SPA = v94;
            v94 = false;
            if l_v12_UnitValue_0 == "Resource" then
                v94 = v12:GetGold(v90);
            end;
            v93.GOLD = v94;
            v92.Stats = v93;
            v92.Equipped = table.find(v59._loadout, v12:CreateLoadoutString(v86, v89)) ~= nil;
            table.insert(l__unitsArray_0, v92);
            v59._totalUnits = v59._totalUnits + 1;
        end;
    end;
    v59:_updateUnitCount();
    v30:OnChanged(v5.Player, "Loadout", function(v95) --[[ Line: 617 ]]
        -- upvalues: v59 (copy), v12 (ref)
        v59._loadout = v95;
        if v59._selectedUnit then
            v59:UpdateSelectedUnit();
        end;
        for _, v97 in v59._unitsArray do
            local l_Name_0 = v97.Name;
            local l_UID_0 = v97.UID;
            v97.Equipped = table.find(v95, v12:CreateLoadoutString(l_Name_0, l_UID_0)) ~= nil;
        end;
        if v59._equippedBest then
            v59._equippedBest = false;
            v59:_loadUnits();
            return;
        else
            v59:SortUnits(v59._unitsArray);
            v59:UpdateButtonOrders();
            return;
        end;
    end, true);
    v30:OnChanged(v5.Player, "PlayerStats", function(v100) --[[ Line: 640 ]]
        -- upvalues: v59 (copy)
        v59._playerStats = v100;
        v59._myLevel = v100.Level or 1;
    end, true);
    v31.UnitsAdded:Connect(function(v101) --[[ Line: 645 ]]
        -- upvalues: v59 (copy), v7 (ref), v38 (ref), v12 (ref), v29 (ref), l_RunService_0 (ref)
        local l_v59_0 = v59;
        l_v59_0._totalUnits = l_v59_0._totalUnits + #v7.Keys(v101);
        v59:_updateUnitCount();
        l_v59_0 = 1;
        local l_v38_EquippedPets_1 = v38:GetEquippedPets();
        for v104, v105 in v101 do
            local v106, v107 = v12:ParseLoadout(v104);
            if not v59._units[v106] then
                v59._units[v106] = {};
            end;
            if not v59._unitButtons[v106] or not v59._unitButtons[v106][v107] then
                if not v59._units[v106][v107] then
                    v59._units[v106][v107] = v105;
                end;
                local l_v12_UnitValue_1 = v12:GetUnitValue(v106, "Type");
                local l__unitsArray_1 = v59._unitsArray;
                local v110 = {
                    Name = v106, 
                    UID = v107, 
                    Data = v105, 
                    Rarity = select(2, v12:GetRarity(v106))
                };
                local v111 = {};
                local v112 = false;
                if l_v12_UnitValue_1 ~= "Resource" then
                    v112 = v12:GetTotalDamage(v105, nil, nil, l_v38_EquippedPets_1);
                end;
                v111.DMG = v112;
                v112 = false;
                if l_v12_UnitValue_1 ~= "Resource" then
                    v112 = v12:GetRange(v105, nil, nil, nil, l_v38_EquippedPets_1);
                end;
                v111.RNG = v112;
                v112 = false;
                if l_v12_UnitValue_1 ~= "Resource" then
                    v112 = v12:GetAttackCooldown(v105, nil, nil, nil, l_v38_EquippedPets_1);
                end;
                v111.SPA = v112;
                v112 = false;
                if l_v12_UnitValue_1 == "Resource" then
                    v112 = v12:GetGold(v105);
                end;
                v111.GOLD = v112;
                v110.Stats = v111;
                v110.Equipped = table.find(v59._loadout, v12:CreateLoadoutString(v106, v107)) ~= nil;
                table.insert(l__unitsArray_1, v110);
                if v29:GetToggleState(script.Name) then
                    v59:GenerateUnitButton(v106, v107, 1);
                    l_v59_0 = l_v59_0 + 1;
                    if l_v59_0 % 25 == 0 then
                        l_RunService_0.RenderStepped:Wait();
                    end;
                end;
            end;
        end;
        if v59._filteredUnits then
            v59:SortUnits(v59._filteredUnits);
        else
            v59:SortUnits(v59._unitsArray);
        end;
        v59:UpdateButtonOrders();
    end);
    v31.UnitsRemoved:Connect(function(v113) --[[ Line: 707 ]]
        -- upvalues: v59 (copy), v12 (ref), v7 (ref), l_RunService_0 (ref)
        local l_v59_1 = v59;
        l_v59_1._totalUnits = l_v59_1._totalUnits - #v113;
        v59:_updateUnitCount();
        l_v59_1 = {};
        for _, v116 in v113 do
            local v117, v118 = v12:ParseLoadout(v116);
            if v118 then
                l_v59_1[v118] = true;
                if v59._units[v117] and v59._units[v117][v118] then
                    v59._units[v117][v118] = nil;
                end;
                if v59._selectedUnit and v59._selectedUnit.Info.UID == v118 then
                    v59:DeselectUnit();
                end;
            end;
        end;
        v59._unitsArray = v7.Filter(v59._unitsArray, function(v119) --[[ Line: 732 ]]
            -- upvalues: l_v59_1 (copy)
            return not l_v59_1[v119.UID];
        end);
        if v59._filteredUnits then
            v59._filteredUnits = v7.Filter(v59._filteredUnits, function(v120) --[[ Line: 741 ]]
                -- upvalues: l_v59_1 (copy)
                return not l_v59_1[v120.UID];
            end);
        end;
        for v121, v122 in v113 do
            local v123, v124 = v12:ParseLoadout(v122);
            if v59._unitButtons[v123] and v59._unitButtons[v123][v124] then
                v59._unitButtons[v123][v124]:Destroy();
                v59._unitButtons[v123][v124] = nil;
            end;
            if v121 % 25 == 0 then
                l_RunService_0.RenderStepped:Wait();
            end;
        end;
    end);
    v31.UnitDataUpdated:Connect(function(v125, v126, v127) --[[ Line: 762 ]]
        -- upvalues: v12 (ref), v59 (copy), v55 (ref), v7 (ref), v38 (ref)
        local v128, v129 = v12:ParseLoadout(v125);
        if not v59._units[v128] then
            v59._units[v128] = {};
        end;
        v59._units[v128][v129] = v126;
        local l_Mode_0 = v55:GetState().Mode;
        v59:UpdateUnitButton(v128, v129, l_Mode_0);
        if v59._selectedUnit then
            if v59._selectedUnit.Info.UID == v129 then
                v59._selectedUnit.Info.Data = v126;
            end;
            v59:UpdateSelectedUnit();
        end;
        local v133 = select(2, v7.Find(v59._unitsArray, function(v131) --[[ Line: 783 ]]
            -- upvalues: v128 (copy), v129 (copy)
            local v132 = false;
            if v131.Name == v128 then
                v132 = v131.UID == v129;
            end;
            return v132;
        end));
        if not v133 then
            return;
        else
            local v134 = v59._unitsArray[v133];
            v134.Data = v126;
            local l_v38_EquippedPets_2 = v38:GetEquippedPets();
            if v134.Stats.TYPE ~= "Resource" then
                v134.Stats.DMG = v12:GetTotalDamage(v126, nil, nil, l_v38_EquippedPets_2);
                v134.Stats.RNG = v12:GetRange(v126, nil, nil, nil, l_v38_EquippedPets_2);
                v134.Stats.SPA = v12:GetAttackCooldown(v126, nil, nil, nil, l_v38_EquippedPets_2);
            else
                v134.Stats.GOLD = v12:GetGold(v126);
            end;
            if v127 then
                return;
            else
                table.insert(v59.updatedUnitData, {
                    name = v128, 
                    uid = v129, 
                    data = v126
                });
                return;
            end;
        end;
    end);
    v25.Simple(1, function() --[[ Line: 817 ]]
        -- upvalues: v59 (copy)
        if #v59.updatedUnitData < 1 then
            return;
        else
            table.clear(v59.updatedUnitData);
            if v59._filteredUnits then
                v59:SortUnits(v59._filteredUnits);
            else
                v59:SortUnits(v59._unitsArray);
            end;
            v59:UpdateButtonOrders();
            return;
        end;
    end);
    v31.UnitEquipped:Connect(function(_, v137) --[[ Line: 833 ]]
        -- upvalues: v7 (ref), v59 (copy)
        local _, v140 = v7.Find(v59._unitsArray, function(v138) --[[ Line: 834 ]]
            -- upvalues: v137 (copy)
            return v138.UID == v137;
        end);
        if v140 then
            v59._unitsArray[v140].Equipped = true;
            v59:SortUnits(v59._unitsArray);
            v59:UpdateButtonOrders();
        end;
    end);
    v31.UnitUnequipped:Connect(function(_, v142) --[[ Line: 846 ]]
        -- upvalues: v7 (ref), v59 (copy)
        local _, v145 = v7.Find(v59._unitsArray, function(v143) --[[ Line: 847 ]]
            -- upvalues: v142 (copy)
            return v143.UID == v142;
        end);
        if v145 then
            v59._unitsArray[v145].Equipped = false;
            v59:SortUnits(v59._unitsArray);
            v59:UpdateButtonOrders();
        end;
    end);
    v31.UnitFavoriteToggled:Connect(function(_, v147, v148) --[[ Line: 859 ]]
        -- upvalues: v7 (ref), v59 (copy)
        local _, v151 = v7.Find(v59._unitsArray, function(v149) --[[ Line: 860 ]]
            -- upvalues: v147 (copy)
            return v149.UID == v147;
        end);
        if not v151 then
            return;
        else
            v59._unitsArray[v151].Data.Favorite = v148;
            v59:SortUnits(v59._unitsArray);
            v59:UpdateButtonOrders();
            return;
        end;
    end);
    v59:_connectFilterFrame();
    v59:_connectSearchBar();
    local v152 = TweenInfo.new(10, Enum.EasingStyle.Linear);
    local v153 = l_TweenService_0:Create(v59.unitInfoFrame.BG, v152, {
        Position = UDim2.fromScale(1, 1)
    });
    local v154 = l_TweenService_0:Create(v59.unitInfoFrame.BG, v152, {
        Position = UDim2.fromScale(0.5, 0.5)
    });
    v153.Completed:Connect(function() --[[ Line: 886 ]]
        -- upvalues: v154 (copy)
        v154:Play();
    end);
    v154.Completed:Connect(function() --[[ Line: 890 ]]
        -- upvalues: v153 (copy)
        v153:Play();
    end);
    v153:Play();
end;
v50.Opening = function(v155) --[[ Line: 897 ]] --[[ Name: Opening ]]
    -- upvalues: v45 (ref)
    v45:ToggleUnitReplacement(false);
    v155.filterFrame.Visible = false;
    v155.selectUnitPreview.Visible = true;
    v155.previewFrame.ExistingCount.Visible = false;
    v155.unitInfoFrame.Visible = false;
end;
v50.Opened = function(v156) --[[ Line: 906 ]] --[[ Name: Opened ]]
    v156:_loadUnits();
end;
v50.Closed = function(v157) --[[ Line: 910 ]] --[[ Name: Closed ]]
    -- upvalues: v55 (copy), v29 (ref), v26 (copy), v46 (copy), v47 (copy)
    if v55:GetState().Mode == "ExchangeSelection" then
        v29:Toggle("BemmyBuddy", true);
    end;
    if v157._stateData and v157._stateData.callback then
        v157._stateData.callback();
    end;
    v26:ToggleFrame(false);
    v157.highPriority = false;
    v157.ToggleAll = v46;
    v157.main.Position = v47;
    if v157.unitsDump then
        v157.unitsDump:Destroy();
    end;
    v157:DeselectUnit();
    v157._filterBackup = nil;
    v157:_clearFilter();
    v157._lastSearchTerm = nil;
    v157.searchBar.Text = "";
    if v157._filteredUnits then
        table.clear(v157._filteredUnits);
        v157._filteredUnits = nil;
    end;
    v29:Toggle("MessagePrompt", false);
    v157.filterFrame.Visible = false;
    v157:SetState("Normal");
    v157:HideHoverTooltip();
    v157.hoverCancelTag = nil;
end;
v50.SetFilter = function(v158, v159) --[[ Line: 956 ]] --[[ Name: SetFilter ]]
    if not v159 then
        v158._lastSearchTerm = nil;
    end;
    v158._filteredUnits = v159;
    v158:_loadUnits();
end;
v50.FilterUnits = function(v160, v161) --[[ Line: 965 ]] --[[ Name: FilterUnits ]]
    -- upvalues: v55 (copy), v7 (copy), v12 (copy)
    local l_Mode_1 = v55:GetState().Mode;
    local v174 = v7.Filter(v160._unitsArray, function(v163) --[[ Line: 982 ]]
        -- upvalues: v12 (ref), v161 (copy), l_Mode_1 (copy)
        local l_v12_UnitValue_2 = v12:GetUnitValue(v163.Name, "Type");
        if v161.Name and not string.find(string.lower(v163.Name), string.lower(v161.Name)) then
            return false;
        elseif v161.ExcludeResourceUnits and (l_v12_UnitValue_2 == "Resource" or v163.Data.Traitless or v163.Data.Temporary) then
            return false;
        elseif v161.ExcludeFavoriteUnits and v163.Data.Favorite then
            return false;
        elseif l_Mode_1 == "FeedSelection" and (v163.Data.Foodless or v163.Data.Temporary) then
            return false;
        else
            if v161.UnitType or v161.UnitVariant then
                local v165 = false;
                local v166 = v161.UnitType or v161.UnitVariant;
                for v167 in v166 do
                    if v167 == "ShinyWumbo" then
                        if v163.Data.Shiny and v163.Data.Mega then
                            v165 = true;
                            break;
                        end;
                    elseif v167 == "Basic" then
                        if v163.Data.Shiny or v163.Data.Mega then
                            return false;
                        else
                            v165 = true;
                            break;
                        end;
                    elseif v163.Data.Shiny and v163.Data.Mega then
                        return false;
                    elseif v163.Data[v167] then
                        v165 = true;
                        break;
                    end;
                end;
                if not v165 then
                    return false;
                end;
            end;
            if v161.AttackType then
                local v168 = false;
                for v169 in v161.AttackType do
                    if l_v12_UnitValue_2 == v169 then
                        v168 = true;
                        break;
                    end;
                end;
                if not v168 then
                    return false;
                end;
            end;
            if l_Mode_1 == "ExchangeSelection" and v163.Rarity ~= "Rare" then
                return false;
            elseif v161.UnitRarity and next(v161.UnitRarity) ~= nil and not v161.UnitRarity[v163.Rarity] then
                return false;
            else
                if v161.UnitTraitExclusions and next(v161.UnitTraitExclusions) ~= nil then
                    local v170 = false;
                    for v171 in v161.UnitTraitExclusions do
                        if v163.Data.Trait and v163.Data.Trait.Name == v171 then
                            v170 = true;
                            break;
                        elseif v163.Data.Trait2 and v163.Data.Trait2.Name == v171 then
                            v170 = true;
                            break;
                        end;
                    end;
                    if v170 then
                        return false;
                    end;
                end;
                if v161.UnitTraits and next(v161.UnitTraits) ~= nil then
                    local v172 = false;
                    for v173 in v161.UnitTraits do
                        if v163.Data.Trait and v163.Data.Trait.Name == v173 then
                            v172 = true;
                            break;
                        elseif v163.Data.Trait2 and v163.Data.Trait2.Name == v173 then
                            v172 = true;
                            break;
                        end;
                    end;
                    if not v172 then
                        return false;
                    end;
                end;
                if v161.ExcludeNeptunesCrown and v163.Data.Trait ~= nil and v163.Data.Trait2 ~= nil then
                    return false;
                elseif v161.ExcludeShinyWumbo and v163.Data.Shiny and v163.Data.Mega then
                    return false;
                else
                    return true;
                end;
            end;
        end;
    end);
    if v161.Stat then
        table.sort(v174, function(v175, v176) --[[ Line: 1121 ]]
            -- upvalues: v161 (copy)
            return v175.Stats[v161.Stat] > v176.Stats[v161.Stat];
        end);
    end;
    v160:SetFilter(v174);
end;
v50.GenerateUnitButton = function(v177, v178, v179, v180, v181) --[[ Line: 1129 ]] --[[ Name: GenerateUnitButton ]]
    -- upvalues: v12 (copy), v29 (ref), v20 (copy), v22 (copy), v16 (copy), v23 (copy), v34 (ref), l_GuiService_0 (copy)
    if v177._unitButtons[v178] and v177._unitButtons[v178][v179] then
        return;
    else
        local v182 = v177.unitTemplate:Clone();
        v182.Name = v12:CreateLoadoutString(v178, v179);
        v182.Parent = v177.unitsBin;
        local _, v184 = v12:GetRarity(v178);
        if not v177._unitButtons[v178] then
            v177._unitButtons[v178] = {};
        end;
        v177._unitButtons[v178][v179] = v182;
        v177:UpdateUnitButton(v178, v179, v181);
        local function _() --[[ Line: 1149 ]] --[[ Name: getUnitInfo ]]
            -- upvalues: v178 (copy), v179 (copy), v177 (copy), v12 (ref)
            return {
                Name = v178, 
                UID = v179, 
                Data = v177._units[v178][v179], 
                UnitType = v12:GetUnitValue(v178, "Type")
            };
        end;
        local v186 = v29:HandleButton(v182, function() --[[ Line: 1158 ]]
            -- upvalues: v177 (copy), v182 (copy), v178 (copy), v179 (copy), v12 (ref)
            v177:ProcessUnitClicked(v182, {
                Name = v178, 
                UID = v179, 
                Data = v177._units[v178][v179], 
                UnitType = v12:GetUnitValue(v178, "Type")
            });
        end, {
            MouseEnter = function() --[[ Line: 1161 ]] --[[ Name: MouseEnter ]]
                -- upvalues: v177 (copy), v182 (copy), v178 (copy), v179 (copy), v12 (ref)
                v177:ShowHoverTooltip(v182, {
                    Name = v178, 
                    UID = v179, 
                    Data = v177._units[v178][v179], 
                    UnitType = v12:GetUnitValue(v178, "Type")
                });
            end, 
            MouseLeave = function() --[[ Line: 1165 ]] --[[ Name: MouseLeave ]]
                -- upvalues: v177 (copy), v182 (copy), v178 (copy), v179 (copy), v12 (ref)
                v177:HideHoverTooltip(v182, {
                    Name = v178, 
                    UID = v179, 
                    Data = v177._units[v178][v179], 
                    UnitType = v12:GetUnitValue(v178, "Type")
                });
            end
        });
        local v187 = v177._units[v178][v179];
        v182.Content.Info.Shiny.Visible = v187.Shiny or false;
        v182.Content.Info.Wumbo.Visible = v187.Mega or false;
        local l_ImageLabel_0 = v182.Content.Info.Traits.Trait:FindFirstChildOfClass("ImageLabel");
        if l_ImageLabel_0 then
            l_ImageLabel_0:Destroy();
        end;
        local l_ImageLabel_1 = v182.Content.Info.Traits.Trait2:FindFirstChildOfClass("ImageLabel");
        if l_ImageLabel_1 then
            l_ImageLabel_1:Destroy();
        end;
        v182.Content.Info.Traits.Trait.Visible = v187.Trait ~= nil;
        v182.Content.Info.Traits.Trait2.Visible = v187.Trait2 ~= nil;
        local l_Traits_0 = v182.Content.Info.Traits;
        local v191 = true;
        if v187.Trait == nil then
            v191 = v187.Trait2 ~= nil;
        end;
        l_Traits_0.Visible = v191;
        if v187.Trait ~= nil then
            v20:CreateTraitIcon(v187.Trait.Name, v182.Content.Info.Traits.Trait);
        end;
        if v187.Trait2 ~= nil then
            v20:CreateTraitIcon(v187.Trait2.Name, v182.Content.Info.Traits.Trait2);
        end;
        v182:SetAttribute("Trait", v187.Trait and v187.Trait.Name);
        v182:SetAttribute("Trait2", v187.Trait2 and v187.Trait2.Name);
        v182.Content.Info.Relic.Visible = v187.Relic ~= nil;
        if v187.Relic then
            v22:CreateRelicIcon(v182.Content.Info.Relic, v187.Relic);
        end;
        v182.Content.Info.Favorite.Visible = v187.Favorite or false;
        v182.Content.Info.Stars.Visible = v187.Stars > 0;
        v182.LayoutOrder = v177:_getLayoutOrder(v187, v179, v180);
        if v187.Stars > 0 then
            v182.Content.Info.Stars.Main.Amount.Text = v187.Stars;
            for v192 = 2, 5 do
                v182.Content.Info.Stars[tostring(v192)].Visible = v192 <= v187.Stars;
            end;
        end;
        v186:Add(v16.new(v182.Content.Info.Backdrop, v184));
        v186:Add(v16.new(v182.Content.Glow, v184));
        l_Traits_0 = v23:CreateImage(v178, {
            Size = UDim2.fromScale(1, 1), 
            Parent = v182.Content.Info, 
            ZIndex = 2
        });
        if l_Traits_0 then
            v186:Add(l_Traits_0);
        end;
        if v180 == 1 and v34:GetDeviceType() == "Console" then
            l_GuiService_0.SelectedObject = v182;
        end;
        return;
    end;
end;
v50.UpdateUnitButton = function(v193, v194, v195, v196) --[[ Line: 1234 ]] --[[ Name: UpdateUnitButton ]]
    -- upvalues: v48 (copy), v12 (copy), v20 (copy), v22 (copy)
    local v197 = v193._unitButtons[v194] and v193._unitButtons[v194][v195];
    if not v197 then
        return;
    elseif not v193._units[v194] then
        warn("[UpdateUnitButton]: missing from data main unit name");
        return;
    else
        local v198 = v193._units[v194][v195];
        if not v198 then
            warn("[UpdateUnitButton]: missing from data unit uid");
            return;
        else
            if v196 ~= "Sell" then
                v197.Content.ForSale.Visible = false;
            end;
            v197.Content.Info.Shiny.Visible = v198.Shiny or false;
            v197.Content.Info.Wumbo.Visible = v198.Mega or false;
            v197.Content.Trading.Visible = v193._tradingUnits[v195];
            v197.Content.Equipped.Visible = v193:_isEquipped(v194, v195);
            v197.Content.Info.Cost.Visible = not v48[v196];
            v197.Content.Info.Cost.Amount.Text = v12:GetUnitValue(v194, "Cost");
            v197.Content.Info.UnitName.Text = v12:GetUnitValue(v194, "FullName") or v194;
            v197.Content.Info.Level.RichText = true;
            v197.Content.Info.Level.Text = ("LVL <font color=\"#FFFF00\">%*</font>"):format(v198.Level or 1);
            local l_v197_Attribute_0 = v197:GetAttribute("Trait");
            local l_v197_Attribute_1 = v197:GetAttribute("Trait2");
            local v201 = false;
            if v198.Trait and v198.Trait.Name ~= l_v197_Attribute_0 then
                v201 = true;
                v197.Content.Info.Traits.Trait.Visible = v198.Trait ~= nil;
                v197:SetAttribute("Trait", v198.Trait and v198.Trait.Name);
                local l_ImageLabel_2 = v197.Content.Info.Traits.Trait:FindFirstChildOfClass("ImageLabel");
                if l_ImageLabel_2 then
                    l_ImageLabel_2:Destroy();
                end;
                if v198.Trait ~= nil then
                    v20:CreateTraitIcon(v198.Trait.Name, v197.Content.Info.Traits.Trait);
                end;
            end;
            if v198.Trait2 and v198.Trait2.Name ~= l_v197_Attribute_1 then
                v201 = true;
                v197.Content.Info.Traits.Trait2.Visible = v198.Trait2 ~= nil;
                v197:SetAttribute("Trait2", v198.Trait2 and v198.Trait2.Name);
                local l_ImageLabel_3 = v197.Content.Info.Traits.Trait2:FindFirstChildOfClass("ImageLabel");
                if l_ImageLabel_3 then
                    l_ImageLabel_3:Destroy();
                end;
                if v198.Trait2 ~= nil then
                    v20:CreateTraitIcon(v198.Trait2.Name, v197.Content.Info.Traits.Trait2);
                end;
            end;
            if v201 then
                local l_Traits_1 = v197.Content.Info.Traits;
                local v205 = true;
                if v198.Trait == nil then
                    v205 = v198.Trait2 ~= nil;
                end;
                l_Traits_1.Visible = v205;
            end;
            v197.Content.Info.Relic.Visible = v198.Relic ~= nil;
            if v198.Relic then
                v22:CreateRelicIcon(v197.Content.Info.Relic, v198.Relic);
            end;
            v197.Visible = true;
            return;
        end;
    end;
end;
v50.UpdateButtonOrders = function(v206) --[[ Line: 1313 ]] --[[ Name: UpdateButtonOrders ]]
    for v207, v208 in v206._unitsArray do
        local l_Name_1 = v208.Name;
        local l_UID_1 = v208.UID;
        local v211 = v206._unitButtons[l_Name_1] and v206._unitButtons[l_Name_1][l_UID_1];
        if v211 then
            local v212 = v206:_isEquipped(l_Name_1, l_UID_1);
            v211.Content.Equipped.Visible = v212;
            v211.Content.Info.Favorite.Visible = v208.Data and v208.Data.Favorite or false;
            v211.LayoutOrder = v206:_getLayoutOrder(v208.Data, l_UID_1, v207);
        end;
    end;
end;
v50.ProcessUnitClicked = function(v213, ...) --[[ Line: 1332 ]] --[[ Name: ProcessUnitClicked ]]
    -- upvalues: v55 (copy)
    if v55:GetState().Mode == "Sell" then
        v213:ToggleForSale(...);
        return;
    else
        v213:SelectUnit(...);
        return;
    end;
end;
v50.ShowHoverTooltip = function(v214, v215, v216) --[[ Line: 1345 ]] --[[ Name: ShowHoverTooltip ]]
    -- upvalues: v12 (copy), v6 (copy), v16 (copy), v35 (ref), v36 (ref), v38 (ref), v22 (copy)
    if v214.hoverCancelTag then
        return;
    elseif v214._hoveringInfo and v214._hoveringInfo.UID == v216.UID then
        return;
    else
        v214._hoveringInfo = v216;
        local v217 = v216.Data.Level or 1;
        local v218 = select(2, v12:GetRarity(v216.Name));
        if v214._hoverDump then
            v214._hoverDump:Destroy();
            v214._hoverDump = nil;
        end;
        v214._hoverDump = v6.new();
        v214._hoverDump:Add(v16.new(v214.hoverTooltip, v218));
        v214._hoverDump:Add(v16.new(v214.hoverTooltip.Content.UIStroke, v218));
        v214._hoverDump:Add(v16.new(v214.hoverTooltip.Content.Characteristics.UnitTags.Rarity, v218));
        v214.hoverTooltip.Content.ExistingCount.Visible = false;
        v214._hoverDump:Add(v35:ApplyCountToLabel(v216.Name, v216.Data, v214.hoverTooltip.Content.ExistingCount, "%s Exist", false):andThen(function(v219, v220) --[[ Line: 1379 ]]
            -- upvalues: v214 (copy)
            if not v219 then
                return;
            else
                v214.hoverTooltip.Content.ExistingCount.Visible = true;
                v214._hoverDump:Add(v220);
                return;
            end;
        end));
        v214.hoverTooltip.Content.Serial.Visible = false;
        v214._hoverDump:Add(v36:ApplyMintToLabel(v216.Name, v216.UID, v216.Data, v214.hoverTooltip.Content.Serial, "#%s"):andThen(function(v221, v222) --[[ Line: 1398 ]]
            -- upvalues: v214 (copy)
            if not v221 then
                return;
            else
                v214.hoverTooltip.Content.Serial.Visible = true;
                v214._hoverDump:Add(v222);
                return;
            end;
        end));
        v214.hoverTooltip.Content.UnitName.UnitName.Text = v12:GetUnitValue(v216.Name, "FullName");
        v214.hoverTooltip.Content.Characteristics.UnitTags.Rarity.Text = v218;
        v214.hoverTooltip.Content.Characteristics.UnitTags.ShinyStatus.Visible = v216.Data.Shiny or false;
        v214.hoverTooltip.Content.Characteristics.UnitTags.WumboStatus.Visible = v216.Data.Mega or false;
        v214.hoverTooltip.Content.Level.Level.RichText = true;
        v214.hoverTooltip.Content.Level.Level.Text = ("Level <font color=\"#FFFF00\">%*</font>"):format(v217);
        local l_v12_NextLevelCost_0 = v12:GetNextLevelCost(v216.Data);
        if v12:GetMaxLevel(v216.Data) <= v217 then
            v214.hoverTooltip.Content.Level.XPBar.Fill.Size = UDim2.fromScale(1, 1);
            v214.hoverTooltip.Content.Level.XPBar.Progression.Text = "(MAX)";
        else
            v214.hoverTooltip.Content.Level.XPBar.Fill.Size = UDim2.fromScale(math.clamp(v216.Data.Experience / l_v12_NextLevelCost_0, 0, 1), 1);
            v214.hoverTooltip.Content.Level.XPBar.Progression.Text = ("%*/%*"):format(math.round(v216.Data.Experience), l_v12_NextLevelCost_0);
        end;
        v214.hoverTooltip.Content.Characteristics.Stats.Values.DMG.Visible = v216.UnitType ~= "Resource";
        v214.hoverTooltip.Content.Characteristics.Stats.Values.RNG.Visible = v216.UnitType ~= "Resource";
        v214.hoverTooltip.Content.Characteristics.Stats.Values.SPA.Visible = v216.UnitType ~= "Resource";
        v214.hoverTooltip.Content.Characteristics.Stats.Values.GOLD.Visible = v216.UnitType == "Resource";
        if v216.UnitType == "Resource" then
            v214.hoverTooltip.Content.Characteristics.Stats.Values.GOLD.StatAmount.Text = v12:GetGold(v216.Data);
        else
            local l_v38_EquippedPets_3 = v38:GetEquippedPets();
            v214.hoverTooltip.Content.Characteristics.Stats.Values.DMG.StatAmount.Text = v12:GetTotalDamage(v216.Data, nil, nil, l_v38_EquippedPets_3);
            v214.hoverTooltip.Content.Characteristics.Stats.Values.RNG.StatAmount.Text = v12:GetRange(v216.Data, nil, nil, nil, l_v38_EquippedPets_3);
            v214.hoverTooltip.Content.Characteristics.Stats.Values.SPA.StatAmount.Text = v12:GetAttackCooldown(v216.Data, nil, nil, nil, l_v38_EquippedPets_3);
        end;
        v214.hoverTooltip.Content.Level.Unsorted.Stars.Visible = v216.Data.Stars > 0;
        if v216.Data.Stars > 0 then
            v214.hoverTooltip.Content.Level.Unsorted.Stars.Main.Amount.Text = v216.Data.Stars;
            for v225 = 2, 5 do
                v214.hoverTooltip.Content.Level.Unsorted.Stars[tostring(v225)].Visible = v225 <= v216.Data.Stars;
            end;
        end;
        v214.hoverTooltip.Content.UnitName.AttackType.Icon.Image = v22:GetAttackTypeIcon(v216.UnitType);
        local l_v12_PrimaryEffect_0 = v12:GetPrimaryEffect(v216.Name);
        v214.hoverTooltip.Content.UnitName.AttackType.EffectType.Visible = l_v12_PrimaryEffect_0 ~= nil;
        if l_v12_PrimaryEffect_0 then
            v214.hoverTooltip.Content.UnitName.AttackType.EffectType.Icon.Image = v22:GetEffectIcon(l_v12_PrimaryEffect_0);
            v214.hoverTooltip.Content.UnitName.AttackType.EffectType.UIGradient.Color = v22:GetEffectColor(l_v12_PrimaryEffect_0);
        end;
        v214.hoverTooltip.Visible = true;
        v214:AlignTooltip(v215, v214.hoverTooltip);
        return;
    end;
end;
v50.HideHoverTooltip = function(v227, v228, v229) --[[ Line: 1470 ]] --[[ Name: HideHoverTooltip ]]
    if not v228 or not v229 then
        v227._hoveringInfo = nil;
        v227.hoverTooltip.Visible = false;
        return;
    elseif v227._hoveringInfo and v227._hoveringInfo.UID ~= v229.UID then
        return;
    else
        if v227._hoverDump then
            v227._hoverDump:Destroy();
            v227._hoverDump = nil;
        end;
        v227._hoveringInfo = nil;
        v227.hoverTooltip.Visible = false;
        return;
    end;
end;
v50.AlignTooltip = function(_, v231, v232) --[[ Line: 1492 ]] --[[ Name: AlignTooltip ]]
    local l_AbsolutePosition_0 = v232.Parent.AbsolutePosition;
    local l_AbsolutePosition_1 = v231.AbsolutePosition;
    local l_AbsoluteSize_0 = v231.AbsoluteSize;
    local l_Offset_0 = v231.Parent.UIPadding.PaddingLeft.Offset;
    local v237 = l_AbsolutePosition_1.X - l_AbsolutePosition_0.X - l_Offset_0 + l_AbsoluteSize_0.X;
    local v238 = l_AbsolutePosition_1.Y - l_AbsolutePosition_0.Y - l_AbsoluteSize_0.Y * 0.25;
    v232.Position = UDim2.new(0, v237, 0, v238);
end;
v50.ToggleForSale = function(v239, v240, v241) --[[ Line: 1506 ]] --[[ Name: ToggleForSale ]]
    -- upvalues: v43 (ref), v12 (copy), v14 (copy), v7 (copy), v22 (copy)
    if v241 and v241.Data and (v241.Data.Favorite or v241.Data.Priceless or v241.Data.Temporary) then
        v43:Notify({
            message = "You cannot sell this unit", 
            duration = 3, 
            isPositive = false
        });
        return;
    else
        local l_v12_LoadoutString_1 = v12:CreateLoadoutString(v241.Name, v241.UID);
        local v243 = select(2, v12:GetRarity(v241.Name, true));
        local v244 = v14.UNIT_SELL_PRICES[v243];
        if v239._uidsForSale[l_v12_LoadoutString_1] then
            v239._uidsForSale[l_v12_LoadoutString_1] = nil;
            v239._totalSalePrice = math.max(v239._totalSalePrice - v244, 0);
        else
            v239._uidsForSale[l_v12_LoadoutString_1] = true;
            v239._totalSalePrice = v239._totalSalePrice + v244;
        end;
        v240.Content.ForSale.Visible = v239._uidsForSale[l_v12_LoadoutString_1] or false;
        v239.bottomBar.Sell.ConfirmSell.Content.Title.Text = ("Sell (x%*)"):format(#v7.Keys(v239._uidsForSale));
        v239.bottomBar.Sell.ConfirmSell.Content.Currency.Amount.Text = ("+%*"):format((v22:SuffixNumber(v239._totalSalePrice)));
        return;
    end;
end;
v50.SelectUnit = function(v245, v246, v247) --[[ Line: 1537 ]] --[[ Name: SelectUnit ]]
    -- upvalues: v6 (copy), v12 (copy), v13 (copy), v22 (copy), v24 (copy), v16 (copy), v35 (ref), v38 (ref), v20 (copy)
    if v245._selectedUnit and v245._selectedUnit.Info.UID == v247.UID then
        v245:DeselectUnit();
        return;
    elseif not v246 or not v247 then
        return;
    else
        v245:DeselectUnit();
        v245._selectionDump = v6.new();
        v245._selectedUnit = {
            Button = v246, 
            Info = v247
        };
        v245._selectionDump:Add(function() --[[ Line: 1557 ]]
            -- upvalues: v245 (copy)
            v245.unitInfoFrame.Content.UnitTags.Rarity:RemoveTag("VisualizeRarity");
            v245.unitInfoFrame.Content.UnitTags.Rarity:SetAttribute("Rarity");
            table.clear(v245._selectedUnit);
            v245._selectedUnit = nil;
            v245._selectionDump = nil;
        end);
        local l_Name_2 = v247.Name;
        local _ = v247.UID;
        local l_Data_0 = v247.Data;
        local v251 = l_Data_0 and l_Data_0.Mega or false;
        local v252 = l_Data_0 and l_Data_0.Shiny or false;
        local v253 = l_Data_0.Level or 1;
        local v254 = l_Data_0.Experience or 0;
        local l_v12_NextLevelCost_1 = v12:GetNextLevelCost(l_Data_0);
        local v256 = select(2, v12:GetRarity(l_Name_2));
        v245._selectionDump:Construct(v13, v245.unitInfoFrame, l_Name_2, false, false, {
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            positionAttribute = "PreviewOffset"
        });
        v245.unitInfoFrame.Content.UnitName.UnitName.Text = v12:GetUnitValue(l_Name_2, "FullName") or l_Name_2;
        v245.unitInfoFrame.Content.UnitName.AttackType.Icon.Image = v22:GetAttackTypeIcon(v247.UnitType);
        local l_v12_PrimaryEffect_1 = v12:GetPrimaryEffect(l_Name_2);
        v245.unitInfoFrame.Content.UnitName.AttackType.EffectType.Visible = l_v12_PrimaryEffect_1 ~= nil;
        if l_v12_PrimaryEffect_1 then
            v245.unitInfoFrame.Content.UnitName.AttackType.EffectType.Icon.Image = v22:GetEffectIcon(l_v12_PrimaryEffect_1);
            v245.unitInfoFrame.Content.UnitName.AttackType.EffectType.UIGradient.Color = v22:GetEffectColor(l_v12_PrimaryEffect_1);
        end;
        v245._selectionDump:Add(v24.new(v245.unitInfoFrame.Content.UnitName.AttackType, {
            IsUnitType = true, 
            Name = l_Name_2
        }));
        if v247.Data.Trait and v247.Data.Trait.Name then
            v245._selectionDump:Add(v24.new(v245.unitInfoFrame.Content.Unsorted.Traits.Trait, {
                IsTraitDisplay = true, 
                Trait = v247.Data.Trait.Name, 
                TraitTier = v247.Data.Trait.Tier, 
                Name = ""
            }), "Trait1Tooltip");
        end;
        if v247.Data.Trait2 and v247.Data.Trait2.Name then
            v245._selectionDump:Add(v24.new(v245.unitInfoFrame.Content.Unsorted.Traits.Trait2, {
                IsTraitDisplay = true, 
                Trait = v247.Data.Trait2.Name, 
                TraitTier = v247.Data.Trait2.Tier, 
                Name = ""
            }), "Trait2Tooltip");
        end;
        if v247.Data.Relic then
            v245._selectionDump:Add(v24.new(v245.unitInfoFrame.Content.Unsorted.Relic, {
                IsRelicDisplay = true, 
                Relic = v247.Data.Relic, 
                Name = ""
            }), "RelicTooltip");
        end;
        local l_v12_MaxLevel_0 = v12:GetMaxLevel(v247.Data);
        v245.unitInfoFrame.Content.Level.Level.Text = ("LVL %*"):format((math.clamp(v253, 1, l_v12_MaxLevel_0)));
        if l_v12_MaxLevel_0 <= v253 then
            v245.unitInfoFrame.Content.Level.XPBar.Fill.Size = UDim2.fromScale(1, 1);
            v245.unitInfoFrame.Content.Level.XPBar.Progression.Text = "(MAX)";
        else
            v245.unitInfoFrame.Content.Level.XPBar.Fill.Size = UDim2.fromScale(math.clamp(v254 / l_v12_NextLevelCost_1, 0, 1), 1);
            v245.unitInfoFrame.Content.Level.XPBar.Progression.Text = ("%*/%*"):format(math.round(v254), l_v12_NextLevelCost_1);
        end;
        v245.unitInfoFrame.Content.UnitTags.ShinyStatus.Visible = v252;
        v245.unitInfoFrame.Content.UnitTags.WumboStatus.Visible = v251;
        v245.unitInfoFrame.Content.UnitTags.Rarity.Text = v256;
        v245.unitInfoFrame.Content.UnitTags.Rarity:SetAttribute("Rarity", v256);
        v245.unitInfoFrame.Content.UnitTags.Rarity:AddTag("VisualizeRarity");
        v245._selectionDump:Add(v16.new(v245.unitInfoFrame.BG, v256));
        v245._selectionDump:Add(v16.new(v245.previewFrame.UIStroke, v256));
        v245.unitInfoFrame.Content.Stats.Values.DMG.Visible = v247.UnitType ~= "Resource";
        v245.unitInfoFrame.Content.Stats.Values.RNG.Visible = v247.UnitType ~= "Resource";
        v245.unitInfoFrame.Content.Stats.Values.SPA.Visible = v247.UnitType ~= "Resource";
        v245.unitInfoFrame.Content.Stats.Values.GOLD.Visible = v247.UnitType == "Resource";
        v245.previewFrame.ExistingCount.Visible = false;
        v245._selectionDump:Add(v35:ApplyCountToLabel(l_Data_0.Name, l_Data_0, v245.previewFrame.ExistingCount.Amount, "%s Exist", false):andThen(function(v259, v260) --[[ Line: 1673 ]]
            -- upvalues: v245 (copy)
            if not v259 then
                return;
            else
                v245.previewFrame.ExistingCount.Visible = true;
                v245._selectionDump:Add(v260);
                return;
            end;
        end));
        v245:_updateSelectedMintCount();
        if v247.UnitType == "Resource" then
            v245.unitInfoFrame.Content.Stats.Values.GOLD.StatAmount.Text = v12:GetGold(l_Data_0) or 0;
        else
            local l_v38_EquippedPets_4 = v38:GetEquippedPets();
            local l_v12_TotalDamage_0 = v12:GetTotalDamage(l_Data_0, nil, nil, l_v38_EquippedPets_4);
            local l_v12_Range_0 = v12:GetRange(l_Data_0, nil, nil, nil, l_v38_EquippedPets_4);
            local l_v12_AttackCooldown_0 = v12:GetAttackCooldown(l_Data_0, nil, nil, nil, l_v38_EquippedPets_4);
            v245.unitInfoFrame.Content.Stats.Values.DMG.StatAmount.Text = l_v12_TotalDamage_0;
            v245.unitInfoFrame.Content.Stats.Values.RNG.StatAmount.Text = l_v12_Range_0;
            v245.unitInfoFrame.Content.Stats.Values.SPA.StatAmount.Text = l_v12_AttackCooldown_0;
        end;
        local l_ImageLabel_4 = v245.unitInfoFrame.Content.Unsorted.Traits.Trait:FindFirstChildOfClass("ImageLabel");
        local l_ImageLabel_5 = v245.unitInfoFrame.Content.Unsorted.Traits.Trait2:FindFirstChildOfClass("ImageLabel");
        if l_ImageLabel_4 then
            l_ImageLabel_4:Destroy();
        end;
        if l_ImageLabel_5 then
            l_ImageLabel_5:Destroy();
        end;
        v245.unitInfoFrame.Content.Unsorted.Traits.Trait.Visible = l_Data_0 and l_Data_0.Trait ~= nil;
        v245.unitInfoFrame.Content.Unsorted.Traits.Trait2.Visible = l_Data_0 and l_Data_0.Trait2 ~= nil;
        v245.unitInfoFrame.Content.Unsorted.Traits.Trait.NeptunesCrown.Visible = l_Data_0 and l_Data_0.Trait2 ~= nil;
        v245.unitInfoFrame.Content.Unsorted.Traits.Visible = l_Data_0 and (l_Data_0.Trait ~= nil or l_Data_0.Trait2 ~= nil);
        if l_Data_0 and l_Data_0.Trait ~= nil then
            v20:CreateTraitIcon(l_Data_0.Trait.Name, v245.unitInfoFrame.Content.Unsorted.Traits.Trait);
        end;
        if l_Data_0 and l_Data_0.Trait2 ~= nil then
            v20:CreateTraitIcon(l_Data_0.Trait2.Name, v245.unitInfoFrame.Content.Unsorted.Traits.Trait2);
        end;
        local l_Relic_0 = v245.unitInfoFrame.Content.Unsorted.Relic;
        local v268 = false;
        if l_Data_0 ~= nil then
            v268 = l_Data_0.Relic ~= nil;
        end;
        l_Relic_0.Visible = v268;
        if l_Data_0 and l_Data_0.Relic then
            v22:CreateRelicIcon(v245.unitInfoFrame.Content.Unsorted.Relic, l_Data_0.Relic);
        end;
        v245.starsContainer.Visible = l_Data_0.Stars > 0;
        if l_Data_0.Stars > 0 then
            v245.starsContainer.Main.Amount.Text = l_Data_0.Stars;
            for v269 = 2, 5 do
                v245.starsContainer:FindFirstChild(v269).Visible = v269 <= l_Data_0.Stars;
            end;
        end;
        v245.selectUnitPreview.Visible = false;
        v245.unitInfoFrame.Visible = true;
        v245:UpdateSelectedUnit(true);
        v245.unitInfoFrame.Content.Options.Feed.Visible = not l_Data_0.Foodless and not l_Data_0.Temporary;
        return;
    end;
end;
v50.DeselectUnit = function(v270) --[[ Line: 1744 ]] --[[ Name: DeselectUnit ]]
    if not v270._selectedUnit then
        return;
    else
        if v270._selectionDump then
            v270._selectionDump:Destroy();
        end;
        v270.selectUnitPreview.Visible = true;
        v270.previewFrame.ExistingCount.Visible = false;
        v270.unitInfoFrame.Visible = false;
        return;
    end;
end;
v50.UpdateSelectedUnit = function(v271, v272) --[[ Line: 1758 ]] --[[ Name: UpdateSelectedUnit ]]
    -- upvalues: v55 (copy), v48 (copy), v49 (copy), v20 (copy), v24 (copy), v22 (copy), v12 (copy), v38 (ref), v34 (ref), l_GuiService_0 (copy)
    if not v271._selectedUnit then
        return;
    else
        local l_Info_0 = v271._selectedUnit.Info;
        local l_Data_1 = l_Info_0.Data;
        local v275 = v48[v55:GetState().Mode] == true;
        for _, v277 in v271.unitInfoFrame.Content.Options:GetChildren() do
            if v277:IsA("GuiButton") then
                if v275 then
                    v277.Visible = v49[v277.Name] or false;
                else
                    v277.Visible = v277.Name ~= "Select";
                end;
            end;
        end;
        local v278 = v271:_isEquipped(l_Info_0.Name, l_Info_0.UID);
        v271.unitInfoFrame.Content.Options.Equip.Content.Title.Text = v278 and "Unequip" or "Equip";
        local v279 = l_Data_1 and l_Data_1.Mega or false;
        local v280 = l_Data_1 and l_Data_1.Shiny or false;
        v271.unitInfoFrame.Content.UnitTags.ShinyStatus.Visible = v280;
        v271.unitInfoFrame.Content.UnitTags.WumboStatus.Visible = v279;
        if not v272 then
            local l_ImageLabel_6 = v271.unitInfoFrame.Content.Unsorted.Traits.Trait:FindFirstChildOfClass("ImageLabel");
            local l_ImageLabel_7 = v271.unitInfoFrame.Content.Unsorted.Traits.Trait2:FindFirstChildOfClass("ImageLabel");
            if l_ImageLabel_6 then
                l_ImageLabel_6:Destroy();
            end;
            if l_ImageLabel_7 then
                l_ImageLabel_7:Destroy();
            end;
            v271.unitInfoFrame.Content.Unsorted.Traits.Trait.Visible = l_Data_1 and l_Data_1.Trait ~= nil;
            v271.unitInfoFrame.Content.Unsorted.Traits.Trait2.Visible = l_Data_1 and l_Data_1.Trait2 ~= nil;
            v271.unitInfoFrame.Content.Unsorted.Traits.Trait.NeptunesCrown.Visible = l_Data_1 and l_Data_1.Trait2 ~= nil;
            v271.unitInfoFrame.Content.Unsorted.Traits.Visible = l_Data_1 and (l_Data_1.Trait ~= nil or l_Data_1.Trait2 ~= nil);
            if l_Data_1 and l_Data_1.Trait ~= nil then
                v20:CreateTraitIcon(l_Data_1.Trait.Name, v271.unitInfoFrame.Content.Unsorted.Traits.Trait);
            end;
            if l_Data_1 and l_Data_1.Trait2 ~= nil then
                v20:CreateTraitIcon(l_Data_1.Trait2.Name, v271.unitInfoFrame.Content.Unsorted.Traits.Trait2);
            end;
            if l_Data_1.Trait and l_Data_1.Trait.Name then
                if v271._selectionDump:Get("Trait1Tooltip") then
                    v271._selectionDump:Remove("Trait1Tooltip");
                end;
                v271._selectionDump:Add(v24.new(v271.unitInfoFrame.Content.Unsorted.Traits.Trait, {
                    IsTraitDisplay = true, 
                    Trait = l_Data_1.Trait.Name, 
                    TraitTier = l_Data_1.Trait.Tier, 
                    Name = ""
                }), "Trait1Tooltip");
            end;
            if l_Data_1.Trait2 and l_Data_1.Trait2.Name then
                if v271._selectionDump:Get("Trait2Tooltip") then
                    v271._selectionDump:Remove("Trait2Tooltip");
                end;
                v271._selectionDump:Add(v24.new(v271.unitInfoFrame.Content.Unsorted.Traits.Trait2, {
                    IsTraitDisplay = true, 
                    Trait = l_Data_1.Trait2.Name, 
                    TraitTier = l_Data_1.Trait2.Tier, 
                    Name = ""
                }), "Trait2Tooltip");
            end;
            local l_Relic_1 = v271.unitInfoFrame.Content.Unsorted.Relic;
            local v284 = false;
            if l_Data_1 ~= nil then
                v284 = l_Data_1.Relic ~= nil;
            end;
            l_Relic_1.Visible = v284;
            if l_Data_1 and l_Data_1.Relic then
                v22:CreateRelicIcon(v271.unitInfoFrame.Content.Unsorted.Relic, l_Data_1.Relic);
                if v271._selectionDump:Get("RelicTooltip") then
                    v271._selectionDump:Remove("RelicTooltip");
                end;
                v271._selectionDump:Add(v24.new(v271.unitInfoFrame.Content.Unsorted.Relic, {
                    IsRelicDisplay = true, 
                    Relic = l_Data_1.Relic, 
                    Name = ""
                }), "RelicTooltip");
            end;
            if l_Info_0.UnitType == "Resource" then
                v271.unitInfoFrame.Content.Stats.Values.GOLD.StatAmount.Text = v12:GetGold(l_Data_1) or 0;
            else
                l_Relic_1 = v38:GetEquippedPets();
                v284 = v12:GetTotalDamage(l_Data_1, nil, nil, l_Relic_1);
                local l_v12_Range_1 = v12:GetRange(l_Data_1, nil, nil, nil, l_Relic_1);
                local l_v12_AttackCooldown_1 = v12:GetAttackCooldown(l_Data_1, nil, nil, nil, l_Relic_1);
                v271.unitInfoFrame.Content.Stats.Values.DMG.StatAmount.Text = v284;
                v271.unitInfoFrame.Content.Stats.Values.RNG.StatAmount.Text = l_v12_Range_1;
                v271.unitInfoFrame.Content.Stats.Values.SPA.StatAmount.Text = l_v12_AttackCooldown_1;
            end;
            v271:_updateSelectedMintCount();
        end;
        if v34:IsConsole() then
            if v275 then
                l_GuiService_0.SelectedObject = v271.unitInfoFrame.Content.Options.Select;
                return;
            else
                l_GuiService_0.SelectedObject = v271.unitInfoFrame.Content.Options.Equip;
            end;
        end;
        return;
    end;
end;
v50.OpenWithSelectedUnit = function(v287, v288) --[[ Line: 1890 ]] --[[ Name: OpenWithSelectedUnit ]]
    -- upvalues: v12 (copy), v29 (ref)
    local v289 = v287._loadout[v288] or "";
    local v290, v291 = v12:ParseLoadout(v289);
    if not v290 or not v291 then
        v29:Toggle(script.Name, true);
        return;
    else
        local function v294() --[[ Line: 1899 ]] --[[ Name: selectUnit ]]
            -- upvalues: v287 (copy), v290 (copy), v291 (copy), v12 (ref)
            if not v287._unitButtons or not v287._unitButtons[v290] or not v287._unitButtons[v290][v291] then
                return;
            else
                local v292 = v287._unitButtons[v290][v291];
                if not v292 then
                    return;
                else
                    local function _() --[[ Line: 1910 ]] --[[ Name: getUnitInfo ]]
                        -- upvalues: v290 (ref), v291 (ref), v287 (ref), v12 (ref)
                        return {
                            Name = v290, 
                            UID = v291, 
                            Data = v287._units[v290][v291], 
                            UnitType = v12:GetUnitValue(v290, "Type")
                        };
                    end;
                    v287:ProcessUnitClicked(v292, {
                        Name = v290, 
                        UID = v291, 
                        Data = v287._units[v290][v291], 
                        UnitType = v12:GetUnitValue(v290, "Type")
                    });
                    return;
                end;
            end;
        end;
        if v29:GetToggleState(script.Name) then
            v294();
            return;
        else
            v287.GeneratedUnitButtons:Once(v294);
            v29:Toggle(script.Name, true);
            return;
        end;
    end;
end;
v50.OpenToUnit = function(v295, v296, v297) --[[ Line: 1932 ]] --[[ Name: OpenToUnit ]]
    -- upvalues: v12 (copy), v29 (ref)
    local function v300() --[[ Line: 1933 ]] --[[ Name: selectUnit ]]
        -- upvalues: v295 (copy), v296 (copy), v297 (copy), v12 (ref)
        if not v295._unitButtons or not v295._unitButtons[v296] or not v295._unitButtons[v296][v297] then
            return;
        else
            local v298 = v295._unitButtons[v296][v297];
            if not v298 then
                return;
            else
                local function _() --[[ Line: 1944 ]] --[[ Name: getUnitInfo ]]
                    -- upvalues: v296 (ref), v297 (ref), v295 (ref), v12 (ref)
                    return {
                        Name = v296, 
                        UID = v297, 
                        Data = v295._units[v296][v297], 
                        UnitType = v12:GetUnitValue(v296, "Type")
                    };
                end;
                v295:ProcessUnitClicked(v298, {
                    Name = v296, 
                    UID = v297, 
                    Data = v295._units[v296][v297], 
                    UnitType = v12:GetUnitValue(v296, "Type")
                });
                return;
            end;
        end;
    end;
    if v29:GetToggleState(script.Name) then
        v300();
        return;
    else
        v295.GeneratedUnitButtons:Once(v300);
        v29:Toggle(script.Name, true);
        return;
    end;
end;
v50.SetState = function(v301, v302, v303) --[[ Line: 1967 ]] --[[ Name: SetState ]]
    -- upvalues: v7 (copy), v55 (copy)
    if v301._stateData then
        table.clear(v301._stateData);
        v301._stateData = nil;
    end;
    if v303 then
        v301._stateData = v7.Copy(v303, true);
    end;
    v55:Dispatch(v55.Actions.SetMode(v302));
end;
v50.OpenWithState = function(v304, v305, v306) --[[ Line: 1980 ]] --[[ Name: OpenWithState ]]
    -- upvalues: v48 (copy), v26 (copy), v29 (ref)
    if v305 == "GeneralSelection" then
        assert(v306.callback, "Missing callback for general selection mode");
    end;
    if v304._stateData then
        v304._stateData = nil;
    end;
    if v48[v305] then
        if v305 == "TradingSelection" then
            v304.highPriority = true;
        end;
        v304.ToggleAll = {};
        v304.main.Position = UDim2.fromScale(0.5, 0.5);
    end;
    v26:ToggleFrame(false);
    v304:SetState(v305, v306);
    v29:Toggle(script.Name, true);
end;
v50.ShowFilterMenu = function(v307) --[[ Line: 2004 ]] --[[ Name: ShowFilterMenu ]]
    -- upvalues: v7 (copy)
    v307._editFilter = v7.Copy(v307._currentFilter, true);
    v307.filterFrame.Visible = true;
end;
v50.SortUnits = function(v308, v309) --[[ Line: 2009 ]] --[[ Name: SortUnits ]]
    -- upvalues: v12 (copy), v14 (copy)
    if not v309 then
        return;
    else
        table.sort(v309, function(v310, v311) --[[ Line: 2014 ]]
            -- upvalues: v308 (copy), v12 (ref), v14 (ref)
            local l_Name_3 = v310.Name;
            local l_Name_4 = v311.Name;
            local l_UID_3 = v310.UID;
            local l_UID_4 = v311.UID;
            local v316 = v308._tradingUnits[v310.UID] or false;
            local v317 = v308._tradingUnits[v311.UID] or false;
            local l_Equipped_0 = v310.Equipped;
            local l_Equipped_1 = v311.Equipped;
            local v320 = v12:GetUnitValue(v310.Name, "Rarity") or 1;
            local v321 = v12:GetUnitValue(v311.Name, "Rarity") or 1;
            local l_v12_UnitValue_3 = v12:GetUnitValue(v310.Name, "Type");
            local l_v12_UnitValue_4 = v12:GetUnitValue(v311.Name, "Type");
            local v324 = v14.TOWERS.ATTACK_TYPE_INDICES[l_v12_UnitValue_3] or 0;
            local v325 = v14.TOWERS.ATTACK_TYPE_INDICES[l_v12_UnitValue_4] or 0;
            local v326 = v310.Data.Trait ~= nil;
            local v327 = v311.Data.Trait ~= nil;
            local v328 = v310.Data.Stars or 0;
            local v329 = v311.Data.Stars or 0;
            local v330 = v12:GetTotalDamage(v310.Data) or 0;
            local v331 = v12:GetTotalDamage(v311.Data) or 0;
            local v332 = v310.Data.Level or 1;
            local v333 = v311.Data.Level or 1;
            local v334 = v310.Data.Mint or 0;
            local v335 = v311.Data.Mint or 0;
            local v336 = 0;
            if v310.Data.Relic then
                v336 = tonumber(string.match(v310.Data.Relic, "_(%d+)$")) or 4;
            end;
            local v337 = 0;
            if v311.Data.Relic then
                v337 = tonumber(string.match(v311.Data.Relic, "_(%d+)$")) or 4;
            end;
            if v316 ~= v317 then
                return v316;
            elseif l_Equipped_0 ~= l_Equipped_1 then
                return l_Equipped_0;
            elseif v320 ~= v321 then
                return v321 < v320;
            elseif l_Name_3 ~= l_Name_4 then
                return l_Name_3 < l_Name_4;
            elseif v328 ~= v329 then
                return v329 < v328;
            elseif v326 ~= v327 then
                return v326;
            elseif v324 ~= v325 then
                return v324 < v325;
            elseif v330 ~= v331 then
                return v331 < v330;
            elseif v336 ~= v337 then
                return v337 < v336;
            elseif v332 ~= v333 then
                return v333 < v332;
            elseif v334 ~= v335 then
                return v334 < v335;
            else
                return l_UID_3 < l_UID_4;
            end;
        end);
        return;
    end;
end;
v50.ToggleTradingUnit = function(v338, v339, v340) --[[ Line: 2126 ]] --[[ Name: ToggleTradingUnit ]]
    if v340 then
        if v338._tradingUnits[v339.UID] then
            return false;
        else
            v338._tradingUnits[v339.UID] = true;
        end;
    elseif not v338._tradingUnits[v339.UID] then
        return false;
    else
        v338._tradingUnits[v339.UID] = nil;
    end;
    return true;
end;
v50.StopTrading = function(v341) --[[ Line: 2144 ]] --[[ Name: StopTrading ]]
    -- upvalues: v29 (ref)
    table.clear(v341._tradingUnits);
    v29:Toggle(script.Name, false);
end;
v50.ShowTeamsFrame = function(_) --[[ Line: 2149 ]] --[[ Name: ShowTeamsFrame ]]
    -- upvalues: v26 (copy)
    v26:ToggleFrame();
end;
v50.SwapUnit = function(v343, v344) --[[ Line: 2153 ]] --[[ Name: SwapUnit ]]
    -- upvalues: v31 (ref), v45 (ref)
    if not v344 then
        return;
    elseif v343:_getMaxLoadoutSlot() < v344 then
        return;
    elseif not v343._selectedUnit then
        return;
    else
        v31:SwapUnitLoadoutPlacement(v343._selectUnit.Info.Name, v343._selectedUnit.Info.UID, v344);
        v45:ToggleUnitReplacement(false);
        return;
    end;
end;
v50._updateUnitCount = function(v345) --[[ Line: 2170 ]] --[[ Name: _updateUnitCount ]]
    v345.unitCountLabel.Text = ("%*/%*"):format(v345._totalUnits, v345._maxUnits);
end;
v50._loadUnits = function(v346) --[[ Line: 2174 ]] --[[ Name: _loadUnits ]]
    -- upvalues: v6 (copy), v17 (copy), v55 (copy)
    if v346.unitsDump then
        v346.unitsDump:Destroy();
    end;
    v346.unitsDump = v6.new();
    v346.unitsDump:Add(function() --[[ Line: 2181 ]]
        -- upvalues: v346 (copy), v17 (ref)
        table.clear(v346._unitButtons);
        v17.deferClearBrowser(v346.unitsBin);
    end);
    local v347 = v346._filteredUnits or v346._unitsArray;
    local l_Mode_2 = v55:GetState().Mode;
    local l_NotEnoughDuplicates_0 = v346.content.NotEnoughDuplicates;
    local v350 = false;
    if l_Mode_2 == "FusionSelection" then
        v350 = #v346._filteredUnits < 1;
    end;
    l_NotEnoughDuplicates_0.Visible = v350;
    v346:SortUnits(v347);
    v17.loadOnDemand(v347, v346.unitsBin, v346.unitsDump, function(v351, v352) --[[ Line: 2195 ]]
        -- upvalues: v346 (copy), l_Mode_2 (copy)
        v346:GenerateUnitButton(v351.Name, v351.UID, v352, l_Mode_2);
        if v352 == 25 or v352 == #v346._unitsArray then
            v346.GeneratedUnitButtons:Fire();
        end;
    end, nil, {
        populateBy = 25
    });
end;
v50._isEquipped = function(v353, v354, v355) --[[ Line: 2207 ]] --[[ Name: _isEquipped ]]
    -- upvalues: v12 (copy)
    if not v354 or not v355 then
        return false;
    else
        local l_v12_LoadoutString_2 = v12:CreateLoadoutString(v354, v355);
        for v357 = 1, #v353._loadout do
            if v353._loadout[v357] == l_v12_LoadoutString_2 then
                return true, v357;
            end;
        end;
        return false;
    end;
end;
v50._connectSearchBar = function(v358) --[[ Line: 2224 ]] --[[ Name: _connectSearchBar ]]
    v358.searchBar.FocusLost:Connect(function(v359) --[[ Line: 2225 ]]
        -- upvalues: v358 (copy)
        if not v359 then
            return;
        elseif v358._lastSearchTerm == v358.searchBar.Text then
            return;
        else
            local l_Text_0 = v358.searchBar.Text;
            v358._lastSearchTerm = l_Text_0;
            v358._currentFilter.Name = l_Text_0;
            v358:FilterUnits(v358._currentFilter);
            return;
        end;
    end);
end;
v50._connectFilterFrame = function(v361) --[[ Line: 2244 ]] --[[ Name: _connectFilterFrame ]]
    -- upvalues: v29 (ref), v7 (copy), v24 (copy)
    v361.filterFrame.Visible = false;
    v361.filterContent.Bin.CanvasPosition = Vector2.new(0, 0);
    local v362 = {};
    v361.filterButtons = v362;
    v29:HandleButton(v361.filterOptions.Cancel, function() --[[ Line: 2251 ]]
        -- upvalues: v361 (copy), v362 (copy)
        v361.filterFrame.Visible = false;
        if v361._currentFilter then
            v361:FilterUnits(v361._currentFilter);
        end;
        for v363, v364 in v361._editFilter do
            local v365 = v361._currentFilter[v363];
            if v362[v363] then
                for v366 in v364 do
                    local v367 = v362[v363][v366];
                    if v367 and not (v365 and v365[v366]) then
                        v367.Content.Deselected.Visible = true;
                    end;
                end;
            end;
        end;
        for v368, v369 in v361._currentFilter do
            if v362[v368] then
                for v370 in v369 do
                    local v371 = v362[v368][v370];
                    if v371 then
                        v371.Content.Deselected.Visible = false;
                    end;
                end;
            end;
        end;
        v361._editFilter = nil;
    end);
    v29:HandleButton(v361.filterOptions.Apply, function() --[[ Line: 2300 ]]
        -- upvalues: v361 (copy), v7 (ref)
        v361.filterFrame.Visible = false;
        v361._currentFilter = v7.Copy(v361._editFilter, true);
        v361:FilterUnits(v361._currentFilter);
        v361._editFilter = nil;
    end);
    local function v375(v372, v373) --[[ Line: 2308 ]] --[[ Name: handleFilterButton ]]
        -- upvalues: v24 (ref), v29 (ref), v361 (copy)
        local v374 = v372:GetAttribute("FilterName") or v372.Name;
        v372.Content.Deselected.Visible = true;
        if v373 == "AttackType" then
            v24.new(v372, {
                IsAttackTypeDisplay = true, 
                AttackType = v372.Name, 
                Name = ""
            });
        elseif v373 == "UnitTraits" then
            v24.new(v372, {
                IsTraitDisplay = true, 
                Trait = v372.Name, 
                Name = ""
            });
        end;
        v29:HandleButton(v372, function() --[[ Line: 2324 ]]
            -- upvalues: v361 (ref), v373 (copy), v374 (copy), v372 (copy)
            if v361._editFilter[v373] and v361._editFilter[v373][v374] then
                v372.Content.Deselected.Visible = true;
                v361._editFilter[v373][v374] = nil;
                if not next(v361._editFilter[v373]) then
                    v361._editFilter[v373] = nil;
                end;
                return;
            else
                if not v361._editFilter[v373] then
                    v361._editFilter[v373] = {};
                end;
                v361._editFilter[v373][v374] = true;
                v372.Content.Deselected.Visible = false;
                return;
            end;
        end);
    end;
    for _, v377 in v361.filterContent.Bin:GetChildren() do
        if v377:IsA("Frame") then
            local v378 = {};
            local l_Buttons_0 = v377:FindFirstChild("Buttons");
            if l_Buttons_0 then
                v362[v377.Name] = v378;
                for _, v381 in l_Buttons_0:GetChildren() do
                    if v381:IsA("GuiButton") then
                        v378[v381.Name] = v381;
                        v375(v381, v377.Name);
                    end;
                end;
            end;
            for _, v383 in v377:GetChildren() do
                if v383:IsA("Frame") then
                    local l_Buttons_1 = v383:FindFirstChild("Buttons");
                    if l_Buttons_1 then
                        v362[v383.Name] = v378;
                        for _, v386 in l_Buttons_1:GetChildren() do
                            if v386:IsA("GuiButton") then
                                v378[v386.Name] = v386;
                                v375(v386, v383.Name);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v50._clearFilter = function(v387) --[[ Line: 2390 ]] --[[ Name: _clearFilter ]]
    v387._currentFilter = {};
    v387._editFilter = nil;
    v387.filterFrame.Visible = false;
    if not v387.filterButtons then
        return;
    else
        for _, v389 in v387.filterButtons do
            for _, v391 in v389 do
                v391.Content.Deselected.Visible = true;
            end;
        end;
        return;
    end;
end;
v50._updateSelectedMintCount = function(v392) --[[ Line: 2408 ]] --[[ Name: _updateSelectedMintCount ]]
    -- upvalues: v36 (ref)
    v392.previewFrame.ExistingCount.Serial.Visible = false;
    v392._selectionDump:Add(v36:ApplyMintToLabel(v392._selectedUnit.Info.Name, v392._selectedUnit.Info.UID, v392._selectedUnit.Info.Data, v392.previewFrame.ExistingCount.Serial, "#%s"):andThen(function(v393, v394) --[[ Line: 2417 ]]
        -- upvalues: v392 (copy)
        if not v393 then
            return;
        else
            v392.previewFrame.ExistingCount.Serial.Visible = true;
            v392._selectionDump:Add(v394);
            return;
        end;
    end));
end;
v50._getMaxLoadoutSlot = function(v395) --[[ Line: 2428 ]] --[[ Name: _getMaxLoadoutSlot ]]
    -- upvalues: v22 (copy)
    return v22:GetMaxLoadoutSlot(v395._playerStats);
end;
v50._getLayoutOrder = function(v396, v397, v398, v399) --[[ Line: 2432 ]] --[[ Name: _getLayoutOrder ]]
    local l_v399_0 = v399;
    local v401, v402 = v396:_isEquipped(v397.Name, v398);
    if v401 then
        l_v399_0 = -10000 + v402;
    end;
    if v397.Favorite then
        l_v399_0 = l_v399_0 - 1000;
    end;
    return l_v399_0;
end;
return v50;