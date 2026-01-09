local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Signal);
local v5 = require(l_ReplicatedStorage_0.Packages.Promise);
local v6 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v9 = require(l_ReplicatedStorage_0.Shared.Util.PromiseAssetInfo);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.Purchases);
local v12 = nil;
local v13 = v3.CreateController({
    Name = "PurchaseController", 
    PurchasePromptOpened = v4.new(), 
    GamepassPromptOpened = v4.new(), 
    ProductPromptOpened = v4.new(), 
    SubscriptionPromptOpened = v4.new(), 
    PurchasePromptClosed = v4.new(), 
    ProductPurchaseFinished = v4.new(), 
    infoCache = {}
});
local function v20(v14, v15) --[[ Line: 56 ]] --[[ Name: getPurchaseFromName ]]
    -- upvalues: v8 (copy), v11 (copy)
    v8:Assert(typeof(v14) == "string", "Purchase type passed was not correct.");
    local v16 = nil;
    local v17 = v11[v14];
    v8:Assert(typeof(v17) == "table", "Purchases table from type was not correct.");
    for _, v19 in ipairs(v17) do
        if v19.purchaseName == v15 then
            v16 = v19;
        end;
    end;
    if not v16 then
        warn(v14, v15);
        v8:Error(string.format("Purchase not found in %s by: %s", v14, v15));
        return;
    else
        return v16;
    end;
end;
local function v27(v21, v22) --[[ Line: 84 ]] --[[ Name: getPurchaseFromId ]]
    -- upvalues: v8 (copy), v11 (copy)
    v8:Assert(typeof(v21) == "string", "Purchase type passed was not correct.");
    local v23 = nil;
    local v24 = v11[v21];
    v8:Assert(typeof(v24) == "table", "Purchases table from type was not correct.");
    for _, v26 in ipairs(v24) do
        if v26.purchaseId == v22 then
            v23 = v26;
        end;
    end;
    return v23;
end;
local function _(v28) --[[ Line: 105 ]] --[[ Name: getAttributeSafeGamepassName ]]
    return "Has" .. v28:gsub("%W+", "") .. "Gamepass";
end;
local function _(v30) --[[ Line: 109 ]] --[[ Name: getAttributeSafeSubscriptionName ]]
    return "Has" .. v30:gsub("%W+", "") .. "Subscription";
end;
v13.GetProduct = function(_, v33) --[[ Line: 118 ]] --[[ Name: GetProduct ]]
    -- upvalues: v27 (copy), v20 (copy)
    if typeof(v33) == "number" then
        return (v27("DevProducts", v33));
    else
        return (v20("DevProducts", v33));
    end;
end;
v13.GetGamepass = function(_, v35) --[[ Line: 128 ]] --[[ Name: GetGamepass ]]
    -- upvalues: v27 (copy), v20 (copy)
    if typeof(v35) == "number" then
        return (v27("Gamepasses", v35));
    else
        return (v20("Gamepasses", v35));
    end;
end;
v13.GetSubscription = function(_, v37) --[[ Line: 135 ]] --[[ Name: GetSubscription ]]
    -- upvalues: v27 (copy), v20 (copy)
    if string.find(v37, "EXP") then
        return (v27("Subscriptions", v37));
    else
        return (v20("Subscriptions", v37));
    end;
end;
v13.GetIcon = function(_, v39, v40) --[[ Line: 142 ]] --[[ Name: GetIcon ]]
    -- upvalues: v27 (copy)
    local v41 = v27(v39, v40);
    if not v41 then
        return;
    else
        return v41.purchaseIcon;
    end;
end;
v13.GetGamepassIconAsync = function(_, v43) --[[ Line: 151 ]] --[[ Name: GetGamepassIconAsync ]]
    -- upvalues: v5 (copy), v9 (copy)
    return v5.new(function(v44) --[[ Line: 152 ]]
        -- upvalues: v9 (ref), v43 (copy)
        v9(v43, Enum.InfoType.GamePass):andThen(function(v45) --[[ Line: 153 ]]
            -- upvalues: v44 (copy)
            v44((("rbxassetid://%*"):format(v45.IconImageAssetId)));
        end):catch(function() --[[ Line: 155 ]]
            -- upvalues: v44 (copy)
            v44("");
        end);
    end);
