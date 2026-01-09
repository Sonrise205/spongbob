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
local v13 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v14 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v15 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v17 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v18 = require(v5.Player.PlayerScripts.Knit.Controllers.UIController.Util.HighlandUIUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.AnimatedSprite);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v21 = require(l_ReplicatedStorage_0.TraitsData);
local v22 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisualBatch);
local v23 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v24 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v25 = require(v5.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v26 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v27 = require(script.TeamsManager);
local v28 = require(script.PetsTab);
local v29 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v30 = require(l_ReplicatedStorage_0.Shared.Data.BemmyQuestlineInfo);
local _ = require(l_ReplicatedStorage_0.Shared.Data.SpritesheetAtlas);
local v32 = require(script.SharedLogic);
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
local v46 = nil;
local v47 = nil;
local v48 = nil;
local v49 = nil;
local v50 = nil;
local v51 = {
    "HUD", 
    "Notification"
};
local v52 = UDim2.fromScale(0.54, 0.45);
local v53 = {
    TraitSelection = true, 
    FeedSelection = true, 
    FusionSelection = true, 
    TradingSelection = true, 
    ExchangeSelection = true, 
    TeamSelection = true, 
    GeneralSelection = true
};
local v54 = {
    Select = true, 
    Cancel = true
};
local v55 = {
    ["Content/UIGradient"] = {
        "Color"
    }, 
    ["Content/UIStroke"] = {
        "Color"
    }, 
    ["Content/Icon"] = {
        "ImageTransparency"
    }
};
local v56 = {
    DESELECTED = {}, 
    SELECTED = {}
};
local v57 = {
    TraitSelection = "Units", 
    TeamSelection = "Units", 
    GeneralSelection = "Units"
};
local v58 = {
    FusionSelection = true, 
    TradingSelection = true, 
    FeedSelection = true
};
local v59 = {
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
    ToggleAll = v51, 
    rgbHandler = v22.new(), 
    updatedUnitData = {}, 
    _currentTab = nil
};
local v64 = v8.new({
    Mode = "Normal", 
    UIDsForSale = {}
}, {
    SetMode = function(v60, v61) --[[ Line: 155 ]]
        v60.Mode = v61;
    end, 
    SetUIDsForSale = function(v62, v63) --[[ Line: 159 ]]
        v62.UIDsForSale = v63;
    end
});
v59.Init = function(v65, v66, v67) --[[ Line: 166 ]] --[[ Name: Init ]]
    -- upvalues: v33 (ref), v5 (copy), v34 (ref), v35 (ref), v36 (ref), v37 (ref), v38 (ref), v39 (ref), v40 (ref), v41 (ref), v42 (ref), v43 (ref), v27 (copy), v28 (copy)
    v33 = v5.GetController("UIController");
    v34 = v5.GetController("DataController");
    v35 = v5.GetService("UnitService");
    v36 = v5.GetController("UnitViewerController");
    v37 = v5.GetController("UnitController");
    v38 = v5.GetController("DeviceTypeController");
    v39 = v5.GetController("GlobalUnitTrackerController");
    v40 = v5.GetController("GlobalMintController");
    v41 = v5.GetService("BemmyBuddyService");
    v42 = v5.GetController("PetController");
    v43 = v5.GetService("PetService");
    v65.currentMode = v67;
    v65.ui = v66;
    v65.filterFrame = v65.ui.FilterOverlay;
    v65.filterMain = v65.filterFrame.Main;
    v65.filterContent = v65.filterMain.Content;
    v65.filterOptions = v65.filterContent.Options;
    v65.main = v66.Main;
    v65.content = v65.main.Content;
    v65.unitsBin = v65.content.Bin.Bin;
    v65.unitTemplate = v65.unitsBin.Template:Clone();
    v65.unitTemplate:SetAttribute("InvertClick", true);
    v65.unitsBin.Template:Destroy();
    v65.topBar = v65.content.Top;
    v65.bottomBar = v65.content.Bottom;
    v65.searchBar = v65.topBar.SearchBar.TextBox;
    v65.exitBtn = v65.main.Exit;
    v65.hoverTooltip = v65.content.HoverTooltip;
    v65.previewFrame = v65.main.Content.Preview;
    v65.selectUnitPreview = v65.previewFrame.FirstOpenBackground;
    v65.unitInfoFrame = v65.previewFrame.UnitInfo;
    v65.starsContainer = v65.unitInfoFrame.Content.Unsorted.Stars;
    v65.toggleFavoriteBtn = v65.unitInfoFrame.Content.Unsorted.ToggleFavorite;
    v65.header = v65.main.Header;
    v65.titleLabel = v65.header.Title.TitleContainer.Title;
    v65.unitCountsFrame = v65.header.Other.UnitsCount;
    v65.tabButtons = v65.header.Other.Tabs;
    v65.hoverTooltip.Visible = false;
    v65.previewFrame.ExistingCount.Visible = false;
    v27:Init(v66);
    v28:Init(v65, v66, v65.unitTemplate);
    v65.PetsTab = v28;
end;
v59.Start = function(v68) --[[ Line: 225 ]] --[[ Name: Start ]]
    -- upvalues: v27 (copy), v28 (copy), v44 (ref), v33 (ref), v45 (ref), v46 (ref), v48 (ref), v49 (ref), v50 (ref), v47 (ref), v7 (copy), v43 (ref), v35 (ref), v12 (copy), v13 (copy), v15 (copy), v23 (copy), v6 (copy), v64 (copy), v30 (copy), v34 (ref), v5 (copy), v51 (copy), v52 (copy), v41 (ref), v42 (ref), l_RunService_0 (copy), v26 (copy), l_TweenService_0 (copy), v55 (copy), v29 (copy), v56 (copy)
    task.spawn(function() --[[ Line: 226 ]]
        -- upvalues: v27 (ref), v28 (ref)
        v27:Start();
        v28:Start();
    end);
    v27.ToggledSignal:Connect(function(v69) --[[ Line: 231 ]]
        -- upvalues: v68 (copy)
        v68.main.Visible = not v69;
    end);
    v44 = v33:GetModuleAsync("Traits"):expect();
    v45 = v33:GetModuleAsync("Feed"):expect();
    v46 = v33:GetModuleAsync("Fusions"):expect();
    v48 = v33:GetModuleAsync("Notification"):expect();
    v49 = v33:GetModuleAsync("MessagePrompt"):expect();
    v50 = v33:GetModuleAsync("HUD"):expect();
    if v68.currentMode == "Trading" then
        v47 = v33:GetModuleAsync("Trade"):expect();
    end;
    v68.unitsBin.CanvasPosition = Vector2.new(0, 0);
    v68.filterFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 248 ]]
        -- upvalues: v68 (copy), v50 (ref)
        v68.main.Visible = not v68.filterFrame.Visible;
        if v68.filterFrame.Visible then
            v50:ToggleUnitsBar(false, 0);
            return;
        else
            v50:ToggleUnitsBar(true, 0.2);
            return;
        end;
    end);
    v33:HandleButton(v68.bottomBar.Sell.ConfirmSell, function() --[[ Line: 258 ]]
        -- upvalues: v7 (ref), v68 (copy), v49 (ref), v43 (ref), v35 (ref)
        local v70 = v7.Keys(v68._uidsForSale);
        if #v70 < 1 then
            return;
        else
            local v71 = v68:GetTab() == "Pets" and "pets" or "units";
            v49:Prompt({
                message = ("Are you sure you want to sell these %*?\n(THIS CAN NOT BE UNDONE!)"):format(v71), 
                options = {
                    {
                        text = "Yes", 
                        callback = function() --[[ Line: 273 ]] --[[ Name: callback ]]
                            -- upvalues: v68 (ref), v43 (ref), v70 (copy), v35 (ref)
                            if v68:GetTab() == "Pets" then
                                v43:SellPets(v70);
                                return;
                            else
                                v35:SellUnits(v70);
                                return;
                            end;
                        end
                    }, 
                    {
                        text = "No"
                    }
                }
            });
            v49:BindToClose(function() --[[ Line: 287 ]]
                -- upvalues: v68 (ref)
                v68:SetState("Normal");
            end);
            return;
        end;
    end, {
        MouseEnter = function() --[[ Line: 291 ]] --[[ Name: MouseEnter ]]
            -- upvalues: v68 (copy)
            v68:HideHoverTooltip();
            v68.hoverCancelTag = "ConfirmSell";
        end, 
        MouseLeave = function() --[[ Line: 295 ]] --[[ Name: MouseLeave ]]
            -- upvalues: v68 (copy)
            if v68.hoverCancelTag == "ConfirmSell" then
                v68.hoverCancelTag = nil;
            end;
        end
    });
    v33:HandleButton(v68.bottomBar.Sell.CancelSell, function() --[[ Line: 302 ]]
        -- upvalues: v68 (copy)
        v68:SetState("Normal");
    end, {
        MouseEnter = function() --[[ Line: 305 ]] --[[ Name: MouseEnter ]]
            -- upvalues: v68 (copy)
            v68:HideHoverTooltip();
            v68.hoverCancelTag = "CancelSell";
        end, 
        MouseLeave = function() --[[ Line: 309 ]] --[[ Name: MouseLeave ]]
            -- upvalues: v68 (copy)
            if v68.hoverCancelTag == "CancelSell" then
                v68.hoverCancelTag = nil;
            end;
        end
    });
    local function v84() --[[ Line: 316 ]] --[[ Name: selectAllForSale ]]
        -- upvalues: v68 (copy), v12 (ref), v28 (ref), v13 (ref), v15 (ref), v7 (ref), v23 (ref)
        local v72 = v68._filteredUnits or v68._unitsArray;
        local v73 = 0;
        local v74 = {};
        local l__unitButtons_0 = v68._unitButtons;
        local l_v12_0 = v12;
        if v68:GetTab() == "Pets" then
            v72 = v68._filteredUnits or v28:GetAllPets();
            l__unitButtons_0 = v28._buttons;
            l_v12_0 = v13;
        end;
        local _ = #v72;
        for v78, v79 in v72 do
            if (v68:GetTab() == "Pets" or v78 ~= 1) and not v79.Data.Favorite and not v79.Data.Priceless and not v79.Data.Temporary then
                local l_l_v12_0_LoadoutString_0 = l_v12_0:CreateLoadoutString(v79.Name, v79.UID);
                local v81 = select(2, l_v12_0:GetRarity(v79.Name, true));
                local v82 = v15.UNIT_SELL_PRICES[v81];
                v74[l_l_v12_0_LoadoutString_0] = true;
                v73 = v73 + v82;
                local v83 = l__unitButtons_0[v79.Name] and l__unitButtons_0[v79.Name][v79.UID];
                if v83 then
                    v83.Content.ForSale.Visible = true;
                end;
            end;
        end;
        v68._uidsForSale = v74;
        v68._totalSalePrice = v73;
        v68.bottomBar.Sell.ConfirmSell.Content.Title.Text = ("Sell (x%*)"):format(#v7.Keys(v68._uidsForSale));
        v68.bottomBar.Sell.ConfirmSell.Content.Currency.Amount.Text = ("+%*"):format((v23:SuffixNumber(v68._totalSalePrice)));
    end;
    v33:HandleButton(v68.bottomBar.Sell.SelectAll, function() --[[ Line: 363 ]]
        -- upvalues: v49 (ref), v68 (copy), v84 (copy)
        v49:Prompt({
            message = ("Are you sure you want to select ALL of your %* to sell?"):format((v68:GetTab())), 
            options = {
                {
                    text = "Yes", 
                    callback = v84
                }, 
                {
                    text = "No"
                }
            }
        });
    end, {
        MouseEnter = function() --[[ Line: 377 ]] --[[ Name: MouseEnter ]]
            -- upvalues: v68 (copy)
            v68:HideHoverTooltip();
            v68.hoverCancelTag = "SelectAll";
        end, 
        MouseLeave = function() --[[ Line: 381 ]] --[[ Name: MouseLeave ]]
            -- upvalues: v68 (copy)
            if v68.hoverCancelTag == "SelectAll" then
                v68.hoverCancelTag = nil;
            end;
        end
    });
    v68.hoverCancelTag = nil;
    v33:HandleButton(v68.bottomBar.Default.EquipBest, function() --[[ Line: 390 ]]
        -- upvalues: v68 (copy), v43 (ref), v35 (ref)
        v68._equippedBest = true;
        if v68:GetTab() == "Pets" then
            v43:EquipBest();
            return;
        else
            v35:EquipBest();
            return;
        end;
    end, {
        MouseEnter = function() --[[ Line: 399 ]] --[[ Name: MouseEnter ]]
            -- upvalues: v68 (copy)
            v68:HideHoverTooltip();
            v68.hoverCancelTag = "EquipBest";
        end, 
        MouseLeave = function() --[[ Line: 403 ]] --[[ Name: MouseLeave ]]
            -- upvalues: v68 (copy)
            if v68.hoverCancelTag == "EquipBest" then
                v68.hoverCancelTag = nil;
            end;
        end
    });
    v33:HandleButton(v68.bottomBar.Default.UnequipAll, function() --[[ Line: 410 ]]
        -- upvalues: v68 (copy), v43 (ref), v35 (ref)
        if v68:GetTab() == "Pets" then
            v43:UnequipAll();
            return;
        else
            v35:UnequipAll();
            return;
        end;
    end, {
        MouseEnter = function() --[[ Line: 418 ]] --[[ Name: MouseEnter ]]
            -- upvalues: v68 (copy)
            v68:HideHoverTooltip();
            v68.hoverCancelTag = "UnequipAll";
        end, 
        MouseLeave = function() --[[ Line: 422 ]] --[[ Name: MouseLeave ]]
            -- upvalues: v68 (copy)
            if v68.hoverCancelTag == "UnequipAll" then
                v68.hoverCancelTag = nil;
            end;
        end
    });
    v33:HandleButton(v68.topBar.Filter, function() --[[ Line: 429 ]]
        -- upvalues: v68 (copy)
        v68:ShowFilterMenu();
    end);
    if v68.topBar:FindFirstChild("Team") then
        v33:HandleButton(v68.topBar.Team, function() --[[ Line: 434 ]]
            -- upvalues: v68 (copy)
            v68:ShowTeamsFrame();
        end);
    end;
    v33:HandleButton(v68.bottomBar.Default.SellMode, function() --[[ Line: 439 ]]
        -- upvalues: v68 (copy)
        v68:SetState("Sell");
    end, {
        MouseEnter = function() --[[ Line: 442 ]] --[[ Name: MouseEnter ]]
            -- upvalues: v68 (copy)
            v68:HideHoverTooltip();
            v68.hoverCancelTag = "SellMode";
        end, 
        MouseLeave = function() --[[ Line: 446 ]] --[[ Name: MouseLeave ]]
            -- upvalues: v68 (copy)
            if v68.hoverCancelTag == "SellMode" then
                v68.hoverCancelTag = nil;
            end;
        end
    });
    local function v86(v85) --[[ Line: 453 ]] --[[ Name: selectMode ]]
        return v85.Mode;
    end;
    local v87 = v6.new();
    v64:Watch(v86, function(v88) --[[ Line: 459 ]]
        -- upvalues: v68 (copy), v87 (copy), v30 (ref), v34 (ref), v5 (ref), v15 (ref), v28 (ref), v33 (ref), v51 (ref), v52 (ref)
        if v88 == "FocusOnUnit" then
            local v89 = v68._selectedUnit and v68._selectedUnit.Button;
            for _, v91 in v68._unitButtons do
                for _, v93 in v91 do
                    v93.Content.Darken.Visible = v93 ~= v89;
                end;
            end;
        end;
        v68.bottomBar.Sell.Visible = v88 == "Sell";
        v68.bottomBar.Default.Visible = v88 == "Normal";
        v68.bottomBar.Fusions.Visible = v88 == "FusionSelection";
        v68.bottomBar.Feeding.Visible = v88 == "FeedSelection";
        v68.bottomBar.Traits.Visible = v88 == "TraitSelection";
        v68.bottomBar.Trading.Visible = v88 == "TradingSelection";
        v68.bottomBar.Exchange.Visible = v88 == "ExchangeSelection";
        v68.bottomBar.Teams.Visible = v88 == "TeamSelection";
        v68.bottomBar.UnitSelection.Visible = v88 == "GeneralSelection";
        if v68._stateData and v68._stateData.selectionText then
            v68.bottomBar.UnitSelection.Text = v68._stateData.selectionText;
        else
            v68.bottomBar.UnitSelection.Visible = false;
        end;
        local l_Filter_0 = v68.topBar.Filter;
        local v95 = false;
        if v68:GetTab() == "Units" then
            v95 = v88 ~= "ExchangeSelection";
        end;
        l_Filter_0.Visible = v95;
        v87:Destroy();
        if v88 == "ExchangeSelection" then
            l_Filter_0 = v30:GetQuestInfo(5);
            local l_l_Filter_0_0 = l_Filter_0 --[[ copy: 1 -> 12 ]];
            v87:Add(v34:OnChanged(v5.Player, {
                v15.BEMMY.DATA_KEY, 
                "progress", 
                5
            }, function(v97) --[[ Line: 498 ]]
                -- upvalues: l_l_Filter_0_0 (copy), v68 (ref)
                local v98 = ("<font color=\"#ebff33\">(Progress: %*/%*)</font>"):format(v97, l_l_Filter_0_0.required);
                v68.bottomBar.Exchange.Text = ("Select units to give to Bemmy %*"):format(v98);
            end, true));
        end;
        l_Filter_0 = v68.topBar.Team;
        v95 = false;
        if v68:GetTab() == "Units" then
            v95 = v88 == "Normal";
        end;
        l_Filter_0.Visible = v95;
        if v88 == "FusionSelection" then
            v68._filterBackup = table.clone(v68._currentFilter);
            v68._currentFilter.ExcludeFavoriteUnits = true;
            v68:FilterUnits(v68._currentFilter);
        end;
        if v88 == "TraitSelection" then
            v68._filterBackup = table.clone(v68._currentFilter);
            v68._currentFilter.ExcludeResourceUnits = true;
            v68:FilterUnits(v68._currentFilter);
        end;
        if v88 == "GeneralSelection" and v68._stateData and v68._stateData.filter then
            v68._filterBackup = table.clone(v68._currentFilter);
            v68:FilterUnits(v68._stateData.filter);
        end;
        if v88 == "Sell" then
            v68:DeselectUnit();
        end;
        table.clear(v68._uidsForSale);
        v68._totalSalePrice = 0;
        v68.bottomBar.Sell.ConfirmSell.Content.Title.Text = "Sell (x0)";
        v68.bottomBar.Sell.ConfirmSell.Content.Currency.Amount.Text = "+0";
        l_Filter_0 = function(v99) --[[ Line: 549 ]] --[[ Name: updateButtons ]]
            -- upvalues: v68 (ref), v88 (copy)
            local v100 = v99 or {};
            for v101, v102 in v100 do
                for v103 in v102 do
                    v68:UpdateUnitButton(v101, v103, v88);
                end;
            end;
        end;
        l_Filter_0(v68._unitButtons);
        l_Filter_0(v28:GetButtons());
        if v88 == "Normal" then
            if v68.HiddenUI then
                v33:RevertFromToggleAll(table.clone(v68.HiddenUI), true);
                v68.HiddenUI = nil;
            end;
            v68.highPriority = false;
            v68.ToggleAll = v51;
            v68.main.Position = v52;
            v68._currentFilter.ExcludeResourceUnits = nil;
            if v68._filterBackup then
                v68._currentFilter = table.clone(v68._filterBackup);
                v68._filterBackup = nil;
                v68:FilterUnits(v68._currentFilter);
            end;
        end;
    end);
    v33:HandleButton(v68.unitInfoFrame.Content.Options.Equip, function() --[[ Line: 581 ]]
        -- upvalues: v68 (copy), v12 (ref), v28 (ref), v43 (ref), v35 (ref), v50 (ref), v33 (ref)
        if not v68._selectedUnit then
            return;
        else
            local v104 = v68:GetTab() == "Pets";
            local l_v12_LoadoutString_0 = v12:CreateLoadoutString(v68._selectedUnit.Info.Name, v68._selectedUnit.Info.UID);
            local v106 = if v104 then v28:GetLoadout() else v68._loadout;
            for v107 = 1, #v106 do
                if v106[v107] == l_v12_LoadoutString_0 then
                    if v104 then
                        v43:UnequipPet(v107);
                        return;
                    else
                        v35:UnequipUnit(v107);
                        return;
                    end;
                end;
            end;
            local v108 = nil;
            local v109 = v68:_getMaxLoadoutSlot();
            for v110 = 1, v109 do
                if v106[v110] == "" then
                    v108 = v110;
                    break;
                end;
            end;
            if not v108 then
                if v104 then
                    if v109 == 1 then
                        v43:EquipPet(v68._selectedUnit.Info.Name, v68._selectedUnit.Info.UID, 1);
                        return;
                    else
                        v50:TogglePetReplacement(true, v68._selectedUnit.Info);
                    end;
                else
                    v50:ToggleUnitReplacement(true, v68._selectedUnit.Info);
                end;
                v33:Toggle(script.Name, false);
                v50:ToggleBottomLobbyFrame(false);
                return;
            elseif v104 then
                v43:EquipPet(v68._selectedUnit.Info.Name, v68._selectedUnit.Info.UID, v108);
                return;
            else
                v35:EquipUnit(v68._selectedUnit.Info.Name, v68._selectedUnit.Info.UID, v108);
                return;
            end;
        end;
    end);
    v33:HandleButton(v68.unitInfoFrame.Content.Options.Feed, function() --[[ Line: 642 ]]
        -- upvalues: v68 (copy), v45 (ref)
        if not v68._selectedUnit then
            return;
        else
            v45:SetUnit(v68._selectedUnit.Info);
            return;
        end;
    end);
    v33:HandleButton(v68.unitInfoFrame.Content.Options.Select, function() --[[ Line: 652 ]]
        -- upvalues: v68 (copy), v64 (ref), v44 (ref), v45 (ref), v46 (ref), v27 (ref), v48 (ref), v47 (ref), v41 (ref), v33 (ref)
        if not v68._selectedUnit then
            return;
        else
            local l_v64_State_0 = v64:GetState();
            if l_v64_State_0.Mode == "TraitSelection" then
                v44:SelectUnit(v68._selectedUnit.Info);
                return;
            elseif l_v64_State_0.Mode == "FeedSelection" then
                v45:SetUnit(v68._selectedUnit.Info);
                return;
            elseif l_v64_State_0.Mode == "FusionSelection" then
                v46:SelectUnit(v68._selectedUnit.Info);
                return;
            elseif l_v64_State_0.Mode == "TeamSelection" then
                v27:CallToAddUnit(v68._selectedUnit.Info);
                return;
            elseif l_v64_State_0.Mode == "GeneralSelection" then
                v68._stateData.callback(v68._selectedUnit.Info);
                return;
            elseif l_v64_State_0.Mode == "TradingSelection" then
                local v112 = v68:GetTab() == "Pets" and "Pet" or "Unit";
                if v68._selectedUnit.Info.Data.Untradable or v68._selectedUnit.Info.Data.Temporary then
                    v48:Notify({
                        message = ("You cannot trade this %*"):format((string.lower(v112))), 
                        duration = 3, 
                        isPositive = false
                    });
                    return;
                elseif v68:ToggleTradingUnit(v68._selectedUnit.Info, true) then
                    v47:AddUnitOrPet(v68._selectedUnit.Info, v112);
                    return;
                else
                    v48:Notify({
                        message = ("You are already trading this %*!"):format((string.lower(v112))), 
                        duration = 3, 
                        isPositive = false
                    });
                    return;
                end;
            else
                if l_v64_State_0.Mode == "ExchangeSelection" then
                    v41:GiveUnit(v68._selectedUnit.Info):andThen(function(v113, v114) --[[ Line: 697 ]]
                        -- upvalues: v48 (ref), v33 (ref)
                        if v113 then
                            v48:Notify({
                                message = "Unit successfully given to Bemmy!", 
                                duration = 3, 
                                isPositive = true
                            });
                        end;
                        if v114 then
                            v33:Toggle(script.Name, false);
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
    v33:HandleButton(v68.exitBtn, function() --[[ Line: 715 ]]
        -- upvalues: v33 (ref), v5 (ref), v15 (ref)
        v33:Toggle(script.Name, false):andThen(function() --[[ Line: 716 ]]
            -- upvalues: v5 (ref), v15 (ref), v33 (ref)
            if v5.Player:GetAttribute(v15.TRADING.ATTRIBUTE) then
                v33:Toggle("Trade", true);
            end;
        end);
    end);
    v33:HandleButton(v68.toggleFavoriteBtn, function() --[[ Line: 723 ]]
        -- upvalues: v68 (copy), v35 (ref)
        if not v68._selectedUnit then
            return;
        else
            v35:ToggleFavorite(v68._selectedUnit.Info.Name, v68._selectedUnit.Info.UID);
            return;
        end;
    end);
    v68._totalUnits = 0;
    v68._maxUnits = 100;
    v34:OnChanged(v5.Player, "MaxUnits", function(v115) --[[ Line: 737 ]]
        -- upvalues: v68 (copy)
        v68._maxUnits = v115;
        v68:_updateUnitCount();
    end, true);
    v34:OnChanged(v5.Player, "MaxPets", function(v116) --[[ Line: 742 ]]
        -- upvalues: v68 (copy)
        v68._maxPets = v116;
        if v68:GetTab() == "Pets" then
            v68:_updatePetsCount();
        end;
    end, true);
    v68._units = v34:Get(v5.Player, "Units"):expect();
    v68._loadout = v34:Get(v5.Player, "Loadout"):expect();
    v68._unitsArray = {};
    local _ = v42:GetEquippedPets();
    for v118, v119 in v68._units do
        local l_v12_UnitValue_0 = v12:GetUnitValue(v118, "Type");
        for v121, v122 in v119 do
            local l__unitsArray_0 = v68._unitsArray;
            local v124 = {
                Name = v118, 
                FullName = v12:GetUnitValue(v118, "FullName"), 
                UID = v121, 
                Data = v122, 
                Rarity = select(2, v12:GetRarity(v118))
            };
            local v125 = {};
            local v126 = false;
            if l_v12_UnitValue_0 ~= "Resource" then
                v126 = v12:GetTotalDamage(v122);
            end;
            v125.DMG = v126;
            v126 = false;
            if l_v12_UnitValue_0 ~= "Resource" then
                v126 = v12:GetRange(v122);
            end;
            v125.RNG = v126;
            v126 = false;
            if l_v12_UnitValue_0 ~= "Resource" then
                v126 = v12:GetAttackCooldown(v122);
            end;
            v125.SPA = v126;
            v126 = false;
            if l_v12_UnitValue_0 == "Resource" then
                v126 = v12:GetGold(v122);
            end;
            v125.GOLD = v126;
            v124.Stats = v125;
            v124.Equipped = table.find(v68._loadout, v12:CreateLoadoutString(v118, v121)) ~= nil;
            table.insert(l__unitsArray_0, v124);
            v68._totalUnits = v68._totalUnits + 1;
        end;
    end;
    v34:OnChanged(v5.Player, "Loadout", function(v127) --[[ Line: 783 ]]
        -- upvalues: v68 (copy), v12 (ref)
        v68._loadout = v127;
        if v68._selectedUnit then
            v68:UpdateSelectedUnit();
        end;
        for _, v129 in v68._unitsArray do
            local l_Name_0 = v129.Name;
            local l_UID_0 = v129.UID;
            v129.Equipped = table.find(v127, v12:CreateLoadoutString(l_Name_0, l_UID_0)) ~= nil;
        end;
        if v68._equippedBest then
            v68._equippedBest = false;
            v68:_loadUnits();
            return;
        else
            v68:SortUnits(v68._unitsArray);
            v68:UpdateButtonOrders();
            return;
        end;
    end, true);
    v34:OnChanged(v5.Player, "PlayerStats", function(v132) --[[ Line: 806 ]]
        -- upvalues: v68 (copy)
        v68._playerStats = v132;
        v68._myLevel = v132.Level or 1;
    end, true);
    v35.UnitsAdded:Connect(function(v133) --[[ Line: 811 ]]
        -- upvalues: v68 (copy), v7 (ref), v42 (ref), v12 (ref), v33 (ref), l_RunService_0 (ref)
        local l_v68_0 = v68;
        l_v68_0._totalUnits = l_v68_0._totalUnits + #v7.Keys(v133);
        v68:_updateUnitCount();
        l_v68_0 = 1;
        local _ = v42:GetEquippedPets();
        for v136, v137 in v133 do
            local v138, v139 = v12:ParseLoadout(v136);
            if not v68._units[v138] then
                v68._units[v138] = {};
            end;
            if not v68._unitButtons[v138] or not v68._unitButtons[v138][v139] then
                if not v68._units[v138][v139] then
                    v68._units[v138][v139] = v137;
                end;
                local l_v12_UnitValue_1 = v12:GetUnitValue(v138, "Type");
                local l__unitsArray_1 = v68._unitsArray;
                local v142 = {
                    Name = v138, 
                    FullName = v12:GetUnitValue(v138, "FullName"), 
                    UID = v139, 
                    Data = v137, 
                    Rarity = select(2, v12:GetRarity(v138))
                };
                local v143 = {};
                local v144 = false;
                if l_v12_UnitValue_1 ~= "Resource" then
                    v144 = v12:GetTotalDamage(v137);
                end;
                v143.DMG = v144;
                v144 = false;
                if l_v12_UnitValue_1 ~= "Resource" then
                    v144 = v12:GetRange(v137);
                end;
                v143.RNG = v144;
                v144 = false;
                if l_v12_UnitValue_1 ~= "Resource" then
                    v144 = v12:GetAttackCooldown(v137);
                end;
                v143.SPA = v144;
                v144 = false;
                if l_v12_UnitValue_1 == "Resource" then
                    v144 = v12:GetGold(v137);
                end;
                v143.GOLD = v144;
                v142.Stats = v143;
                v142.Equipped = table.find(v68._loadout, v12:CreateLoadoutString(v138, v139)) ~= nil;
                table.insert(l__unitsArray_1, v142);
                if v33:GetToggleState(script.Name) then
                    v68:GenerateUnitButton(v138, v139, 1);
                    l_v68_0 = l_v68_0 + 1;
                    if l_v68_0 % 25 == 0 then
                        l_RunService_0.RenderStepped:Wait();
                    end;
                end;
            end;
        end;
        if v68._filteredUnits then
            v68:SortUnits(v68._filteredUnits);
        else
            v68:SortUnits(v68._unitsArray);
        end;
        v68:UpdateButtonOrders();
    end);
    v35.UnitsRemoved:Connect(function(v145) --[[ Line: 874 ]]
        -- upvalues: v68 (copy), v12 (ref), v7 (ref), l_RunService_0 (ref)
        local l_v68_1 = v68;
        l_v68_1._totalUnits = l_v68_1._totalUnits - #v145;
        v68:_updateUnitCount();
        l_v68_1 = {};
        for _, v148 in v145 do
            local v149, v150 = v12:ParseLoadout(v148);
            if v150 then
                l_v68_1[v150] = true;
                if v68._units[v149] and v68._units[v149][v150] then
                    v68._units[v149][v150] = nil;
                end;
                if v68._selectedUnit and v68._selectedUnit.Info.UID == v150 then
                    v68:DeselectUnit();
                end;
            end;
        end;
        v68._unitsArray = v7.Filter(v68._unitsArray, function(v151) --[[ Line: 899 ]]
            -- upvalues: l_v68_1 (copy)
            return not l_v68_1[v151.UID];
        end);
        if v68._filteredUnits then
            v68._filteredUnits = v7.Filter(v68._filteredUnits, function(v152) --[[ Line: 908 ]]
                -- upvalues: l_v68_1 (copy)
                return not l_v68_1[v152.UID];
            end);
        end;
        for v153, v154 in v145 do
            local v155, v156 = v12:ParseLoadout(v154);
            if v68._unitButtons[v155] and v68._unitButtons[v155][v156] then
                v68._unitButtons[v155][v156]:Destroy();
                v68._unitButtons[v155][v156] = nil;
            end;
            if v153 % 25 == 0 then
                l_RunService_0.RenderStepped:Wait();
            end;
        end;
    end);
    v35.UnitDataUpdated:Connect(function(v157, v158, v159) --[[ Line: 929 ]]
        -- upvalues: v12 (ref), v68 (copy), v64 (ref), v7 (ref), v42 (ref)
        local v160, v161 = v12:ParseLoadout(v157);
        if not v68._units[v160] then
            v68._units[v160] = {};
        end;
        v68._units[v160][v161] = v158;
        local l_Mode_0 = v64:GetState().Mode;
        v68:UpdateUnitButton(v160, v161, l_Mode_0);
        if v68._selectedUnit then
            if v68._selectedUnit.Info.UID == v161 then
                v68._selectedUnit.Info.Data = v158;
            end;
            v68:UpdateSelectedUnit();
        end;
        local v165 = select(2, v7.Find(v68._unitsArray, function(v163) --[[ Line: 950 ]]
            -- upvalues: v160 (copy), v161 (copy)
            local v164 = false;
            if v163.Name == v160 then
                v164 = v163.UID == v161;
            end;
            return v164;
        end));
        if not v165 then
            return;
        else
            local v166 = v68._unitsArray[v165];
            v166.Data = v158;
            local _ = v42:GetEquippedPets();
            if v166.Stats.TYPE ~= "Resource" then
                v166.Stats.DMG = v12:GetTotalDamage(v158);
                v166.Stats.RNG = v12:GetRange(v158);
                v166.Stats.SPA = v12:GetAttackCooldown(v158);
            else
                v166.Stats.GOLD = v12:GetGold(v158);
            end;
            if v159 then
                return;
            else
                table.insert(v68.updatedUnitData, {
                    name = v160, 
                    uid = v161, 
                    data = v158
                });
                return;
            end;
        end;
    end);
    v26.Simple(1, function() --[[ Line: 984 ]]
        -- upvalues: v68 (copy)
        if #v68.updatedUnitData < 1 then
            return;
        else
            table.clear(v68.updatedUnitData);
            if v68._filteredUnits then
                v68:SortUnits(v68._filteredUnits);
            else
                v68:SortUnits(v68._unitsArray);
            end;
            v68:UpdateButtonOrders();
            return;
        end;
    end);
    v35.UnitEquipped:Connect(function(_, v169) --[[ Line: 1000 ]]
        -- upvalues: v7 (ref), v68 (copy)
        local _, v172 = v7.Find(v68._unitsArray, function(v170) --[[ Line: 1001 ]]
            -- upvalues: v169 (copy)
            return v170.UID == v169;
        end);
        if v172 then
            v68._unitsArray[v172].Equipped = true;
            v68:SortUnits(v68._unitsArray);
            v68:UpdateButtonOrders();
        end;
    end);
    v35.UnitUnequipped:Connect(function(_, v174) --[[ Line: 1013 ]]
        -- upvalues: v7 (ref), v68 (copy)
        local _, v177 = v7.Find(v68._unitsArray, function(v175) --[[ Line: 1014 ]]
            -- upvalues: v174 (copy)
            return v175.UID == v174;
        end);
        if v177 then
            v68._unitsArray[v177].Equipped = false;
            v68:SortUnits(v68._unitsArray);
            v68:UpdateButtonOrders();
        end;
    end);
    v35.UnitFavoriteToggled:Connect(function(_, v179, v180) --[[ Line: 1026 ]]
        -- upvalues: v7 (ref), v68 (copy)
        local _, v183 = v7.Find(v68._unitsArray, function(v181) --[[ Line: 1027 ]]
            -- upvalues: v179 (copy)
            return v181.UID == v179;
        end);
        if not v183 then
            return;
        else
            v68._unitsArray[v183].Data.Favorite = v180;
            v68:SortUnits(v68._unitsArray);
            v68:UpdateButtonOrders();
            return;
        end;
    end);
    v68:_connectFilterFrame();
    v68:_connectSearchBar();
    local v184 = TweenInfo.new(10, Enum.EasingStyle.Linear);
    local v185 = l_TweenService_0:Create(v68.unitInfoFrame.BG, v184, {
        Position = UDim2.fromScale(1, 1)
    });
    local v186 = l_TweenService_0:Create(v68.unitInfoFrame.BG, v184, {
        Position = UDim2.fromScale(0.5, 0.5)
    });
    v185.Completed:Connect(function() --[[ Line: 1053 ]]
        -- upvalues: v186 (copy)
        v186:Play();
    end);
    v186.Completed:Connect(function() --[[ Line: 1057 ]]
        -- upvalues: v185 (copy)
        v185:Play();
    end);
    local function v194(v187, v188) --[[ Line: 1063 ]] --[[ Name: cacheProps ]]
        -- upvalues: v55 (ref), v29 (ref)
        for v189, v190 in v55 do
            local v191 = v29(v187, v189, nil, "/");
            if v191 then
                v188[v189] = {};
                for _, v193 in v190 do
                    v188[v189][v193] = v191[v193];
                end;
            end;
        end;
    end;
    v194(v68.tabButtons.Units, v56.SELECTED);
    v194(v68.tabButtons.Pets, v56.DESELECTED);
    v33:HandleButton(v68.tabButtons.Units, function() --[[ Line: 1082 ]]
        -- upvalues: v68 (copy)
        v68:SetTab("Units");
    end);
    v33:HandleButton(v68.tabButtons.Pets, function() --[[ Line: 1086 ]]
        -- upvalues: v68 (copy)
        v68:SetTab("Pets");
    end);
    v185:Play();
end;
v59.Opening = function(v195) --[[ Line: 1093 ]] --[[ Name: Opening ]]
    -- upvalues: v50 (ref)
    local l_v195_Tab_0 = v195:GetTab();
    if not l_v195_Tab_0 then
        v195:SetTab("Units", true);
        v195.firstOpen = true;
    else
        v50:SwitchHotbar(l_v195_Tab_0);
    end;
    if l_v195_Tab_0 == "Units" then
        v50:ToggleUnitReplacement(false);
    elseif l_v195_Tab_0 == "Pets" then
        v50:TogglePetReplacement(false);
    end;
    v195.filterFrame.Visible = false;
    v195.selectUnitPreview.Visible = true;
    v195.previewFrame.ExistingCount.Visible = false;
    v195.unitInfoFrame.Visible = false;
end;
v59.Opened = function(v197) --[[ Line: 1114 ]] --[[ Name: Opened ]]
    -- upvalues: v50 (ref), v28 (copy)
    v50:ToggleBottomLobbyFrame(false);
    if v197.firstOpen then
        v197.firstOpen = false;
        return;
    elseif v197:GetTab() == "Units" then
        v197:_loadUnits();
        return;
    else
        if v197:GetTab() == "Pets" then
            v28:Load();
        end;
        return;
    end;
end;
v59.Closed = function(v198) --[[ Line: 1132 ]] --[[ Name: Closed ]]
    -- upvalues: v64 (copy), v33 (ref), v27 (copy), v51 (copy), v52 (copy), v28 (copy)
    if v64:GetState().Mode == "ExchangeSelection" then
        v33:Toggle("BemmyBuddy", true);
    end;
    if v198._stateData and v198._stateData.callback then
        if v198._stateData.returnToMenu then
            v33:Toggle(v198._stateData.returnToMenu, true);
        end;
        v198._stateData.callback();
    end;
    v27:ToggleFrame(false);
    v198.highPriority = false;
    v198.ToggleAll = v51;
    v198.main.Position = v52;
    if v198.unitsDump then
        v198.unitsDump:Destroy();
    end;
    if v28.dumpster then
        v28.dumpster:Destroy();
    end;
    v198:DeselectUnit();
    v198._filterBackup = nil;
    v198:_clearFilter();
    v198._lastSearchTerm = nil;
    v198.searchBar.Text = "";
    if v198._filteredUnits then
        table.clear(v198._filteredUnits);
        v198._filteredUnits = nil;
    end;
    v33:Toggle("MessagePrompt", false);
    v198.filterFrame.Visible = false;
    v198:SetState("Normal");
    v198:HideHoverTooltip();
    v198.hoverCancelTag = nil;
end;
v59.Closing = function(_) --[[ Line: 1186 ]] --[[ Name: Closing ]]
    -- upvalues: v50 (ref)
    v50:ToggleBottomLobbyFrame(true);
    if not v50._selectedPetData then
        v50:SwitchHotbar("Units");
    end;
end;
local function v208(v200, v201) --[[ Line: 1194 ]] --[[ Name: changeButtonColors ]]
    -- upvalues: v56 (copy), v29 (copy)
    local v202 = v201 and v56.SELECTED or v56.DESELECTED;
    for v203, v204 in v202 do
        local v205 = v29(v200, v203, nil, "/");
        if v205 then
            for v206, v207 in v204 do
                v205[v206] = v207;
            end;
        end;
    end;
end;
v59.GetTab = function(v209) --[[ Line: 1210 ]] --[[ Name: GetTab ]]
    return v209._currentTab;
end;
v59.SetTab = function(v210, v211, v212) --[[ Line: 1214 ]] --[[ Name: SetTab ]]
    -- upvalues: v64 (copy), v58 (copy), v208 (copy), v50 (ref), v28 (copy)
    if not v212 and v210._currentTab == v211 then
        return;
    else
        v210._currentTab = v211;
        if v210.unitsDump then
            v210.unitsDump:Destroy();
        end;
        v210:DeselectUnit();
        local v213 = true;
        local l_v64_State_1 = v64:GetState();
        if not v58[l_v64_State_1.Mode] then
            v210:SetFilter(nil);
            v210:SetState("Normal");
            v213 = false;
        else
            table.clear(v210._currentFilter);
            v210._currentFilter.ExcludeFavoriteUnits = true;
            v210:FilterUnits(v210._currentFilter);
            v213 = false;
            local l__filteredUnits_0 = v210._filteredUnits;
            v210.content.NotEnoughDuplicates.Visible = #l__filteredUnits_0 < 1;
        end;
        if v211 then
            local v216 = string.sub(string.lower(v211), 1, string.len(v211) - 1);
            v210.content.NotEnoughDuplicates.Text = ("Not enough duplicates of any %* for Fusion"):format(v216);
            v210.content.Bottom.Fusions.Text = ("Select a %* for Fusion"):format(v216);
            v210.content.Bottom.Feeding.Text = ("Select a %* to Feed"):format(v216);
        end;
        v208(v210.tabButtons.Pets, v211 == "Pets");
        v208(v210.tabButtons.Units, v211 == "Units");
        v50:SwitchHotbar(v211);
        local v217 = v211 == "Units";
        v210.topBar.Filter.Visible = v217;
        v210.topBar.Team.Visible = v217 and l_v64_State_1.Mode == "Normal";
        v210.titleLabel.Text = v211;
        v210.selectUnitPreview.Frame.Title2.Text = string.upper((("A %*"):format((string.sub(v211, 1, string.len(v211) - 1)))));
        if v211 == "Pets" then
            if v213 then
                v28:Load();
            end;
            v210:_updatePetsCount();
            return;
        else
            v210:_updateUnitCount();
            if v213 then
                v210:_loadUnits();
            end;
            return;
        end;
    end;
end;
v59.SetFilter = function(v218, v219) --[[ Line: 1289 ]] --[[ Name: SetFilter ]]
    -- upvalues: v28 (copy)
    if not v219 then
        v218._lastSearchTerm = nil;
    end;
    v218._filteredUnits = v219;
    if v218:GetTab() == "Pets" then
        v28:Load(v218._filteredUnits);
        return;
    else
        v218:_loadUnits();
        return;
    end;
end;
v59.FilterUnits = function(v220, v221) --[[ Line: 1304 ]] --[[ Name: FilterUnits ]]
    -- upvalues: v64 (copy), v34 (ref), v5 (copy), v12 (copy), v28 (copy), v7 (copy)
    local l_Mode_1 = v64:GetState().Mode;
    local v223 = {};
    for _, v225 in (v34:Get(v5.Player, "RoguelikeLoadout"):expect()) do
        if v225 ~= "" then
            v223[v12:ParseLoadout(v225)] = true;
        end;
    end;
    local v226 = v220:GetTab() == "Pets" and v28:GetArray() or v220._unitsArray;
    local v238 = v7.Filter(v226, function(v227) --[[ Line: 1336 ]]
        -- upvalues: v220 (copy), v12 (ref), v221 (copy), l_Mode_1 (copy), v223 (copy)
        local v228 = nil;
        if v220:GetTab() == "Units" then
            v228 = v12:GetUnitValue(v227.Name, "Type");
        end;
        if v221.Name and not string.find(string.lower(v227.FullName or v227.Name), string.lower(v221.Name)) then
            return false;
        elseif v221.ExcludeResourceUnits and (v228 == "Resource" or v227.Data.Traitless or v227.Data.Temporary) then
            return false;
        elseif v221.ExcludeFavoriteUnits and v227.Data.Favorite then
            return false;
        elseif l_Mode_1 == "FeedSelection" and (v227.Data.Foodless or v227.Data.Temporary) then
            return false;
        elseif v221.ExcludeRoguelikeLoadout and v223[v227.Name] then
            return false;
        elseif v221.ExcludedUnits and v221.ExcludedUnits[v227.Name] then
            return false;
        else
            if v221.UnitType or v221.UnitVariant then
                local v229 = false;
                local v230 = v221.UnitType or v221.UnitVariant;
                for v231 in v230 do
                    if v231 == "ShinyWumbo" then
                        if v227.Data.Shiny and v227.Data.Mega then
                            v229 = true;
                            break;
                        end;
                    elseif v231 == "Basic" then
                        if v227.Data.Shiny or v227.Data.Mega then
                            return false;
                        else
                            v229 = true;
                            break;
                        end;
                    elseif v227.Data.Shiny and v227.Data.Mega then
                        return false;
                    elseif v227.Data[v231] then
                        v229 = true;
                        break;
                    end;
                end;
                if not v229 then
                    return false;
                end;
            end;
            if v221.AttackType then
                local v232 = false;
                for v233 in v221.AttackType do
                    if v228 == v233 then
                        v232 = true;
                        break;
                    end;
                end;
                if not v232 then
                    return false;
                end;
            end;
            if l_Mode_1 == "ExchangeSelection" and v227.Rarity ~= "Rare" then
                return false;
            elseif v221.UnitRarity and next(v221.UnitRarity) ~= nil and not v221.UnitRarity[v227.Rarity] then
                return false;
            else
                if v221.UnitTraitExclusions and next(v221.UnitTraitExclusions) ~= nil then
                    local v234 = false;
                    for v235 in v221.UnitTraitExclusions do
                        if v227.Data.Trait and v227.Data.Trait.Name == v235 then
                            v234 = true;
                            break;
                        elseif v227.Data.Trait2 and v227.Data.Trait2.Name == v235 then
                            v234 = true;
                            break;
                        end;
                    end;
                    if v234 then
                        return false;
                    end;
                end;
                if v221.UnitTraits and next(v221.UnitTraits) ~= nil then
                    local v236 = false;
                    for v237 in v221.UnitTraits do
                        if v227.Data.Trait and v227.Data.Trait.Name == v237 then
                            v236 = true;
                            break;
                        elseif v227.Data.Trait2 and v227.Data.Trait2.Name == v237 then
                            v236 = true;
                            break;
                        end;
                    end;
                    if not v236 then
                        return false;
                    end;
                end;
                if v221.ExcludeNeptunesCrown and v227.Data.Trait ~= nil and v227.Data.Trait2 ~= nil then
                    return false;
                elseif v221.ExcludeShinyWumbo and v227.Data.Shiny and v227.Data.Mega then
                    return false;
                else
                    return true;
                end;
            end;
        end;
    end);
    if v221.Stat then
        table.sort(v238, function(v239, v240) --[[ Line: 1487 ]]
            -- upvalues: v221 (copy)
            return v239.Stats[v221.Stat] > v240.Stats[v221.Stat];
        end);
    end;
    v220:SetFilter(v238);
end;
v59.GenerateUnitButton = function(v241, v242, v243, v244, v245) --[[ Line: 1495 ]] --[[ Name: GenerateUnitButton ]]
    -- upvalues: v12 (copy), v33 (ref), v21 (copy), v23 (copy), v17 (copy), v24 (copy), v38 (ref), l_GuiService_0 (copy)
    if not v242 or not v243 then
        return;
    elseif v241._unitButtons[v242] and v241._unitButtons[v242][v243] then
        return;
    else
        local l_v12_LoadoutString_1 = v12:CreateLoadoutString(v242, v243);
        local v247 = v241.unitTemplate:Clone();
        v247.Name = l_v12_LoadoutString_1;
        v247.Parent = v241.unitsBin;
        local _, v249 = v12:GetRarity(v242);
        if not v241._unitButtons[v242] then
            v241._unitButtons[v242] = {};
        end;
        v241._unitButtons[v242][v243] = v247;
        v241:UpdateUnitButton(v242, v243, v245);
        local function _() --[[ Line: 1521 ]] --[[ Name: getUnitInfo ]]
            -- upvalues: v242 (copy), v243 (copy), v241 (copy), v12 (ref)
            return {
                Name = v242, 
                UID = v243, 
                Data = v241._units[v242][v243], 
                UnitType = v12:GetUnitValue(v242, "Type")
            };
        end;
        local v251 = v33:HandleButton(v247, function() --[[ Line: 1530 ]]
            -- upvalues: v241 (copy), v247 (ref), v242 (copy), v243 (copy), v12 (ref)
            v241:ProcessUnitClicked(v247, {
                Name = v242, 
                UID = v243, 
                Data = v241._units[v242][v243], 
                UnitType = v12:GetUnitValue(v242, "Type")
            });
        end, {
            MouseEnter = function() --[[ Line: 1533 ]] --[[ Name: MouseEnter ]]
                -- upvalues: v241 (copy), v247 (ref), v242 (copy), v243 (copy), v12 (ref)
                v241:ShowHoverTooltip(v247, {
                    Name = v242, 
                    UID = v243, 
                    Data = v241._units[v242][v243], 
                    UnitType = v12:GetUnitValue(v242, "Type")
                });
            end, 
            MouseLeave = function() --[[ Line: 1537 ]] --[[ Name: MouseLeave ]]
                -- upvalues: v241 (copy), v247 (ref), v242 (copy), v243 (copy), v12 (ref)
                v241:HideHoverTooltip(v247, {
                    Name = v242, 
                    UID = v243, 
                    Data = v241._units[v242][v243], 
                    UnitType = v12:GetUnitValue(v242, "Type")
                });
            end
        });
        local v252 = v241._units[v242][v243];
        if not v252 then
            v247:Destroy();
            v247 = nil;
            v241._unitButtons[v242][v243] = nil;
            return;
        else
            v247.Content.Info.Shiny.Visible = v252.Shiny or false;
            v247.Content.Info.Wumbo.Visible = v252.Mega or false;
            local l_ImageLabel_0 = v247.Content.Info.Traits.Trait:FindFirstChildOfClass("ImageLabel");
            if l_ImageLabel_0 then
                l_ImageLabel_0:Destroy();
            end;
            local l_ImageLabel_1 = v247.Content.Info.Traits.Trait2:FindFirstChildOfClass("ImageLabel");
            if l_ImageLabel_1 then
                l_ImageLabel_1:Destroy();
            end;
            v247.Content.Info.Traits.Trait.Visible = v252.Trait ~= nil;
            v247.Content.Info.Traits.Trait2.Visible = v252.Trait2 ~= nil;
            local l_Traits_0 = v247.Content.Info.Traits;
            local v256 = true;
            if v252.Trait == nil then
                v256 = v252.Trait2 ~= nil;
            end;
            l_Traits_0.Visible = v256;
            if v252.Trait ~= nil then
                v21:CreateTraitIcon(v252.Trait.Name, v247.Content.Info.Traits.Trait);
            end;
            if v252.Trait2 ~= nil then
                v21:CreateTraitIcon(v252.Trait2.Name, v247.Content.Info.Traits.Trait2);
            end;
            local v257 = "Trait";
            local v258 = v252.Trait and v252.Trait.Name;
            v247:SetAttribute(v257, v258);
            v257 = "Trait2";
            v258 = v252.Trait2 and v252.Trait2.Name;
            v247:SetAttribute(v257, v258);
            v247.Content.Info.Relic.Visible = v252.Relic ~= nil;
            if v252.Relic then
                v23:CreateRelicIcon(v247.Content.Info.Relic, v252.Relic);
            end;
            v247.Content.Info.Favorite.Visible = v252.Favorite or false;
            v247.Content.Info.Stars.Visible = v252.Stars > 0;
            v247.LayoutOrder = v241:_getLayoutOrder(v252, v243, v244);
            if v252.Stars > 0 then
                v247.Content.Info.Stars.Main.Amount.Text = v252.Stars;
                for v259 = 2, 5 do
                    v247.Content.Info.Stars[tostring(v259)].Visible = v259 <= v252.Stars;
                end;
            end;
            if v241._uidsForSale and v241._uidsForSale[l_v12_LoadoutString_1] then
                v247.Content.ForSale.Visible = true;
            end;
            v251:Add(v17.new(v247.Content.Info.Backdrop, v249));
            v251:Add(v17.new(v247.Content.Glow, v249));
            l_Traits_0 = v24:CreateImage(v242, {
                Size = UDim2.fromScale(1, 1), 
                Parent = v247.Content.Info, 
                ZIndex = 2
            });
            if l_Traits_0 then
                v251:Add(l_Traits_0);
            end;
            if v244 == 1 and v38:GetDeviceType() == "Console" then
                l_GuiService_0.SelectedObject = v247;
            end;
            return;
        end;
    end;
end;
v59.UpdateUnitButton = function(v260, v261, v262, v263) --[[ Line: 1619 ]] --[[ Name: UpdateUnitButton ]]
    -- upvalues: v28 (copy), v13 (copy), v12 (copy), v53 (copy), v21 (copy), v23 (copy)
    local v264 = nil;
    v264 = if v260:GetTab() == "Pets" then v28:GetButton(v261, v262) else v260._unitButtons[v261] and v260._unitButtons[v261][v262];
    if not v264 then
        return;
    else
        local v265 = nil;
        if v260:GetTab() == "Pets" then
            v265 = v28._pets[v261] and v28._pets[v261][v262];
        elseif not v260._units[v261] then
            warn("[UpdateUnitButton]: missing from data main unit name");
            return;
        else
            v265 = v260._units[v261][v262];
        end;
        if not v265 then
            warn("[UpdateUnitButton]: missing from data unit uid");
            return;
        else
            if v263 ~= "Sell" then
                v264.Content.ForSale.Visible = false;
            end;
            local v266 = nil;
            local v267 = nil;
            if v260:GetTab() == "Pets" then
                v266 = v13:GetPetValue(v261, "FullName");
            else
                v266 = v12:GetUnitValue(v261, "FullName");
                v267 = v12:GetUnitValue(v261, "Cost");
            end;
            v264.Content.Info.Shiny.Visible = v265.Shiny or false;
            v264.Content.Info.Wumbo.Visible = v265.Mega or false;
            v264.Content.Trading.Visible = v260._tradingUnits[v262];
            v264.Content.Equipped.Visible = v260:_isEquipped(v261, v262);
            v264.Content.Info.Cost.Visible = not v53[v263];
            v264.Content.Info.Cost.Amount.Text = v267 or 0;
            v264.Content.Info.UnitName.Text = v266 or v261;
            v264.Content.Info.Level.RichText = true;
            v264.Content.Info.Level.Text = ("LVL <font color=\"#FFFF00\">%*</font>"):format(v265.Level or 1);
            if v260:GetTab() == "Pets" then
                v264.Content.Info.Cost.Visible = false;
            end;
            local l_v264_Attribute_0 = v264:GetAttribute("Trait");
            local l_v264_Attribute_1 = v264:GetAttribute("Trait2");
            local v270 = false;
            if v265.Trait and v265.Trait.Name ~= l_v264_Attribute_0 then
                v270 = true;
                v264.Content.Info.Traits.Trait.Visible = v265.Trait ~= nil;
                v264:SetAttribute("Trait", v265.Trait and v265.Trait.Name);
                local l_ImageLabel_2 = v264.Content.Info.Traits.Trait:FindFirstChildOfClass("ImageLabel");
                if l_ImageLabel_2 then
                    l_ImageLabel_2:Destroy();
                end;
                if v265.Trait ~= nil then
                    v21:CreateTraitIcon(v265.Trait.Name, v264.Content.Info.Traits.Trait);
                end;
            end;
            if v265.Trait2 and v265.Trait2.Name ~= l_v264_Attribute_1 then
                v270 = true;
                v264.Content.Info.Traits.Trait2.Visible = v265.Trait2 ~= nil;
                v264:SetAttribute("Trait2", v265.Trait2 and v265.Trait2.Name);
                local l_ImageLabel_3 = v264.Content.Info.Traits.Trait2:FindFirstChildOfClass("ImageLabel");
                if l_ImageLabel_3 then
                    l_ImageLabel_3:Destroy();
                end;
                if v265.Trait2 ~= nil then
                    v21:CreateTraitIcon(v265.Trait2.Name, v264.Content.Info.Traits.Trait2);
                end;
            end;
            if v270 then
                local l_Traits_1 = v264.Content.Info.Traits;
                local v274 = true;
                if v265.Trait == nil then
                    v274 = v265.Trait2 ~= nil;
                end;
                l_Traits_1.Visible = v274;
            end;
            v264.Content.Info.Relic.Visible = v265.Relic ~= nil;
            if v265.Relic then
                v23:CreateRelicIcon(v264.Content.Info.Relic, v265.Relic);
            end;
            v264.Visible = true;
            return;
        end;
    end;
end;
v59.UpdateButtonOrders = function(v275) --[[ Line: 1725 ]] --[[ Name: UpdateButtonOrders ]]
    for v276, v277 in v275._unitsArray do
        local l_Name_1 = v277.Name;
        local l_UID_1 = v277.UID;
        local v280 = v275._unitButtons[l_Name_1] and v275._unitButtons[l_Name_1][l_UID_1];
        if v280 then
            local v281 = v275:_isEquipped(l_Name_1, l_UID_1);
            v280.Content.Equipped.Visible = v281;
            v280.Content.Info.Favorite.Visible = v277.Data and v277.Data.Favorite or false;
            v280.LayoutOrder = v275:_getLayoutOrder(v277.Data, l_UID_1, v276);
        end;
    end;
end;
v59.ProcessUnitClicked = function(v282, ...) --[[ Line: 1744 ]] --[[ Name: ProcessUnitClicked ]]
    -- upvalues: v64 (copy)
    if v64:GetState().Mode == "Sell" then
        v282:ToggleForSale(...);
        return;
    else
        v282:SelectUnit(...);
        return;
    end;
end;
v59.ShowHoverTooltip = function(v283, v284, v285) --[[ Line: 1757 ]] --[[ Name: ShowHoverTooltip ]]
    -- upvalues: v13 (copy), v12 (copy), v6 (copy), v17 (copy), v39 (ref), v40 (ref), v23 (copy)
    if v283.hoverCancelTag then
        return;
    elseif v283._hoveringInfo and v283._hoveringInfo.UID == v285.UID then
        return;
    elseif not v285 or not v285.Data or not v285.UID then
        return;
    else
        v283._hoveringInfo = v285;
        local v286 = v285.Data.Level or 1;
        local v287 = nil;
        v287 = if v285.IsPet then select(2, v13:GetRarity(v285.Name)) else select(2, v12:GetRarity(v285.Name));
        if v283._hoverDump then
            v283._hoverDump:Destroy();
            v283._hoverDump = nil;
        end;
        v283._hoverDump = v6.new();
        v283._hoverDump:Add(v17.new(v283.hoverTooltip, v287));
        v283._hoverDump:Add(v17.new(v283.hoverTooltip.Content.UIStroke, v287));
        v283._hoverDump:Add(v17.new(v283.hoverTooltip.Content.Characteristics.UnitTags.Rarity, v287));
        v283.hoverTooltip.Content.ExistingCount.Visible = false;
        v283._hoverDump:Add(v39:ApplyCountToLabel(v285.Name, v285.Data, v283.hoverTooltip.Content.ExistingCount, v285.IsPet, "%s Exist", false):andThen(function(v288, v289) --[[ Line: 1802 ]]
            -- upvalues: v283 (copy)
            if not v288 then
                return;
            else
                v283.hoverTooltip.Content.ExistingCount.Visible = true;
                v283._hoverDump:Add(v289);
                return;
            end;
        end));
        v283.hoverTooltip.Content.Serial.Visible = false;
        v283.hoverTooltip.Content.MintedBy.Visible = false;
        if not v285.Data.Temporary then
            v283._hoverDump:Add(v40:ApplyMintToLabel(v285.Name, v285.UID, v285.Data, v283.hoverTooltip.Content.Serial, v285.IsPet and "Pets" or "Units", "#%s"):andThen(function(v290, v291) --[[ Line: 1824 ]]
                -- upvalues: v285 (copy), v40 (ref), v283 (copy)
                if not v290 then
                    return;
                else
                    if v285.Data.MintedBy ~= nil then
                        v40:ApplyMintedByToLabel(v285.Data, v283.hoverTooltip.Content.MintedBy):andThen(function() --[[ Line: 1833 ]]
                            -- upvalues: v283 (ref)
                            v283.hoverTooltip.Content.MintedBy.Visible = true;
                        end);
                    end;
                    v283.hoverTooltip.Content.Serial.Visible = true;
                    v283._hoverDump:Add(v291);
                    return;
                end;
            end));
        end;
        local v292 = nil;
        v292 = if v285.IsPet then v13:GetPetValue(v285.Name, "FullName") else v12:GetUnitValue(v285.Name, "FullName");
        v283.hoverTooltip.Content.UnitName.UnitName.Text = v292;
        v283.hoverTooltip.Content.Characteristics.UnitTags.Rarity.Text = v287;
        v283.hoverTooltip.Content.Characteristics.UnitTags.ShinyStatus.Visible = v285.Data.Shiny or false;
        v283.hoverTooltip.Content.Characteristics.UnitTags.WumboStatus.Visible = v285.Data.Mega or false;
        v283.hoverTooltip.Content.Level.Level.RichText = true;
        v283.hoverTooltip.Content.Level.Level.Text = ("Level <font color=\"#FFFF00\">%*</font>"):format(v286);
        local v293 = nil;
        local v294 = nil;
        if v285.IsPet then
            v293 = v13:GetNextLevelCost(v285.Data);
            v294 = v13:GetMaxLevel(v285.Data);
        else
            v293 = v12:GetNextLevelCost(v285.Data);
            v294 = v12:GetMaxLevel(v285.Data);
        end;
        if v294 <= v286 then
            v283.hoverTooltip.Content.Level.XPBar.Fill.Size = UDim2.fromScale(1, 1);
            v283.hoverTooltip.Content.Level.XPBar.Progression.Text = "(MAX)";
        else
            v283.hoverTooltip.Content.Level.XPBar.Fill.Size = UDim2.fromScale(math.clamp(v285.Data.Experience / v293, 0, 1), 1);
            v283.hoverTooltip.Content.Level.XPBar.Progression.Text = ("%*/%*"):format(math.round(v285.Data.Experience), v293);
        end;
        local l_Values_0 = v283.hoverTooltip.Content.Characteristics.Stats.Values;
        v23:IterateClass(l_Values_0, "Frame", function(v296) --[[ Line: 1894 ]]
            v296.Visible = false;
        end);
        if not v285.IsPet and v285.UnitType == "Resource" then
            l_Values_0.GOLD.StatAmount.Text = v12:GetGold(v285.Data);
        elseif not v285.IsPet then
            l_Values_0.DMG.StatAmount.Text = v12:GetTotalDamage(v285.Data);
            l_Values_0.RNG.StatAmount.Text = v12:GetRange(v285.Data);
            l_Values_0.SPA.StatAmount.Text = v12:GetAttackCooldown(v285.Data);
            v23:IterateClass(l_Values_0, "Frame", function(v297) --[[ Line: 1905 ]]
                local v298 = false;
                if v297.Name ~= "GOLD" then
                    v298 = v297.Name ~= "PLC";
                end;
                v297.Visible = v298;
            end);
        else
            local v299 = v13:GetDamageBuff(v285.Data) or 0;
            local v300 = v13:GetRangeBuff(v285.Data) or 0;
            local v301 = v13:GetCooldownBuff(v285.Data) or 0;
            local v302 = v13:GetGoldBuff(v285.Data) or 0;
            local v303 = v13:GetPlacementBuff(v285.Data) or 0;
            local function _(v304, v305, v306) --[[ Line: 1915 ]] --[[ Name: fillStatLabel ]]
                local v307 = v305 > 0 and "+" or "";
                local v308 = v306 and "" or "%";
                v304.StatAmount.Text = ("%*%*%*"):format(v307, v305, v308);
                v304.Visible = v305 ~= 0;
            end;
            local l_DMG_0 = l_Values_0.DMG;
            local v311 = v299 > 0 and "+" or "";
            l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v311, v299);
            l_DMG_0.Visible = v299 ~= 0;
            l_DMG_0 = l_Values_0.RNG;
            v311 = v300 > 0 and "+" or "";
            l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v311, v300);
            l_DMG_0.Visible = v300 ~= 0;
            l_DMG_0 = l_Values_0.SPA;
            v311 = v301 > 0 and "+" or "";
            l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v311, v301);
            l_DMG_0.Visible = v301 ~= 0;
            l_DMG_0 = l_Values_0.GOLD;
            v311 = v302 > 0 and "+" or "";
            l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v311, v302);
            l_DMG_0.Visible = v302 ~= 0;
            l_DMG_0 = l_Values_0.PLC;
            v311 = v303 > 0 and "+" or "";
            l_DMG_0.StatAmount.Text = ("%*%*"):format(v311, v303);
            l_DMG_0.Visible = v303 ~= 0;
        end;
        v283.hoverTooltip.Content.Level.Unsorted.Stars.Visible = v285.Data.Stars > 0;
        if v285.Data.Stars > 0 then
            v283.hoverTooltip.Content.Level.Unsorted.Stars.Main.Amount.Text = v285.Data.Stars;
            for v312 = 2, 5 do
                v283.hoverTooltip.Content.Level.Unsorted.Stars[tostring(v312)].Visible = v312 <= v285.Data.Stars;
            end;
        end;
        v283.hoverTooltip.Content.UnitName.AttackType.Visible = false;
        if not v285.IsPet then
            v283.hoverTooltip.Content.UnitName.AttackType.Icon.Image = v23:GetAttackTypeIcon(v285.UnitType);
            v283.hoverTooltip.Content.UnitName.AttackType.Visible = true;
            local l_v12_PrimaryEffect_0 = v12:GetPrimaryEffect(v285.Name);
            v283.hoverTooltip.Content.UnitName.AttackType.EffectType.Visible = l_v12_PrimaryEffect_0 ~= nil;
            if l_v12_PrimaryEffect_0 then
                v283.hoverTooltip.Content.UnitName.AttackType.EffectType.Icon.Image = v23:GetEffectIcon(l_v12_PrimaryEffect_0);
                v283.hoverTooltip.Content.UnitName.AttackType.EffectType.UIGradient.Color = v23:GetEffectColor(l_v12_PrimaryEffect_0);
            end;
        end;
        v283.hoverTooltip.Visible = true;
        v283:AlignTooltip(v284, v283.hoverTooltip);
        return;
    end;
