local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("UserService");
local v8 = require(l_ReplicatedStorage_0.Packages.Knit);
local v9 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v10 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Packages.Promise);
local v12 = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v16 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local v18 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v19 = require(v8.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v20 = require(l_ReplicatedStorage_0.Shared.Data.FoodShared);
local v21 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisualBatch);
local v22 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v23 = require(l_ReplicatedFirst_0.PlaceIds);
local v24 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Data.SpritesheetAtlas);
local v26 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v27 = require(l_ReplicatedStorage_0.TraitsData);
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
local v51 = nil;
local v52 = nil;
local v53 = nil;
local v54 = nil;
local v55 = nil;
local v56 = nil;
local v57 = nil;
local v58 = nil;
local v59 = nil;
local v60 = nil;
local v61 = nil;
local v62 = nil;
local v63 = nil;
local v64 = nil;
local v65 = nil;
local v66 = nil;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local v73 = nil;
local v74 = nil;
local v75 = UDim2.fromScale(0.54, 0.45);
local v76 = {
    ["Content/UIGradient"] = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#25e9ff")), 
        ColorSequenceKeypoint.new(1, Color3.fromHex("#0b79ff"))
    }), 
    ["Content/UIStroke"] = Color3.fromRGB(17, 80, 135)
};
local v77 = {
    ["Content/UIGradient"] = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#97c1e2")), 
        ColorSequenceKeypoint.new(1, Color3.fromHex("#5d7d96"))
    }), 
    ["Content/UIStroke"] = Color3.fromRGB(61, 79, 103)
};
local v78 = {
    [true] = {
        Content = {
            BackgroundTransparency = 0
        }, 
        ["Content/Icon"] = {
            ImageTransparency = 0
        }
    }, 
    [false] = {
        Content = {
            BackgroundTransparency = 0.5
        }, 
        ["Content/Icon"] = {
            ImageTransparency = 0.5
        }
    }
};
local v79 = {
    primaryMenu = true, 
    blur = true, 
    _itemButtons = {}, 
    _categorizedItemButtons = {}, 
    _category = nil, 
    _lastCategory = nil, 
    _tradingCache = {}, 
    _inventoryDumpster = v9.new(), 
    rgbHandler = v21.new(), 
    _awaitingFeedback = false
};
local v80 = v9.new();
v79.Init = function(v81, v82, v83) --[[ Line: 166 ]] --[[ Name: Init ]]
    -- upvalues: v28 (ref), v8 (copy), v29 (ref), v30 (ref), v31 (ref), v32 (ref), v33 (ref), v34 (ref), v35 (ref), v36 (ref), v37 (ref), v38 (ref), v39 (ref), v40 (ref), v41 (ref), v42 (ref), v43 (ref), v44 (ref), v45 (ref), v46 (ref), v47 (ref), v48 (ref), v49 (ref), v50 (ref), v51 (ref), v52 (ref), v53 (ref), v54 (ref), v55 (ref), v56 (ref), v57 (ref), v58 (ref), v59 (ref), v73 (ref), v68 (ref), v60 (ref), v61 (ref), v62 (ref), v63 (ref), v64 (ref), v65 (ref), v66 (ref), v67 (ref)
    v28 = v8.GetController("UIController");
    v29 = v8.GetController("DataController");
    v30 = v8.GetService("BoostsService");
    v31 = v8.GetController("DeviceTypeController");
    v32 = v8.GetService("TreasureService");
    v33 = v8.GetController("TreasureController");
    v34 = v8.GetService("GiftService");
    v35 = v8.GetController("PurchaseController");
    v36 = v8.GetController("VDayGiftController");
    v37 = v8.GetController("BubblePopperController");
    v38 = v8.GetService("InventoryService");
    v39 = v8.GetController("MountController");
    v40 = v8.GetController("ChallengeUnitGiftController");
    v41 = v8.GetController("NewChallengeGiftController");
    v42 = v8.GetController("FactionWorldController");
    v43 = v8.GetController("EasterEggController");
    v44 = v8.GetController("DragonEggController");
    v45 = v8.GetController("ExoticCrateController");
    v46 = v8.GetService("UnitService");
    v47 = v8.GetController("ScoopCapsuleController");
    v48 = v8.GetController("SandCrateController");
    v49 = v8.GetController("RogueCrateController");
    v50 = v8.GetController("PetCrateController");
    v51 = v8.GetController("PatriciaCrateController");
    v52 = v8.GetController("KampKrateController");
    v53 = v8.GetController("CyclopsVaultController");
    v54 = v8.GetController("PrizedEggController");
    v55 = v8.GetController("PioneerCrateController");
    v56 = v8.GetController("FighterCrateController");
    v57 = v8.GetController("KarateKrateController");
    v58 = v8.GetController("AdminCrateController");
    v59 = v8.GetService("TowerKarateService");
    v73 = v28:GetModuleAsync("MessagePrompt"):expect();
    v68 = v28:GetModuleAsync("HUD"):expect();
    v60 = v8.GetService("SeasonPassService");
    v61 = v8.GetService("CurrencyService");
    v62 = v8.GetController("FeastCrateController");
    v63 = v8.GetController("CoralGiftController");
    v64 = v8.GetController("SwashbucklerCrateController");
    v65 = v8.GetController("CruiseCrateController");
    v66 = v8.GetController("SnowCrateController");
    v67 = v8.GetController("HolidayCrateController");
    v81.currentMode = v83;
    v81.ui = v82;
    v81.main = v82.Main;
    v81.content = v81.main.Content;
    v81.categoryButtons = v81.content.Top.Buttons;
    v81.searchFrame = v81.content.Top.SearchFrame;
    v81.searchBar = v81.searchFrame.SearchBar.TextBox;
    v81.bin = v81.content.Bin;
    v81.templateBtn = v81.bin.Template:Clone();
    v81.exitBtn = v81.main.Exit;
    v81.hoverTooltip = v81.ui.HoverTooltip;
    v81.selectionTooltip = v81.ui.SelectionTooltip;
    v81.templateBtn.Parent = nil;
    v81.templateBtn:SetAttribute("InvertClick", true);
    v81.useBtn = v81.selectionTooltip.Content.Options.Use;
    v81.useBtn2 = v81.selectionTooltip.Content.Options.Use2;
    v81.useBtn3 = v81.selectionTooltip.Content.Options.Use2:Clone();
    v81.useBtn3.Name = "Use3";
    v81.useBtn3.LayoutOrder = v81.useBtn2.LayoutOrder + 1;
    v81.useBtn3.Visible = false;
    v81.useBtn3.Parent = v81.useBtn2.Parent;
    v81.use2ChestsFrame = v81.selectionTooltip.Content.Options.Use2_Chests;
    v81.hoverTooltip.Visible = false;
    v81.selectionTooltip.Visible = false;
    v81.detailsBtn = v81.selectionTooltip.Content.Options.MoreOptions.Details;
    v81.favoriteBtn = v81.selectionTooltip.Content.Options.MoreOptions.Favorite;
    v81.bin.Template:Destroy();