end;
v13.GetGamepassAttributeName = function(v46, v47) --[[ Line: 163 ]] --[[ Name: GetGamepassAttributeName ]]
    if typeof(v47) == "number" then
        v47 = v46:GetGamepass(v47).purchaseName;
    end;
    return "Has" .. v47:gsub("%W+", "") .. "Gamepass";
end;
v13.GetSubscriptionAttributeName = function(v48, v49) --[[ Line: 172 ]] --[[ Name: GetSubscriptionAttributeName ]]
    local l_v48_Subscription_0 = v48:GetSubscription(v49);
    if not l_v48_Subscription_0 then
        return;
    else
        return "Has" .. l_v48_Subscription_0.purchaseName:gsub("%W+", "") .. "Subscription";
    end;
end;
v13.HasGamepass = function(_, v52, v53) --[[ Line: 183 ]] --[[ Name: HasGamepass ]]
    -- upvalues: v13 (copy)
    return v52:GetAttribute((v13:GetGamepassAttributeName(v53)));
end;
v13.HasSubscription = function(_, v55, v56) --[[ Line: 189 ]] --[[ Name: HasSubscription ]]
    -- upvalues: v13 (copy), l_RunService_0 (copy)
    local l_v13_SubscriptionAttributeName_0 = v13:GetSubscriptionAttributeName(v56);
    if l_RunService_0:IsStudio() then
        return true;
    else
        return v55:GetAttribute(l_v13_SubscriptionAttributeName_0);
    end;
end;
v13.ArePaidItemsRestricted = function(_, _) --[[ Line: 199 ]] --[[ Name: ArePaidItemsRestricted ]]

end;
v13.ListenToGamepassOwned = function(_, v61, v62, v63, v64) --[[ Line: 205 ]] --[[ Name: ListenToGamepassOwned ]]
    -- upvalues: v6 (copy), v13 (copy)
    local v65 = v6.new();
    local l_v13_GamepassAttributeName_0 = v13:GetGamepassAttributeName(v62);
    v65:Connect(v61:GetAttributeChangedSignal(l_v13_GamepassAttributeName_0), function() --[[ Line: 211 ]] --[[ Name: gamepassOwnedChanged ]]
        -- upvalues: v61 (copy), l_v13_GamepassAttributeName_0 (copy), v65 (copy), v63 (copy)
        local v67 = v61:GetAttribute(l_v13_GamepassAttributeName_0) or false;
        if v67 then
            v65:Destroy();
        end;
        v63(v67);
    end);
    if v64 then
        local v68 = v61:GetAttribute(l_v13_GamepassAttributeName_0) or false;
        if v68 then
            v65:Destroy();
        end;
        v63(v68);
    end;
    return v65;
end;
v13.ListenToSubscriptionOwned = function(_, v70, v71, v72, v73) --[[ Line: 232 ]] --[[ Name: ListenToSubscriptionOwned ]]
    -- upvalues: v6 (copy), v13 (copy)
    local v74 = v6.new();
    local l_v13_SubscriptionAttributeName_1 = v13:GetSubscriptionAttributeName(v71);
    v74:Connect(v70:GetAttributeChangedSignal(l_v13_SubscriptionAttributeName_1), function() --[[ Line: 238 ]] --[[ Name: subscriptionOwnedChanged ]]
        -- upvalues: v70 (copy), l_v13_SubscriptionAttributeName_1 (copy), v74 (copy), v72 (copy)
        local l_v70_Attribute_0 = v70:GetAttribute(l_v13_SubscriptionAttributeName_1);
        if l_v70_Attribute_0 then
            v74:Destroy();
        end;
        v72(l_v70_Attribute_0);
    end);
    if v73 then
        local l_v70_Attribute_1 = v70:GetAttribute(l_v13_SubscriptionAttributeName_1);
        if l_v70_Attribute_1 then
            v74:Destroy();
        end;
        v72(l_v70_Attribute_1);
    end;
    return v74;