end;
v59.HideHoverTooltip = function(v314, v315, v316) --[[ Line: 1958 ]] --[[ Name: HideHoverTooltip ]]
    if not v315 or not v316 then
        v314._hoveringInfo = nil;
        v314.hoverTooltip.Visible = false;
        return;
    elseif v314._hoveringInfo and v314._hoveringInfo.UID ~= v316.UID then
        return;
    else
        if v314._hoverDump then
            v314._hoverDump:Destroy();
            v314._hoverDump = nil;
        end;
        v314._hoveringInfo = nil;
        v314.hoverTooltip.Visible = false;
        return;
    end;
end;
v59.AlignTooltip = function(_, v318, v319) --[[ Line: 1980 ]] --[[ Name: AlignTooltip ]]
    local l_AbsolutePosition_0 = v319.Parent.AbsolutePosition;
    local l_AbsolutePosition_1 = v318.AbsolutePosition;
    local l_AbsoluteSize_0 = v318.AbsoluteSize;
    local l_Offset_0 = v318.Parent.UIPadding.PaddingLeft.Offset;
    local v324 = l_AbsolutePosition_1.X - l_AbsolutePosition_0.X - l_Offset_0 + l_AbsoluteSize_0.X;
    local v325 = l_AbsolutePosition_1.Y - l_AbsolutePosition_0.Y - l_AbsoluteSize_0.Y * 0.25;
    v319.Position = UDim2.new(0, v324, 0, v325);