end;
v79.Start = function(v84) --[[ Line: 250 ]] --[[ Name: Start ]]
    -- upvalues: v69 (ref), v28 (ref), v70 (ref), v71 (ref), v74 (ref), v72 (ref), v8 (copy), v22 (copy), v35 (ref), v29 (ref), v77 (copy), v12 (copy), v78 (copy), v38 (ref)
    v69 = v28:GetModuleAsync("Units"):expect();
    v70 = v28:GetModuleAsync("SendGift"):expect();
    v71 = v28:GetModuleAsync("NumberPrompt"):expect();
    v74 = v28:GetModuleAsync("Notification"):expect();
    if v84.currentMode == "Trading" then
        v72 = v28:GetModuleAsync("Trade"):expect();
    end;
    v28:HandleButton(v84.exitBtn, function() --[[ Line: 260 ]]
        -- upvalues: v84 (copy), v28 (ref), v8 (ref), v22 (ref)
        v84:_deselectItem();
        v28:Toggle(script.Name, false):andThen(function() --[[ Line: 262 ]]
            -- upvalues: v8 (ref), v22 (ref), v28 (ref)
            if v8.Player:GetAttribute(v22.TRADING.ATTRIBUTE) then
                v28:Toggle("Trade", true);
            end;
        end);
    end);
    v28:HandleButton(v84.selectionTooltip.Content.Options.Cancel, function() --[[ Line: 269 ]]
        -- upvalues: v84 (copy)
        v84:_deselectItem();
    end);
    v28:HandleButton(v84.useBtn, function() --[[ Line: 273 ]]
        -- upvalues: v84 (copy)
        v84:_attemptUseSelectedItem(nil, false);
    end);
    v28:HandleButton(v84.useBtn2, function() --[[ Line: 277 ]]
        -- upvalues: v84 (copy)
        v84:_attemptUseSelectedItem(nil, true);
    end);
    v28:HandleButton(v84.useBtn3, function() --[[ Line: 281 ]]
        -- upvalues: v84 (copy)
        v84:_attemptUseSelectedItem(3);
    end);
    local function v89(v85) --[[ Line: 285 ]] --[[ Name: openChest ]]
        -- upvalues: v84 (copy), v35 (ref), v8 (ref)
        if not v84._itemSelected then
            return;
        else
            local v86 = "Open50Chests";
            if v85 < 50 then
                v86 = "Open10Chests";
            end;
            local l_details_0 = v84._itemSelected.details;
            local _ = v84._itemSelected.name;
            if not l_details_0.isTreasureChest and not l_details_0._rngType then
                return;
            elseif not v35:HasGamepass(v8.Player, v86) then
                v35:PromptGamepassPurchase(v86);
                v84._awaitingFeedback = false;
                return;
            else
                v84:_attemptUseSelectedItem(v85);
                v84._awaitingFeedback = false;
                return;
            end;
        end;
    end;
    v84._itemsFavorited = v29:Get(v8.Player, "ItemFavorites"):expect() or {};
    v29:OnChanged(v8.Player, "ItemFavorites", function(v90) --[[ Line: 315 ]]
        -- upvalues: v84 (copy)
        v84._itemsFavorited = v90 or {};
        warn(v84._itemsFavorited);
    end);
    v28:HandleButton(v84.use2ChestsFrame.Use, function() --[[ Line: 321 ]]
        -- upvalues: v89 (copy)
        v89(10);
    end);
    v28:HandleButton(v84.use2ChestsFrame.Use2, function() --[[ Line: 325 ]]
        -- upvalues: v89 (copy)
        v89(50);
    end);
    v84.searchBar.FocusLost:Connect(function() --[[ Line: 329 ]]
        -- upvalues: v84 (copy)
        v84:FilterItemsBySearch(v84.searchBar.Text);
    end);
    for _, v92 in v84.categoryButtons:GetChildren() do
        if v92:IsA("GuiButton") then
            for v93, v94 in v77 do
                local v95 = nil;
                if v12.Exists(v92, v93) then
                    v95 = v12.Find(v92, v93);
                end;
                if v95 then
                    v95.Color = v94;
                end;
            end;
            v28:HandleButton(v92, function() --[[ Line: 352 ]]
                -- upvalues: v84 (copy), v92 (copy)
                v84:SetCategory(v92.Name);
            end);
        end;
    end;
    v29:OnChanged(v8.Player, "Inventory", function(v96) --[[ Line: 357 ]]
        -- upvalues: v84 (copy)
        v84._myInventory = v96;
        v84:_updateInventory();
    end, true);
    v84:SetCategory("All");
    v29:OnChanged(v8.Player, "Mount", function(v97) --[[ Line: 365 ]]
        -- upvalues: v84 (copy)
        v84:_updateEquippedMount(v97);
    end);
    v29:OnChanged(v8.Player, "NewItems", function(v98) --[[ Line: 370 ]]
        -- upvalues: v84 (copy)
        v84:_newItemsAdded(v98);
    end);
    v84.detailsBtn.Visible = false;
    v84.favoriteBtn.Visible = true;
    local function _(v99) --[[ Line: 377 ]] --[[ Name: verifySelectedItem ]]
        -- upvalues: v84 (copy)
        if not v84._itemSelected then
            return false;
        elseif v99 and not v84._itemSelected.details._rngType then
            return false;
        else
            return true;
        end;
    end;
    local v101 = v28:GetModuleAsync("ChestDrops"):expect();
    v28:HandleButton(v84.detailsBtn, function() --[[ Line: 392 ]]
        -- upvalues: v84 (copy), v101 (copy)
        if not (not not v84._itemSelected and (v84._itemSelected.details._rngType and true or false)) then
            return;
        else
            v101:ShowDropChances(v84._itemSelected.details._rngType, script.Name);
            return;
        end;
    end);
    v28:HandleButton(v84.favoriteBtn, function() --[[ Line: 402 ]]
        -- upvalues: v84 (copy), v78 (ref), v12 (ref), v22 (ref), v38 (ref)
        if not v84._itemSelected then
            return;
        else
            local v102 = not (v84._itemsFavorited[v84._itemSelected.name] == true);
            local v103 = 0;
            if v102 then
                v103 = -1000;
            end;
            for v104, v105 in v78[v102] do
                if v12.Exists(v84.favoriteBtn, v104) then
                    local v106 = v12.Find(v84.favoriteBtn, v104);
                    for v107, v108 in v105 do
                        v106[v107] = v108;
                    end;
                end;
            end;
            local l_details_1 = v84._itemSelected.details;
            local v110 = l_details_1.visualRarity or l_details_1.rarity;
            v84._itemSelected.button.LayoutOrder = v103 - v22.RARITIES_FROM_NAME[v110] or 0;
            v84._itemSelected.button.Content.Info.Favorited.Visible = v102;
            v38:ToggleFavorite(v84._itemSelected.name);
            return;
        end;
    end);