end;
v13.PromptGamepassPurchase = function(v78, v79) --[[ Line: 259 ]] --[[ Name: PromptGamepassPurchase ]]
    -- upvalues: v10 (copy), v8 (copy), l_MarketplaceService_0 (copy), v3 (copy)
    if typeof(v79) == "string" and v10.FAKE_GAMEPASSES[v79] then
        return;
    else
        local l_v78_Gamepass_0 = v78:GetGamepass(v79);
        if not l_v78_Gamepass_0 then
            v8:Warn(string.format("Gamepass not found by: %s", v79));
            return;
        else
            v78.promptingPurchase = true;
            v78.promptingGamepassPurchase = true;
            v78.PurchasePromptOpened:Fire();
            v78.GamepassPromptOpened:Fire();
            l_MarketplaceService_0:PromptGamePassPurchase(v3.Player, l_v78_Gamepass_0.purchaseId);
            return;
        end;
    end;
end;
v13.PromptProductPurchase = function(v81, v82) --[[ Line: 279 ]] --[[ Name: PromptProductPurchase ]]
    -- upvalues: v8 (copy), l_MarketplaceService_0 (copy), v3 (copy)
    local l_v81_Product_0 = v81:GetProduct(v82);
    if not v82 then
        v8:Warn(string.format("Gamepass not found by: %s", v82));
        return;
    else
        v81.promptingPurchase = true;
        v81.promptingProductPurchase = true;
        v81.PurchasePromptOpened:Fire();
        v81.ProductPromptOpened:Fire();
        l_MarketplaceService_0:PromptProductPurchase(v3.Player, l_v81_Product_0.purchaseId);
        return;
    end;
end;
v13.PromptSubscriptionPurchase = function(v84, v85) --[[ Line: 295 ]] --[[ Name: PromptSubscriptionPurchase ]]
    -- upvalues: v8 (copy), l_MarketplaceService_0 (copy), v3 (copy)
    local l_v84_Subscription_0 = v84:GetSubscription(v85);
    if not l_v84_Subscription_0 then
        v8:Warn(string.format("Subscription not found by: %s", v85));
        return;
    else
        v84.promptingPurchase = true;
        v84.promptingSubscriptionPurchase = true;
        v84.PurchasePromptOpened:Fire();
        v84.SubscriptionPromptOpened:Fire();
        l_MarketplaceService_0:PromptSubscriptionPurchase(v3.Player, l_v84_Subscription_0.purchaseId);
        return;
    end;
