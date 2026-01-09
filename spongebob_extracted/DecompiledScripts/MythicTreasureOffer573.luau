local _ = game:GetService("MarketplaceService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = {
    "TreasurePack1", 
    "TreasurePack2", 
    "TreasurePack3", 
    "TreasurePack4", 
    "TreasureOffer1", 
    "TreasureOffer2", 
    "TreasureOffer3", 
    "TreasureOffer4", 
    "TreasureOffer5", 
    "TreasureOffer6", 
    "TreasureOffer7", 
    "TreasureOffer8", 
    "TreasureOffer9", 
    "TreasureOffer10"
};
local v9 = {};
return {
    primaryMenu = false, 
    Init = function(v10, v11) --[[ Line: 53 ]] --[[ Name: Init ]]
        -- upvalues: v5 (ref), v2 (copy), v6 (ref), v7 (ref), v8 (copy), v9 (copy)
        v5 = v2.GetController("DataController");
        v6 = v2.GetController("UIController");
        v7 = v2.GetController("PurchaseController");
        v10.ui = v11;
        v10.main = v11.Main;
        v10.exitBtn = v10.main.Exit;
        v10.purchaseBtn = v10.main.Purchase;
        for _, v13 in v8 do
            local l_v7_Product_0 = v7:GetProduct(v13);
            if l_v7_Product_0 then
                table.insert(v9, l_v7_Product_0.purchaseId);
            end;
        end;
    end, 
    Start = function(v15, _) --[[ Line: 74 ]] --[[ Name: Start ]]
        -- upvalues: v5 (ref), v2 (copy), v6 (ref), v7 (ref), v9 (copy)
        local v17 = v5:Get(v2.Player, "BundlesPurchased"):expect().MythicChestBundle1 or false;
        v5:OnChanged(v2.Player, "BundlesPurchased", function(v18) --[[ Line: 78 ]]
            -- upvalues: v17 (ref), v6 (ref)
            v17 = v18.MythicChestBundle1 or false;
            if v17 and v6:GetToggleState(script.Name) then
                v6:Toggle(script.Name, false);
            end;
        end);
        v7:PromiseProductInfo("MythicChestBundle1", Enum.InfoType.Product):andThen(function(v19) --[[ Line: 86 ]]
            -- upvalues: v15 (copy)
            v15.purchaseBtn.Content.Amount.Text = v19.PriceInRobux or "???";
        end);
        v7.ProductPurchaseFinished:Connect(function(v20, v21) --[[ Line: 90 ]]
            -- upvalues: v9 (ref), v17 (ref), v6 (ref)
            if not table.find(v9, v20) then
                return;
            elseif not v21 then
                return;
            elseif v17 then
                return;
            else
                v6:Toggle(script.Name, true);
                return;
            end;
        end);
        v6:HandleButton(v15.exitBtn, function() --[[ Line: 106 ]]
            -- upvalues: v6 (ref)
            v6:Toggle(script.Name, false);
        end);
        v6:HandleButton(v15.purchaseBtn, function() --[[ Line: 110 ]]
            -- upvalues: v17 (ref), v7 (ref)
            if v17 then
                return;
            else
                v7:PromptProductPurchase("MythicChestBundle1");
                return;
            end;
        end);
    end
};