end;
v79.Opening = function(v111) --[[ Line: 437 ]] --[[ Name: Opening ]]
    v111.rgbHandler:Enable();
end;
v79.Opened = function(v112) --[[ Line: 441 ]] --[[ Name: Opened ]]
    -- upvalues: v31 (ref), l_GuiService_0 (copy), v9 (copy), l_UserInputService_0 (copy), v8 (copy), v68 (ref)
    if v112._inputDump then
        v112._inputDump:Destroy();
    end;
    if v31:IsConsole() then
        l_GuiService_0:Select(v112.bin);
    end;
    v112._inputDump = v9.new();
    v112._inputDump:Add(l_UserInputService_0.InputEnded:Connect(function(v113, v114) --[[ Line: 452 ]]
        -- upvalues: v112 (copy), v31 (ref), v8 (ref)
        if not v112._itemSelected then
            return;
        elseif v31:IsConsole() then
            return;
        else
            if v113.UserInputType == Enum.UserInputType.MouseButton1 or v113.UserInputType == Enum.UserInputType.Touch then
                local l_Position_0 = v113.Position;
                for _, v117 in (v8.PlayerGui:GetGuiObjectsAtPosition(l_Position_0.X, l_Position_0.Y)) do
                    if v117:IsDescendantOf(v112.selectionTooltip) then
                        return;
                    end;
                end;
                v112:_deselectItem();
            end;
            if v114 then
                v112:_deselectItem();
            end;
            return;
        end;
    end));
    local v118 = v31:ObserveGamepadButtonPress(Enum.KeyCode.ButtonB, function() --[[ Line: 479 ]]
        -- upvalues: v112 (copy)
        v112:_deselectItem();
    end);
    v112._inputDump:Add(function() --[[ Line: 483 ]]
        -- upvalues: v118 (ref), v112 (copy)
        v118();
        v118 = nil;
        v112._inputDump = nil;
    end);
    v68:ToggleBottomLobbyFrame(false);
end;
v79.Closed = function(v119) --[[ Line: 492 ]] --[[ Name: Closed ]]
    if v119._inputDump then
        v119._inputDump:Destroy();
    end;
    v119:FilterItemsBySearch();
    v119:_deselectItem();
    v119.rgbHandler:Disable();
end;
v79.Closing = function(_) --[[ Line: 503 ]] --[[ Name: Closing ]]
    -- upvalues: v68 (ref)
    v68:ToggleBottomLobbyFrame(true);
end;
v79.SetCategory = function(v121, v122, v123) --[[ Line: 508 ]] --[[ Name: SetCategory ]]
    -- upvalues: v77 (copy), v12 (copy), v76 (copy)
    if not v123 and v121._category == v122 then
        return;
    else
        local l_FirstChild_0 = v121.categoryButtons:FindFirstChild(v121._category or "");
        local l_FirstChild_1 = v121.categoryButtons:FindFirstChild(v122);
        if l_FirstChild_0 then
            for v126, v127 in v77 do
                local v128 = nil;
                if v12.Exists(l_FirstChild_0, v126) then
                    v128 = v12.Find(l_FirstChild_0, v126);
                end;
                if v128 then
                    v128.Color = v127;
                end;
            end;
            l_FirstChild_0.Content.Title.Visible = false;
            l_FirstChild_0.Content.Icon.ImageTransparency = 0.65;
        end;
        if l_FirstChild_1 then
            for v129, v130 in v76 do
                local v131 = nil;
                if v12.Exists(l_FirstChild_1, v129) then
                    v131 = v12.Find(l_FirstChild_1, v129);
                end;
                if v131 then
                    v131.Color = v130;
                end;
            end;
            l_FirstChild_1.Content.Title.Visible = true;
            l_FirstChild_1.Content.Icon.ImageTransparency = 0;
        end;
        v121._category = v122;
        for _, v133 in v121._itemButtons do
            if v121._category == "All" then
                v133.button.Visible = true;
            else
                v133.button.Visible = v121._category == "All" or v133.category == v121._category;
            end;
        end;
        return;
    end;
end;
v79.FilterItemsBySearch = function(v134, v135) --[[ Line: 568 ]] --[[ Name: FilterItemsBySearch ]]
    -- upvalues: v10 (copy)
    if v134.trading then
        return;
    else
        v135 = string.lower(v135 or "");
        local v139 = v10.Filter(v134._itemButtons, function(v136, v137) --[[ Line: 576 ]]
            -- upvalues: v134 (copy), v135 (ref)
            local v138 = v134._category == "All" or v136.category == v134._category;
            if v135 == "" then
                return v138;
            elseif not (string.find(string.lower(v137), v135) ~= nil) then
                return false;
            else
                return v138;
            end;
        end);
        for v140, v141 in v134._itemButtons do
            v141.button.Visible = v139[v140] ~= nil;
        end;
        table.clear(v139);
        v139 = nil;
        return;
    end;
end;
v79.OpenForTrading = function(v142) --[[ Line: 600 ]] --[[ Name: OpenForTrading ]]
    -- upvalues: v16 (copy), v28 (ref)
    v142.trading = true;
    if not v142._lastCategory then
        v142._lastCategory = v142._category or "All";
        for v143, v144 in v142._itemButtons do
            v144.button.Visible = v16:IsTradeable(v143) and (v16:IsFood(v143) or v16:IsGiftItem(v143) or v16:IsMount(v143) or v16:IsRNGItem(v143));
        end;
    end;
    v142.highPriority = true;
    v142.ToggleAll = {};
    v142.categoryButtons.Visible = false;
    v142.content.Trading.Visible = true;
    v142.searchFrame.Visible = false;
    v142.main.Position = UDim2.fromScale(0.5, 0.5);
    v28:Toggle(script.Name, true);
