local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Signal);
local v4 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v5 = require(v2.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v9 = require(l_ReplicatedStorage_0.RNGRolls);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v11 = v2.GetController("DataController");
local v12 = v2.GetController("UIController");
local v13 = v2.GetController("PurchaseController");
local v14 = v2.GetService("KampKoralService");
local v15 = nil;
local v16 = nil;
local v17 = nil;
return {
    rarityVisuals = {}, 
    _open = false, 
    _tooltips = {}, 
    Init = function(v18, v19, _) --[[ Line: 30 ]] --[[ Name: Init ]]
        v18.frame = v19;
        v18.bin = v19.Bin;
    end, 
    Start = function(v21) --[[ Line: 35 ]] --[[ Name: Start ]]
        -- upvalues: v15 (ref), v12 (copy), v16 (ref), v17 (ref)
        v15 = v12:GetModuleAsync("NumberPrompt"):expect();
        v16 = v12:GetModuleAsync("MessagePrompt"):expect();
        v17 = v12:GetModuleAsync("Notification"):expect();
        v12:HandleButton(v21.bin.EventExclusives.BottomBin.Friend.Main.OpenShop, function() --[[ Line: 40 ]]
            -- upvalues: v12 (ref)
            v12:Toggle("PetShop", true);
        end);
        v21:_setupKampKrate();
        v21:_setupPurchaseButtons();
    end, 
    Opened = function(v22) --[[ Line: 48 ]] --[[ Name: Opened ]]
        v22._open = true;
        for _, v24 in v22.rarityVisuals do
            v24:AddTag("VisualizeRarity");
        end;
    end, 
    Closed = function(v25) --[[ Line: 56 ]] --[[ Name: Closed ]]
        v25._open = false;
        for _, v27 in v25.rarityVisuals do
            v27:RemoveTag("VisualizeRarity");
        end;
    end, 
    _setupKampKrate = function(v28) --[[ Line: 67 ]] --[[ Name: _setupKampKrate ]]
        -- upvalues: v9 (copy), v3 (copy), v7 (copy), v5 (copy), v11 (copy), v2 (copy), v8 (copy), v12 (copy), v17 (ref), v14 (copy), v4 (copy), v15 (ref)
        local l_v9_RarityPool_0 = v9:GetRarityPool("KampKrate");
        local l_v9_LootPool_0 = v9:GetLootPool("KampKrate");
        local v31 = {};
        for v32, v33 in l_v9_RarityPool_0 do
            table.insert(v31, {
                rarity = v32, 
                weight = v33.weight or v33.Weight or 1
            });
        end;
        table.sort(v31, function(v34, v35) --[[ Line: 82 ]]
            return v34.weight > v35.weight;
        end);
        local v36 = v3.new();
        local l_Content_0 = v28.bin.KampKrate.Content;
        local v38 = 0;
        for _, v40 in v31 do
            for _, v42 in l_v9_LootPool_0[v40.rarity] do
                v38 = v38 + 1;
                local l_FirstChild_0 = l_Content_0.Rewards:FindFirstChild(v38);
                if l_FirstChild_0 then
                    local v44 = v42 and v42.extraData;
                    local v45 = nil;
                    v45 = select(2, v7:GetRarity(v42.name or v42.Name));
                    if v44 then
                        v44.Name = v42.name or v42.Name;
                        v44.Mega = v44.Wumbo or false;
                        v44.Shiny = v44.Shiny or false;
                        if not v44.Level then
                            v44.Level = 1;
                        end;
                    end;
                    local l_Pity_0 = l_FirstChild_0.Content:FindFirstChild("Pity");
                    local l_pityAmount_0 = v42.pityAmount;
                    if l_Pity_0 and l_pityAmount_0 then
                        l_Pity_0.Visible = true;
                        v36:Connect(function(v48) --[[ Line: 120 ]]
                            -- upvalues: l_Pity_0 (copy), l_pityAmount_0 (copy)
                            l_Pity_0.Amount.Text = ("%*/%*"):format(v48 % l_pityAmount_0, l_pityAmount_0);
                        end);
                    end;
                    l_FirstChild_0.Content.Backdrop:SetAttribute("Rarity", v45 or "Common");
                    l_FirstChild_0.Content.Glow:SetAttribute("Rarity", v45 or "Common");
                    table.insert(v28.rarityVisuals, l_FirstChild_0.Content.Backdrop);
                    table.insert(v28.rarityVisuals, l_FirstChild_0.Content.Glow);
                    if v28._open then
                        l_FirstChild_0.Content.Backdrop:AddTag("VisualizeRarity");
                        l_FirstChild_0.Content.Glow:AddTag("VisualizeRarity");
                    end;
                    local l__tooltips_0 = v28._tooltips;
                    local l_new_0 = v5.new;
                    local l_l_FirstChild_0_0 = l_FirstChild_0;
                    local v52 = {
                        Name = v42.name or v42.Name, 
                        UnitData = v44, 
                        IsUnit = v44 ~= nil
                    };
                    local v53;
                    if v44 then
                        v53 = {};
                        local v54 = false;
                        if v44.Shiny == false then
                            v54 = v44.Wumbo == false;
                        end;
                        v53.Normal = v54;
                        v53.Shiny = v44.Shiny or false;
                        v53.Mega = v44.Wumbo or false;
                        v54 = false;
                        if v44.Shiny == true then
                            v54 = v44.Wumbo == true;
                        end;
                        v53.ShinyMega = v54;
                    else
                        v53 = nil;
                    end;
                    v52.ExtraData = v53;
                    table.insert(l__tooltips_0, l_new_0(l_l_FirstChild_0_0, v52));
                    l_FirstChild_0.Content.Chance.Text = ("%*%%"):format(v42.weight or 1);
                end;
            end;
        end;
        v11:OnChanged(v2.Player, {
            "ChestPity", 
            "KampKrate"
        }, function(v55) --[[ Line: 153 ]]
            -- upvalues: v36 (copy)
            v36:Fire(v55 or 0);
        end, true);
        local v56 = v8.KAMP_KORAL_SHOP[1];
        v12:HandleButton(l_Content_0.Options.Purchase, function() --[[ Line: 160 ]]
            -- upvalues: v56 (copy), v28 (copy), v17 (ref), v14 (ref), v4 (ref), v5 (ref), v15 (ref)
            local l_amount_0 = v56.cost.amount;
            local v58 = math.floor(v28.myKredits / l_amount_0);
            if v28._processingRequest then
                return;
            elseif v58 < 1 then
                v17:Notify({
                    message = ("You need %* more Kamp Kredits"):format(l_amount_0 - v28.myKredits), 
                    duration = 3.5, 
                    isPositive = false
                });
                return;
            else
                local function v62(v59) --[[ Line: 177 ]] --[[ Name: attemptPurchase ]]
                    -- upvalues: v28 (ref), v14 (ref), v17 (ref), v4 (ref)
                    v59 = v59 and tonumber(v59);
                    if not tonumber(v59) or v59 < 1 then
                        return;
                    else
                        v28._processingRequest = true;
                        v14:PurchaseShopItem(1, v59):andThen(function(v60) --[[ Line: 187 ]]
                            -- upvalues: v17 (ref), v4 (ref), v59 (ref)
                            if not v60 then
                                v17:Notify({
                                    message = "Something went wrong", 
                                    duration = 3.5, 
                                    isPositive = false
                                });
                                return;
                            else
                                local v61 = v4:Pluralize("Kamp Krate", v59 or 1);
                                v17:Notify({
                                    message = ("Successfully purchased %*x %*!"):format(v59 or 1, v61), 
                                    duration = 3.5, 
                                    isPositive = true
                                });
                                return;
                            end;
                        end):finally(function() --[[ Line: 206 ]]
                            -- upvalues: v28 (ref)
                            v28._processingRequest = false;
                        end);
                        return;
                    end;
                end;
                if v58 == 1 then
                    v62(1);
                    return;
                else
                    for _, v64 in v28._tooltips do
                        v64.Enabled = false;
                    end;
                    v5:HideAll();
                    v15:Prompt({
                        message = "How many would you like to purchase?", 
                        minAmount = 1, 
                        maxAmount = v58, 
                        maxMessage = "You can buy a maximum of %s Kamp Crates.", 
                        shopInfo = {
                            baseCost = l_amount_0, 
                            currencyName = v56.cost.currency
                        }, 
                        callback = v62
                    });
                    v15:BindToClose(function() --[[ Line: 235 ]]
                        -- upvalues: v28 (ref)
                        for _, v66 in v28._tooltips do
                            v66.Enabled = true;
                        end;
                    end);
                    return;
                end;
            end;
        end);
        v28:_setupCurrencyFrame(l_Content_0);
    end, 
    _setupCurrencyFrame = function(v67, v68) --[[ Line: 245 ]] --[[ Name: _setupCurrencyFrame ]]
        -- upvalues: v11 (copy), v2 (copy), v4 (copy)
        local l_TotalCurrency_0 = v68.TotalCurrency;
        v11:OnChanged(v2.Player, "Currency.KampKredit", function(v70) --[[ Line: 248 ]]
            -- upvalues: v67 (copy), l_TotalCurrency_0 (copy), v4 (ref)
            v67.myKredits = v70 or 0;
            l_TotalCurrency_0.Content.Amount.Text = v4:CommaNumber(v70 or 0);
        end, true);
    end, 
    _setupPurchaseButtons = function(v71) --[[ Line: 254 ]] --[[ Name: _setupPurchaseButtons ]]
        -- upvalues: v13 (copy), v12 (copy), v8 (copy), v10 (copy), v17 (ref), v14 (copy), v16 (ref), l_CollectionService_0 (copy)
        local function v87(v72) --[[ Line: 255 ]] --[[ Name: purchaseAdded ]]
            -- upvalues: v71 (copy), v13 (ref), v12 (ref), v8 (ref), v10 (ref), v17 (ref), v14 (ref), v16 (ref)
            if not v72:IsDescendantOf(v71.frame) then
                return;
            else
                local l_v72_Attribute_0 = v72:GetAttribute("PurchaseType");
                local l_v72_Attribute_1 = v72:GetAttribute("PurchaseName");
                local l_v72_Attribute_2 = v72:GetAttribute("ShopIndex");
                if l_v72_Attribute_0 ~= "SoftCurrency" then
                    local v76 = l_v72_Attribute_0 == "DevProducts" and Enum.InfoType.Product or Enum.InfoType.GamePass;
                    v13:PromiseProductInfo(l_v72_Attribute_1, v76):andThen(function(v77) --[[ Line: 268 ]]
                        -- upvalues: v72 (copy)
                        v72.Content.Amount.Text = v77 and v77.PriceInRobux or "?";
                    end);
                end;
                v12:HandleButton(v72, function() --[[ Line: 273 ]]
                    -- upvalues: l_v72_Attribute_0 (copy), v13 (ref), l_v72_Attribute_1 (copy), l_v72_Attribute_2 (copy), v8 (ref), v10 (ref), v71 (ref), v17 (ref), v14 (ref), v16 (ref)
                    if l_v72_Attribute_0 ~= "SoftCurrency" then
                        local v78 = l_v72_Attribute_0 == "DevProducts" and "GetProduct" or "GetGamepass";
                        local v79 = l_v72_Attribute_0 == "DevProducts" and "PromptProductPurchase" or "PromptGamepassPurchase";
                        local v80 = v13[v78](v13, l_v72_Attribute_1);
                        if not v80 then
                            return;
                        else
                            v13[v79](v13, v80.purchaseId);
                            return;
                        end;
                    elseif not l_v72_Attribute_2 then
                        return;
                    else
                        local v81 = v8.KAMP_KORAL_SHOP[l_v72_Attribute_2];
                        if not v81 then
                            return;
                        else
                            local l_amount_1 = v81.cost.amount;
                            local l_v10_ByItemName_0 = v10:GetByItemName(v81.name);
                            if v71.myKredits < l_amount_1 then
                                v17:Notify({
                                    message = ("You need %* more Kamp Kredits"):format(l_amount_1 - v71.myKredits), 
                                    duration = 3.5, 
                                    isPositive = false
                                });
                                return;
                            else
                                local v84 = l_v10_ByItemName_0 and l_v10_ByItemName_0.displayName or v81.name;
                                local function v86() --[[ Line: 313 ]] --[[ Name: attemptPurchase ]]
                                    -- upvalues: v71 (ref), v14 (ref), l_v72_Attribute_2 (ref), v17 (ref), v84 (copy)
                                    if v71._processingRequest then
                                        return;
                                    else
                                        v14:PurchaseShopItem(l_v72_Attribute_2, 1):andThen(function(v85) --[[ Line: 318 ]]
                                            -- upvalues: v17 (ref), v84 (ref)
                                            if not v85 then
                                                return;
                                            else
                                                v17:Notify({
                                                    message = ("Successfully purchased %*!"):format(v84), 
                                                    duration = 3.5, 
                                                    isPositive = true
                                                });
                                                return;
                                            end;
                                        end):finally(function() --[[ Line: 328 ]]
                                            -- upvalues: v71 (ref)
                                            v71._processingRequest = false;
                                        end);
                                        return;
                                    end;
                                end;
                                v16:Prompt({
                                    message = ("Are you sure you want to purchase %* for %* Kamp Kredits?"):format(v84, l_amount_1), 
                                    options = {
                                        {
                                            text = "Yes", 
                                            callback = v86
                                        }, 
                                        {
                                            text = "No"
                                        }
                                    }
                                });
                                return;
                            end;
                        end;
                    end;
                end);
                return;
            end;
        end;
        for _, v89 in l_CollectionService_0:GetTagged("KampKoralPurchase") do
            v87(v89);
        end;
        l_CollectionService_0:GetInstanceAddedSignal("KampKoralPurchase"):Connect(v87);
    end
};