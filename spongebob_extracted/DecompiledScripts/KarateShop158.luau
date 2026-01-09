local _ = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.RNGRolls);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v9 = require(v2.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.PetImages);
local v12 = require(l_ReplicatedStorage_0.Shared.TowerOfKarate.Constants);
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local l_KRATE_COST_0 = v12.KRATE_COST;
return {
    primaryMenu = true, 
    ToggleAll = {}, 
    Init = function(v19, v20) --[[ Line: 43 ]] --[[ Name: Init ]]
        -- upvalues: v13 (ref), v2 (copy), v14 (ref), v15 (ref), v16 (ref), v17 (ref)
        v13 = v2.GetController("UIController");
        v14 = v2.GetController("DataController");
        v15 = v2.GetService("TowerKarateService");
        v16 = v13:GetModuleAsync("NumberPrompt"):expect();
        v17 = v13:GetModuleAsync("Notification"):expect();
        v19.ui = v20;
        v19.main = v20.Main.ShopWindow;
        v19.content = v19.main.Content;
        v19.viewport = v19.content.ViewportFrame;
        v19.crateOffer = v19.content.Bin.CrateOffer.Main;
        v19.rarityVisuals = {};
    end, 
    Start = function(v21, _) --[[ Line: 59 ]] --[[ Name: Start ]]
        -- upvalues: v13 (ref), v14 (ref), v2 (copy), v6 (copy)
        v13:HandleButton(v21.main.Exit, function() --[[ Line: 61 ]]
            -- upvalues: v13 (ref)
            v13:Toggle(script.Name, false);
        end);
        v14:OnChanged(v2.Player, "Currency.KarateCoins", function(v23) --[[ Line: 65 ]]
            -- upvalues: v21 (copy), v6 (ref)
            v21.myCurrency = v23 or 0;
            v21.content.Header.Currencies.Inner.KarateCoins.Content.Amount.Text = v6:SuffixNumber(v21.myCurrency, true);
        end, true);
        v21:_PopulateVariantPool();
        v21:_PopulateChances();
        v21:_SetupPurchase();
    end, 
    Opening = function(v24) --[[ Line: 76 ]] --[[ Name: Opening ]]
        for _, v26 in v24.rarityVisuals do
            v26:AddTag("VisualizeRarity");
        end;
    end, 
    Closed = function(v27) --[[ Line: 82 ]] --[[ Name: Closed ]]
        for _, v29 in v27.rarityVisuals do
            v29:RemoveTag("VisualizeRarity");
        end;
    end, 
    _PopulateVariantPool = function(v30) --[[ Line: 91 ]] --[[ Name: _PopulateVariantPool ]]
        -- upvalues: v5 (copy)
        local l_v5_VariantPool_0 = v5:GetVariantPool("KarateKrate");
        if not l_v5_VariantPool_0 then
            return;
        else
            for v32, v33 in l_v5_VariantPool_0 do
                local l_FirstChild_0 = v30.crateOffer.VariantChances:FindFirstChild(v32);
                if l_FirstChild_0 then
                    l_FirstChild_0.Amount.Text = ("%*%%"):format(v33.weight or "NAN");
                end;
            end;
            return;
        end;
    end, 
    _PopulateChances = function(v35) --[[ Line: 108 ]] --[[ Name: _PopulateChances ]]
        -- upvalues: v5 (copy), v6 (copy), v7 (copy), v10 (copy), v8 (copy), v11 (copy), v13 (ref), v9 (copy)
        local l_v5_RarityPool_0 = v5:GetRarityPool("KarateKrate");
        local l_v5_LootPool_0 = v5:GetLootPool("KarateKrate");
        local v38 = {};
        for v39, v40 in l_v5_RarityPool_0 do
            table.insert(v38, {
                rarity = v39, 
                weight = v40.weight or v40.Weight or 1
            });
        end;
        table.sort(v38, function(v41, v42) --[[ Line: 122 ]]
            return v41.weight > v42.weight;
        end);
        local v43 = 0;
        for _, v45 in v38 do
            for _, v47 in l_v5_LootPool_0[v45.rarity] do
                v43 = v43 + 1;
                local l_type_0 = v47.type;
                local l_FirstChild_1 = v35.crateOffer.Contents:FindFirstChild(v43);
                if l_FirstChild_1 then
                    local v50 = v47 and v47.extraData;
                    l_FirstChild_1.Inner.Icon.Visible = true;
                    local v51 = nil;
                    if l_type_0 == "Inventory" then
                        v51 = v6:GetRewardRarity(v47);
                        l_FirstChild_1.Inner.Icon.Image = v6:GetIconFromRewardData(v47) or "";
                    elseif l_type_0 == "Unit" then
                        v51 = select(2, v7:GetRarity(v47.name or v47.Name));
                        if v50 then
                            v50.Name = v47.name or v47.Name;
                            v50.Mega = v50.Wumbo or false;
                            v50.Shiny = v50.Shiny or false;
                            if not v50.Level then
                                v50.Level = 1;
                            end;
                        end;
                        v10:SetImage(l_FirstChild_1.Inner.Icon, v47.name or v47.Name);
                    elseif l_type_0 == "Pet" then
                        v51 = select(2, v8:GetRarity(v47.name or v47.Name));
                        if v50 then
                            v50.Name = v47.name or v47.Name;
                            v50.Mega = v50.Wumbo or false;
                            v50.Shiny = v50.Shiny or false;
                            if not v50.Level then
                                v50.Level = 1;
                            end;
                        end;
                        v11:SetImage(l_FirstChild_1.Inner.Icon, v47.name or v47.Name);
                    else
                        warn("Invalid reward type in KarateKrate loot pool:", l_type_0);
                        continue;
                    end;
                    l_FirstChild_1.Backdrop:SetAttribute("Rarity", v51 or "Common");
                    l_FirstChild_1.Glow:SetAttribute("Rarity", v51 or "Common");
                    table.insert(v35.rarityVisuals, l_FirstChild_1.Backdrop);
                    table.insert(v35.rarityVisuals, l_FirstChild_1.Glow);
                    if v13:GetToggleState(script.Name) then
                        l_FirstChild_1.Backdrop:AddTag("VisualizeRarity");
                        l_FirstChild_1.Glow:AddTag("VisualizeRarity");
                    end;
                    local l_new_0 = v9.new;
                    local l_l_FirstChild_1_0 = l_FirstChild_1;
                    local v54 = {
                        Name = v47.name or v47.Name, 
                        UnitData = v50, 
                        IsUnit = l_type_0 == "Unit", 
                        IsPet = l_type_0 == "Pet", 
                        IsSecretUnit = function() --[[ Line: 190 ]] --[[ Name: IsSecretUnit ]]
                            return false;
                        end
                    };
                    local v55;
                    if v50 then
                        v55 = {};
                        local v56 = false;
                        if v50.Shiny == false then
                            v56 = v50.Wumbo == false;
                        end;
                        v55.Normal = v56;
                        v55.Shiny = v50.Shiny or false;
                        v55.Mega = v50.Wumbo or false;
                        v56 = false;
                        if v50.Shiny == true then
                            v56 = v50.Wumbo == true;
                        end;
                        v55.ShinyMega = v56;
                    else
                        v55 = nil;
                    end;
                    v54.ExtraData = v55;
                    l_new_0(l_l_FirstChild_1_0, v54);
                    l_FirstChild_1.Inner.Chance.Text = ("%*%%"):format(v47.weight or 1);
                end;
            end;
        end;
    end, 
    _SetupPurchase = function(v57) --[[ Line: 206 ]] --[[ Name: _SetupPurchase ]]
        -- upvalues: v13 (ref), l_KRATE_COST_0 (copy), v17 (ref), v16 (ref)
        v13:HandleButton(v57.crateOffer.Crate.Buy, function() --[[ Line: 207 ]]
            -- upvalues: l_KRATE_COST_0 (ref), v57 (copy), v17 (ref), v16 (ref)
            local l_l_KRATE_COST_0_0 = l_KRATE_COST_0;
            local v59 = l_l_KRATE_COST_0_0 <= v57.myCurrency;
            local v60 = math.floor(v57.myCurrency / l_l_KRATE_COST_0_0) or 0;
            if v57.purchaseRequestProcessing or not v59 or v60 < 1 then
                if not v59 or v60 < 1 then
                    v17:Notify({
                        text = ("You need %* more KarateCoins to purchase this!"):format((math.clamp(l_l_KRATE_COST_0_0 - v57.myCurrency, 0, l_l_KRATE_COST_0_0))), 
                        duration = 3, 
                        isPositive = false
                    });
                end;
                return;
            elseif v60 == 1 then
                v57:_attemptPurchaseGift(1, v60);
                return;
            else
                v16:Prompt({
                    message = "How many would you like to purchase?", 
                    minAmount = 1, 
                    maxAmount = v60, 
                    maxMessage = "You can buy a maximum of %s KarateKrates.", 
                    shopInfo = {
                        baseCost = l_l_KRATE_COST_0_0, 
                        currencyName = "KarateCoins"
                    }, 
                    callback = function(v61) --[[ Line: 238 ]] --[[ Name: callback ]]
                        -- upvalues: v57 (ref), v60 (copy)
                        v61 = v61 or 1;
                        if v61 < 1 then
                            return;
                        else
                            v57:_attemptPurchaseGift(v61, v60);
                            return;
                        end;
                    end
                });
                return;
            end;
        end);
    end, 
    _attemptPurchaseGift = function(v62, v63, v64) --[[ Line: 251 ]] --[[ Name: _attemptPurchaseGift ]]
        -- upvalues: v15 (ref), v17 (ref)
        if not v63 or v63 < 1 or v64 < v63 then
            return;
        elseif v62.purchaseRequestProcessing then
            return;
        else
            v62.purchaseRequestProcessing = true;
            v15:PurchaseKrate(v63):andThen(function(v65, v66) --[[ Line: 262 ]]
                -- upvalues: v17 (ref)
                if not v66 then
                    return;
                else
                    v17:Notify({
                        text = v66, 
                        duration = 3, 
                        isPositive = v65
                    });
                    return;
                end;
            end):finally(function() --[[ Line: 275 ]]
                -- upvalues: v62 (copy)
                task.delay(0.2, function() --[[ Line: 276 ]]
                    -- upvalues: v62 (ref)
                    v62.purchaseRequestProcessing = false;
                end);
            end);
            return;
        end;
    end
};