end;
v79.RemoveItemFromTrading = function(v145, v146, v147) --[[ Line: 626 ]] --[[ Name: RemoveItemFromTrading ]]
    if not v146 or not v147 then
        return;
    elseif not v145._tradingCache[v146] then
        return;
    else
        local v148 = math.max(v145._tradingCache[v146] - v147, 0);
        v145._tradingCache[v146] = v148;
        v145:_updateItemAmount(v146, (v145._myInventory[v146] or 0) - v148);
        return;
    end;
end;
v79.StopTrading = function(v149) --[[ Line: 641 ]] --[[ Name: StopTrading ]]
    -- upvalues: v28 (ref), v75 (copy)
    v149.trading = false;
    for v150 in v149._tradingCache do
        v149:_updateItemAmount(v150, v149._myInventory[v150] or 0);
    end;
    v149._tradingCache = {};
    v28:Toggle(script.Name, false):finally(function() --[[ Line: 650 ]]
        -- upvalues: v149 (copy), v75 (ref)
        if v149._lastCategory and not v149.trading then
            v149:SetCategory(v149._lastCategory, true);
            v149._lastCategory = nil;
            v149.highPriority = false;
            v149.ToggleAll = nil;
            v149.content.Trading.Visible = false;
            v149.categoryButtons.Visible = true;
            v149.searchFrame.Visible = true;
            v149.main.Position = v75;
        end;
    end);
end;
v79._updateItemAmount = function(v151, v152, v153) --[[ Line: 668 ]] --[[ Name: _updateItemAmount ]]
    local v154 = v151._itemButtons[v152];
    local v155 = v154 and v154.button;
    if v155 then
        v155.Visible = v153 > 0;
        v155.Content.Info.Amount.Text = ("x%*"):format(v153);
    end;
end;
v79._updateInventory = function(v156) --[[ Line: 677 ]] --[[ Name: _updateInventory ]]
    -- upvalues: v80 (copy), v16 (copy), v24 (copy), v35 (ref), v22 (copy), v19 (copy), v28 (ref), l_RunService_0 (copy)
    v80:Destroy();
    for v157, v158 in v156._itemButtons do
        if not v156._myInventory[v157] then
            if v158.button then
                v156.rgbHandler:RemoveObject(v158.button.Content.Glow);
                v156.rgbHandler:RemoveObject(v158.button.Content.Backdrop);
                if v156._itemSelected and v156._itemSelected.name == v157 then
                    v156:_deselectItem();
                end;
                v158.button:Destroy();
            end;
            local v159 = v156._categorizedItemButtons[v158.category];
            if v159 then
                v159[v157] = nil;
            end;
            v156._itemButtons[v157] = nil;
            v156._inventoryDumpster:Remove("Button_" .. v157);
        end;
    end;
    local function v174(v160, v161, v162) --[[ Line: 703 ]] --[[ Name: addItem ]]
        -- upvalues: v156 (copy), v16 (ref), v24 (ref), v35 (ref), v22 (ref), v19 (ref), v28 (ref), l_RunService_0 (ref)
        local v163 = v156._itemButtons[v160];
        local v164 = v163 and v163.button;
        v162 = v162 or v16.All[v160];
        if not v162 then
            return;
        else
            if not v164 then
                v164 = v156.templateBtn:Clone();
                v164.Name = v160;
                v164.Content.Info.ItemName.Text = v162.displayName or v162.DisplayName or v160;
                v24:SetIcon(v164.Content.Info.Icon, v160, {
                    type = "Item"
                });
                if v16:IsGiftItem(v160) then
                    local l_UICorner_0 = Instance.new("UICorner");
                    l_UICorner_0.CornerRadius = UDim.new(1, 0);
                    l_UICorner_0.Parent = v164.Content.Info.Icon;
                end;
                if v16:IsCurrencyGift(v160) then
                    local l_v35_Product_0 = v35:GetProduct(v162.currencyPackName);
                    local v167 = l_v35_Product_0 and l_v35_Product_0.purchaseData and l_v35_Product_0.purchaseData.currency;
                    if v167 then
                        local l_name_1 = v167.name;
                        local l_amount_0 = v167.amount;
                        local l_v16_ByItemName_0 = v16:GetByItemName(l_name_1);
                        if l_v16_ByItemName_0 then
                            local v171 = l_v16_ByItemName_0.displayName or l_v16_ByItemName_0.DisplayName or l_name_1;
                            v164.Content.Info.ItemName.Text = ("(\240\159\142\129) %* %*"):format(l_amount_0, v171);
                        end;
                    end;
                end;
                local v172 = 0;
                if v156._itemsFavorited[v160] == true then
                    v172 = -1000;
                end;
                v164.LayoutOrder = v172 - v22.RARITIES_FROM_NAME[v162.visualRarity or v162.rarity] or 0;
                v156._itemButtons[v160] = {
                    button = v164, 
                    category = v162.category
                };
                local v173 = v156._categorizedItemButtons[v162.category];
                if not v173 then
                    v173 = {};
                    v156._categorizedItemButtons[v162.category] = v173;
                end;
                v173[v160] = v164;
                if v156._category ~= "All" and v162.category ~= v156._category then
                    v164.Visible = false;
                else
                    v164.Visible = true;
                end;
                v164.Parent = v156.bin;
                v156.rgbHandler:AddObject(v164.Content.Glow, v162.visualRarity or v162.rarity);
                v156.rgbHandler:AddObject(v164.Content.Backdrop, v162.visualRarity or v162.rarity);
                v19.new(v164, {
                    Name = v160, 
                    ItemInfo = v162
                }, function() --[[ Line: 780 ]]
                    -- upvalues: v156 (ref)
                    return v156._itemSelected == nil;
                end);
                v156._inventoryDumpster:Add(v28:HandleButton(v164, function() --[[ Line: 784 ]]
                    -- upvalues: l_RunService_0 (ref), v156 (ref), v160 (copy), v162 (ref), v164 (ref)
                    l_RunService_0.RenderStepped:Once(function() --[[ Line: 785 ]]
                        -- upvalues: v156 (ref), v160 (ref), v162 (ref), v164 (ref)
                        v156:_selectItem(v160, v162, v164);
                    end);
                end), "Button_" .. v160);
            end;
            v164.Content.Info.Favorited.Visible = v156._itemsFavorited[v160] == true;
            v164.Content.Info.Amount.Text = ("x%*"):format(v161);
            return;
        end;
    end;
    for v175, v176 in v156._myInventory do
        v174(v175, v176);
    end;
    v156:_updateEquippedMount();
    v156:_newItemsAdded();