end;
v13.GamepassPromptFinished = function(v87, v88) --[[ Line: 311 ]] --[[ Name: GamepassPromptFinished ]]
    -- upvalues: v8 (copy), v5 (copy), l_MarketplaceService_0 (copy), v3 (copy)
    local l_v87_Gamepass_0 = v87:GetGamepass(v88);
    if not l_v87_Gamepass_0 then
        v8:Warn(string.format("Gamepass not found by: %s", v88));
        return v5.reject();
    else
        return v5.new(function(v90) --[[ Line: 319 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v3 (ref), l_v87_Gamepass_0 (copy)
            l_MarketplaceService_0.PromptGamePassPurchaseFinished:Once(function(v91, v92, v93) --[[ Line: 320 ]]
                -- upvalues: v3 (ref), l_v87_Gamepass_0 (ref), v90 (copy)
                if v91 ~= v3.Player or v92 ~= l_v87_Gamepass_0.purchaseId then
                    return;
                else
                    v90(v93);
                    return;
                end;
            end);
        end);
    end;
end;
v13.ProductPromptFinished = function(v94, v95) --[[ Line: 330 ]] --[[ Name: ProductPromptFinished ]]
    -- upvalues: v8 (copy), v5 (copy), l_MarketplaceService_0 (copy), v3 (copy)
    local l_v94_Product_0 = v94:GetProduct(v95);
    if not l_v94_Product_0 then
        v8:Warn(string.format("Product not found by: %s", v95));
        return v5.reject();
    else
        return v5.new(function(v97) --[[ Line: 338 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v3 (ref), l_v94_Product_0 (copy)
            l_MarketplaceService_0.PromptProductPurchaseFinished:Once(function(v98, v99, v100) --[[ Line: 339 ]]
                -- upvalues: v3 (ref), l_v94_Product_0 (ref), v97 (copy)
                if v98 ~= v3.Player.UserId or v99 ~= l_v94_Product_0.purchaseId then
                    return;
                else
                    v97(v100);
                    return;
                end;
            end);
        end);
    end;
end;
v13.SubscriptionPromptFinished = function(v101, v102) --[[ Line: 349 ]] --[[ Name: SubscriptionPromptFinished ]]
    -- upvalues: v8 (copy), v5 (copy), l_MarketplaceService_0 (copy), v3 (copy)
    local l_v101_Subscription_0 = v101:GetSubscription(v102);
    if not l_v101_Subscription_0 then
        v8:Warn(string.format("Subscription not found by: %s", v102));
        return v5.reject();
    else
        return v5.new(function(v104) --[[ Line: 357 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v3 (ref), l_v101_Subscription_0 (copy)
            l_MarketplaceService_0.PromptSubscriptionPurchaseFinished:Once(function(v105, v106, v107) --[[ Line: 358 ]]
                -- upvalues: v3 (ref), l_v101_Subscription_0 (ref), v104 (copy)
                if v105 ~= v3.Player or v106 ~= l_v101_Subscription_0.purchaseId then
                    return;
                else
                    v104(v107);
                    return;
                end;
            end);
        end);
    end;
end;
v13.IsGamepassPromptOpen = function(v108) --[[ Line: 368 ]] --[[ Name: IsGamepassPromptOpen ]]
    return v108.promptingGamepassPurchase;
end;
v13.IsSubscriptionPromptOpen = function(v109) --[[ Line: 372 ]] --[[ Name: IsSubscriptionPromptOpen ]]
    return v109.promptingSubscriptionPurchase;
end;
v13.IsPurchasePromptOpen = function(v110) --[[ Line: 376 ]] --[[ Name: IsPurchasePromptOpen ]]
    return v110.promptingPurchase;
end;
v13.PromiseProductInfo = function(v111, v112, v113) --[[ Line: 380 ]] --[[ Name: PromiseProductInfo ]]
    -- upvalues: v5 (copy), v9 (copy)
    local v114 = nil;
    v114 = if v113 == Enum.InfoType.Product then v111:GetProduct(v112) else v111:GetGamepass(v112);
    if not v114 then
        warn("Failed to get product info for: ", v112);
        return v5.reject("No product info for: ", v112);
    else
        return v9(v114.purchaseId, v113);
    end;
end;
v13.IsFakeGamepass = function(_, v116) --[[ Line: 397 ]] --[[ Name: IsFakeGamepass ]]
    -- upvalues: v10 (copy)
    if not v116 or typeof(v116) ~= "string" then
        return false;
    else
        return v10.FAKE_GAMEPASSES[v116] == true;
    end;
end;
v13.KnitInit = function(_) --[[ Line: 405 ]] --[[ Name: KnitInit ]]
    -- upvalues: v12 (ref), v3 (copy)
    v12 = v3.GetService("PurchaseService");
end;
v13.KnitStart = function(v118) --[[ Line: 409 ]] --[[ Name: KnitStart ]]
    -- upvalues: l_MarketplaceService_0 (copy), v3 (copy)
    v118.promptingPurchase = false;
    v118.promptingGamepassPurchase = false;
    v118.promptingSubscriptionPurchase = false;
    l_MarketplaceService_0.PromptGamePassPurchaseFinished:Connect(function(v119) --[[ Line: 414 ]]
        -- upvalues: v3 (ref), v118 (copy)
        if v119 == v3.Player then
            v118.promptingGamepassPurchase = false;
            v118.promptingPurchase = false;
            v118.PurchasePromptClosed:Fire();
        end;
    end);
    l_MarketplaceService_0.PromptProductPurchaseFinished:Connect(function(v120, v121, v122) --[[ Line: 423 ]]
        -- upvalues: v3 (ref), v118 (copy)
        if v120 == v3.Player.UserId then
            v118.promptingProductPurchase = false;
            v118.promptingPurchase = false;
            v118.PurchasePromptClosed:Fire();
            v118.ProductPurchaseFinished:Fire(v121, v122);
        end;
    end);
    l_MarketplaceService_0.PromptSubscriptionPurchaseFinished:Connect(function(v123) --[[ Line: 433 ]]
        -- upvalues: v3 (ref), v118 (copy)
        if v123 == v3.Player then
            v118.promptingSubscriptionPurchase = false;
            v118.promptingPurchase = false;
            v118.PurchasePromptClosed:Fire();
        end;
    end);
end;
return v13;