end;
v59.ToggleForSale = function(v326, v327, v328) --[[ Line: 1994 ]] --[[ Name: ToggleForSale ]]
    -- upvalues: v48 (ref), v12 (copy), v13 (copy), v15 (copy), v7 (copy), v23 (copy)
    if v328 and v328.Data and (v328.Data.Favorite or v328.Data.Priceless or v328.Data.Temporary) then
        v48:Notify({
            message = "You cannot sell this unit", 
            duration = 3, 
            isPositive = false
        });
        return;
    else
        local l_v12_LoadoutString_2 = v12:CreateLoadoutString(v328.Name, v328.UID);
        local v330 = nil;
        v330 = if v326:GetTab() == "Pets" then select(2, v13:GetRarity(v328.Name, true)) else select(2, v12:GetRarity(v328.Name, true));
        local v331 = v15.UNIT_SELL_PRICES[v330];
        if v326._uidsForSale[l_v12_LoadoutString_2] then
            v326._uidsForSale[l_v12_LoadoutString_2] = nil;
            v326._totalSalePrice = math.max(v326._totalSalePrice - v331, 0);
        else
            v326._uidsForSale[l_v12_LoadoutString_2] = true;
            v326._totalSalePrice = v326._totalSalePrice + v331;
        end;
        v327.Content.ForSale.Visible = v326._uidsForSale[l_v12_LoadoutString_2] or false;
        v326.bottomBar.Sell.ConfirmSell.Content.Title.Text = ("Sell (x%*)"):format(#v7.Keys(v326._uidsForSale));
        v326.bottomBar.Sell.ConfirmSell.Content.Currency.Amount.Text = ("+%*"):format((v23:SuffixNumber(v326._totalSalePrice)));
        return;
    end;
end;
v59.SelectUnit = function(v332, v333, v334) --[[ Line: 2031 ]] --[[ Name: SelectUnit ]]
    -- upvalues: v6 (copy), v13 (copy), v12 (copy), v14 (copy), v23 (copy), v25 (copy), v17 (copy), v39 (ref), v42 (ref), v21 (copy), v64 (copy)
    if v332._selectedUnit and v332._selectedUnit.Info.UID == v334.UID then
        v332:DeselectUnit();
        return;
    elseif not v333 or not v334 then
        return;
    else
        v332:DeselectUnit();
        v332._selectionDump = v6.new();
        v332._selectedUnit = {
            Button = v333, 
            Info = v334, 
            IsPet = v334.IsPet or false
        };
        v332._selectionDump:Add(function() --[[ Line: 2052 ]]
            -- upvalues: v332 (copy)
            v332.unitInfoFrame.Content.UnitTags.Rarity:RemoveTag("VisualizeRarity");
            v332.unitInfoFrame.Content.UnitTags.Rarity:SetAttribute("Rarity");
            table.clear(v332._selectedUnit);
            v332._selectedUnit = nil;
            v332._selectionDump = nil;
        end);
        local l_Name_2 = v334.Name;
        local _ = v334.UID;
        local l_Data_0 = v334.Data;
        local v338 = l_Data_0 and l_Data_0.Mega or false;
        local v339 = l_Data_0 and l_Data_0.Shiny or false;
        local v340 = l_Data_0.Level or 1;
        local v341 = l_Data_0.Experience or 0;
        local v342 = nil;
        local v343 = nil;
        local v344 = nil;
        if v334.IsPet then
            v342 = v13:GetNextLevelCost(l_Data_0);
            v343 = select(2, v13:GetRarity(l_Name_2));
            v344 = v13:GetPetValue(l_Name_2, "FullName");
        else
            v342 = v12:GetNextLevelCost(l_Data_0);
            v343 = select(2, v12:GetRarity(l_Name_2));
            v344 = v12:GetUnitValue(l_Name_2, "FullName");
        end;
        v332._selectionDump:Construct(v14, v332.unitInfoFrame, l_Name_2, {
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            positionAttribute = "PreviewOffset", 
            isPet = v334.IsPet
        });
        v332.unitInfoFrame.Content.UnitName.UnitName.Text = v344 or l_Name_2;
        v332.unitInfoFrame.Content.UnitName.AttackType.Visible = not (v334.IsPet or false);
        if not v334.IsPet then
            v332.unitInfoFrame.Content.UnitName.AttackType.Icon.Image = v23:GetAttackTypeIcon(v334.UnitType);
            local l_v12_PrimaryEffect_1 = v12:GetPrimaryEffect(l_Name_2);
            v332.unitInfoFrame.Content.UnitName.AttackType.EffectType.Visible = l_v12_PrimaryEffect_1 ~= nil;
            if l_v12_PrimaryEffect_1 then
                v332.unitInfoFrame.Content.UnitName.AttackType.EffectType.Icon.Image = v23:GetEffectIcon(l_v12_PrimaryEffect_1);
                v332.unitInfoFrame.Content.UnitName.AttackType.EffectType.UIGradient.Color = v23:GetEffectColor(l_v12_PrimaryEffect_1);
            end;
        end;
        v332._selectionDump:Add(v25.new(v332.unitInfoFrame.Content.UnitName.AttackType, {
            IsUnitType = not (v334.IsPet or false), 
            IsPet = v334.IsPet, 
            Name = l_Name_2
        }));
        if v334.Data.Trait and v334.Data.Trait.Name then
            v332._selectionDump:Add(v25.new(v332.unitInfoFrame.Content.Unsorted.Traits.Trait, {
                IsTraitDisplay = true, 
                Trait = v334.Data.Trait.Name, 
                TraitTier = v334.Data.Trait.Tier, 
                Name = ""
            }), "Trait1Tooltip");
        end;
        if v334.Data.Trait2 and v334.Data.Trait2.Name then
            v332._selectionDump:Add(v25.new(v332.unitInfoFrame.Content.Unsorted.Traits.Trait2, {
                IsTraitDisplay = true, 
                Trait = v334.Data.Trait2.Name, 
                TraitTier = v334.Data.Trait2.Tier, 
                Name = ""
            }), "Trait2Tooltip");
        end;
        if v334.Data.Relic then
            v332._selectionDump:Add(v25.new(v332.unitInfoFrame.Content.Unsorted.Relic, {
                IsRelicDisplay = true, 
                Relic = v334.Data.Relic, 
                Name = ""
            }), "RelicTooltip");
        end;
        local v346 = nil;
        v346 = if v334.IsPet then v13:GetMaxLevel(v334.Data) else v12:GetMaxLevel(v334.Data);
        v332.unitInfoFrame.Content.Level.Level.Text = ("LVL %*"):format((math.clamp(v340, 1, v346)));
        if v346 <= v340 then
            v332.unitInfoFrame.Content.Level.XPBar.Fill.Size = UDim2.fromScale(1, 1);
            v332.unitInfoFrame.Content.Level.XPBar.Progression.Text = "(MAX)";
        else
            v332.unitInfoFrame.Content.Level.XPBar.Fill.Size = UDim2.fromScale(math.clamp(v341 / v342, 0, 1), 1);
            v332.unitInfoFrame.Content.Level.XPBar.Progression.Text = ("%*/%*"):format(math.round(v341), v342);
        end;
        v332.unitInfoFrame.Content.UnitTags.ShinyStatus.Visible = v339;
        v332.unitInfoFrame.Content.UnitTags.WumboStatus.Visible = v338;
        v332.unitInfoFrame.Content.UnitTags.Rarity.Text = v343;
        v332.unitInfoFrame.Content.UnitTags.Rarity:SetAttribute("Rarity", v343);
        v332.unitInfoFrame.Content.UnitTags.Rarity:AddTag("VisualizeRarity");
        v332._selectionDump:Add(v17.new(v332.unitInfoFrame.BG, v343));
        v332._selectionDump:Add(v17.new(v332.previewFrame.UIStroke, v343));
        v332.unitInfoFrame.Content.Stats.Values.DMG.Visible = v334.UnitType ~= "Resource";
        v332.unitInfoFrame.Content.Stats.Values.RNG.Visible = v334.UnitType ~= "Resource";
        v332.unitInfoFrame.Content.Stats.Values.SPA.Visible = v334.UnitType ~= "Resource";
        v332.unitInfoFrame.Content.Stats.Values.GOLD.Visible = v334.UnitType == "Resource";
        v332.previewFrame.ExistingCount.Visible = false;
        if not l_Data_0.Temporary then
            v332._selectionDump:Add(v39:ApplyCountToLabel(l_Data_0.Name, l_Data_0, v332.previewFrame.ExistingCount.Amount, v332._selectedUnit.Info.IsPet, "%s Exist", false):andThen(function(v347, v348) --[[ Line: 2197 ]]
                -- upvalues: v332 (copy)
                if not v347 then
                    return;
                else
                    v332.previewFrame.ExistingCount.Visible = true;
                    v332._selectionDump:Add(v348);
                    return;
                end;
            end));
            v332:_updateSelectedMintCount();
        end;
        local l_ExtraStats_0 = v332.unitInfoFrame.Content.Unsorted.ExtraStats;
        if not v334.IsPet and v334.UnitType == "Resource" then
            v332.unitInfoFrame.Content.Stats.Values.GOLD.StatAmount.Text = v12:GetGold(l_Data_0) or 0;
        elseif not v334.IsPet then
            local _ = v42:GetEquippedPets();
            local l_v12_TotalDamage_0 = v12:GetTotalDamage(l_Data_0);
            local l_v12_Range_0 = v12:GetRange(l_Data_0);
            local l_v12_AttackCooldown_0 = v12:GetAttackCooldown(l_Data_0);
            v332.unitInfoFrame.Content.Stats.Values.DMG.StatAmount.Text = l_v12_TotalDamage_0;
            v332.unitInfoFrame.Content.Stats.Values.RNG.StatAmount.Text = l_v12_Range_0;
            v332.unitInfoFrame.Content.Stats.Values.SPA.StatAmount.Text = l_v12_AttackCooldown_0;
        elseif v334.IsPet then
            local v354 = v13:GetDamageBuff(v334.Data) or 0;
            local v355 = v13:GetRangeBuff(v334.Data) or 0;
            local v356 = v13:GetCooldownBuff(v334.Data) or 0;
            local v357 = v13:GetGoldBuff(v334.Data) or 0;
            local v358 = v13:GetPlacementBuff(v334.Data) or 0;
            local l_Values_1 = v332.unitInfoFrame.Content.Stats.Values;
            local function _(v360, v361, v362) --[[ Line: 2232 ]] --[[ Name: fillStatLabel ]]
                local v363 = v361 > 0 and "+" or "";
                local v364 = v362 and "" or "%";
                v360.StatAmount.Text = ("%*%*%*"):format(v363, v361, v364);
                v360.Visible = v361 ~= 0;
            end;
            local l_DMG_1 = l_Values_1.DMG;
            local v367 = v354 > 0 and "+" or "";
            l_DMG_1.StatAmount.Text = ("%*%*%%"):format(v367, v354);
            l_DMG_1.Visible = v354 ~= 0;
            l_DMG_1 = l_Values_1.RNG;
            v367 = v355 > 0 and "+" or "";
            l_DMG_1.StatAmount.Text = ("%*%*%%"):format(v367, v355);
            l_DMG_1.Visible = v355 ~= 0;
            l_DMG_1 = l_Values_1.SPA;
            v367 = v356 > 0 and "+" or "";
            l_DMG_1.StatAmount.Text = ("%*%*%%"):format(v367, v356);
            l_DMG_1.Visible = v356 ~= 0;
            l_DMG_1 = l_ExtraStats_0.GOLD;
            v367 = v357 > 0 and "+" or "";
            l_DMG_1.StatAmount.Text = ("%*%*%%"):format(v367, v357);
            l_DMG_1.Visible = v357 ~= 0;
            l_DMG_1 = l_ExtraStats_0.PLC;
            v367 = v358 > 0 and "+" or "";
            l_DMG_1.StatAmount.Text = ("%*%*"):format(v367, v358);
            l_DMG_1.Visible = v358 ~= 0;
        end;
        l_ExtraStats_0.Visible = v334.IsPet or false;
        local l_ImageLabel_4 = v332.unitInfoFrame.Content.Unsorted.Traits.Trait:FindFirstChildOfClass("ImageLabel");
        local l_ImageLabel_5 = v332.unitInfoFrame.Content.Unsorted.Traits.Trait2:FindFirstChildOfClass("ImageLabel");
        if l_ImageLabel_4 then
            l_ImageLabel_4:Destroy();
        end;
        if l_ImageLabel_5 then
            l_ImageLabel_5:Destroy();
        end;
        v332.unitInfoFrame.Content.Unsorted.Traits.Trait.Visible = l_Data_0 and l_Data_0.Trait ~= nil;
        v332.unitInfoFrame.Content.Unsorted.Traits.Trait2.Visible = l_Data_0 and l_Data_0.Trait2 ~= nil;
        v332.unitInfoFrame.Content.Unsorted.Traits.Trait.NeptunesCrown.Visible = l_Data_0 and l_Data_0.Trait2 ~= nil;
        v332.unitInfoFrame.Content.Unsorted.Traits.Visible = l_Data_0 and (l_Data_0.Trait ~= nil or l_Data_0.Trait2 ~= nil);
        if l_Data_0 and l_Data_0.Trait ~= nil then
            v21:CreateTraitIcon(l_Data_0.Trait.Name, v332.unitInfoFrame.Content.Unsorted.Traits.Trait);
        end;
        if l_Data_0 and l_Data_0.Trait2 ~= nil then
            v21:CreateTraitIcon(l_Data_0.Trait2.Name, v332.unitInfoFrame.Content.Unsorted.Traits.Trait2);
        end;
        local l_Relic_0 = v332.unitInfoFrame.Content.Unsorted.Relic;
        local v371 = false;
        if l_Data_0 ~= nil then
            v371 = l_Data_0.Relic ~= nil;
        end;
        l_Relic_0.Visible = v371;
        if l_Data_0 and l_Data_0.Relic then
            v23:CreateRelicIcon(v332.unitInfoFrame.Content.Unsorted.Relic, l_Data_0.Relic);
        end;
        v332.starsContainer.Visible = l_Data_0.Stars > 0;
        if l_Data_0.Stars > 0 then
            v332.starsContainer.Main.Amount.Text = l_Data_0.Stars;
            for v372 = 2, 5 do
                v332.starsContainer:FindFirstChild(v372).Visible = v372 <= l_Data_0.Stars;
            end;
        end;
        v332.selectUnitPreview.Visible = false;
        v332.unitInfoFrame.Visible = true;
        v332:UpdateSelectedUnit(true);
        v371 = v64:GetState().Mode == "Normal";
        v332.unitInfoFrame.Content.Options.Feed.Visible = v371 and not l_Data_0.Foodless and not l_Data_0.Temporary;
        return;
    end;
end;
v59.DeselectUnit = function(v373) --[[ Line: 2299 ]] --[[ Name: DeselectUnit ]]
    if not v373._selectedUnit then
        return;
    else
        if v373._selectionDump then
            v373._selectionDump:Destroy();
        end;
        v373.selectUnitPreview.Visible = true;
        v373.previewFrame.ExistingCount.Visible = false;
        v373.unitInfoFrame.Visible = false;
        return;
    end;
end;
v59.UpdateSelectedUnit = function(v374, v375) --[[ Line: 2313 ]] --[[ Name: UpdateSelectedUnit ]]
    -- upvalues: v64 (copy), v53 (copy), v54 (copy), v28 (copy), v21 (copy), v25 (copy), v23 (copy), v12 (copy), v42 (ref), v13 (copy), v38 (ref), l_GuiService_0 (copy)
    if not v374._selectedUnit then
        return;
    else
        local l_Info_0 = v374._selectedUnit.Info;
        local l_Data_1 = l_Info_0.Data;
        local v378 = v53[v64:GetState().Mode] == true;
        for _, v380 in v374.unitInfoFrame.Content.Options:GetChildren() do
            if v380:IsA("GuiButton") then
                if v378 then
                    v380.Visible = v54[v380.Name] or false;
                else
                    v380.Visible = v380.Name ~= "Select";
                end;
            end;
        end;
        local v381 = nil;
        v381 = if l_Info_0.IsPet then v28:IsEquipped(l_Info_0.Name, l_Info_0.UID) else v374:_isEquipped(l_Info_0.Name, l_Info_0.UID);
        v374.unitInfoFrame.Content.Options.Equip.Content.Title.Text = v381 and "Unequip" or "Equip";
        local v382 = l_Data_1 and l_Data_1.Mega or false;
        local v383 = l_Data_1 and l_Data_1.Shiny or false;
        v374.unitInfoFrame.Content.UnitTags.ShinyStatus.Visible = v383;
        v374.unitInfoFrame.Content.UnitTags.WumboStatus.Visible = v382;
        if not v375 then
            local l_ImageLabel_6 = v374.unitInfoFrame.Content.Unsorted.Traits.Trait:FindFirstChildOfClass("ImageLabel");
            local l_ImageLabel_7 = v374.unitInfoFrame.Content.Unsorted.Traits.Trait2:FindFirstChildOfClass("ImageLabel");
            if l_ImageLabel_6 then
                l_ImageLabel_6:Destroy();
            end;
            if l_ImageLabel_7 then
                l_ImageLabel_7:Destroy();
            end;
            v374.unitInfoFrame.Content.Unsorted.Traits.Trait.Visible = l_Data_1 and l_Data_1.Trait ~= nil;
            v374.unitInfoFrame.Content.Unsorted.Traits.Trait2.Visible = l_Data_1 and l_Data_1.Trait2 ~= nil;
            v374.unitInfoFrame.Content.Unsorted.Traits.Trait.NeptunesCrown.Visible = l_Data_1 and l_Data_1.Trait2 ~= nil;
            v374.unitInfoFrame.Content.Unsorted.Traits.Visible = l_Data_1 and (l_Data_1.Trait ~= nil or l_Data_1.Trait2 ~= nil);
            if l_Data_1 and l_Data_1.Trait ~= nil then
                v21:CreateTraitIcon(l_Data_1.Trait.Name, v374.unitInfoFrame.Content.Unsorted.Traits.Trait);
            end;
            if l_Data_1 and l_Data_1.Trait2 ~= nil then
                v21:CreateTraitIcon(l_Data_1.Trait2.Name, v374.unitInfoFrame.Content.Unsorted.Traits.Trait2);
            end;
            if l_Data_1.Trait and l_Data_1.Trait.Name then
                if v374._selectionDump:Get("Trait1Tooltip") then
                    v374._selectionDump:Remove("Trait1Tooltip");
                end;
                v374._selectionDump:Add(v25.new(v374.unitInfoFrame.Content.Unsorted.Traits.Trait, {
                    IsTraitDisplay = true, 
                    Trait = l_Data_1.Trait.Name, 
                    TraitTier = l_Data_1.Trait.Tier, 
                    Name = ""
                }), "Trait1Tooltip");
            end;
            if l_Data_1.Trait2 and l_Data_1.Trait2.Name then
                if v374._selectionDump:Get("Trait2Tooltip") then
                    v374._selectionDump:Remove("Trait2Tooltip");
                end;
                v374._selectionDump:Add(v25.new(v374.unitInfoFrame.Content.Unsorted.Traits.Trait2, {
                    IsTraitDisplay = true, 
                    Trait = l_Data_1.Trait2.Name, 
                    TraitTier = l_Data_1.Trait2.Tier, 
                    Name = ""
                }), "Trait2Tooltip");
            end;
            local l_Relic_1 = v374.unitInfoFrame.Content.Unsorted.Relic;
            local v387 = false;
            if l_Data_1 ~= nil then
                v387 = l_Data_1.Relic ~= nil;
            end;
            l_Relic_1.Visible = v387;
            if l_Data_1 and l_Data_1.Relic then
                v23:CreateRelicIcon(v374.unitInfoFrame.Content.Unsorted.Relic, l_Data_1.Relic);
                if v374._selectionDump:Get("RelicTooltip") then
                    v374._selectionDump:Remove("RelicTooltip");
                end;
                v374._selectionDump:Add(v25.new(v374.unitInfoFrame.Content.Unsorted.Relic, {
                    IsRelicDisplay = true, 
                    Relic = l_Data_1.Relic, 
                    Name = ""
                }), "RelicTooltip");
            end;
            if not l_Info_0.IsPet and l_Info_0.UnitType == "Resource" then
                v374.unitInfoFrame.Content.Stats.Values.GOLD.StatAmount.Text = v12:GetGold(l_Data_1) or 0;
            elseif not l_Info_0.IsPet then
                l_Relic_1 = v42:GetEquippedPets();
                v387 = v12:GetTotalDamage(l_Data_1);
                local l_v12_Range_1 = v12:GetRange(l_Data_1);
                local l_v12_AttackCooldown_1 = v12:GetAttackCooldown(l_Data_1);
                v374.unitInfoFrame.Content.Stats.Values.DMG.StatAmount.Text = v387;
                v374.unitInfoFrame.Content.Stats.Values.RNG.StatAmount.Text = l_v12_Range_1;
                v374.unitInfoFrame.Content.Stats.Values.SPA.StatAmount.Text = l_v12_AttackCooldown_1;
            elseif l_Info_0.IsPet then
                l_Relic_1 = v13:GetDamageBuff(l_Info_0.Data) or 0;
                v387 = v13:GetRangeBuff(l_Info_0.Data) or 0;
                local v390 = v13:GetCooldownBuff(l_Info_0.Data) or 0;
                local v391 = v13:GetGoldBuff(l_Info_0.Data) or 0;
                local v392 = v13:GetPlacementBuff(l_Info_0.Data) or 0;
                local l_Values_2 = v374.unitInfoFrame.Content.Stats.Values;
                local function _(v394, v395, v396) --[[ Line: 2448 ]] --[[ Name: fillStatLabel ]]
                    local v397 = v395 > 0 and "+" or "";
                    local v398 = v396 and "" or "%";
                    v394.StatAmount.Text = ("%*%*%*"):format(v397, v395, v398);
                    v394.Visible = v395 ~= 0;
                end;
                local l_DMG_2 = l_Values_2.DMG;
                local v401 = l_Relic_1 > 0 and "+" or "";
                l_DMG_2.StatAmount.Text = ("%*%*%%"):format(v401, l_Relic_1);
                l_DMG_2.Visible = l_Relic_1 ~= 0;
                l_DMG_2 = l_Values_2.RNG;
                v401 = v387 > 0 and "+" or "";
                l_DMG_2.StatAmount.Text = ("%*%*%%"):format(v401, v387);
                l_DMG_2.Visible = v387 ~= 0;
                l_DMG_2 = l_Values_2.SPA;
                v401 = v390 > 0 and "+" or "";
                l_DMG_2.StatAmount.Text = ("%*%*%%"):format(v401, v390);
                l_DMG_2.Visible = v390 ~= 0;
                l_DMG_2 = v374.unitInfoFrame.Content.Unsorted.ExtraStats.PLC;
                v401 = v392 > 0 and "+" or "";
                l_DMG_2.StatAmount.Text = ("%*%*"):format(v401, v392);
                l_DMG_2.Visible = v392 ~= 0;
                l_DMG_2 = v374.unitInfoFrame.Content.Unsorted.ExtraStats.GOLD;
                v401 = v391 > 0 and "+" or "";
                l_DMG_2.StatAmount.Text = ("%*%*%%"):format(v401, v391);
                l_DMG_2.Visible = v391 ~= 0;
            end;
            if not l_Data_1.Temporary then
                v374:_updateSelectedMintCount();
            end;
        end;
        if v38:IsConsole() then
            if v378 then
                l_GuiService_0.SelectedObject = v374.unitInfoFrame.Content.Options.Select;
                return;
            else
                l_GuiService_0.SelectedObject = v374.unitInfoFrame.Content.Options.Equip;
            end;
        end;
        return;
    end;
end;
v59.OpenWithSelectedUnit = function(v402, v403) --[[ Line: 2477 ]] --[[ Name: OpenWithSelectedUnit ]]
    -- upvalues: v12 (copy), v33 (ref)
    local v404 = v402._loadout[v403] or "";
    local v405, v406 = v12:ParseLoadout(v404);
    if not v405 or not v406 then
        v33:Toggle(script.Name, true);
        return;
    else
        local function v409() --[[ Line: 2486 ]] --[[ Name: selectUnit ]]
            -- upvalues: v402 (copy), v405 (copy), v406 (copy), v12 (ref)
            if not v402._unitButtons or not v402._unitButtons[v405] or not v402._unitButtons[v405][v406] then
                return;
            else
                local v407 = v402._unitButtons[v405][v406];
                if not v407 then
                    return;
                else
                    local function _() --[[ Line: 2497 ]] --[[ Name: getUnitInfo ]]
                        -- upvalues: v405 (ref), v406 (ref), v402 (ref), v12 (ref)
                        return {
                            Name = v405, 
                            UID = v406, 
                            Data = v402._units[v405][v406], 
                            UnitType = v12:GetUnitValue(v405, "Type")
                        };
                    end;
                    v402:ProcessUnitClicked(v407, {
                        Name = v405, 
                        UID = v406, 
                        Data = v402._units[v405][v406], 
                        UnitType = v12:GetUnitValue(v405, "Type")
                    });
                    return;
                end;
            end;
        end;
        if v33:GetToggleState(script.Name) then
            v409();
            return;
        else
            v402.GeneratedUnitButtons:Once(v409);
            v33:Toggle(script.Name, true);
            return;
        end;
    end;
end;
v59.OpenToUnit = function(v410, v411, v412) --[[ Line: 2519 ]] --[[ Name: OpenToUnit ]]
    -- upvalues: v12 (copy), v33 (ref)
    local function v415() --[[ Line: 2520 ]] --[[ Name: selectUnit ]]
        -- upvalues: v410 (copy), v411 (copy), v412 (copy), v12 (ref)
        if not v410._unitButtons or not v410._unitButtons[v411] or not v410._unitButtons[v411][v412] then
            return;
        else
            local v413 = v410._unitButtons[v411][v412];
            if not v413 then
                return;
            else
                local function _() --[[ Line: 2531 ]] --[[ Name: getUnitInfo ]]
                    -- upvalues: v411 (ref), v412 (ref), v410 (ref), v12 (ref)
                    return {
                        Name = v411, 
                        UID = v412, 
                        Data = v410._units[v411][v412], 
                        UnitType = v12:GetUnitValue(v411, "Type")
                    };
                end;
                v410:ProcessUnitClicked(v413, {
                    Name = v411, 
                    UID = v412, 
                    Data = v410._units[v411][v412], 
                    UnitType = v12:GetUnitValue(v411, "Type")
                });
                return;
            end;
        end;
    end;
    if v33:GetToggleState(script.Name) then
        v415();
        return;
    else
        v410.GeneratedUnitButtons:Once(v415);
        v33:Toggle(script.Name, true);
        return;
    end;
end;
v59.SetState = function(v416, v417, v418) --[[ Line: 2554 ]] --[[ Name: SetState ]]
    -- upvalues: v57 (copy), v7 (copy), v64 (copy)
    if v57[v417] then
        v416:SetTab(v57[v417]);
    end;
    if v416._stateData then
        table.clear(v416._stateData);
        v416._stateData = nil;
    end;
    if v418 then
        v416._stateData = v7.Copy(v418, true);
    end;
    v416.tabButtons.Visible = v57[v417] ~= "Units";
    v64:Dispatch(v64.Actions.SetMode(v417));
end;
v59.OpenWithState = function(v419, v420, v421) --[[ Line: 2572 ]] --[[ Name: OpenWithState ]]
    -- upvalues: v53 (copy), v27 (copy), v33 (ref)
    if v420 == "GeneralSelection" then
        assert(v421.callback, "Missing callback for general selection mode");
    end;
    if v419._stateData then
        v419._stateData = nil;
    end;
    if v53[v420] then
        if v420 == "TradingSelection" then
            v419.highPriority = true;
        end;
        v419.ToggleAll = {};
        v419.main.Position = UDim2.fromScale(0.5, 0.5);
    end;
    v27:ToggleFrame(false);
    v419:SetState(v420, v421);
    v33:Toggle(script.Name, true);
end;
v59.ShowFilterMenu = function(v422) --[[ Line: 2596 ]] --[[ Name: ShowFilterMenu ]]
    -- upvalues: v7 (copy)
    v422._editFilter = v7.Copy(v422._currentFilter, true);
    v422.filterFrame.Visible = true;
end;
v59.SortUnits = function(v423, v424, v425, v426) --[[ Line: 2601 ]] --[[ Name: SortUnits ]]
    -- upvalues: v28 (copy), v32 (copy), v12 (copy), v15 (copy)
    if not v424 then
        return;
    elseif v425 then
        local v427 = if v426 then v424 else v28:GetArray();
        return v32:SortItems(v427, true);
    else
        table.sort(v424, function(v428, v429) --[[ Line: 2612 ]]
            -- upvalues: v423 (copy), v12 (ref), v15 (ref)
            local l_Name_3 = v428.Name;
            local l_Name_4 = v429.Name;
            local l_UID_3 = v428.UID;
            local l_UID_4 = v429.UID;
            local v434 = v423._tradingUnits[v428.UID] or false;
            local v435 = v423._tradingUnits[v429.UID] or false;
            local l_Equipped_0 = v428.Equipped;
            local l_Equipped_1 = v429.Equipped;
            local v438 = v12:GetUnitValue(v428.Name, "Rarity") or 1;
            local v439 = v12:GetUnitValue(v429.Name, "Rarity") or 1;
            local l_v12_UnitValue_2 = v12:GetUnitValue(v428.Name, "Type");
            local l_v12_UnitValue_3 = v12:GetUnitValue(v429.Name, "Type");
            local v442 = v15.TOWERS.ATTACK_TYPE_INDICES[l_v12_UnitValue_2] or 0;
            local v443 = v15.TOWERS.ATTACK_TYPE_INDICES[l_v12_UnitValue_3] or 0;
            local v444 = v428.Data.Trait ~= nil;
            local v445 = v429.Data.Trait ~= nil;
            local v446 = v428.Data.Stars or 0;
            local v447 = v429.Data.Stars or 0;
            local v448 = v12:GetTotalDamage(v428.Data) or 0;
            local v449 = v12:GetTotalDamage(v429.Data) or 0;
            local v450 = v428.Data.Level or 1;
            local v451 = v429.Data.Level or 1;
            local v452 = v428.Data.Mint or 0;
            local v453 = v429.Data.Mint or 0;
            local v454 = 0;
            if v428.Data.Relic then
                v454 = tonumber(string.match(v428.Data.Relic, "_(%d+)$")) or 4;
            end;
            local v455 = 0;
            if v429.Data.Relic then
                v455 = tonumber(string.match(v429.Data.Relic, "_(%d+)$")) or 4;
            end;
            if v434 ~= v435 then
                return v434;
            elseif l_Equipped_0 ~= l_Equipped_1 then
                return l_Equipped_0;
            elseif v438 ~= v439 then
                return v439 < v438;
            elseif l_Name_3 ~= l_Name_4 then
                return l_Name_3 < l_Name_4;
            elseif v446 ~= v447 then
                return v447 < v446;
            elseif v444 ~= v445 then
                return v444;
            elseif v442 ~= v443 then
                return v442 < v443;
            elseif v448 ~= v449 then
                return v449 < v448;
            elseif v454 ~= v455 then
                return v455 < v454;
            elseif v450 ~= v451 then
                return v451 < v450;
            elseif v452 ~= v453 then
                return v452 < v453;
            else
                return l_UID_3 < l_UID_4;
            end;
        end);
        return;
    end;
end;
v59.ToggleTradingUnit = function(v456, v457, v458) --[[ Line: 2724 ]] --[[ Name: ToggleTradingUnit ]]
    if v458 then
        if v456._tradingUnits[v457.UID] then
            return false;
        else
            v456._tradingUnits[v457.UID] = true;
        end;
    elseif not v456._tradingUnits[v457.UID] then
        return false;
    else
        v456._tradingUnits[v457.UID] = nil;
    end;
    return true;
end;
v59.StopTrading = function(v459) --[[ Line: 2742 ]] --[[ Name: StopTrading ]]
    -- upvalues: v33 (ref)
    table.clear(v459._tradingUnits);
    v33:Toggle(script.Name, false);
end;
v59.ShowTeamsFrame = function(_) --[[ Line: 2747 ]] --[[ Name: ShowTeamsFrame ]]
    -- upvalues: v27 (copy)
    v27:ToggleFrame();
end;
v59.SwapUnit = function(v461, v462) --[[ Line: 2751 ]] --[[ Name: SwapUnit ]]
    -- upvalues: v35 (ref), v50 (ref)
    if not v462 then
        return;
    elseif v461:_getMaxLoadoutSlot() < v462 then
        return;
    elseif not v461._selectedUnit then
        return;
    else
        v35:SwapUnitLoadoutPlacement(v461._selectedUnit.Info.Name, v461._selectedUnit.Info.UID, v462);
        v50:ToggleUnitReplacement(false);
        return;
    end;
end;
v59.ClearBin = function(v463, v464) --[[ Line: 2769 ]] --[[ Name: ClearBin ]]
    -- upvalues: v18 (copy)
    table.clear(v463._unitButtons);
    v18.deferClearBrowser(v463.unitsBin);
    if v464 then
        v464();
    end;
end;
v59._updateUnitCount = function(v465) --[[ Line: 2778 ]] --[[ Name: _updateUnitCount ]]
    if v465:GetTab() ~= "Units" then
        return;
    else
        v465.unitCountsFrame.Title.Text = "UNIT STORAGE";
        v465.unitCountsFrame.Count.Text = ("%*/%*"):format(v465._totalUnits, v465._maxUnits);
        return;
    end;
end;
v59._updatePetsCount = function(v466) --[[ Line: 2787 ]] --[[ Name: _updatePetsCount ]]
    -- upvalues: v23 (copy), v28 (copy)
    if v466:GetTab() ~= "Pets" then
        return;
    else
        local l_v23_TotalPets_0 = v23:GetTotalPets(v28._pets or {});
        v466.unitCountsFrame.Title.Text = "PET STORAGE";
        v466.unitCountsFrame.Count.Text = ("%*/%*"):format(l_v23_TotalPets_0, v466._maxPets);
        return;
    end;
end;
v59._loadUnits = function(v468) --[[ Line: 2797 ]] --[[ Name: _loadUnits ]]
    -- upvalues: v28 (copy), v6 (copy), v64 (copy), v18 (copy)
    if v28.dumpster then
        v28.dumpster:Destroy();
    end;
    if v468.unitsDump then
        v468.unitsDump:Destroy();
    end;
    v468.unitsDump = v6.new();
    v468.unitsDump:Add(function() --[[ Line: 2808 ]]
        -- upvalues: v468 (copy)
        v468:ClearBin();
    end);
    local v469 = v468._filteredUnits or v468._unitsArray;
    local l_Mode_2 = v64:GetState().Mode;
    v468:SortUnits(v469);
    v18.loadOnDemand(v469, v468.unitsBin, v468.unitsDump, function(v471, v472) --[[ Line: 2821 ]]
        -- upvalues: v468 (copy), l_Mode_2 (copy)
        v468:GenerateUnitButton(v471.Name, v471.UID, v472, l_Mode_2);
        if v472 == 25 or v472 == #v468._unitsArray then
            v468.GeneratedUnitButtons:Fire();
        end;
    end, nil, {
        populateBy = 25
    });
end;
v59._isEquipped = function(v473, v474, v475) --[[ Line: 2833 ]] --[[ Name: _isEquipped ]]
    -- upvalues: v12 (copy)
    if not v474 or not v475 then
        return false;
    else
        local l_v12_LoadoutString_3 = v12:CreateLoadoutString(v474, v475);
        for v477 = 1, #v473._loadout do
            if v473._loadout[v477] == l_v12_LoadoutString_3 then
                return true, v477;
            end;
        end;
        return false;
    end;
end;
v59._connectSearchBar = function(v478) --[[ Line: 2850 ]] --[[ Name: _connectSearchBar ]]
    v478.searchBar.FocusLost:Connect(function(v479) --[[ Line: 2851 ]]
        -- upvalues: v478 (copy)
        if not v479 then
            return;
        elseif v478._lastSearchTerm == v478.searchBar.Text then
            return;
        else
            local l_Text_0 = v478.searchBar.Text;
            v478._lastSearchTerm = l_Text_0;
            v478._currentFilter.Name = l_Text_0;
            v478:FilterUnits(v478._currentFilter);
            return;
        end;
    end);
end;
v59._connectFilterFrame = function(v481) --[[ Line: 2870 ]] --[[ Name: _connectFilterFrame ]]
    -- upvalues: v33 (ref), v7 (copy), v25 (copy)
    v481.filterFrame.Visible = false;
    v481.filterContent.Bin.CanvasPosition = Vector2.new(0, 0);
    local v482 = {};
    v481.filterButtons = v482;
    v33:HandleButton(v481.filterOptions.Cancel, function() --[[ Line: 2877 ]]
        -- upvalues: v481 (copy), v482 (copy)
        v481.filterFrame.Visible = false;
        if v481._currentFilter then
            v481:FilterUnits(v481._currentFilter);
        end;
        for v483, v484 in v481._editFilter do
            local v485 = v481._currentFilter[v483];
            if v482[v483] then
                for v486 in v484 do
                    local v487 = v482[v483][v486];
                    if v487 and not (v485 and v485[v486]) then
                        v487.Content.Deselected.Visible = true;
                    end;
                end;
            end;
        end;
        for v488, v489 in v481._currentFilter do
            if v482[v488] then
                for v490 in v489 do
                    local v491 = v482[v488][v490];
                    if v491 then
                        v491.Content.Deselected.Visible = false;
                    end;
                end;
            end;
        end;
        v481._editFilter = nil;
    end);
    v33:HandleButton(v481.filterOptions.Apply, function() --[[ Line: 2926 ]]
        -- upvalues: v481 (copy), v7 (ref)
        v481.filterFrame.Visible = false;
        v481._currentFilter = v7.Copy(v481._editFilter, true);
        if v481._stateData and v481._stateData.filter then
            local l_filter_0 = v481._stateData.filter;
            if l_filter_0.ExcludeResourceUnits == true then
                v481._currentFilter.ExcludeResourceUnits = true;
            end;
            if l_filter_0.ExcludeNeptunesCrown == true then
                v481._currentFilter.ExcludeNeptunesCrown = true;
            end;
            if l_filter_0.UnitTraitExclusions and l_filter_0.UnitTraitExclusions.SecretFormula then
                v481._currentFilter.UnitTraitExclusions = {
                    SecretFormula = true
                };
            end;
        end;
        v481:FilterUnits(v481._currentFilter);
        v481._editFilter = nil;
    end);
    local function v496(v493, v494) --[[ Line: 2952 ]] --[[ Name: handleFilterButton ]]
        -- upvalues: v25 (ref), v33 (ref), v481 (copy)
        local v495 = v493:GetAttribute("FilterName") or v493.Name;
        v493.Content.Deselected.Visible = true;
        if v494 == "AttackType" then
            v25.new(v493, {
                IsAttackTypeDisplay = true, 
                AttackType = v493.Name, 
                Name = ""
            });
        elseif v494 == "UnitTraits" then
            v25.new(v493, {
                IsTraitDisplay = true, 
                Trait = v493.Name, 
                Name = ""
            });
        end;
        v33:HandleButton(v493, function() --[[ Line: 2968 ]]
            -- upvalues: v481 (ref), v494 (copy), v495 (copy), v493 (copy)
            if v481._editFilter[v494] and v481._editFilter[v494][v495] then
                v493.Content.Deselected.Visible = true;
                v481._editFilter[v494][v495] = nil;
                if not next(v481._editFilter[v494]) then
                    v481._editFilter[v494] = nil;
                end;
                return;
            else
                if not v481._editFilter[v494] then
                    v481._editFilter[v494] = {};
                end;
                v481._editFilter[v494][v495] = true;
                v493.Content.Deselected.Visible = false;
                return;
            end;
        end);
    end;
    for _, v498 in v481.filterContent.Bin:GetChildren() do
        if v498:IsA("Frame") then
            local v499 = {};
            local l_Buttons_0 = v498:FindFirstChild("Buttons");
            if l_Buttons_0 then
                v482[v498.Name] = v499;
                for _, v502 in l_Buttons_0:GetChildren() do
                    if v502:IsA("GuiButton") then
                        v499[v502.Name] = v502;
                        v496(v502, v498.Name);
                    end;
                end;
            end;
            for _, v504 in v498:GetChildren() do
                if v504:IsA("Frame") then
                    local l_Buttons_1 = v504:FindFirstChild("Buttons");
                    if l_Buttons_1 then
                        v482[v504.Name] = v499;
                        for _, v507 in l_Buttons_1:GetChildren() do
                            if v507:IsA("GuiButton") then
                                v499[v507.Name] = v507;
                                v496(v507, v504.Name);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v59._clearFilter = function(v508) --[[ Line: 3034 ]] --[[ Name: _clearFilter ]]
    v508._currentFilter = {};
    v508._editFilter = nil;
    v508.filterFrame.Visible = false;
    if not v508.filterButtons then
        return;
    else
        for _, v510 in v508.filterButtons do
            for _, v512 in v510 do
                v512.Content.Deselected.Visible = true;
            end;
        end;
        return;
    end;
end;
v59._updateSelectedMintCount = function(v513) --[[ Line: 3052 ]] --[[ Name: _updateSelectedMintCount ]]
    -- upvalues: v40 (ref)
    v513.previewFrame.ExistingCount.Serial.Visible = false;
    if v513._selectedUnit.Info.Data.Temporary then
        return;
    else
        v513._selectionDump:Add(v40:ApplyMintToLabel(v513._selectedUnit.Info.Name, v513._selectedUnit.Info.UID, v513._selectedUnit.Info.Data, v513.previewFrame.ExistingCount.Serial, v513._selectedUnit.Info.IsPet and "Pets" or "Units", "#%s"):andThen(function(v514, v515) --[[ Line: 3066 ]]
            -- upvalues: v513 (copy)
            if not v514 then
                return;
            else
                v513.previewFrame.ExistingCount.Serial.Visible = true;
                v513._selectionDump:Add(v515);
                return;
            end;
        end));
        return;
    end;
end;
v59._getMaxLoadoutSlot = function(v516) --[[ Line: 3077 ]] --[[ Name: _getMaxLoadoutSlot ]]
    -- upvalues: v34 (ref), v5 (copy), v23 (copy)
    if v516:GetTab() == "Pets" then
        return v34:Get(v5.Player, "MaxPetSlots"):expect();
    else
        return v23:GetMaxLoadoutSlot(v516._playerStats);
    end;
end;
v59._getLayoutOrder = function(v517, v518, v519, v520) --[[ Line: 3085 ]] --[[ Name: _getLayoutOrder ]]
    local l_v520_0 = v520;
    local v522, v523 = v517:_isEquipped(v518.Name, v519);
    if v522 then
        l_v520_0 = -10000 + v523;
    end;
    if v518.Favorite then
        l_v520_0 = l_v520_0 - 1000;
    end;
    return l_v520_0;
end;
return v59;