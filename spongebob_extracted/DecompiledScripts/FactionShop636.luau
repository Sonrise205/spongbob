local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v11 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v12 = require(l_ReplicatedStorage_0.Shared.Util.RandomUnitDisplay);
local v13 = require(v3.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v14 = require(v3.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local _ = require(l_ReplicatedStorage_0.RNGRolls);
local v16 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.ChallengerCratePack);
local v18 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v19 = require(l_ReplicatedStorage_0.Shared.Util.FactionsUtil);
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v103 = {
    primaryMenu = true, 
    blur = true, 
    _processingRequest = false, 
    ToggleAll = {}, 
    Init = function(v27, v28) --[[ Line: 55 ]] --[[ Name: Init ]]
        -- upvalues: v20 (ref), v3 (copy), v21 (ref), v22 (ref), v23 (ref), v24 (ref), v4 (copy)
        v20 = v3.GetController("DataController");
        v21 = v3.GetController("UIController");
        v22 = v3.GetService("VendorService");
        v23 = v3.GetController("PurchaseController");
        v24 = v3.GetService("FactionService");
        v27.ui = v28;
        v27.main = v28.Main;
        v27.shopWindow = v27.main.ShopWindow;
        v27.bin = v27.shopWindow.Content.Bin;
        v27.gridBin = v27.bin.Grid;
        v27.template = v27.gridBin.Template;
        v27.template.Parent = nil;
        v27.shopFrame = v27.shopWindow.Products;
        v27.animatedModels = {};
        for _, v30 in v27.shopWindow.Content:GetChildren() do
            if v30:IsA("ViewportFrame") then
                local l_WorldModel_0 = v30:FindFirstChild("WorldModel");
                if l_WorldModel_0 then
                    for _, v33 in l_WorldModel_0:GetChildren() do
                        if v33:IsA("Model") then
                            table.insert(v27.animatedModels, v33);
                        end;
                    end;
                end;
            end;
        end;
        v27.currencyFrame = v27.shopWindow.Content.Header.TotalCurrency.Content;
        v27.exitBtn = v27.shopWindow.Exit;
        v27.dumpster = v4.new();
    end, 
    Start = function(v34, _) --[[ Line: 99 ]] --[[ Name: Start ]]
        -- upvalues: v25 (ref), v21 (ref), v26 (ref), v11 (copy), v20 (ref), v3 (copy), v24 (ref)
        v25 = v21:GetModuleAsync("NumberPrompt"):expect();
        v26 = v21:GetModuleAsync("Notification"):expect();
        v34.myCurrency = 0;
        local function v37(v36) --[[ Line: 106 ]] --[[ Name: factionUpdated ]]
            -- upvalues: v34 (copy), v11 (ref)
            v34.myFactionData = v36;
            v34.myCurrency = v36.Balance or 0;
            v34.myFactionId = v36.Id or 0;
            v34.currencyFrame.Amount.Text = v11:CommaNumber(v34.myCurrency or 0);
            if v34.globalFactions then
                v34.myFactionGlobalData = v34.globalFactions[v34.myFactionId];
            end;
            v34:_update();
        end;
        local function v39(v38) --[[ Line: 120 ]] --[[ Name: globalFactionUpdated ]]
            -- upvalues: v34 (copy)
            v34.globalFactions = v38;
            v34.myFactionGlobalData = v34.myFactionId and v34.globalFactions[v34.myFactionId];
            v34:_update();
        end;
        v34.myFactionData = v20:Get(v3.Player, "Faction"):expect();
        v34.myCurrency = v34.myFactionData.Balance or 0;
        v34.myFactionId = v34.myFactionData.Id or 0;
        v34.globalFactions = v24.FactionsProgress:OnReady():expect();
        v34.myFactionGlobalData = v34.myFactionId and v34.globalFactions[v34.myFactionId];
        v20:OnChanged(v3.Player, "Faction", v37, true);
        v24.FactionsProgress:Observe(v39);
        v21:HandleButton(v34.exitBtn, function() --[[ Line: 138 ]]
            -- upvalues: v21 (ref)
            v21:Toggle(script.Name, false);
        end);
        v34:_setupShop();
    end, 
    Opening = function(v40) --[[ Line: 146 ]] --[[ Name: Opening ]]
        -- upvalues: v13 (copy), v18 (copy), v10 (copy), v7 (copy), v11 (copy), v12 (copy), v8 (copy), v14 (copy), v21 (ref), v19 (copy), v26 (ref), v24 (ref)
        for _, v42 in v40.animatedModels do
            local v43 = v42:GetAttribute("Animation") or v42.Name;
            local v44 = v13.new(v43, v42, "Friendlies");
            v44:Play("Idle");
            v40.dumpster:Add(v44);
        end;
        for v45, v46 in v18.FACTIONS.SHOP_MILESTONES do
            if not v46.dontShow then
                local v47 = v46.item or v46.items and v46.items[v40.myFactionId];
                if not v47 then
                    --[[ close >= 6 ]]
                else
                    local v48 = v40.template:Clone();
                    v48.Name = "Item-" .. v45;
                    v48.Visible = true;
                    v48.Main.Locked.Title.Text = string.upper((("Unlocks at Tier %*"):format(v45)));
                    v48.LayoutOrder = v45;
                    v40.dumpster:Add(v48);
                    local v49 = v47.displayName or v47.name or v47.type;
                    local v50 = v47.name or v47.type;
                    if v47.type == "Unit" then
                        v50 = v10:GetUnitValue(v50, "FullName") or v50;
                    end;
                    v49 = string.gsub(v49, "{amount}", v47.amount);
                    v49 = string.gsub(v49, "{name}", v50);
                    v48.Main.Title.Text = v49;
                    v48.Main.Buy.Content.Currency.Image = v7:GetByItemName("FactionPoint").icon or "";
                    v48.Main.Buy.Content.Amount.Text = v11:CommaNumber(v46.cost or 0);
                    for _, v52 in v48.Main.Status:GetChildren() do
                        if v52:IsA("ImageLabel") or v52:IsA("Frame") then
                            v52.Visible = false;
                        end;
                    end;
                    if v47.extraData then
                        v48.Main.Status.Shiny.Visible = v47.extraData.Shiny or false;
                        v48.Main.Status.Wumbo.Visible = v47.extraData.Wumbo or false;
                        v48.Main.Status.Stars.Visible = v47.extraData.Stars ~= nil;
                    end;
                    local l_Mystery_0 = v48.Main.Mystery;
                    local v54 = true;
                    if v47.type ~= "RandomUnit" then
                        v54 = v47.type == "TBD";
                    end;
                    l_Mystery_0.Visible = v54;
                    if v47.type == "RandomUnit" then
                        v12(v48.Main.Icon, v47.poolName, v47.rarity);
                    elseif v47.type == "Unit" then
                        v8:SetImage(v48.Main.Icon, v47.name);
                    elseif v47.type ~= "TBD" then
                        v48.Main.Icon.Image = v11:GetIconFromRewardData(v47) or "";
                    else
                        v48.Main.Icon.ImageColor3 = Color3.new(0, 0, 0);
                        v48.Main.Icon.Image = v47.icon;
                    end;
                    if v47.type ~= "TBD" then
                        v14.new(v48.Main.Tooltip, {
                            Name = v50
                        });
                    end;
                    v48.Parent = v40.gridBin;
                    do
                        local l_v47_0, l_v49_0 = v47, v49;
                        v21:HandleButton(v48.Main.Buy, function() --[[ Line: 224 ]]
                            -- upvalues: v40 (copy), l_v47_0 (ref), v19 (ref), v45 (copy), v26 (ref), v46 (copy), v24 (ref), l_v49_0 (ref)
                            if v40._processingRequest then
                                return;
                            elseif l_v47_0.type == "TBD" then
                                return;
                            else
                                local l_v19_ShopTier_0 = v19:GetShopTier(v40.myFactionGlobalData);
                                if not l_v19_ShopTier_0 or l_v19_ShopTier_0 < v45 then
                                    v26:Notify({
                                        message = ("Your faction must reach Tier %*!"):format(v45), 
                                        duration = 3.5, 
                                        isPositive = false
                                    });
                                    return;
                                else
                                    local v58 = v40.myFactionData and v40.myFactionData.ShopPurchases;
                                    v58 = v58 and v58[tostring(v45)] or 0;
                                    if v46.maxStock > -1 and v46.maxStock <= v58 then
                                        v26:Notify({
                                            message = "This item is out of stock!", 
                                            duration = 3.5, 
                                            isPositive = false
                                        });
                                        return;
                                    elseif v40.myCurrency < v46.cost then
                                        v26:Notify({
                                            message = "You do not have enough Faction Points to purchase this!", 
                                            duration = 3.5, 
                                            isPositive = false
                                        });
                                        return;
                                    else
                                        v40._processingRequest = true;
                                        v24:Purchase(v45):andThen(function(v59) --[[ Line: 269 ]]
                                            -- upvalues: v26 (ref), l_v49_0 (ref)
                                            if not v59 then
                                                v26:Notify({
                                                    message = "Something went wrong!", 
                                                    duration = 3.5, 
                                                    isPositive = false
                                                });
                                                return;
                                            else
                                                v26:Notify({
                                                    message = ("Successfully purchased %*!"):format(l_v49_0), 
                                                    duration = 3.5, 
                                                    isPositive = true
                                                });
                                                return;
                                            end;
                                        end):finally(function() --[[ Line: 285 ]]
                                            -- upvalues: v40 (ref)
                                            v40._processingRequest = false;
                                        end);
                                        return;
                                    end;
                                end;
                            end;
                        end);
                    end;
                end;
            end;
        end;
        v40:_update();
    end, 
    Closed = function(v60) --[[ Line: 294 ]] --[[ Name: Closed ]]
        v60.bin.CanvasPosition = Vector2.zero;
        v60.dumpster:Destroy();
    end, 
    _setupShop = function(v61) --[[ Line: 301 ]] --[[ Name: _setupShop ]]
        -- upvalues: v23 (ref), v3 (copy), v20 (ref), v21 (ref)
        for _, v63 in v61.shopFrame:GetDescendants() do
            if v63:IsA("GuiButton") or v63.Name == "Buy" then
                local l_v63_Attribute_0 = v63:GetAttribute("PurchaseType");
                local l_v63_Attribute_1 = v63:GetAttribute("PurchaseName");
                local l_v63_Attribute_2 = v63:GetAttribute("OwnedDataKey");
                if not l_v63_Attribute_0 or not l_v63_Attribute_1 then
                    warn("no type or name", l_v63_Attribute_0, l_v63_Attribute_1);
                else
                    local l_Product_0 = Enum.InfoType.Product;
                    local v68 = false;
                    do
                        local l_v68_0 = v68;
                        if l_v63_Attribute_0 == "Gamepasses" then
                            l_Product_0 = Enum.InfoType.GamePass;
                            v63.Owned.Visible = false;
                            v63.Content.Visible = true;
                            v23:ListenToGamepassOwned(v3.Player, l_v63_Attribute_1, function(v70) --[[ Line: 324 ]]
                                -- upvalues: v63 (copy), l_v68_0 (ref)
                                v63.Owned.Visible = v70;
                                v63.Content.Visible = not v70;
                                l_v68_0 = v70;
                            end, true);
                        elseif l_v63_Attribute_0 == "DevProducts" and l_v63_Attribute_2 ~= nil then
                            v20:OnChanged(v3.Player, l_v63_Attribute_2, function(v71) --[[ Line: 330 ]]
                                -- upvalues: v63 (copy), l_v68_0 (ref)
                                v63.Owned.Visible = v71;
                                v63.Content.Visible = not v71;
                                l_v68_0 = v71;
                            end, true);
                        end;
                        v21:HandleButton(v63, function() --[[ Line: 337 ]]
                            -- upvalues: l_v68_0 (ref), l_v63_Attribute_0 (copy), v23 (ref), l_v63_Attribute_1 (copy)
                            if l_v68_0 then
                                return;
                            elseif l_v63_Attribute_0 == "DevProducts" then
                                v23:PromptProductPurchase(l_v63_Attribute_1);
                                return;
                            else
                                v23:PromptGamepassPurchase(l_v63_Attribute_1);
                                return;
                            end;
                        end);
                        v23:PromiseProductInfo(l_v63_Attribute_1, l_Product_0):andThen(function(v72) --[[ Line: 350 ]]
                            -- upvalues: v63 (copy)
                            v63.Content.Amount.Text = v72 and v72.PriceInRobux or 0;
                        end);
                    end;
                end;
            end;
        end;
        v20:OnChanged(v3.Player, "PacksPurchased", function(v73) --[[ Line: 355 ]] --[[ Name: update ]]
            -- upvalues: v61 (copy)
            for _, v75 in v61.shopFrame.DevProducts:GetChildren() do
                if v75:IsA("Frame") then
                    v75.Visible = not (v73[v75.Name] or false);
                end;
            end;
        end, true);
    end, 
    _setupChallengerCratePack = function(v76) --[[ Line: 368 ]] --[[ Name: _setupChallengerCratePack ]]
        -- upvalues: v17 (copy), v20 (ref), v3 (copy), v11 (copy), v16 (copy)
        local l_Main_0 = v76.shopWindow.Products.ProgressiveChest.Main;
        local l_Header_0 = l_Main_0.Header;
        local l_Buy_0 = l_Main_0.Buy;
        local v80 = 1;
        local v81 = #v17;
        local v82 = 0;
        local v83 = false;
        v20:OnChanged(v3.Player, "ChallengeCratePack", function(v84) --[[ Line: 378 ]]
            -- upvalues: v80 (ref), v82 (ref), v81 (copy), v83 (ref), v17 (ref), l_Header_0 (copy), v11 (ref), l_Buy_0 (copy), v76 (copy)
            v80 = v84.Tier or 1;
            v82 = v84.StartTime + 86400 - workspace:GetServerTimeNow();
            local l_v80_0 = v80;
            if v81 < v80 then
                v83 = true;
                l_v80_0 = v81;
            else
                v83 = false;
            end;
            if v17[l_v80_0] and v17[l_v80_0].purchaseName then
                local v86 = v17[l_v80_0].reward.amount or 1;
                l_Header_0.Number.Text = v86;
                l_Header_0.Title.Text = v11:Pluralize("Crate", v86, false);
                l_Buy_0:SetAttribute("PurchaseName", v17[l_v80_0].purchaseName);
                l_Buy_0.Owned.Visible = false;
                l_Buy_0.Content.Visible = true;
            else
                l_Buy_0.Owned.Visible = true;
                l_Buy_0.Content.Visible = false;
            end;
            v76.shopWindow.Products.ProgressiveChest.Visible = not v83;
            if v83 then
                l_Buy_0.Owned.Visible = true;
                l_Buy_0.Content.Visible = false;
            end;
        end, true);
        v16.Simple(1, function() --[[ Line: 413 ]]
            -- upvalues: v82 (ref), v80 (ref), l_Main_0 (copy), v11 (ref)
            v82 = v82 - 1;
            if v80 < 1 then
                l_Main_0.Countdown.Visible = false;
                return;
            elseif v82 < 1 then
                l_Main_0.Countdown.Visible = false;
                return;
            else
                l_Main_0.Countdown.Text = ("Resets In: %*"):format((v11:FormatTimeFromSeconds(v82)));
                l_Main_0.Countdown.Visible = true;
                return;
            end;
        end);
        v76:_handlePurchaseButton(l_Buy_0, function() --[[ Line: 430 ]]
            -- upvalues: v83 (ref)
            return not v83;
        end);
    end, 
    _handlePurchaseButton = function(_, v88, v89) --[[ Line: 435 ]] --[[ Name: _handlePurchaseButton ]]
        -- upvalues: v23 (ref), v3 (copy), v20 (ref), v21 (ref)
        local l_v88_Attribute_0 = v88:GetAttribute("PurchaseName");
        local l_v88_Attribute_1 = v88:GetAttribute("PurchaseType");
        local l_v88_Attribute_2 = v88:GetAttribute("OwnedDataKey");
        local l_v88_Attribute_3 = v88:GetAttribute("OwnedItemKey");
        if not l_v88_Attribute_0 or not l_v88_Attribute_1 then
            return;
        else
            local l_Product_1 = Enum.InfoType.Product;
            local v95 = false;
            local function v102() --[[ Line: 448 ]] --[[ Name: update ]]
                -- upvalues: l_v88_Attribute_0 (ref), v88 (copy), l_v88_Attribute_1 (ref), l_v88_Attribute_2 (ref), l_v88_Attribute_3 (ref), v95 (ref), l_Product_1 (ref), v23 (ref), v3 (ref), v20 (ref)
                l_v88_Attribute_0 = v88:GetAttribute("PurchaseName");
                l_v88_Attribute_1 = v88:GetAttribute("PurchaseType");
                l_v88_Attribute_2 = v88:GetAttribute("OwnedDataKey");
                l_v88_Attribute_3 = v88:GetAttribute("OwnedItemKey");
                v95 = false;
                if not l_v88_Attribute_0 or not l_v88_Attribute_1 then
                    return;
                else
                    if l_v88_Attribute_1 ~= "DevProducts" then
                        l_Product_1 = Enum.InfoType.GamePass;
                        v88.Owned.Visible = v95;
                        v23:ListenToGamepassOwned(v3.Player, l_v88_Attribute_0, function(v96) --[[ Line: 463 ]]
                            -- upvalues: v88 (ref), v95 (ref)
                            v88.Owned.Visible = v96;
                            v88.Content.Visible = not v96;
                            v95 = v96;
                        end, true);
                    elseif l_v88_Attribute_1 == "DevProducts" then
                        if l_v88_Attribute_2 ~= nil then
                            v20:OnChanged(v3.Player, l_v88_Attribute_2, function(v97) --[[ Line: 470 ]]
                                -- upvalues: v88 (ref), v95 (ref)
                                v88.Owned.Visible = v97;
                                v88.Content.Visible = not v97;
                                v95 = v97;
                            end, true);
                        end;
                        if l_v88_Attribute_3 ~= nil then
                            v20:OnChanged(v3.Player, "Inventory", function(v98) --[[ Line: 478 ]]
                                -- upvalues: l_v88_Attribute_3 (ref), v88 (ref), v95 (ref)
                                local v99 = v98[l_v88_Attribute_3] ~= nil;
                                v88.Owned.Visible = v99;
                                v88.Content.Visible = not v99;
                                v95 = v99;
                            end, true);
                        end;
                    end;
                    if v88.Content:FindFirstChild("Amount") then
                        v23:PromiseProductInfo(l_v88_Attribute_0, l_Product_1):andThen(function(v100) --[[ Line: 488 ]]
                            -- upvalues: v88 (ref)
                            local l_Amount_0 = v88.Content.Amount;
                            if not l_Amount_0:IsA("TextLabel") then
                                l_Amount_0 = l_Amount_0:FindFirstChild("Amount");
                            end;
                            l_Amount_0.Text = v100.PriceInRobux or "???";
                        end);
                    end;
                    return;
                end;
            end;
            v102();
            v88:GetAttributeChangedSignal("PurchaseName"):Connect(v102);
            v88:GetAttributeChangedSignal("PurchaseType"):Connect(v102);
            v88:GetAttributeChangedSignal("OwnedDataKey"):Connect(v102);
            v88:GetAttributeChangedSignal("OwnedItemKey"):Connect(v102);
            v21:HandleButton(v88, function() --[[ Line: 507 ]]
                -- upvalues: v95 (ref), v89 (copy), v88 (copy), l_v88_Attribute_1 (ref), v23 (ref), l_v88_Attribute_0 (ref)
                if v95 then
                    return;
                elseif v89 ~= nil and not v89(v88) then
                    return;
                elseif l_v88_Attribute_1 == "DevProducts" then
                    v23:PromptProductPurchase(l_v88_Attribute_0);
                    return;
                else
                    v23:PromptGamepassPurchase(l_v88_Attribute_0);
                    return;
                end;
            end);
            return;
        end;
    end
};
local v104 = {
    [1] = "Goofy Goober Waiter", 
    [2] = "Kevin C. Cucumber", 
    [3] = "Band Geek Squidward"
};
v103._update = function(v105) --[[ Line: 530 ]] --[[ Name: _update ]]
    -- upvalues: v19 (copy), v18 (copy), v104 (copy)
    local l_v19_ShopTier_1 = v19:GetShopTier(v105.myFactionGlobalData);
    for v107 = 1, #v18.FACTIONS.SHOP_MILESTONES do
        local l_FirstChild_0 = v105.gridBin:FindFirstChild("Item-" .. v107);
        if l_FirstChild_0 then
            local l_maxStock_0 = v18.FACTIONS.SHOP_MILESTONES[v107].maxStock;
            local v110 = v105.myFactionData and v105.myFactionData.ShopPurchases and v105.myFactionData.ShopPurchases[tostring(v107)] or 0;
            l_FirstChild_0.Main.Locked.Visible = l_v19_ShopTier_1 < v107;
            local l_Buy_1 = l_FirstChild_0.Main.Buy;
            if l_maxStock_0 == -1 then
                l_Buy_1.Content.Unsorted.Stock.Visible = false;
                l_Buy_1.Content.Unsorted.StockBar.UIGradient.Offset = Vector2.new(0, 0);
            else
                l_Buy_1.Content.Unsorted.Stock.Text = ("%* LEFT"):format((math.clamp(l_maxStock_0 - v110, 0, l_maxStock_0)));
                l_Buy_1.Content.Unsorted.StockBar.UIGradient.Offset = Vector2.new(-math.clamp(v110 / l_maxStock_0, 0, 1), 0);
                l_Buy_1.Content.Visible = v110 < l_maxStock_0;
                l_Buy_1.Owned.Visible = not l_FirstChild_0.Main.Buy.Content.Visible;
            end;
        end;
    end;
    local v112 = v105.myFactionData.Id or 0;
    if v112 == 0 then
        return;
    else
        for _, v114 in v105.ui.Main.ShopWindow.Content:GetChildren() do
            if v114:IsA("ViewportFrame") then
                v114.Visible = false;
            end;
        end;
        local l_FirstChild_1 = v105.ui.Main.ShopWindow.Content:FindFirstChild((("Viewport_Faction%*"):format(v112)));
        if l_FirstChild_1 then
            l_FirstChild_1.Visible = true;
        end;
        v105.ui.Main.ShopWindow.Content.Header.CharacterName.Text = v104[v112] or "";
        return;
    end;
end;
return v103;