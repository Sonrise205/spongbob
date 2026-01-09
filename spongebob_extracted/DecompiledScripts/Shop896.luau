local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Signal);
local v4 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v5 = require(v2.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local _ = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.EventVariables);
local _ = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v13 = require(l_ReplicatedStorage_0.RNGRolls);
local v14 = v2.GetController("DataController");
local v15 = v2.GetController("UIController");
local v16 = v2.GetController("PurchaseController");
local v17 = v2.GetService("EventService");
local v18 = nil;
local v19 = nil;
local v20 = nil;
return {
    rarityVisuals = {}, 
    _open = false, 
    _tooltips = {}, 
    Init = function(v21, v22, _) --[[ Line: 34 ]] --[[ Name: Init ]]
        v21.frame = v22;
        v21.crateOffer = v22.CrateOffer;
    end, 
    Start = function(v24) --[[ Line: 40 ]] --[[ Name: Start ]]
        -- upvalues: v18 (ref), v15 (copy), v19 (ref), v20 (ref), v6 (copy), v2 (copy)
        v18 = v15:GetModuleAsync("NumberPrompt"):expect();
        v19 = v15:GetModuleAsync("MessagePrompt"):expect();
        v20 = v15:GetModuleAsync("Notification"):expect();
        v24.PolicyInfo = v6(v2.Player):expect();
        if not v24.PolicyInfo then
            v2.Player:Kick("Failed to get policy info. (Please rejoin)");
            return;
        else
            v24.PaidItemsRestricted = v24.PolicyInfo.ArePaidRandomItemsRestricted or false;
            v24:_setupCrate();
            v24:_setupBottomBin();
            v24:_setupPurchases();
            return;
        end;
    end, 
    Opened = function(v25) --[[ Line: 60 ]] --[[ Name: Opened ]]
        v25._open = true;
        for _, v27 in v25.rarityVisuals do
            v27:AddTag("VisualizeRarity");
        end;
    end, 
    Closed = function(v28) --[[ Line: 68 ]] --[[ Name: Closed ]]
        v28._open = false;
        for _, v30 in v28.rarityVisuals do
            v30:RemoveTag("VisualizeRarity");
        end;
    end, 
    _setupCrate = function(v31) --[[ Line: 79 ]] --[[ Name: _setupCrate ]]
        -- upvalues: v13 (copy), v3 (copy), v4 (copy), v10 (copy), v12 (copy), v5 (copy), v14 (copy), v2 (copy), v8 (copy), v15 (copy), v20 (ref), v17 (copy), v18 (ref)
        local l_v13_RarityPool_0 = v13:GetRarityPool("SwashbucklerCrate");
        local l_v13_LootPool_0 = v13:GetLootPool("SwashbucklerCrate");
        local v34 = {};
        for v35, v36 in l_v13_RarityPool_0 do
            table.insert(v34, {
                rarity = v35, 
                weight = v36.weight or v36.Weight or 1
            });
        end;
        table.sort(v34, function(v37, v38) --[[ Line: 94 ]]
            return v37.weight > v38.weight;
        end);
        local v39 = v3.new();
        local l_Main_0 = v31.crateOffer.LargeBin.Main;
        local v41 = 0;
        for _, v43 in v34 do
            for _, v45 in l_v13_LootPool_0[v43.rarity] do
                v41 = v41 + 1;
                local l_FirstChild_0 = l_Main_0.Rewards:FindFirstChild(v41);
                if l_FirstChild_0 then
                    local l_type_0 = v45.type;
                    local v48 = v45 and v45.extraData;
                    local v49 = nil;
                    if l_type_0 == "Inventory" then
                        v49 = v4:GetRewardRarity(v45);
                    elseif l_type_0 == "Unit" then
                        v49 = select(2, v10:GetRarity(v45.name or v45.Name));
                        if v48 then
                            v48.Name = v45.name or v45.Name;
                            v48.Mega = v48.Wumbo or false;
                            v48.Shiny = v48.Shiny or false;
                            if not v48.Level then
                                v48.Level = 1;
                            end;
                        end;
                    elseif l_type_0 == "Pet" then
                        v49 = select(2, v12:GetRarity(v45.name or v45.Name));
                        if v48 then
                            v48.Name = v45.name or v45.Name;
                            v48.Mega = v48.Wumbo or false;
                            v48.Shiny = v48.Shiny or false;
                            if not v48.Level then
                                v48.Level = 1;
                            end;
                        end;
                    else
                        continue;
                    end;
                    local l_Inner_0 = l_FirstChild_0.Inner;
                    local l_Pity_0 = l_Inner_0:FindFirstChild("Pity");
                    local l_pityAmount_0 = v45.pityAmount;
                    if l_Pity_0 and l_pityAmount_0 then
                        l_Pity_0.Visible = true;
                        v39:Connect(function(v53) --[[ Line: 149 ]]
                            -- upvalues: l_Pity_0 (copy), l_pityAmount_0 (copy)
                            l_Pity_0.Amount.Text = ("%*/%*"):format(v53 % l_pityAmount_0, l_pityAmount_0);
                        end);
                    end;
                    l_FirstChild_0.Backdrop:SetAttribute("Rarity", v49 or "Common");
                    l_FirstChild_0.Glow:SetAttribute("Rarity", v49 or "Common");
                    l_FirstChild_0.Backdrop:ClearAllChildren();
                    l_FirstChild_0.Glow:ClearAllChildren();
                    table.insert(v31.rarityVisuals, l_FirstChild_0.Backdrop);
                    table.insert(v31.rarityVisuals, l_FirstChild_0.Glow);
                    if v31._open then
                        l_FirstChild_0.Backdrop:AddTag("VisualizeRarity");
                        l_FirstChild_0.Glow:AddTag("VisualizeRarity");
                    end;
                    local l__tooltips_0 = v31._tooltips;
                    local l_new_0 = v5.new;
                    local l_l_FirstChild_0_0 = l_FirstChild_0;
                    local v57 = {
                        Name = v45.name or v45.Name, 
                        UnitData = v48, 
                        IsUnit = l_type_0 == "Unit", 
                        IsPet = l_type_0 == "Pet", 
                        IsSecretUnit = false
                    };
                    local v58;
                    if v48 then
                        v58 = {};
                        local v59 = false;
                        if v48.Shiny == false then
                            v59 = v48.Wumbo == false;
                        end;
                        v58.Normal = v59;
                        v58.Shiny = v48.Shiny or false;
                        v58.Mega = v48.Wumbo or false;
                        v59 = false;
                        if v48.Shiny == true then
                            v59 = v48.Wumbo == true;
                        end;
                        v58.ShinyMega = v59;
                    else
                        v58 = nil;
                    end;
                    v57.ExtraData = v58;
                    table.insert(l__tooltips_0, l_new_0(l_l_FirstChild_0_0, v57));
                    l_Inner_0.Chance.Text = ("%*%%"):format(v45.weight or 1);
                end;
            end;
        end;
        v14:OnChanged(v2.Player, {
            "ChestPity", 
            "SwashbucklerCrate"
        }, function(v60) --[[ Line: 187 ]]
            -- upvalues: v39 (copy)
            v39:Fire(v60 or 0);
        end, true);
        local v61 = v8.Shop[1];
        v15:HandleButton(l_Main_0.Buttons.Currency, function() --[[ Line: 194 ]]
            -- upvalues: v61 (copy), v31 (copy), v20 (ref), v17 (ref), v4 (ref), v5 (ref), v18 (ref)
            local l_amount_0 = v61.cost.amount;
            local v63 = math.floor(v31.currencyAmount / l_amount_0);
            if v31._processingRequest then
                return;
            elseif v63 < 1 then
                v20:Notify({
                    message = ("You need %* more Swashbucks"):format(l_amount_0 - v31.currencyAmount), 
                    duration = 3.5, 
                    isPositive = false
                });
                return;
            else
                local function v67(v64) --[[ Line: 212 ]] --[[ Name: attemptPurchase ]]
                    -- upvalues: v31 (ref), v17 (ref), v20 (ref), v4 (ref)
                    v64 = v64 and tonumber(v64);
                    if not tonumber(v64) or v64 < 1 then
                        return;
                    else
                        v31._processingRequest = true;
                        v17:PurchaseShopItem(1, v64):andThen(function(v65) --[[ Line: 222 ]]
                            -- upvalues: v20 (ref), v4 (ref), v64 (ref)
                            if not v65 then
                                v20:Notify({
                                    message = "Something went wrong", 
                                    duration = 3.5, 
                                    isPositive = false
                                });
                                return;
                            else
                                local v66 = v4:Pluralize("Swashbuckler Crate", v64 or 1);
                                v20:Notify({
                                    message = ("Successfully purchased %*x %*!"):format(v64 or 1, v66), 
                                    duration = 3.5, 
                                    isPositive = true
                                });
                                return;
                            end;
                        end):finally(function() --[[ Line: 241 ]]
                            -- upvalues: v31 (ref)
                            v31._processingRequest = false;
                        end);
                        return;
                    end;
                end;
                if v63 == 1 then
                    v67(1);
                    return;
                else
                    for _, v69 in v31._tooltips do
                        v69.Enabled = false;
                    end;
                    v5:HideAll();
                    v18:Prompt({
                        message = "How many would you like to purchase?", 
                        minAmount = 1, 
                        maxAmount = v63, 
                        maxMessage = "You can buy a maximum of %s Swashbuckler Crates.", 
                        shopInfo = {
                            baseCost = l_amount_0, 
                            currencyName = v61.cost.currency
                        }, 
                        callback = v67
                    });
                    v18:BindToClose(function() --[[ Line: 270 ]]
                        -- upvalues: v31 (ref)
                        for _, v71 in v31._tooltips do
                            v71.Enabled = true;
                        end;
                    end);
                    return;
                end;
            end;
        end);
        local l_TotalCurrency_0 = l_Main_0.TotalCurrency;
        v14:OnChanged(v2.Player, "Currency.Swashbucks", function(v73) --[[ Line: 279 ]]
            -- upvalues: v31 (copy), l_TotalCurrency_0 (copy), v4 (ref)
            v31.currencyAmount = v73 or 0;
            l_TotalCurrency_0.Content.Amount.Text = v4:CommaNumber(v73 or 0);
        end, true);
    end, 
    _setupBottomBin = function(_) --[[ Line: 285 ]] --[[ Name: _setupBottomBin ]]
        -- upvalues: v14 (copy), v2 (copy), v20 (ref), v15 (copy), v5 (copy), v10 (copy)
    end, 
    _setupPurchases = function(v75) --[[ Line: 394 ]] --[[ Name: _setupPurchases ]]
        -- upvalues: v16 (copy), v15 (copy), l_CollectionService_0 (copy)
        local function v84(v76) --[[ Line: 395 ]] --[[ Name: purchaseAdded ]]
            -- upvalues: v75 (copy), v16 (ref), v15 (ref)
            if not v76:IsDescendantOf(v75.frame) then
                return;
            elseif v75.PaidItemsRestricted then
                v76:Destroy();
                return;
            else
                local l_v76_Attribute_0 = v76:GetAttribute("PurchaseType");
                local l_v76_Attribute_1 = v76:GetAttribute("PurchaseName");
                local v79 = l_v76_Attribute_0 == "DevProducts" and Enum.InfoType.Product or Enum.InfoType.GamePass;
                v16:PromiseProductInfo(l_v76_Attribute_1, v79):andThen(function(v80) --[[ Line: 411 ]]
                    -- upvalues: v76 (copy)
                    v76.Content:FindFirstChild("Amount", true).Text = v80 and v80.PriceInRobux or "?";
                end);
                v15:HandleButton(v76, function() --[[ Line: 416 ]]
                    -- upvalues: l_v76_Attribute_0 (copy), v16 (ref), l_v76_Attribute_1 (copy)
                    local v81 = l_v76_Attribute_0 == "DevProducts" and "GetProduct" or "GetGamepass";
                    local v82 = l_v76_Attribute_0 == "DevProducts" and "PromptProductPurchase" or "PromptGamepassPurchase";
                    local v83 = v16[v81](v16, l_v76_Attribute_1);
                    if not v83 then
                        return;
                    else
                        v16[v82](v16, v83.purchaseId);
                        return;
                    end;
                end);
                return;
            end;
        end;
        for _, v86 in l_CollectionService_0:GetTagged("TakeoverPurchase") do
            v84(v86);
        end;
        l_CollectionService_0:GetInstanceAddedSignal("TakeoverPurchase"):Connect(v84);
    end
};