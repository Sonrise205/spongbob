local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v4 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.CraftingData);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.CraftingUtils);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v11 = require(v1.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v13 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = Color3.fromRGB(255, 44, 48);
local v21 = Color3.fromRGB(41, 255, 55);
local _ = Color3.fromRGB(255, 255, 255);
return {
    ToggleProperties = {
        Main = {
            Open = {
                Position = UDim2.fromScale(0.016, 0.53), 
                ToggleTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine)
            }, 
            Close = {
                Position = UDim2.fromScale(-0.425, 0.53), 
                ToggleTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
            }
        }
    }, 
    hideMobileControls = true, 
    primaryMenu = false, 
    rarityVisualElements = {}, 
    InventoryChanged = v4.new(), 
    CurrencyChanged = v4.new(), 
    ToggleAll = {}, 
    Init = function(v23, v24) --[[ Line: 68 ]] --[[ Name: Init ]]
        -- upvalues: v15 (ref), v1 (copy), v14 (ref), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v7 (copy)
        v15 = v1.GetController("DataController");
        v14 = v1.GetController("UIController");
        v16 = v1.GetController("CraftingController");
        v17 = v1.GetService("CraftingService");
        v18 = v1.GetController("DeviceTypeController");
        v19 = v1.GetController("EventController");
        v23.ui = v24;
        v23.options = v24.Options;
        v23.main = v24.Main;
        v23.content = v23.main.Content;
        v23.preview = v23.content.Preview;
        v23.firstOpenFrame = v23.preview.FirstOpenBackground;
        v23.recipeFrame = v23.preview.RecipeInfo;
        v23.craftButton = v23.recipeFrame.Item.Craft;
        v23.itemFrame = v23.recipeFrame.Item.Icon;
        v23.craftTimeLabel = v23.craftButton.Content.CraftTime.Time;
        v23.recipeMaterialTemplate = v23.recipeFrame.Materials.Template:Clone();
        v23.recipesBin = v23.main.Content.Recipes.Bin;
        v23.recipeTemplate = v23.recipesBin.Template.Bin.Template:Clone();
        v23.recipeCategoryFrames = {};
        v23.recipeButtons = {};
        v23.recipesBin.Template.Bin.Template:Destroy();
        v23.recipeFrame.Materials.Template:Destroy();
        v23.categoryTemplate = v23.recipesBin.Template:Clone();
        v23.recipesBin.Template:Destroy();
        v23.materialFinderFrame = v23.ui.MaterialFinder;
        v23.materialFinderMain = v23.materialFinderFrame.Main;
        v23.materialFinderExit = v23.materialFinderMain.Exit;
        v23.materialFinderContent = v23.materialFinderMain.Content;
        v23.materialWindowToggleButton = v23.content.Folder.MaterialFinder;
        v23:ToggleMaterialFinder(false);
        v23:_generateRecipeButtons();
        v23:_populateMaterialFinder();
        local function v29() --[[ Line: 113 ]] --[[ Name: eventEnded ]]
            -- upvalues: v23 (copy), v7 (ref)
            if not v23.recipeButtons.Event then
                return;
            else
                for v25, v26 in v23.recipeButtons.Event do
                    local l_v7_RecipeData_0 = v7:GetRecipeData(v25);
                    if l_v7_RecipeData_0.postEventCategory then
                        local v28 = v23.recipeCategoryFrames[l_v7_RecipeData_0.postEventCategory];
                        if v28 then
                            v26.Parent = v28.Bin;
                            v23.recipeButtons[l_v7_RecipeData_0.postEventCategory][v25] = v26;
                        end;
                    end;
                end;
                v23.recipeCategoryFrames.Event:Destroy();
                v23.recipeCategoryFrames.Event = nil;
                v23.recipeButtons.Event = nil;
                return;
            end;
        end;
        if not v19:IsActive() and v23.recipeCategoryFrames.Event then
            v29();
        end;
        v19.EventEnded:Connect(v29);
    end, 
    Start = function(v30, _) --[[ Line: 145 ]] --[[ Name: Start ]]
        -- upvalues: v14 (ref), v16 (ref), v15 (ref), v1 (copy), v8 (copy)
        v14:HandleButton(v30.craftButton, function() --[[ Line: 146 ]]
            -- upvalues: v30 (copy), v16 (ref)
            if not v30._selectedRecipeName then
                return;
            else
                v16:RequestServer({
                    action = "Craft", 
                    recipe = v30._selectedRecipeName
                });
                return;
            end;
        end);
        v14:HandleButton(v30.materialWindowToggleButton, function() --[[ Line: 157 ]]
            -- upvalues: v30 (copy)
            v30:ToggleMaterialFinder(true);
        end);
        v14:HandleButton(v30.materialFinderExit, function() --[[ Line: 161 ]]
            -- upvalues: v30 (copy)
            v30:ToggleMaterialFinder(false);
        end);
        v14:HandleButton(v30.options.Exit, function() --[[ Line: 165 ]]
            -- upvalues: v16 (ref)
            v16:StopCrafting();
        end);
        v16:ObserveData(function(v32) --[[ Line: 169 ]]
            -- upvalues: v30 (copy)
            v30.craftingData = v32;
        end);
        v15:OnChanged(v1.Player, "Inventory", function(v33) --[[ Line: 173 ]]
            -- upvalues: v30 (copy)
            v30.myInventory = v33;
            v30.InventoryChanged:Fire();
        end, true);
        v30.myCurrency = v15:Get(v1.Player, "Currency"):expect();
        for _, v35 in v8:GetAllCurrencies() do
            v15:OnChanged(v1.Player, ("Currency.%*"):format(v35), function(v36) --[[ Line: 181 ]]
                -- upvalues: v30 (copy), v35 (copy)
                v30.myCurrency[v35] = v36;
                v30.CurrencyChanged:Fire();
            end, true);
        end;
        v30:_resetVisuals();
    end, 
    Opened = function(v37) --[[ Line: 190 ]] --[[ Name: Opened ]]
        -- upvalues: v18 (ref), v16 (ref)
        v37.unsubscribe = v18:ObserveGamepadButtonPress(Enum.KeyCode.ButtonB, function() --[[ Line: 191 ]]
            -- upvalues: v37 (copy), v16 (ref)
            if v37.materialFinderFrame.Visible then
                v37:ToggleMaterialFinder(false);
                return;
            else
                v16:StopCrafting(false);
                return;
            end;
        end);
    end, 
    Opening = function(v38) --[[ Line: 201 ]] --[[ Name: Opening ]]
        for _, v40 in v38.rarityVisualElements do
            v40:AddTag("VisualizeRarity");
        end;
    end, 
    Closed = function(v41) --[[ Line: 207 ]] --[[ Name: Closed ]]
        v41:_resetVisuals();
        v41:SetRecipe(nil);
        if v41.unsubscribe then
            v41.unsubscribe();
            v41.unsubscribe = nil;
        end;
        for _, v43 in v41.rarityVisualElements do
            v43:RemoveTag("VisualizeRarity");
        end;
        v41:ToggleMaterialFinder(false);
        v41.recipesBin.CanvasPosition = Vector2.zero;
    end, 
    ToggleMaterialFinder = function(v44, v45) --[[ Line: 225 ]] --[[ Name: ToggleMaterialFinder ]]
        v44.main.Visible = not v45;
        v44.options.Visible = not v45;
        v44.materialFinderFrame.Visible = v45;
    end, 
    SetRecipe = function(v46, v47, v48, _) --[[ Line: 231 ]] --[[ Name: SetRecipe ]]
        -- upvalues: v2 (copy), v12 (copy), v6 (copy), v13 (copy), v21 (copy), v20 (copy), v16 (ref), v11 (copy)
        if v46._selectedRecipeName == v47 then
            return;
        else
            v46:_clearMaterialsDisplay();
            if v46._selectionDump then
                v46._selectionDump:Destroy();
            end;
            v46._selectionDump = v2.new();
            v46._selectedRecipeName = v47;
            if not v47 or not v48 or not v48.materials then
                v46:_resetVisuals();
                return;
            else
                if v48.item then
                    v46:SetRecipeVisuals(v46.itemFrame, v47, v48, false);
                end;
                v46._selectionDump:Add(function() --[[ Line: 268 ]]
                    -- upvalues: v46 (copy)
                    v46._selectionDump = nil;
                end);
                local v50 = 0;
                for v51, v52 in v48.materials do
                    local l_v12_ByItemName_0 = v12:GetByItemName(v51);
                    local v54 = l_v12_ByItemName_0 and l_v12_ByItemName_0.rarity or "Common";
                    local v55 = v46.recipeMaterialTemplate:Clone();
                    v55.Name = v51;
                    v55.Visible = true;
                    v55.LayoutOrder = v6.RARITIES_FROM_NAME[v54];
                    v55.Parent = v46.recipeFrame.Materials;
                    v55.Content.Info.Backdrop:SetAttribute("Rarity", v54);
                    v55.Content.Glow:SetAttribute("Rarity", v54);
                    v55.Content.Info.Backdrop:AddTag("VisualizeRarity");
                    v55.Content.Glow:AddTag("VisualizeRarity");
                    v13:SetIcon(v55.Content.Info.Icon, v51, {
                        type = "Crafting"
                    });
                    local function v61() --[[ Line: 294 ]] --[[ Name: updateAmount ]]
                        -- upvalues: v46 (copy), v51 (copy), v52 (copy), v13 (ref), v55 (copy), v21 (ref), v20 (ref), v50 (ref), v16 (ref), v47 (copy)
                        local v56 = v46.myInventory[v51] or v46.myCurrency[v51] or 0;
                        local v57 = v52 <= v56;
                        local v58 = v13:SuffixNumber(v56, false, 1);
                        local v59 = v13:SuffixNumber(v52, false, 1);
                        v55.Content.Info.Amount.Text = ("%*/%*"):format(v58, v59);
                        v55.Content.Info.Amount.TextColor3 = if v57 then v21 else v20;
                        local v60 = os.clock();
                        if v60 - v50 >= 0.1 then
                            v46.craftButton.NeedMaterials.Visible = not v16:CanCraft(v47, false);
                            v50 = v60;
                        end;
                    end;
                    local v62 = v2.new();
                    v11.new(v55, {
                        Name = v51
                    });
                    v62:Add(v46.InventoryChanged:Connect(function() --[[ Line: 317 ]]
                        -- upvalues: v61 (copy)
                        v61();
                    end));
                    v62:Add(v46.CurrencyChanged:Connect(function() --[[ Line: 321 ]]
                        -- upvalues: v61 (copy)
                        v61();
                    end));
                    v61();
                    v62:AttachTo(v55);
                end;
                local v63 = v13:FormatTimeFromSeconds(v48.timeToCraft or 0, true, true);
                v46.craftButton.Content.CraftTime.Time.Text = string.upper(v63);
                v46.firstOpenFrame.Visible = false;
                v46.recipeFrame.Visible = true;
                return;
            end;
        end;
    end, 
    SetRecipeVisuals = function(v64, v65, v66, v67, v68, v69) --[[ Line: 336 ]] --[[ Name: SetRecipeVisuals ]]
        -- upvalues: v8 (copy), v13 (copy), v14 (ref)
        local l_v8_RecipeRarity_0 = v8:GetRecipeRarity(v67, v69);
        v13:SetIcon(v65.Content.Info.Icon, v66, {
            type = v67.item and v67.item.type or "Inventory", 
            isRecipe = true, 
            rngIndex = v69
        });
        local l_UICorner_0 = v65.Content.Info.Icon:FindFirstChildOfClass("UICorner");
        if l_UICorner_0 then
            l_UICorner_0:Destroy();
            l_UICorner_0 = nil;
        end;
        if v67.item and string.find(v67.item.name, "GIFT_") then
            l_UICorner_0 = Instance.new("UICorner");
            l_UICorner_0.CornerRadius = UDim.new(1, 0);
            l_UICorner_0.Parent = v65.Content.Info.Icon;
        end;
        if v67.rngItem then
            l_UICorner_0 = v67.rngItem[v69 or 1];
            if l_UICorner_0 then
                v65.Content.Info.Weight.Text = ("%*%%"):format(l_UICorner_0.weight);
                v65.Content.Info.Weight.Visible = true;
            end;
        else
            v65.Content.Info.Weight.Visible = false;
            v65.Content.Info.Mystery.Visible = false;
        end;
        if v65.Content.Info.Backdrop:HasTag("VisualizeRarity") then
            v65.Content.Info.Backdrop:RemoveTag("VisualizeRarity");
        end;
        if v65.Content.Glow:HasTag("VisualizeRarity") then
            v65.Content.Glow:RemoveTag("VisualizeRarity");
        end;
        v65.Content.Info.Backdrop:SetAttribute("Rarity", l_v8_RecipeRarity_0);
        v65.Content.Glow:SetAttribute("Rarity", l_v8_RecipeRarity_0);
        if v68 then
            if not table.find(v64.rarityVisualElements, v65.Content.Info.Backdrop) then
                table.insert(v64.rarityVisualElements, v65.Content.Info.Backdrop);
            end;
            if not table.find(v64.rarityVisualElements, v65.Content.Glow) then
                table.insert(v64.rarityVisualElements, v65.Content.Glow);
            end;
        end;
        if v14:GetToggleState(script.Name) then
            v65.Content.Info.Backdrop:AddTag("VisualizeRarity");
            v65.Content.Glow:AddTag("VisualizeRarity");
        end;
    end, 
    _resetVisuals = function(v72) --[[ Line: 400 ]] --[[ Name: _resetVisuals ]]
        v72.firstOpenFrame.Visible = true;
        v72.recipeFrame.Visible = false;
        v72:_clearMaterialsDisplay();
    end, 
    _generateRecipeButtons = function(v73) --[[ Line: 406 ]] --[[ Name: _generateRecipeButtons ]]
        -- upvalues: v7 (copy), v19 (ref), v8 (copy), v6 (copy), v2 (copy), v9 (copy), v14 (ref), v11 (copy)
        for v74, v75 in v7.Categories.RecipesPerCategory do
            local v76 = {};
            for v77, v78 in v75 do
                if v77 ~= "category" and typeof(v78) == "table" then
                    if v74 == "Event" then
                        assert(v78.event ~= nil, (("Event Recipe \"%*\" does not have an event specified"):format(v77)));
                        if not v19:IsActive(v78.event) then
                            continue;
                        end;
                    end;
                    if not v78.offsale then
                        local l_v8_RecipeRarity_1 = v8:GetRecipeRarity(v78);
                        local v80 = v73.recipeTemplate:Clone();
                        v80.Name = v77;
                        v80.Visible = true;
                        v80:SetAttribute("InvertClick", true);
                        v80.LayoutOrder = v78.order or v6.RARITIES_FROM_NAME[l_v8_RecipeRarity_1] or 1;
                        local v81 = v2.new();
                        v81:AttachTo(v80);
                        local v82 = nil;
                        do
                            local l_v82_0 = v82;
                            if v78.item then
                                v73:SetRecipeVisuals(v80, v77, v78, true);
                            elseif v78.rngItem then
                                l_v82_0 = 1;
                                v81:Add(v9.Simple(1, function() --[[ Line: 445 ]]
                                    -- upvalues: v14 (ref), v73 (copy), v80 (copy), v77 (copy), v78 (copy), l_v82_0 (ref)
                                    if not v14:GetToggleState(script.Name) then
                                        return;
                                    else
                                        v73:SetRecipeVisuals(v80, v77, v78, true, l_v82_0);
                                        if v73._selectedRecipeName == v77 then
                                            v73:SetRecipeVisuals(v73.itemFrame, v77, v78, false, l_v82_0);
                                        end;
                                        l_v82_0 = l_v82_0 + 1;
                                        if l_v82_0 > #v78.rngItem then
                                            l_v82_0 = 1;
                                        end;
                                        return;
                                    end;
                                end));
                            end;
                            local v84 = {
                                Name = v77, 
                                IsRecipe = true, 
                                hideOwnedAmount = true
                            };
                            if v78.item then
                                if v78.item.type == "Unit" then
                                    v84.IsUnit = true;
                                end;
                                v84.Name = v78.item.name;
                                v84.IsRecipe = nil;
                            end;
                            v11.new(v80, v84);
                            v14:HandleButton(v80, function() --[[ Line: 481 ]]
                                -- upvalues: v73 (copy), v77 (copy), v78 (copy), l_v82_0 (ref)
                                v73:SetRecipe(v77, v78);
                                if l_v82_0 then
                                    v73:SetRecipeVisuals(v73.itemFrame, v77, v78, false, l_v82_0);
                                end;
                            end);
                            v76[v77] = v80;
                        end;
                    end;
                end;
            end;
            if next(v76) then
                v73.recipeButtons[v74] = v76;
                local v85 = v73.categoryTemplate:Clone();
                v85.Name = v74;
                v85.CategoryTitle.Title.Text = v74;
                v85.Visible = true;
                v85.LayoutOrder = v7.Config.CATEGORY_ORDERS[v74] or 999999;
                v85.Parent = v73.recipesBin;
                for _, v87 in v76 do
                    v87.Parent = v85.Bin;
                end;
                v73.recipeCategoryFrames[v74] = v85;
            end;
        end;
    end, 
    _clearMaterialsDisplay = function(v88) --[[ Line: 513 ]] --[[ Name: _clearMaterialsDisplay ]]
        v88._selectedRecipeName = nil;
        for _, v90 in v88.recipeFrame.Materials:GetChildren() do
            if v90:IsA("GuiButton") then
                v90:Destroy();
            end;
        end;
        v88.itemFrame.Content.Info.Backdrop:RemoveTag("VisualizeRarity");
        v88.itemFrame.Content.Glow:RemoveTag("VisualizeRarity");
        v88.itemFrame.Content.Info.Backdrop:SetAttribute("Rarity");
        v88.itemFrame.Content.Glow:SetAttribute("Rarity");
    end, 
    _populateMaterialFinder = function(v91) --[[ Line: 531 ]] --[[ Name: _populateMaterialFinder ]]
        -- upvalues: v7 (copy), v12 (copy), v6 (copy), v14 (ref), v11 (copy), v13 (copy)
        local function v99(v92, v93) --[[ Line: 532 ]] --[[ Name: populateFrame ]]
            -- upvalues: v7 (ref), v12 (ref), v91 (copy), v6 (ref), v14 (ref), v11 (ref), v13 (ref)
            for v94, v95 in v7.Categories.CraftingMaterials do
                if v93(v95) then
                    local l_v12_ByItemName_1 = v12:GetByItemName(v94);
                    local v97 = l_v12_ByItemName_1 and l_v12_ByItemName_1.rarity or "Common";
                    local v98 = v91.recipeMaterialTemplate:Clone();
                    v98.Name = v94;
                    v98.Content.Info.Icon.Position = UDim2.fromScale(0.5, 0.5);
                    v98.Content.Info.Amount.Visible = false;
                    v98.Visible = true;
                    v98.LayoutOrder = v95.order or v6.RARITIES_FROM_NAME[v97];
                    v98.Parent = v92;
                    v98.Content.Info.Backdrop:SetAttribute("Rarity", v97);
                    v98.Content.Glow:SetAttribute("Rarity", v97);
                    table.insert(v91.rarityVisualElements, v98.Content.Info.Backdrop);
                    table.insert(v91.rarityVisualElements, v98.Content.Glow);
                    if v14:GetToggleState(script.Name) then
                        v98.Content.Info.Backdrop:AddTag("VisualizeRarity");
                        v98.Content.Glow:AddTag("VisualizeRarity");
                    end;
                    v11.new(v98, {
                        Name = v94
                    });
                    v13:SetIcon(v98.Content.Info.Icon, v94, {
                        type = "Crafting"
                    });
                end;
            end;
        end;
        for _, v101 in {
            "Story", 
            "Challenge", 
            "Raid"
        } do
            v99(v91.materialFinderContent.TopBin[v101].Bin, function(v102) --[[ Line: 573 ]]
                -- upvalues: v101 (copy)
                return v102.earnType == v101;
            end);
        end;
        v99(v91.materialFinderContent.BottomBin.MysteryMarket.Bin, function(v103) --[[ Line: 578 ]]
            return v103.isMysteryMarketMaterial == true;
        end);
    end
};