end;
v79._selectItem = function(v177, v178, v179, v180) --[[ Line: 803 ]] --[[ Name: _selectItem ]]
    -- upvalues: v22 (copy), v16 (copy), v71 (ref), v72 (ref), v9 (copy), v78 (copy), v12 (copy), v24 (copy), v20 (copy), v35 (ref), v8 (copy), v29 (ref), v38 (ref), v18 (copy), l_RunService_0 (copy), v31 (ref), l_GuiService_0 (copy)
    if v177._itemSelected and v177._itemSelected.name == v178 then
        v177:_deselectItem();
        return;
    else
        v177.selectionTooltip.Position = UDim2.fromScale(-1, -1);
        local v181 = v177._myInventory[v178] or 0;
        if v177._tradingCache[v178] then
            v181 = v181 - v177._tradingCache[v178];
        end;
        if v177.trading then
            local v182 = math.min(v22.TRADING.MAX_STACK, v181);
            if v16:IsFood(v178) then
                v182 = v181;
            end;
            v71:Prompt({
                message = "How many of this item would you like to trade?", 
                highPriority = true, 
                minAmount = 1, 
                maxAmount = v182, 
                hasAmount = v181, 
                callback = function(v183) --[[ Line: 832 ]] --[[ Name: callback ]]
                    -- upvalues: v72 (ref), v178 (copy), v177 (copy), v181 (ref)
                    if v183 < 1 then
                        return;
                    elseif not v72:AddItemStack(v178, v183) then
                        return;
                    else
                        if not v177._tradingCache[v178] then
                            v177._tradingCache[v178] = 0;
                        end;
                        local l__tradingCache_0 = v177._tradingCache;
                        local l_v178_0 = v178;
                        l__tradingCache_0[l_v178_0] = l__tradingCache_0[l_v178_0] + v183;
                        v177:_updateItemAmount(v178, v181 - v183);
                        return;
                    end;
                end
            });
            return;
        else
            v177._itemSelected = {
                name = v178, 
                amount = v181, 
                details = v179, 
                button = v180
            };
            v177.detailsBtn.Visible = v179._rngType ~= nil;
            v177.favoriteBtn.Visible = true;
            if v179._rngType == "VDayGift" then
                v177.detailsBtn.Visible = false;
            end;
            if v177._tooltipDump then
                v177._tooltipDump:Destroy();
            end;
            v177._tooltipDump = v9.new();
            v177._tooltipDump:Add(function() --[[ Line: 875 ]]
                -- upvalues: v177 (copy)
                task.defer(function() --[[ Line: 876 ]]
                    -- upvalues: v177 (ref)
                    v177.ignoreClosePrimaryMenus = false;
                end);
                v177.selectionTooltip.Visible = false;
                v177._tooltipDump = nil;
            end);
            v177.selectionTooltip.Content.ItemName.Text = v179.displayName or v179.DisplayName or v178;
            v177.selectionTooltip.Content.ItemAmount.Visible = v179.isMount == false;
            v177.selectionTooltip.Content.ItemAmount.Text = ("x%*"):format(v181);
            v177.selectionTooltip.Content.Rarity.Text = v179.visualRarity or v179.rarity or "";
            v177.selectionTooltip.Content.Description.Text = v179.description or "";
            local l_v78_0 = v78;
            local v187 = v177._itemsFavorited[v178] == true;
            for v188, v189 in l_v78_0[v187] do
                if v12.Exists(v177.favoriteBtn, v188) then
                    local v190 = v12.Find(v177.favoriteBtn, v188);
                    for v191, v192 in v189 do
                        v190[v191] = v192;
                    end;
                end;
            end;
            if v179.description and string.find(v179.description, "{numXP}") then
                v177.selectionTooltip.Content.Description.Text = string.gsub(v179.description, "{numXP}", v24:SuffixNumber(v20:GetXP(v178) or 0, true, 1));
            end;
            v177.useBtn.Visible = not v179.noUse;
            v177.useBtn2.Visible = false;
            v177.useBtn3.Visible = false;
            v177.use2ChestsFrame.Visible = false;
            if v179.isTreasureChest or v179.isVDayGift or v179.isRNGRollItem or v179._rngType ~= nil then
                v177.useBtn.Content.Title.Text = "Open";
                v177.useBtn2.Content.Title.Text = "Open All";
                v177.useBtn2.Visible = false;
                if not v179.disableMultiOpen then
                    v177.use2ChestsFrame.Visible = true;
                    v177.useBtn2.Visible = false;
                    l_v78_0 = v35:HasGamepass(v8.Player, "Open10Chests") or false;
                    v177.use2ChestsFrame.Use2.Content.Title.Text = l_v78_0 and "x50" or "Open x50";
                    v177.use2ChestsFrame.Use.Visible = l_v78_0;
                else
                    v177.use2ChestsFrame.Visible = false;
                end;
            elseif v179.isMount then
                l_v78_0 = v29:Get(v8.Player, "Mount"):expect();
                v177.useBtn.Content.Title.Text = l_v78_0 == v178 and "Un-equip" or "Equip";
            elseif v179.isKarateGlove then
                v177.useBtn.Content.Title.Text = "Equip";
            else
                v177.useBtn.Content.Title.Text = "Use";
            end;
            if v16:IsCurrencyGift(v178) then
                l_v78_0 = v35:GetProduct(v179.currencyPackName);
                v187 = l_v78_0 and l_v78_0.purchaseData and l_v78_0.purchaseData.currency;
                if v187 then
                    local l_name_2 = v187.name;
                    local l_amount_1 = v187.amount;
                    local l_v16_ByItemName_1 = v16:GetByItemName(l_name_2);
                    if l_v16_ByItemName_1 then
                        local v196 = l_v16_ByItemName_1.displayName or l_v16_ByItemName_1.DisplayName or l_name_2;
                        v177.selectionTooltip.Content.ItemName.Text = ("(\240\159\142\129) %* %*"):format(l_amount_1, v196);
                    end;
                end;
            end;
            v180.Content.Info.ClaimNotifier.Visible = false;
            v38.ClearNotification:Fire(v178);
            v177._tooltipDump:Add(v18.new(v177.selectionTooltip.Content.UIStroke, v179.visualRarity or v179.rarity));
            v177._tooltipDump:Add(v18.new(v177.selectionTooltip.Content.Rarity, v179.visualRarity or v179.rarity));
            v177._tooltipDump:Add(v18.new(v177.selectionTooltip.Glow, v179.visualRarity or v179.rarity));
            v177._tooltipDump:Add(l_RunService_0.RenderStepped:Connect(function() --[[ Line: 969 ]]
                -- upvalues: v177 (copy), v180 (copy)
                local l_AbsolutePosition_0 = v177.selectionTooltip.Parent.AbsolutePosition;
                local l_AbsolutePosition_1 = v180.AbsolutePosition;
                local l_AbsoluteSize_0 = v180.AbsoluteSize;
                local v200 = l_AbsolutePosition_1.X - l_AbsolutePosition_0.X + l_AbsoluteSize_0.X * 1.15;
                local v201 = l_AbsolutePosition_1.Y - l_AbsolutePosition_0.Y - l_AbsoluteSize_0.X * 0.1;
                v177.selectionTooltip.Position = UDim2.fromOffset(v200, v201);
            end));
            v177.selectionTooltip.Visible = true;
            v177.ignoreClosePrimaryMenus = true;
            if v31:IsConsole() then
                l_GuiService_0.SelectedObject = v177.selectionTooltip.Content.Options.Use;
            end;
            return;
        end;
    end;
