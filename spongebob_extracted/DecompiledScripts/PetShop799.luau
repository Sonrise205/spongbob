local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Shops.PetShop);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.PetImages);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v12 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Util.RandomUnitDisplay);
local v14 = require(v3.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v15 = require(v3.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v16 = require(l_ReplicatedStorage_0.RNGRolls);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v18 = require(l_ReplicatedStorage_0.Shared.Data.EventVariables);
local v19 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = {
    "Gems"
};
return {
    primaryMenu = true, 
    blur = true, 
    _processingRequest = false, 
    ToggleAll = {}, 
    OpenFrom = function(v29, v30) --[[ Line: 55 ]] --[[ Name: OpenFrom ]]
        -- upvalues: v21 (ref)
        v21:Toggle(script.Name, true);
        v29.openedFrom = v30;
    end, 
    Init = function(v31, v32) --[[ Line: 61 ]] --[[ Name: Init ]]
        -- upvalues: v20 (ref), v3 (copy), v21 (ref), v22 (ref), v23 (ref), v25 (ref), v26 (ref), v4 (copy)
        v20 = v3.GetController("DataController");
        v21 = v3.GetController("UIController");
        v22 = v3.GetService("VendorService");
        v23 = v3.GetController("PurchaseController");
        v25 = v3.GetController("EventController");
        v26 = v3.GetService("EventService");
        v31.ui = v32;
        v31.main = v32.Main;
        v31.shopWindow = v31.main.ShopWindow;
        v31.bin = v31.shopWindow.Content.Bin;
        v31.shopFrame = v31.shopWindow.Products;
        v31.animatedModels = {};
        for _, v34 in v31.shopWindow.Content.ViewportFrame.WorldModel:GetChildren() do
            if v34:IsA("Model") then
                table.insert(v31.animatedModels, v34);
            end;
        end;
        v31.currencyFrames = v31.shopWindow.Content.Header.Currencies.Inner;
        v31.exitBtn = v31.shopWindow.Exit;
        v31.dumpster = v4.new();
    end, 
    Start = function(v35, _) --[[ Line: 91 ]] --[[ Name: Start ]]
        -- upvalues: v24 (ref), v21 (ref), v27 (ref), v28 (copy), v4 (copy), v20 (ref), v3 (copy), v12 (copy)
        v24 = v21:GetModuleAsync("NumberPrompt"):expect();
        v27 = v21:GetModuleAsync("Notification"):expect();
        v35.currencyAmounts = {};
        for _, v38 in v28 do
            local l_FirstChild_0 = v35.currencyFrames:FindFirstChild(v38);
            if l_FirstChild_0 then
                local v40 = v4.new();
                v40:AttachTo(l_FirstChild_0);
                v40:Add(v20:OnChanged(v3.Player, ("Currency.%*"):format(v38), function(v41) --[[ Line: 107 ]]
                    -- upvalues: l_FirstChild_0 (copy), v35 (copy), v38 (copy), v12 (ref)
                    if not l_FirstChild_0.Parent then
                        return;
                    else
                        v35.currencyAmounts[v38] = v41 or 0;
                        l_FirstChild_0.Content.Amount.Text = v12:CommaNumber(v41 or 0);
                        return;
                    end;
                end, true));
            end;
        end;
        v21:HandleButton(v35.exitBtn, function() --[[ Line: 117 ]]
            -- upvalues: v21 (ref)
            v21:Toggle(script.Name, false);
        end);
        v35:_setupCrateOffer(v35.bin.CrateOffer, "PetCrate");
        v35:_setupPetEquipOffer(v35.shopFrame.PetEquip.Bin.Frame.Main);
        v35:_setupShop();
    end, 
    Opening = function(v42) --[[ Line: 128 ]] --[[ Name: Opening ]]
        -- upvalues: v14 (copy)
        for _, v44 in v42.animatedModels do
            local v45 = v44:GetAttribute("Animation") or v44.Name;
            local v46 = v14.new(v45, v44, "Friendlies");
            v46:Play("Idle");
            v42.dumpster:Add(v46);
        end;
        for _, v48 in v42.bin.CrateOffer.Main.Unit:GetChildren() do
            if v48:IsA("Frame") then
                v48.Backdrop:AddTag("VisualizeRarity");
                v48.Glow:AddTag("VisualizeRarity");
            end;
        end;
    end, 
    Closed = function(v49) --[[ Line: 146 ]] --[[ Name: Closed ]]
        -- upvalues: v21 (ref)
        for _, v51 in v49.bin.CrateOffer.Main.Unit:GetChildren() do
            if v51:IsA("Frame") then
                v51.Backdrop:RemoveTag("VisualizeRarity");
                v51.Glow:RemoveTag("VisualizeRarity");
            end;
        end;
        if v49.openedFrom then
            v21:Toggle(v49.openedFrom, true);
            v49.openedFrom = nil;
        end;
    end, 
    _setupShop = function(v52) --[[ Line: 164 ]] --[[ Name: _setupShop ]]
        -- upvalues: v18 (copy), v23 (ref), v3 (copy), v20 (ref), v21 (ref), v26 (ref), v27 (ref)
        local v53 = {
            "Buy", 
            "Gift"
        };
        local function v69(v54) --[[ Line: 167 ]] --[[ Name: descAdded ]]
            -- upvalues: v53 (copy), v18 (ref), v23 (ref), v3 (ref), v20 (ref), v21 (ref), v52 (copy), v26 (ref), v27 (ref)
            if not v54:IsA("GuiButton") and not table.find(v53, v54.Name) then
                return;
            elseif v54:GetAttribute("IgnoreInitialSetup") then
                return;
            else
                local l_v54_Attribute_0 = v54:GetAttribute("PurchaseType");
                local l_v54_Attribute_1 = v54:GetAttribute("PurchaseName");
                local l_v54_Attribute_2 = v54:GetAttribute("PurchaseId");
                local l_v54_Attribute_3 = v54:GetAttribute("OwnedDataKey");
                local v59 = l_v54_Attribute_2 and v18.Shop[l_v54_Attribute_2];
                if not l_v54_Attribute_0 or not l_v54_Attribute_1 and not l_v54_Attribute_2 then
                    warn("No PurchaseType, PurchaseName, or PurchaseId found:", l_v54_Attribute_0, l_v54_Attribute_1, l_v54_Attribute_2);
                    return;
                else
                    local l_Owned_0 = v54:FindFirstChild("Owned");
                    local l_Amount_0 = v54.Content:FindFirstChild("Amount");
                    local l_Product_0 = Enum.InfoType.Product;
                    local v63 = false;
                    if l_v54_Attribute_0 == "Gamepasses" then
                        l_Product_0 = Enum.InfoType.GamePass;
                        if l_Owned_0 then
                            l_Owned_0.Visible = false;
                        end;
                        v54.Content.Visible = true;
                        v23:ListenToGamepassOwned(v3.Player, l_v54_Attribute_1, function(v64) --[[ Line: 203 ]]
                            -- upvalues: l_Owned_0 (copy), v54 (copy), v63 (ref)
                            if l_Owned_0 then
                                l_Owned_0.Visible = v64;
                            end;
                            v54.Content.Visible = not v64;
                            v63 = v64;
                        end, true);
                    elseif l_v54_Attribute_0 == "DevProducts" and l_v54_Attribute_3 ~= nil then
                        v20:OnChanged(v3.Player, l_v54_Attribute_3, function(v65) --[[ Line: 212 ]]
                            -- upvalues: l_Owned_0 (copy), v54 (copy), v63 (ref)
                            if l_Owned_0 then
                                l_Owned_0.Visible = v65;
                            end;
                            v54.Content.Visible = not v65;
                            v63 = v65;
                        end, true);
                    elseif l_v54_Attribute_0 == "Event" and v59 then
                        l_Amount_0.Text = v59.cost.amount;
                    end;
                    v21:HandleButton(v54, function() --[[ Line: 224 ]]
                        -- upvalues: v63 (ref), v52 (ref), l_v54_Attribute_0 (copy), v23 (ref), l_v54_Attribute_1 (copy), v26 (ref), l_v54_Attribute_2 (copy), v27 (ref)
                        if v63 then
                            return;
                        elseif v52._processingRequest then
                            return;
                        elseif l_v54_Attribute_0 == "DevProducts" then
                            v23:PromptProductPurchase(l_v54_Attribute_1);
                            return;
                        elseif l_v54_Attribute_0 == "Event" then
                            v52._processingRequest = true;
                            v26:PurchaseShopItem(l_v54_Attribute_2, 1):andThen(function(v66, v67) --[[ Line: 241 ]]
                                -- upvalues: v27 (ref)
                                if not v67 then
                                    return;
                                else
                                    v27:Notify({
                                        text = v67, 
                                        duration = 3, 
                                        isPositive = v66
                                    });
                                    return;
                                end;
                            end):finally(function() --[[ Line: 252 ]]
                                -- upvalues: v52 (ref)
                                v52._processingRequest = false;
                            end);
                            return;
                        else
                            v23:PromptGamepassPurchase(l_v54_Attribute_1);
                            return;
                        end;
                    end);
                    if not l_Amount_0 or l_v54_Attribute_0 ~= "Gamepasses" and l_v54_Attribute_0 ~= "DevProducts" then
                        return;
                    else
                        v23:PromiseProductInfo(l_v54_Attribute_1, l_Product_0):andThen(function(v68) --[[ Line: 266 ]]
                            -- upvalues: l_Amount_0 (copy)
                            l_Amount_0.Text = v68 and v68.PriceInRobux or 0;
                        end);
                        return;
                    end;
                end;
            end;
        end;
        for _, v71 in v52.shopFrame:GetDescendants() do
            task.spawn(v69, v71);
        end;
        v52.shopFrame.DescendantAdded:Connect(v69);
        v20:OnChanged(v3.Player, "PacksPurchased", function(v72) --[[ Line: 277 ]] --[[ Name: update ]]
            -- upvalues: v52 (copy)
            for _, v74 in v52.shopFrame:GetChildren() do
                if v74:IsA("Frame") then
                    v74.Visible = not (v72[v74.Name] or false);
                end;
            end;
        end, true);
    end, 
    _handlePurchaseButton = function(_, v76, v77) --[[ Line: 290 ]] --[[ Name: _handlePurchaseButton ]]
        -- upvalues: v23 (ref), v3 (copy), v20 (ref), v21 (ref)
        local l_v76_Attribute_0 = v76:GetAttribute("PurchaseName");
        local l_v76_Attribute_1 = v76:GetAttribute("PurchaseType");
        local l_v76_Attribute_2 = v76:GetAttribute("OwnedDataKey");
        local l_v76_Attribute_3 = v76:GetAttribute("OwnedItemKey");
        if not l_v76_Attribute_0 or not l_v76_Attribute_1 then
            return;
        else
            local l_Product_1 = Enum.InfoType.Product;
            local v83 = false;
            local function v90() --[[ Line: 303 ]] --[[ Name: update ]]
                -- upvalues: l_v76_Attribute_0 (ref), v76 (copy), l_v76_Attribute_1 (ref), l_v76_Attribute_2 (ref), l_v76_Attribute_3 (ref), v83 (ref), l_Product_1 (ref), v23 (ref), v3 (ref), v20 (ref)
                l_v76_Attribute_0 = v76:GetAttribute("PurchaseName");
                l_v76_Attribute_1 = v76:GetAttribute("PurchaseType");
                l_v76_Attribute_2 = v76:GetAttribute("OwnedDataKey");
                l_v76_Attribute_3 = v76:GetAttribute("OwnedItemKey");
                v83 = false;
                if not l_v76_Attribute_0 or not l_v76_Attribute_1 then
                    return;
                else
                    if l_v76_Attribute_1 ~= "DevProducts" then
                        l_Product_1 = Enum.InfoType.GamePass;
                        v76.Owned.Visible = v83;
                        v23:ListenToGamepassOwned(v3.Player, l_v76_Attribute_0, function(v84) --[[ Line: 318 ]]
                            -- upvalues: v76 (ref), v83 (ref)
                            v76.Owned.Visible = v84;
                            v76.Content.Visible = not v84;
                            v83 = v84;
                        end, true);
                    elseif l_v76_Attribute_1 == "DevProducts" then
                        if l_v76_Attribute_2 ~= nil then
                            v20:OnChanged(v3.Player, l_v76_Attribute_2, function(v85) --[[ Line: 325 ]]
                                -- upvalues: v76 (ref), v83 (ref)
                                v76.Owned.Visible = v85;
                                v76.Content.Visible = not v85;
                                v83 = v85;
                            end, true);
                        end;
                        if l_v76_Attribute_3 ~= nil then
                            v20:OnChanged(v3.Player, "Inventory", function(v86) --[[ Line: 333 ]]
                                -- upvalues: l_v76_Attribute_3 (ref), v76 (ref), v83 (ref)
                                local v87 = v86[l_v76_Attribute_3] ~= nil;
                                v76.Owned.Visible = v87;
                                v76.Content.Visible = not v87;
                                v83 = v87;
                            end, true);
                        end;
                    end;
                    if v76.Content:FindFirstChild("Amount") then
                        v23:PromiseProductInfo(l_v76_Attribute_0, l_Product_1):andThen(function(v88) --[[ Line: 343 ]]
                            -- upvalues: v76 (ref)
                            local l_Amount_1 = v76.Content.Amount;
                            if not l_Amount_1:IsA("TextLabel") then
                                l_Amount_1 = l_Amount_1:FindFirstChild("Amount");
                            end;
                            l_Amount_1.Text = v88.PriceInRobux or "???";
                        end);
                    end;
                    return;
                end;
            end;
            v90();
            v76:GetAttributeChangedSignal("PurchaseName"):Connect(v90);
            v76:GetAttributeChangedSignal("PurchaseType"):Connect(v90);
            v76:GetAttributeChangedSignal("OwnedDataKey"):Connect(v90);
            v76:GetAttributeChangedSignal("OwnedItemKey"):Connect(v90);
            v21:HandleButton(v76, function() --[[ Line: 362 ]]
                -- upvalues: v83 (ref), v77 (copy), v76 (copy), l_v76_Attribute_1 (ref), v23 (ref), l_v76_Attribute_0 (ref)
                if v83 then
                    return;
                elseif v77 ~= nil and not v77(v76) then
                    return;
                elseif l_v76_Attribute_1 == "DevProducts" then
                    v23:PromptProductPurchase(l_v76_Attribute_0);
                    return;
                else
                    v23:PromptGamepassPurchase(l_v76_Attribute_0);
                    return;
                end;
            end);
            return;
        end;
    end, 
    _setupCrateOffer = function(v91, v92, v93) --[[ Line: 379 ]] --[[ Name: _setupCrateOffer ]]
        -- upvalues: v16 (copy), v9 (copy), v11 (copy), v15 (copy), v5 (copy), v7 (copy), v21 (ref), v8 (copy), v27 (ref), v22 (ref), v12 (copy), v24 (ref)
        if not v92 or not v93 then
            return;
        else
            local l_v16_RarityPool_0 = v16:GetRarityPool(v93);
            local l_v16_LootPool_0 = v16:GetLootPool(v93);
            local v96 = {};
            for v97, v98 in l_v16_RarityPool_0 do
                table.insert(v96, {
                    rarity = v97, 
                    weight = v98.weight
                });
            end;
            table.sort(v96, function(v99, v100) --[[ Line: 399 ]]
                return v99.weight > v100.weight;
            end);
            local v101 = 1;
            for _, v103 in v92.Main.Unit:GetChildren() do
                if v103:IsA("Frame") then
                    v103.Visible = false;
                end;
            end;
            for _, v105 in v96 do
                for _, v107 in l_v16_LootPool_0[v105.rarity] do
                    local l_FirstChild_1 = v92.Main.Unit:FindFirstChild((tostring(v101)));
                    if l_FirstChild_1 then
                        v9:SetImage(l_FirstChild_1.Inner.Icon, v107.Name or v107.name);
                        l_FirstChild_1.Inner.Chance.Text = ("%*%%"):format(v107.weight or 0);
                        l_FirstChild_1.Inner.Icon.ImageColor3 = v105.rarity == "Secret" and Color3.new(0, 0, 0) or Color3.new(1, 1, 1);
                        local v109 = select(2, v11:GetRarity(v107.Name or v107.name));
                        l_FirstChild_1.Backdrop:SetAttribute("Rarity", v109);
                        l_FirstChild_1.Glow:SetAttribute("Rarity", v109);
                        v15.new(l_FirstChild_1, {
                            Name = v107.Name or v107.name, 
                            IsPet = true, 
                            IsSecretUnit = function() --[[ Line: 431 ]] --[[ Name: IsSecretUnit ]]
                                -- upvalues: v105 (copy)
                                return v105.rarity == "Secret";
                            end
                        });
                        l_FirstChild_1.Visible = true;
                        v101 = v101 + 1;
                    end;
                end;
            end;
            local v110 = v16:GetVariantPool(v93) or {};
            for v111, v112 in v110 do
                local l_weight_0 = v112.weight;
                if l_weight_0 then
                    local l_FirstChild_2 = v92.Main.Chances:FindFirstChild((("%*Chance"):format(v111)));
                    if l_FirstChild_2 then
                        l_FirstChild_2.Amount.Text = ("%*%%"):format(l_weight_0);
                    end;
                end;
            end;
            local v115;
            v110, v115 = v5.Find(v7, function(v116) --[[ Line: 460 ]]
                -- upvalues: v93 (copy)
                return v116.name == v93;
            end);
            if not v110 or not v115 then
                v92.Visible = false;
                return;
            else
                v92.Main.Crate.Buy.Content.Amount.Text = v110.cost.amount;
                v21:HandleButton(v92.Main.Crate.Buy, function() --[[ Line: 471 ]]
                    -- upvalues: v91 (copy), v110 (copy), v8 (ref), v27 (ref), v22 (ref), v115 (copy), v12 (ref), v24 (ref)
                    local v117 = v91.currencyAmounts[v110.cost.currency] or 0;
                    local l_amount_0 = v110.cost.amount;
                    local v119 = l_amount_0 <= v117;
                    local v120 = v117 // l_amount_0;
                    local l_currency_0 = v110.cost.currency;
                    local l_displayName_0 = v8.Currency[l_currency_0].displayName;
                    if v91._processingRequest then
                        return;
                    elseif v91.purchaseRequestProcessing or not v119 or v120 < 1 then
                        if not v119 or v120 < 1 then
                            v27:Notify({
                                text = ("You need %* more %* to purchase this!"):format(math.clamp(l_amount_0 - v117, 0, l_amount_0), l_displayName_0 or l_currency_0), 
                                duration = 3, 
                                isPositive = false
                            });
                        end;
                        return;
                    else
                        local function v126(v123) --[[ Line: 495 ]] --[[ Name: attemptPurchase ]]
                            -- upvalues: v91 (ref), v22 (ref), v115 (ref), v27 (ref), v12 (ref), v110 (ref)
                            v123 = v123 and tonumber(v123);
                            if not tonumber(v123) or v123 < 1 then
                                return;
                            else
                                v91._processingRequest = true;
                                v22:Purchase(script.Name, v115, v123):andThen(function(v124) --[[ Line: 505 ]]
                                    -- upvalues: v27 (ref), v12 (ref), v110 (ref), v123 (ref)
                                    if not v124 then
                                        v27:Notify({
                                            message = "Something went wrong", 
                                            duration = 3.5, 
                                            isPositive = false
                                        });
                                        return;
                                    else
                                        local v125 = v12:Pluralize(v110.crateDisplayName, v123 or 1);
                                        v27:Notify({
                                            message = ("Successfully purchased %*x %*!"):format(v123 or 1, v125), 
                                            duration = 3.5, 
                                            isPositive = true
                                        });
                                        return;
                                    end;
                                end):finally(function() --[[ Line: 524 ]]
                                    -- upvalues: v91 (ref)
                                    v91._processingRequest = false;
                                end);
                                return;
                            end;
                        end;
                        if v120 == 1 then
                            v126(1);
                            return;
                        else
                            v24:Prompt({
                                message = "How many would you like to purchase?", 
                                minAmount = 1, 
                                maxAmount = v120, 
                                maxMessage = ("You can buy a maximum of %%s %*."):format(v110.crateDisplayName), 
                                shopInfo = {
                                    baseCost = l_amount_0, 
                                    currencyName = v110.cost.currency
                                }, 
                                callback = v126
                            });
                            return;
                        end;
                    end;
                end);
                return;
            end;
        end;
    end, 
    _setupPetEquipOffer = function(v127, v128) --[[ Line: 549 ]] --[[ Name: _setupPetEquipOffer ]]
        -- upvalues: v20 (ref), v3 (copy), v19 (copy)
        local l_Buy_0 = v128.PurchaseOptions.Buy;
        local v130 = false;
        v20:OnChanged(v3.Player, "PurchasedPetSlots", function(v131) --[[ Line: 554 ]]
            -- upvalues: v130 (ref), v19 (ref), l_Buy_0 (copy)
            v130 = v19.PETS.MAX_PURCHASED_SLOTS <= v131;
            l_Buy_0.Content.Unsorted.Disabled.Visible = v130;
        end, true);
        v127:_handlePurchaseButton(l_Buy_0, function() --[[ Line: 559 ]]
            -- upvalues: v130 (ref)
            return not v130;
        end);
    end
};