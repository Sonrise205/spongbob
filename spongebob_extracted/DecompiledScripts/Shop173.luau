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
local _ = v2.GetService("KampKoralService");
local v18 = v2.GetService("EventService");
local v19 = v2.GetService("RobloxEventService");
local v20 = nil;
local v21 = nil;
local v22 = nil;
return {
    rarityVisuals = {}, 
    _open = false, 
    _tooltips = {}, 
    Init = function(v23, v24, _) --[[ Line: 35 ]] --[[ Name: Init ]]
        v23.frame = v24;
        v23.crateOffer = v24.CrateOffer;
        v23.bottomBin = v24.Bin;
    end, 
    Start = function(v26) --[[ Line: 41 ]] --[[ Name: Start ]]
        -- upvalues: v20 (ref), v15 (copy), v21 (ref), v22 (ref), v6 (copy), v2 (copy)
        v20 = v15:GetModuleAsync("NumberPrompt"):expect();
        v21 = v15:GetModuleAsync("MessagePrompt"):expect();
        v22 = v15:GetModuleAsync("Notification"):expect();
        v26.PolicyInfo = v6(v2.Player):expect();
        if not v26.PolicyInfo then
            v2.Player:Kick("Failed to get policy info. (Please rejoin)");
            return;
        else
            v26.PaidItemsRestricted = v26.PolicyInfo.ArePaidRandomItemsRestricted or false;
            v26:_setupCrate();
            v26:_setupBottomBin();
            v26:_setupPurchases();
            return;
        end;
    end, 
    Opened = function(v27) --[[ Line: 61 ]] --[[ Name: Opened ]]
        v27._open = true;
        for _, v29 in v27.rarityVisuals do
            v29:AddTag("VisualizeRarity");
        end;
    end, 
    Closed = function(v30) --[[ Line: 69 ]] --[[ Name: Closed ]]
        v30._open = false;
        for _, v32 in v30.rarityVisuals do
            v32:RemoveTag("VisualizeRarity");
        end;
    end, 
    _setupCrate = function(v33) --[[ Line: 80 ]] --[[ Name: _setupCrate ]]
        -- upvalues: v13 (copy), v3 (copy), v4 (copy), v10 (copy), v12 (copy), v5 (copy), v14 (copy), v2 (copy), v8 (copy), v15 (copy), v22 (ref), v18 (copy), v20 (ref)
        local l_v13_RarityPool_0 = v13:GetRarityPool("PrizedEgg");
        local l_v13_LootPool_0 = v13:GetLootPool("PrizedEgg");
        local v36 = {};
        for v37, v38 in l_v13_RarityPool_0 do
            table.insert(v36, {
                rarity = v37, 
                weight = v38.weight or v38.Weight or 1
            });
        end;
        table.sort(v36, function(v39, v40) --[[ Line: 95 ]]
            return v39.weight > v40.weight;
        end);
        local v41 = v3.new();
        local l_Main_0 = v33.crateOffer.LargeBin.Main;
        local v43 = 0;
        for _, v45 in v36 do
            for _, v47 in l_v13_LootPool_0[v45.rarity] do
                v43 = v43 + 1;
                local l_FirstChild_0 = l_Main_0.Rewards:FindFirstChild(v43);
                if l_FirstChild_0 then
                    local l_type_0 = v47.type;
                    local v50 = v47 and v47.extraData;
                    local v51 = nil;
                    if l_type_0 == "Inventory" then
                        v51 = v4:GetRewardRarity(v47);
                    elseif l_type_0 == "Unit" then
                        v51 = select(2, v10:GetRarity(v47.name or v47.Name));
                        if v50 then
                            v50.Name = v47.name or v47.Name;
                            v50.Mega = v50.Wumbo or false;
                            v50.Shiny = v50.Shiny or false;
                            if not v50.Level then
                                v50.Level = 1;
                            end;
                        end;
                    elseif l_type_0 == "Pet" then
                        v51 = select(2, v12:GetRarity(v47.name or v47.Name));
                        if v50 then
                            v50.Name = v47.name or v47.Name;
                            v50.Mega = v50.Wumbo or false;
                            v50.Shiny = v50.Shiny or false;
                            if not v50.Level then
                                v50.Level = 1;
                            end;
                        end;
                    else
                        continue;
                    end;
                    local l_Inner_0 = l_FirstChild_0.Inner;
                    local l_Pity_0 = l_Inner_0:FindFirstChild("Pity");
                    local l_pityAmount_0 = v47.pityAmount;
                    if l_Pity_0 and l_pityAmount_0 then
                        l_Pity_0.Visible = true;
                        v41:Connect(function(v55) --[[ Line: 150 ]]
                            -- upvalues: l_Pity_0 (copy), l_pityAmount_0 (copy)
                            l_Pity_0.Amount.Text = ("%*/%*"):format(v55 % l_pityAmount_0, l_pityAmount_0);
                        end);
                    end;
                    l_FirstChild_0.Backdrop:SetAttribute("Rarity", v51 or "Common");
                    l_FirstChild_0.Glow:SetAttribute("Rarity", v51 or "Common");
                    l_FirstChild_0.Backdrop:ClearAllChildren();
                    l_FirstChild_0.Glow:ClearAllChildren();
                    table.insert(v33.rarityVisuals, l_FirstChild_0.Backdrop);
                    table.insert(v33.rarityVisuals, l_FirstChild_0.Glow);
                    if v33._open then
                        l_FirstChild_0.Backdrop:AddTag("VisualizeRarity");
                        l_FirstChild_0.Glow:AddTag("VisualizeRarity");
                    end;
                    local l__tooltips_0 = v33._tooltips;
                    local l_new_0 = v5.new;
                    local l_l_FirstChild_0_0 = l_FirstChild_0;
                    local v59 = {
                        Name = v47.name or v47.Name, 
                        UnitData = v50, 
                        IsUnit = l_type_0 == "Unit", 
                        IsPet = l_type_0 == "Pet", 
                        IsSecretUnit = false
                    };
                    local v60;
                    if v50 then
                        v60 = {};
                        local v61 = false;
                        if v50.Shiny == false then
                            v61 = v50.Wumbo == false;
                        end;
                        v60.Normal = v61;
                        v60.Shiny = v50.Shiny or false;
                        v60.Mega = v50.Wumbo or false;
                        v61 = false;
                        if v50.Shiny == true then
                            v61 = v50.Wumbo == true;
                        end;
                        v60.ShinyMega = v61;
                    else
                        v60 = nil;
                    end;
                    v59.ExtraData = v60;
                    table.insert(l__tooltips_0, l_new_0(l_l_FirstChild_0_0, v59));
                    l_Inner_0.Chance.Text = ("%*%%"):format(v47.weight or 1);
                end;
            end;
        end;
        v14:OnChanged(v2.Player, {
            "ChestPity", 
            "PrizedEgg"
        }, function(v62) --[[ Line: 188 ]]
            -- upvalues: v41 (copy)
            v41:Fire(v62 or 0);
        end, true);
        local v63 = v8.Shop[1];
        v15:HandleButton(l_Main_0.Buttons.Currency, function() --[[ Line: 195 ]]
            -- upvalues: v63 (copy), v33 (copy), v22 (ref), v18 (ref), v4 (ref), v5 (ref), v20 (ref)
            local l_amount_0 = v63.cost.amount;
            local v65 = math.floor(v33.currencyAmount / l_amount_0);
            if v33._processingRequest then
                return;
            elseif v65 < 1 then
                v22:Notify({
                    message = ("You need %* more Kelp Dollars"):format(l_amount_0 - v33.currencyAmount), 
                    duration = 3.5, 
                    isPositive = false
                });
                return;
            else
                local function v69(v66) --[[ Line: 213 ]] --[[ Name: attemptPurchase ]]
                    -- upvalues: v33 (ref), v18 (ref), v22 (ref), v4 (ref)
                    v66 = v66 and tonumber(v66);
                    if not tonumber(v66) or v66 < 1 then
                        return;
                    else
                        v33._processingRequest = true;
                        v18:PurchaseShopItem(1, v66):andThen(function(v67) --[[ Line: 223 ]]
                            -- upvalues: v22 (ref), v4 (ref), v66 (ref)
                            if not v67 then
                                v22:Notify({
                                    message = "Something went wrong", 
                                    duration = 3.5, 
                                    isPositive = false
                                });
                                return;
                            else
                                local v68 = v4:Pluralize("Prized Egg", v66 or 1);
                                v22:Notify({
                                    message = ("Successfully purchased %*x %*!"):format(v66 or 1, v68), 
                                    duration = 3.5, 
                                    isPositive = true
                                });
                                return;
                            end;
                        end):finally(function() --[[ Line: 242 ]]
                            -- upvalues: v33 (ref)
                            v33._processingRequest = false;
                        end);
                        return;
                    end;
                end;
                if v65 == 1 then
                    v69(1);
                    return;
                else
                    for _, v71 in v33._tooltips do
                        v71.Enabled = false;
                    end;
                    v5:HideAll();
                    v20:Prompt({
                        message = "How many would you like to purchase?", 
                        minAmount = 1, 
                        maxAmount = v65, 
                        maxMessage = "You can buy a maximum of %s Prized Eggs.", 
                        shopInfo = {
                            baseCost = l_amount_0, 
                            currencyName = v63.cost.currency
                        }, 
                        callback = v69
                    });
                    v20:BindToClose(function() --[[ Line: 271 ]]
                        -- upvalues: v33 (ref)
                        for _, v73 in v33._tooltips do
                            v73.Enabled = true;
                        end;
                    end);
                    return;
                end;
            end;
        end);
        local l_TotalCurrency_0 = l_Main_0.TotalCurrency;
        v14:OnChanged(v2.Player, "Currency.KelpDollar", function(v75) --[[ Line: 280 ]]
            -- upvalues: v33 (copy), l_TotalCurrency_0 (copy), v4 (ref)
            v33.currencyAmount = v75 or 0;
            l_TotalCurrency_0.Content.Amount.Text = v4:CommaNumber(v75 or 0);
        end, true);
    end, 
    _setupBottomBin = function(v76) --[[ Line: 286 ]] --[[ Name: _setupBottomBin ]]
        -- upvalues: v14 (copy), v2 (copy), v22 (ref), v15 (copy), v19 (copy), v5 (copy), v10 (copy)
        local l_Main_1 = v76.bottomBin.ChallengeDifficulties.Main;
        local l_Claim_0 = l_Main_1.Claim;
        local l_Fill_0 = l_Claim_0.Content.Fill;
        local l_TextDisplay_0 = l_Claim_0.Content.TextDisplay;
        local v81 = false;
        local v82 = 0;
        local v83 = 0;
        local l_TextColor3_0 = l_TextDisplay_0.TextColor3;
        local function v85() --[[ Line: 298 ]] --[[ Name: update ]]
            -- upvalues: l_Fill_0 (copy), v82 (ref), v83 (ref), l_TextDisplay_0 (copy), v81 (ref), l_TextColor3_0 (copy)
            l_Fill_0.Size = UDim2.fromScale(v82 / v83, 1);
            l_TextDisplay_0.Text = v81 and "CLAIMED" or v82 == v83 and "CLAIM" or ("%*/%*"):format(v82, v83);
            l_TextDisplay_0.TextColor3 = if not not v81 or v82 == v83 then Color3.new(1, 1, 1) else l_TextColor3_0;
        end;
        v14:OnChanged(v2.Player, "TakeoverEvent.ClaimedCompletionReward", function(v86) --[[ Line: 304 ]]
            -- upvalues: v81 (ref), v85 (copy)
            v81 = v86;
            v85();
        end, true);
        v14:OnChanged(v2.Player, "TakeoverEvent.FirstTimeCompletions", function(v87) --[[ Line: 309 ]]
            -- upvalues: v82 (ref), v83 (ref), v85 (copy)
            v82 = 0;
            v83 = 0;
            for _, v89 in v87 do
                v83 = v83 + 1;
                if v89 then
                    v82 = v82 + 1;
                end;
            end;
            v85();
        end, true);
        local function _() --[[ Line: 324 ]] --[[ Name: notifyIncomplete ]]
            -- upvalues: v22 (ref)
            v22:Notify({
                message = "You must complete all challenges to claim your reward!", 
                duration = 3.5, 
                isPositive = false
            });
        end;
        v15:HandleButton(l_Claim_0, function() --[[ Line: 332 ]]
            -- upvalues: v81 (ref), v22 (ref), v82 (ref), v83 (ref), v19 (ref)
            if v81 then
                v22:Notify({
                    message = "You have already claimed your reward!", 
                    duration = 3.5, 
                    isPositive = false
                });
                return;
            elseif v82 < v83 then
                v22:Notify({
                    message = "You must complete all challenges to claim your reward!", 
                    duration = 3.5, 
                    isPositive = false
                });
                return;
            else
                v19:ClaimCompletionReward():andThen(function(v91) --[[ Line: 350 ]]
                    -- upvalues: v22 (ref)
                    if v91 then
                        v22:Notify({
                            message = "Successfully claimed your reward!", 
                            duration = 3.5, 
                            isPositive = true
                        });
                        return;
                    else
                        v22:Notify({
                            message = "You must complete all challenges to claim your reward!", 
                            duration = 3.5, 
                            isPositive = false
                        });
                        return;
                    end;
                end);
                return;
            end;
        end);
        for v92, v93 in {
            Mayor = l_Main_1.Reward, 
            MorbidSpongebob = v76.bottomBin.MorbidSpongeBob.Main.Reward
        } do
            table.insert(v76._tooltips, v5.new(v93, {
                Name = v92, 
                IsUnit = true, 
                IsSecretUnit = false
            }));
            local v94 = select(2, v10:GetRarity(v92));
            v93.Backdrop:SetAttribute("Rarity", v94 or "Common");
            v93.Glow:SetAttribute("Rarity", v94 or "Common");
            v93.Backdrop:ClearAllChildren();
            v93.Glow:ClearAllChildren();
            table.insert(v76.rarityVisuals, v93.Backdrop);
            table.insert(v76.rarityVisuals, v93.Glow);
            if v76._open then
                v93.Backdrop:AddTag("VisualizeRarity");
                v93.Glow:AddTag("VisualizeRarity");
            end;
        end;
    end, 
    _setupPurchases = function(v95) --[[ Line: 393 ]] --[[ Name: _setupPurchases ]]
        -- upvalues: v16 (copy), v15 (copy), l_CollectionService_0 (copy)
        local function v104(v96) --[[ Line: 394 ]] --[[ Name: purchaseAdded ]]
            -- upvalues: v95 (copy), v16 (ref), v15 (ref)
            if not v96:IsDescendantOf(v95.frame) then
                return;
            elseif v95.PaidItemsRestricted then
                v96:Destroy();
                return;
            else
                local l_v96_Attribute_0 = v96:GetAttribute("PurchaseType");
                local l_v96_Attribute_1 = v96:GetAttribute("PurchaseName");
                local v99 = l_v96_Attribute_0 == "DevProducts" and Enum.InfoType.Product or Enum.InfoType.GamePass;
                v16:PromiseProductInfo(l_v96_Attribute_1, v99):andThen(function(v100) --[[ Line: 410 ]]
                    -- upvalues: v96 (copy)
                    v96.Content:FindFirstChild("Amount", true).Text = v100 and v100.PriceInRobux or "?";
                end);
                v15:HandleButton(v96, function() --[[ Line: 415 ]]
                    -- upvalues: l_v96_Attribute_0 (copy), v16 (ref), l_v96_Attribute_1 (copy)
                    local v101 = l_v96_Attribute_0 == "DevProducts" and "GetProduct" or "GetGamepass";
                    local v102 = l_v96_Attribute_0 == "DevProducts" and "PromptProductPurchase" or "PromptGamepassPurchase";
                    local v103 = v16[v101](v16, l_v96_Attribute_1);
                    if not v103 then
                        return;
                    else
                        v16[v102](v16, v103.purchaseId);
                        return;
                    end;
                end);
                return;
            end;
        end;
        for _, v106 in l_CollectionService_0:GetTagged("TakeoverPurchase") do
            v104(v106);
        end;
        l_CollectionService_0:GetInstanceAddedSignal("TakeoverPurchase"):Connect(v104);
    end
};