end;
v79._deselectItem = function(v202) --[[ Line: 989 ]] --[[ Name: _deselectItem ]]
    if v202._tooltipDump then
        v202._tooltipDump:Destroy();
    end;
    v202._itemSelected = nil;
    v202.selectionTooltip.Visible = false;
end;
v79._attemptUseSelectedItem = function(v203, v204, v205) --[[ Line: 999 ]] --[[ Name: _attemptUseSelectedItem ]]
    -- upvalues: v28 (ref), v39 (ref), v69 (ref), v30 (ref), v59 (ref), v71 (ref), v60 (ref), v16 (copy), v61 (ref), v24 (copy), v46 (ref), v74 (ref), v26 (copy), v73 (ref), v27 (copy), v33 (ref), v40 (ref), v41 (ref), v43 (ref), v44 (ref), v45 (ref), v47 (ref), v48 (ref), v49 (ref), v50 (ref), v51 (ref), v52 (ref), v53 (ref), v55 (ref), v56 (ref), v54 (ref), v57 (ref), v58 (ref), v62 (ref), v63 (ref), v64 (ref), v65 (ref), v66 (ref), v67 (ref), v37 (ref), v36 (ref), v23 (copy), v70 (ref)
    v205 = v205 or 1;
    if not v203._itemSelected then
        return;
    else
        local l_details_2 = v203._itemSelected.details;
        local l_name_3 = v203._itemSelected.name;
        if l_details_2.isMap then
            v28:Toggle(l_name_3, true);
            return;
        elseif l_details_2.isMount then
            v39:Equip(l_name_3);
            return;
        elseif l_details_2.category == "Food" then
            v69:OpenWithState("FeedSelection");
            return;
        elseif l_details_2.category == "Materials" then
            return;
        elseif v203._awaitingFeedback then
            return;
        else
            v203._awaitingFeedback = true;
            if l_details_2.isBoost then
                v30:UseBoost(l_name_3):andThen(function() --[[ Line: 1040 ]]
                    -- upvalues: v203 (copy)
                    v203._awaitingFeedback = false;
                end):catch(function() --[[ Line: 1042 ]]
                    -- upvalues: v203 (copy)
                    v203._awaitingFeedback = false;
                end);
                return;
            elseif l_details_2.isKarateGlove then
                v59:EquipGlove(l_name_3):finally(function() --[[ Line: 1050 ]]
                    -- upvalues: v203 (copy)
                    v203._awaitingFeedback = false;
                end);
                return;
            elseif l_details_2.seasonXPItem == true then
                v71:Prompt({
                    message = "How much Season XP would you like to use?", 
                    highPriority = true, 
                    minAmount = 1, 
                    maxAmount = v203._itemSelected.amount, 
                    hasAmount = v203._itemSelected.amount, 
                    callback = function(v208) --[[ Line: 1063 ]] --[[ Name: callback ]]
                        -- upvalues: v60 (ref), v203 (copy)
                        v208 = v208 or 1;
                        if v208 < 1 then
                            v208 = 1;
                        end;
                        v60:UseSeasonXP(v208):finally(function() --[[ Line: 1070 ]]
                            -- upvalues: v203 (ref)
                            v203._awaitingFeedback = false;
                        end);
                    end, 
                    onFinished = function() --[[ Line: 1074 ]] --[[ Name: onFinished ]]
                        -- upvalues: v203 (copy)
                        v203._awaitingFeedback = false;
                    end
                });
                return;
            else
                local l_v16_DisplayName_0 = v16:GetDisplayName(l_name_3);
                if v16:IsCurrency(l_name_3) == true then
                    v71:Prompt({
                        message = ("How much %* would you like to use?"):format(l_v16_DisplayName_0), 
                        highPriority = true, 
                        minAmount = 1, 
                        maxAmount = v203._itemSelected.amount, 
                        hasAmount = v203._itemSelected.amount, 
                        callback = function(v210) --[[ Line: 1090 ]] --[[ Name: callback ]]
                            -- upvalues: v61 (ref), l_name_3 (copy)
                            v210 = v210 or 1;
                            if v210 < 1 then
                                v210 = 1;
                            end;
                            v61:RedeemCurrencyItem(l_name_3, v210);
                        end, 
                        onFinished = function() --[[ Line: 1099 ]] --[[ Name: onFinished ]]
                            -- upvalues: v203 (copy)
                            v203._awaitingFeedback = false;
                        end
                    });
                    return;
                else
                    local v211 = v24:Highlight(l_v16_DisplayName_0);
                    if l_details_2.isRelic then
                        v69:OpenWithState("GeneralSelection", {
                            selectionText = ("Select unit to use %*"):format(v211), 
                            filter = {
                                ExcludeResourceUnits = true
                            }, 
                            callback = function(v212) --[[ Line: 1114 ]] --[[ Name: callback ]]
                                -- upvalues: v203 (copy), v69 (ref), v46 (ref), l_name_3 (copy), v74 (ref), l_v16_DisplayName_0 (copy), v24 (ref), v16 (ref), v26 (ref), v73 (ref), v211 (copy)
                                if not v212 then
                                    v203._awaitingFeedback = false;
                                    return;
                                else
                                    local function v214() --[[ Line: 1121 ]] --[[ Name: applyRelic ]]
                                        -- upvalues: v69 (ref), v46 (ref), v212 (copy), l_name_3 (ref), v203 (ref), v74 (ref), l_v16_DisplayName_0 (ref)
                                        v69:SetState("Normal");
                                        v46:UseRelic(v212.Name, v212.UID, l_name_3):andThen(function(v213) --[[ Line: 1125 ]]
                                            -- upvalues: v203 (ref), v74 (ref), l_v16_DisplayName_0 (ref), v212 (ref)
                                            v203._awaitingFeedback = false;
                                            v74:Notify({
                                                message = if v213 then ("Successfully used %* Relic on %*"):format(l_v16_DisplayName_0, v212.Name) else "Something went wrong!", 
                                                isPositive = v213, 
                                                duration = 4
                                            });
                                        end);
                                    end;
                                    local l_Relic_0 = v212.Data.Relic;
                                    local v216 = v24:Highlight(v16:GetDisplayName(l_Relic_0));
                                    local v217 = v24:Highlight(v26:GetUnitValue(v212.Name, "FullName"));
                                    if not l_Relic_0 then
                                        v73:Prompt({
                                            message = ("Use %* Relic on %*?"):format(v211, v217), 
                                            options = {
                                                {
                                                    text = "Yes", 
                                                    callback = v214
                                                }, 
                                                {
                                                    text = "No"
                                                }
                                            }
                                        });
                                        return;
                                    else
                                        local v218 = tonumber(string.match(l_name_3, "_(%d+)$"));
                                        local v219 = tonumber(string.match(l_Relic_0, "_(%d+)$"));
                                        local v220 = if not v219 or v218 and v219 and v218 < v219 then ("Are you sure you want to replace the current Relic?\n\nThe Relic you are replacing is a higher tier than the one you are trying to equip:\n\n%*  \226\134\146  %*"):format(v216, v211) else ("Use %* Relic on %*?\n\nThis will replace it's current Relic: %*"):format(v211, v217, v216);
                                        v73:Prompt({
                                            message = v220, 
                                            options = {
                                                {
                                                    text = "Yes", 
                                                    callback = v214
                                                }, 
                                                {
                                                    text = "No"
                                                }
                                            }
                                        });
                                        return;
                                    end;
                                end;
                            end
                        });
                        return;
                    elseif l_details_2.unitBoost then
                        local v221 = {};
                        if string.find(l_name_3, "ShinyWumboPotion") then
                            v221.ExcludeShinyWumbo = true;
                            v221.UnitRarity = table.clone(l_details_2.canUseOnRarities);
                            v221.ExcludedUnits = l_details_2.excludedUnits and table.clone(l_details_2.excludedUnits);
                        elseif l_name_3 == "SecretFormulaReroll" then
                            v221.ExcludeResourceUnits = true;
                            v221.UnitTraitExclusions = {
                                SecretFormula = true
                            };
                        elseif l_name_3 == "NeptunesCrownReroll" then
                            v221.ExcludeResourceUnits = true;
                            v221.ExcludeNeptunesCrown = true;
                        end;
                        v69:OpenWithState("GeneralSelection", {
                            selectionText = ("Select unit to use %*"):format(v211), 
                            filter = v221, 
                            callback = function(v222) --[[ Line: 1207 ]] --[[ Name: callback ]]
                                -- upvalues: v203 (copy), v24 (ref), v26 (ref), v69 (ref), v46 (ref), l_name_3 (copy), v74 (ref), l_v16_DisplayName_0 (copy), v27 (ref), v73 (ref), v211 (copy)
                                if not v222 then
                                    v203._awaitingFeedback = false;
                                    return;
                                else
                                    local v223 = v24:Highlight(v26:GetUnitValue(v222.Name, "FullName"));
                                    local l_Data_0 = v222.Data;
                                    local function v227(v225) --[[ Line: 1217 ]] --[[ Name: useBoost ]]
                                        -- upvalues: v69 (ref), v46 (ref), v222 (copy), l_name_3 (ref), v203 (ref), v74 (ref), l_v16_DisplayName_0 (ref)
                                        v69:SetState("Normal");
                                        v46:UsePotion(v222.Name, v222.UID, l_name_3, v225):andThen(function(v226) --[[ Line: 1221 ]]
                                            -- upvalues: v203 (ref), v74 (ref), l_v16_DisplayName_0 (ref), v222 (ref)
                                            v203._awaitingFeedback = false;
                                            v74:Notify({
                                                message = if v226 then ("Successfully used %* on %*"):format(l_v16_DisplayName_0, v222.Name) else "Something went wrong!", 
                                                isPositive = v226, 
                                                duration = 4
                                            });
                                        end);
                                    end;
                                    if l_name_3 == "SecretFormulaReroll" and l_Data_0.Trait and l_Data_0.Trait2 then
                                        local l_v27_TraitDisplayName_0 = v27:GetTraitDisplayName(l_Data_0.Trait.Name);
                                        local l_v27_TraitDisplayName_1 = v27:GetTraitDisplayName(l_Data_0.Trait2.Name);
                                        v73:Prompt({
                                            message = "This unit has Neptune's Crown\n\nWhich trait would you like to reroll?", 
                                            multiChoice = true, 
                                            options = {
                                                {
                                                    text = l_v27_TraitDisplayName_0, 
                                                    callback = function() --[[ Line: 1244 ]] --[[ Name: callback ]]
                                                        -- upvalues: v69 (ref), v46 (ref), v222 (copy), l_name_3 (ref), v203 (ref), v74 (ref), l_v16_DisplayName_0 (ref)
                                                        v69:SetState("Normal");
                                                        v46:UsePotion(v222.Name, v222.UID, l_name_3, 1):andThen(function(v230) --[[ Line: 1221 ]]
                                                            -- upvalues: v203 (ref), v74 (ref), l_v16_DisplayName_0 (ref), v222 (ref)
                                                            v203._awaitingFeedback = false;
                                                            v74:Notify({
                                                                message = if v230 then ("Successfully used %* on %*"):format(l_v16_DisplayName_0, v222.Name) else "Something went wrong!", 
                                                                isPositive = v230, 
                                                                duration = 4
                                                            });
                                                        end);
                                                    end
                                                }, 
                                                {
                                                    text = l_v27_TraitDisplayName_1, 
                                                    callback = function() --[[ Line: 1250 ]] --[[ Name: callback ]]
                                                        -- upvalues: v69 (ref), v46 (ref), v222 (copy), l_name_3 (ref), v203 (ref), v74 (ref), l_v16_DisplayName_0 (ref)
                                                        v69:SetState("Normal");
                                                        v46:UsePotion(v222.Name, v222.UID, l_name_3, 2):andThen(function(v231) --[[ Line: 1221 ]]
                                                            -- upvalues: v203 (ref), v74 (ref), l_v16_DisplayName_0 (ref), v222 (ref)
                                                            v203._awaitingFeedback = false;
                                                            v74:Notify({
                                                                message = if v231 then ("Successfully used %* on %*"):format(l_v16_DisplayName_0, v222.Name) else "Something went wrong!", 
                                                                isPositive = v231, 
                                                                duration = 4
                                                            });
                                                        end);
                                                    end
                                                }, 
                                                {
                                                    callback = function() --[[ Line: 1255 ]] --[[ Name: callback ]]
                                                        -- upvalues: v203 (ref)
                                                        v203._awaitingFeedback = false;
                                                    end
                                                }
                                            }
                                        });
                                        return;
                                    else
                                        v73:Prompt({
                                            message = ("Use %* on %*?"):format(v211, v223), 
                                            options = {
                                                {
                                                    text = "Yes", 
                                                    callback = v227
                                                }, 
                                                {
                                                    text = "No"
                                                }
                                            }
                                        });
                                        return;
                                    end;
                                end;
                            end
                        });
                        return;
                    elseif l_details_2.isTreasureChest then
                        v33:AttemptOpen(l_name_3, true, v204);
                        v203._awaitingFeedback = false;
                        return;
                    elseif l_details_2._rngType == "ChallengeGift" then
                        v40:AttemptOpen(v204, true);
                        v203._awaitingFeedback = false;
                        return;
                    elseif l_details_2._rngType == "ChallengeCrate2" then
                        v41:AttemptOpen(v204, true);
                        v203._awaitingFeedback = false;
                        return;
                    elseif l_details_2._rngType == "EasterEgg" then
                        v43:AttemptOpen(l_name_3, v204, true);
                        v203._awaitingFeedback = false;
                        return;
                    elseif l_details_2._rngType == "DragonEgg" then
                        v44:AttemptOpen(l_name_3, v204, true);
                        v203._awaitingFeedback = false;
                        return;
                    elseif l_details_2._rngType == "HydraCrate" then
                        v45:AttemptOpen(l_name_3, v204, true);
                        v203._awaitingFeedback = false;
                        return;
                    elseif l_details_2._rngType == "ScoopCapsule" then
                        v47:AttemptOpen(l_name_3, v204, true);
                        v203._awaitingFeedback = false;
                        return;
                    elseif l_details_2._rngType == "SandCrate" then
                        v48:AttemptOpen(l_name_3, v204, true);
                        v203._awaitingFeedback = false;
                        return;
                    elseif l_details_2._rngType == "RogueCrate" then
                        v49:AttemptOpen(l_name_3, v204, true);
                        v203._awaitingFeedback = false;
                        return;
                    elseif l_details_2._rngType == "PetCrate" then
                        v50:AttemptOpen(l_name_3, v204, true);
                        v203._awaitingFeedback = false;
                        return;
                    else
                        if l_details_2._rngType == "PatriciaCrate" then
                            v51:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                        elseif l_details_2._rngType == "KampKrate" then
                            v52:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                        elseif l_details_2._rngType == "CyclopsVault" then
                            v53:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                        elseif l_details_2._rngType == "PioneerCrate" then
                            v55:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                        elseif l_details_2._rngType == "FighterCrate" then
                            v56:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                        elseif l_details_2._rngType == "PrizedEgg" then
                            v54:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                        elseif l_details_2._rngType == "KarateKrate" then
                            v57:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                        elseif l_details_2._rngType == "AdminCrate" then
                            v58:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                        elseif l_details_2._rngType == "FeastCrate" then
                            v62:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                        elseif l_details_2._rngType == "CoralGift" then
                            v63:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                        elseif l_details_2._rngType == "SwashbucklerCrate" then
                            v64:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                            return;
                        elseif l_details_2._rngType == "CruiseCrate" then
                            v65:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                            return;
                        elseif l_details_2._rngType == "SnowCrate" then
                            v66:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                            return;
                        elseif l_details_2._rngType == "HolidayCrate" then
                            v67:AttemptOpen(l_name_3, v204, true);
                            v203._awaitingFeedback = false;
                            return;
                        elseif l_details_2.isRNGRollItem then
                            v37:AttemptOpen(l_name_3, true);
                            v203._awaitingFeedback = false;
                            return;
                        elseif l_details_2.isVDayGift then
                            v36:AttemptOpen(true);
                            v203._awaitingFeedback = false;
                            return;
                        end;
                        if v16:IsGiftItem(l_name_3) then
                            v203._awaitingFeedback = false;
                            if not v23:IsLobby() and not v23:IsFactionWorld() then
                                v73:Prompt({
                                    message = "Gifts must be redeemed in the lobby.", 
                                    options = {
                                        {
                                            text = "Ok"
                                        }
                                    }
                                });
                                return;
                            else
                                v70:OpenGift(l_name_3);
                                return;
                            end;
                        else
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v79._updateEquippedMount = function(v232, v233) --[[ Line: 1402 ]] --[[ Name: _updateEquippedMount ]]
    -- upvalues: v29 (ref), v8 (copy)
    if not v233 then
        v233 = v29:Get(v8.Player, "Mount"):expect();
    end;
    if v232._itemSelected and v232._itemSelected.details.isMount then
        v232.useBtn.Content.Title.Text = v233 == v232._itemSelected.name and "Un-equip" or "Equip";
    end;
    local l_Mounts_0 = v232._categorizedItemButtons.Mounts;
    if not l_Mounts_0 then
        return;
    else
        for v235, v236 in l_Mounts_0 do
            v236.Content.Info.MountEquipped.Visible = v233 == v235;
        end;
        return;
    end;
end;
v79._newItemsAdded = function(v237, v238) --[[ Line: 1421 ]] --[[ Name: _newItemsAdded ]]
    -- upvalues: v29 (ref), v8 (copy), v16 (copy)
    if not v238 then
        v238 = v29:Get(v8.Player, "NewItems"):expect();
    end;
    local v239 = {};
    for v240 in v238 do
        local v241 = v237._itemButtons[v240];
        if v241 then
            v241.button.Content.Info.ClaimNotifier.Visible = true;
            local v242 = v239[v241.category] or 0;
            v239[v241.category] = v242 + 1;
        end;
    end;
    for v243, v244 in v16 do
        if typeof(v244) == "table" and v243 ~= "All" then
            local v245 = v239[v243] or 0;
            local l_FirstChild_2 = v237.categoryButtons:FindFirstChild(v243);
            if l_FirstChild_2 then
                l_FirstChild_2.ClaimNotifier.Visible = v245 > 0;
            end;
        end;
    end;
end;
return v79;