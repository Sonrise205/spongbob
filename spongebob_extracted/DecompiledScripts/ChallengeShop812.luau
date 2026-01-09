local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Shops.ChallengeShop);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v12 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v13 = require(l_ReplicatedStorage_0.Shared.Util.RandomUnitDisplay);
local v14 = require(v3.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v15 = require(v3.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v16 = require(l_ReplicatedStorage_0.RNGRolls);
local v17 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v18 = require(l_ReplicatedStorage_0.Shared.Data.ChallengerCratePack);
local v19 = require(l_ReplicatedStorage_0.Shared.Data.EventVariables);
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = {
    "ChallengeToken"
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
        v31.gridBin = v31.bin.Grid;
        v31.template = v31.gridBin.Template;
        v31.template.Parent = nil;
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
    Start = function(v35, _) --[[ Line: 95 ]] --[[ Name: Start ]]
        -- upvalues: v24 (ref), v21 (ref), v27 (ref), v28 (copy), v25 (ref), v4 (copy), v20 (ref), v3 (copy), v12 (copy), v7 (copy), v11 (copy), v10 (copy), v13 (copy), v9 (copy), v15 (copy), v22 (ref)
        v24 = v21:GetModuleAsync("NumberPrompt"):expect();
        v27 = v21:GetModuleAsync("Notification"):expect();
        v35.currencyAmounts = {};
        for _, v38 in v28 do
            local l_FirstChild_0 = v35.currencyFrames:FindFirstChild(v38);
            if l_FirstChild_0 then
                if v38 == "SandDollar" and not v25:IsActive() then
                    l_FirstChild_0.Visible = false;
                else
                    local v40 = v4.new();
                    v40:AttachTo(l_FirstChild_0);
                    v40:Add(v20:OnChanged(v3.Player, ("Currency.%*"):format(v38), function(v41) --[[ Line: 117 ]]
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
        end;
        v21:HandleButton(v35.exitBtn, function() --[[ Line: 127 ]]
            -- upvalues: v21 (ref)
            v21:Toggle(script.Name, false);
        end);
        for v42, v43 in v7 do
            if not v43.dontShow and (not v43.event or v25:IsActive()) then
                local v44 = v35.template:Clone();
                v44.Name = "Item-" .. v42;
                v44.Visible = true;
                v44.LayoutOrder = v42;
                if v43.event then
                    v44:AddTag("TemporaryEventObject");
                end;
                local v45 = v43.displayName or v43.name or v43.type;
                local v46 = v43.name or v43.type;
                if v43.type == "Unit" then
                    v46 = v11:GetUnitValue(v46, "FullName") or v46;
                end;
                v45 = string.gsub(v45, "{amount}", v43.amount);
                v45 = string.gsub(v45, "{name}", v46);
                v44.Main.Title.Text = v45;
                v44.Main.Buy.Content.Currency.Image = v10.Currency[v43.cost.currency] or "";
                v44.Main.Buy.Content.Amount.Text = v12:CommaNumber(v43.cost.amount or 0);
                for _, v48 in v44.Main.Status:GetChildren() do
                    if v48:IsA("ImageLabel") or v48:IsA("Frame") then
                        v48.Visible = false;
                    end;
                end;
                if v43.extraData then
                    v44.Main.Status.Shiny.Visible = v43.extraData.Shiny or false;
                    v44.Main.Status.Wumbo.Visible = v43.extraData.Wumbo or false;
                    v44.Main.Status.Stars.Visible = v43.extraData.Stars ~= nil;
                end;
                v44.Main.Mystery.Visible = v43.type == "RandomUnit";
                if v43.type == "RandomUnit" then
                    v13(v44.Main.Icon, v43.poolName, v43.rarity);
                elseif v43.type == "Unit" then
                    v9:SetImage(v44.Main.Icon, v43.name);
                else
                    v44.Main.Icon.Image = v12:GetIconFromRewardData(v43) or "";
                end;
                v15.new(v44.Main.Tooltip, {
                    Name = v46
                });
                v44.Parent = v35.gridBin;
                do
                    local l_v45_0 = v45;
                    v21:HandleButton(v44.Main.Buy, function() --[[ Line: 193 ]]
                        -- upvalues: v35 (copy), v43 (copy), v27 (ref), v22 (ref), v42 (copy), l_v45_0 (ref)
                        if v35._processingRequest then
                            return;
                        elseif v35.currencyAmounts[v43.cost.currency] < v43.cost.amount then
                            v27:Notify({
                                message = "You do not have enough Challenge Tokens to purchase this!", 
                                duration = 3.5, 
                                isPositive = false
                            });
                            return;
                        else
                            v35._processingRequest = true;
                            v22:Purchase(script.Name, v42):andThen(function(v50) --[[ Line: 211 ]]
                                -- upvalues: v27 (ref), l_v45_0 (ref)
                                if not v50 then
                                    v27:Notify({
                                        message = "Something went wrong", 
                                        duration = 3.5, 
                                        isPositive = false
                                    });
                                    return;
                                else
                                    v27:Notify({
                                        message = ("Successfully purchased %*!"):format(l_v45_0), 
                                        duration = 3.5, 
                                        isPositive = true
                                    });
                                    return;
                                end;
                            end):finally(function() --[[ Line: 228 ]]
                                -- upvalues: v35 (ref)
                                v35._processingRequest = false;
                            end);
                            return;
                        end;
                    end);
                end;
            end;
        end;
        v35:_setupCrateOffer(v35.bin.CrateOffer, "ChallengeGift");
        v35:_setupCrateOffer(v35.bin.CrateOffer2, "ChallengeCrate2");
        v35.scoopCapsule = v35.bin:FindFirstChild("ScoopCapsule");
        if v35.scoopCapsule then
            v35:_setupCrateOffer(v35.scoopCapsule, "ScoopCapsule");
        end;
        v35:_setupShop();
    end, 
    Opening = function(v51) --[[ Line: 246 ]] --[[ Name: Opening ]]
        -- upvalues: v14 (copy)
        for _, v53 in v51.animatedModels do
            local v54 = v53:GetAttribute("Animation") or v53.Name;
            local v55 = v14.new(v54, v53, "Friendlies");
            v55:Play("Idle");
            v51.dumpster:Add(v55);
        end;
        for _, v57 in v51.bin.CrateOffer.Main.Unit:GetChildren() do
            if v57:IsA("Frame") then
                v57.Backdrop:AddTag("VisualizeRarity");
                v57.Glow:AddTag("VisualizeRarity");
            end;
        end;
        for _, v59 in v51.bin.CrateOffer2.Main.Unit:GetChildren() do
            if v59:IsA("Frame") then
                v59.Backdrop:AddTag("VisualizeRarity");
                v59.Glow:AddTag("VisualizeRarity");
            end;
        end;
        if v51.scoopCapsule and v51.scoopCapsule.Parent then
            for _, v61 in v51.scoopCapsule.Main.Unit:GetChildren() do
                if v61:IsA("Frame") and v61.Backdrop:GetAttribute("Rarity") then
                    v61.Backdrop:AddTag("VisualizeRarity");
                    v61.Glow:AddTag("VisualizeRarity");
                end;
            end;
        end;
    end, 
    Closed = function(v62) --[[ Line: 288 ]] --[[ Name: Closed ]]
        -- upvalues: v21 (ref)
        v62.bin.CanvasPosition = Vector2.zero;
        for _, v64 in v62.bin.CrateOffer.Main.Unit:GetChildren() do
            if v64:IsA("Frame") then
                v64.Backdrop:RemoveTag("VisualizeRarity");
                v64.Glow:RemoveTag("VisualizeRarity");
            end;
        end;
        for _, v66 in v62.bin.CrateOffer2.Main.Unit:GetChildren() do
            if v66:IsA("Frame") then
                v66.Backdrop:RemoveTag("VisualizeRarity");
                v66.Glow:RemoveTag("VisualizeRarity");
            end;
        end;
        if v62.scoopCapsule and v62.scoopCapsule.Parent then
            for _, v68 in v62.scoopCapsule.Main.Unit:GetChildren() do
                if v68:IsA("Frame") then
                    v68.Backdrop:RemoveTag("VisualizeRarity");
                    v68.Glow:RemoveTag("VisualizeRarity");
                end;
            end;
        end;
        if v62.openedFrom then
            v21:Toggle(v62.openedFrom, true);
            v62.openedFrom = nil;
        end;
    end, 
    _setupShop = function(v69) --[[ Line: 328 ]] --[[ Name: _setupShop ]]
        -- upvalues: v19 (copy), v23 (ref), v3 (copy), v20 (ref), v21 (ref), v26 (ref), v27 (ref)
        local v70 = {
            "Buy", 
            "Gift"
        };
        local function v86(v71) --[[ Line: 331 ]] --[[ Name: descAdded ]]
            -- upvalues: v70 (copy), v19 (ref), v23 (ref), v3 (ref), v20 (ref), v21 (ref), v69 (copy), v26 (ref), v27 (ref)
            if not v71:IsA("GuiButton") and not table.find(v70, v71.Name) then
                return;
            else
                local l_v71_Attribute_0 = v71:GetAttribute("PurchaseType");
                local l_v71_Attribute_1 = v71:GetAttribute("PurchaseName");
                local l_v71_Attribute_2 = v71:GetAttribute("PurchaseId");
                local l_v71_Attribute_3 = v71:GetAttribute("OwnedDataKey");
                local v76 = l_v71_Attribute_2 and v19.Shop[l_v71_Attribute_2];
                if not l_v71_Attribute_0 or not l_v71_Attribute_1 and not l_v71_Attribute_2 then
                    warn("No PurchaseType, PurchaseName, or PurchaseId found:", l_v71_Attribute_0, l_v71_Attribute_1, l_v71_Attribute_2);
                    return;
                else
                    local l_Owned_0 = v71:FindFirstChild("Owned");
                    local l_Amount_0 = v71.Content:FindFirstChild("Amount");
                    local l_Product_0 = Enum.InfoType.Product;
                    local v80 = false;
                    if l_v71_Attribute_0 == "Gamepasses" then
                        l_Product_0 = Enum.InfoType.GamePass;
                        if l_Owned_0 then
                            l_Owned_0.Visible = false;
                        end;
                        v71.Content.Visible = true;
                        v23:ListenToGamepassOwned(v3.Player, l_v71_Attribute_1, function(v81) --[[ Line: 363 ]]
                            -- upvalues: l_Owned_0 (copy), v71 (copy), v80 (ref)
                            if l_Owned_0 then
                                l_Owned_0.Visible = v81;
                            end;
                            v71.Content.Visible = not v81;
                            v80 = v81;
                        end, true);
                    elseif l_v71_Attribute_0 == "DevProducts" and l_v71_Attribute_3 ~= nil then
                        v20:OnChanged(v3.Player, l_v71_Attribute_3, function(v82) --[[ Line: 372 ]]
                            -- upvalues: l_Owned_0 (copy), v71 (copy), v80 (ref)
                            if l_Owned_0 then
                                l_Owned_0.Visible = v82;
                            end;
                            v71.Content.Visible = not v82;
                            v80 = v82;
                        end, true);
                    elseif l_v71_Attribute_0 == "Event" and v76 then
                        l_Amount_0.Text = v76.cost.amount;
                    end;
                    v21:HandleButton(v71, function() --[[ Line: 384 ]]
                        -- upvalues: v80 (ref), v69 (ref), l_v71_Attribute_0 (copy), v23 (ref), l_v71_Attribute_1 (copy), v26 (ref), l_v71_Attribute_2 (copy), v27 (ref)
                        if v80 then
                            return;
                        elseif v69._processingRequest then
                            return;
                        elseif l_v71_Attribute_0 == "DevProducts" then
                            v23:PromptProductPurchase(l_v71_Attribute_1);
                            return;
                        elseif l_v71_Attribute_0 == "Event" then
                            v69._processingRequest = true;
                            v26:PurchaseShopItem(l_v71_Attribute_2, 1):andThen(function(v83, v84) --[[ Line: 401 ]]
                                -- upvalues: v27 (ref)
                                if not v84 then
                                    return;
                                else
                                    v27:Notify({
                                        text = v84, 
                                        duration = 3, 
                                        isPositive = v83
                                    });
                                    return;
                                end;
                            end):finally(function() --[[ Line: 412 ]]
                                -- upvalues: v69 (ref)
                                v69._processingRequest = false;
                            end);
                            return;
                        else
                            v23:PromptGamepassPurchase(l_v71_Attribute_1);
                            return;
                        end;
                    end);
                    if not l_Amount_0 or l_v71_Attribute_0 ~= "Gamepasses" and l_v71_Attribute_0 ~= "DevProducts" then
                        return;
                    else
                        v23:PromiseProductInfo(l_v71_Attribute_1, l_Product_0):andThen(function(v85) --[[ Line: 426 ]]
                            -- upvalues: l_Amount_0 (copy)
                            l_Amount_0.Text = v85 and v85.PriceInRobux or 0;
                        end);
                        return;
                    end;
                end;
            end;
        end;
        for _, v88 in v69.shopFrame:GetDescendants() do
            task.spawn(v86, v88);
        end;
        v69.shopFrame.DescendantAdded:Connect(v86);
        v20:OnChanged(v3.Player, "PacksPurchased", function(v89) --[[ Line: 437 ]] --[[ Name: update ]]
            -- upvalues: v69 (copy)
            for _, v91 in v69.shopFrame:GetChildren() do
                if v91:IsA("Frame") then
                    v91.Visible = not (v89[v91.Name] or false);
                end;
            end;
        end, true);
    end, 
    _setupChallengerCratePack = function(v92) --[[ Line: 450 ]] --[[ Name: _setupChallengerCratePack ]]
        -- upvalues: v18 (copy), v20 (ref), v3 (copy), v12 (copy), v17 (copy)
        local l_Main_0 = v92.shopWindow.Products.ProgressiveChest.Main;
        local l_Header_0 = l_Main_0.Header;
        local l_Buy_0 = l_Main_0.Buy;
        local v96 = 1;
        local v97 = #v18;
        local v98 = 0;
        local v99 = false;
        v20:OnChanged(v3.Player, "ChallengeCratePack", function(v100) --[[ Line: 460 ]]
            -- upvalues: v96 (ref), v98 (ref), v97 (copy), v99 (ref), v18 (ref), l_Header_0 (copy), v12 (ref), l_Buy_0 (copy), v92 (copy)
            v96 = v100.Tier or 1;
            v98 = v100.StartTime + 86400 - workspace:GetServerTimeNow();
            local l_v96_0 = v96;
            if v97 < v96 then
                v99 = true;
                l_v96_0 = v97;
            else
                v99 = false;
            end;
            if v18[l_v96_0] and v18[l_v96_0].purchaseName then
                local v102 = v18[l_v96_0].reward.amount or 1;
                l_Header_0.Number.Text = v102;
                l_Header_0.Title.Text = v12:Pluralize("Crate", v102, false);
                l_Buy_0:SetAttribute("PurchaseName", v18[l_v96_0].purchaseName);
                l_Buy_0.Owned.Visible = false;
                l_Buy_0.Content.Visible = true;
            else
                l_Buy_0.Owned.Visible = true;
                l_Buy_0.Content.Visible = false;
            end;
            v92.shopWindow.Products.ProgressiveChest.Visible = not v99;
            if v99 then
                l_Buy_0.Owned.Visible = true;
                l_Buy_0.Content.Visible = false;
            end;
        end, true);
        v17.Simple(1, function() --[[ Line: 495 ]]
            -- upvalues: v98 (ref), v96 (ref), l_Main_0 (copy), v12 (ref)
            v98 = v98 - 1;
            if v96 < 1 then
                l_Main_0.Countdown.Visible = false;
                return;
            elseif v98 < 1 then
                l_Main_0.Countdown.Visible = false;
                return;
            else
                l_Main_0.Countdown.Text = ("Resets In: %*"):format((v12:FormatTimeFromSeconds(v98)));
                l_Main_0.Countdown.Visible = true;
                return;
            end;
        end);
        v92:_handlePurchaseButton(l_Buy_0, function() --[[ Line: 512 ]]
            -- upvalues: v99 (ref)
            return not v99;
        end);
    end, 
    _handlePurchaseButton = function(_, v104, v105) --[[ Line: 517 ]] --[[ Name: _handlePurchaseButton ]]
        -- upvalues: v23 (ref), v3 (copy), v20 (ref), v21 (ref)
        local l_v104_Attribute_0 = v104:GetAttribute("PurchaseName");
        local l_v104_Attribute_1 = v104:GetAttribute("PurchaseType");
        local l_v104_Attribute_2 = v104:GetAttribute("OwnedDataKey");
        local l_v104_Attribute_3 = v104:GetAttribute("OwnedItemKey");
        if not l_v104_Attribute_0 or not l_v104_Attribute_1 then
            return;
        else
            local l_Product_1 = Enum.InfoType.Product;
            local v111 = false;
            local function v118() --[[ Line: 530 ]] --[[ Name: update ]]
                -- upvalues: l_v104_Attribute_0 (ref), v104 (copy), l_v104_Attribute_1 (ref), l_v104_Attribute_2 (ref), l_v104_Attribute_3 (ref), v111 (ref), l_Product_1 (ref), v23 (ref), v3 (ref), v20 (ref)
                l_v104_Attribute_0 = v104:GetAttribute("PurchaseName");
                l_v104_Attribute_1 = v104:GetAttribute("PurchaseType");
                l_v104_Attribute_2 = v104:GetAttribute("OwnedDataKey");
                l_v104_Attribute_3 = v104:GetAttribute("OwnedItemKey");
                v111 = false;
                if not l_v104_Attribute_0 or not l_v104_Attribute_1 then
                    return;
                else
                    if l_v104_Attribute_1 ~= "DevProducts" then
                        l_Product_1 = Enum.InfoType.GamePass;
                        v104.Owned.Visible = v111;
                        v23:ListenToGamepassOwned(v3.Player, l_v104_Attribute_0, function(v112) --[[ Line: 545 ]]
                            -- upvalues: v104 (ref), v111 (ref)
                            v104.Owned.Visible = v112;
                            v104.Content.Visible = not v112;
                            v111 = v112;
                        end, true);
                    elseif l_v104_Attribute_1 == "DevProducts" then
                        if l_v104_Attribute_2 ~= nil then
                            v20:OnChanged(v3.Player, l_v104_Attribute_2, function(v113) --[[ Line: 552 ]]
                                -- upvalues: v104 (ref), v111 (ref)
                                v104.Owned.Visible = v113;
                                v104.Content.Visible = not v113;
                                v111 = v113;
                            end, true);
                        end;
                        if l_v104_Attribute_3 ~= nil then
                            v20:OnChanged(v3.Player, "Inventory", function(v114) --[[ Line: 560 ]]
                                -- upvalues: l_v104_Attribute_3 (ref), v104 (ref), v111 (ref)
                                local v115 = v114[l_v104_Attribute_3] ~= nil;
                                v104.Owned.Visible = v115;
                                v104.Content.Visible = not v115;
                                v111 = v115;
                            end, true);
                        end;
                    end;
                    if v104.Content:FindFirstChild("Amount") then
                        v23:PromiseProductInfo(l_v104_Attribute_0, l_Product_1):andThen(function(v116) --[[ Line: 570 ]]
                            -- upvalues: v104 (ref)
                            local l_Amount_1 = v104.Content.Amount;
                            if not l_Amount_1:IsA("TextLabel") then
                                l_Amount_1 = l_Amount_1:FindFirstChild("Amount");
                            end;
                            l_Amount_1.Text = v116.PriceInRobux or "???";
                        end);
                    end;
                    return;
                end;
            end;
            v118();
            v104:GetAttributeChangedSignal("PurchaseName"):Connect(v118);
            v104:GetAttributeChangedSignal("PurchaseType"):Connect(v118);
            v104:GetAttributeChangedSignal("OwnedDataKey"):Connect(v118);
            v104:GetAttributeChangedSignal("OwnedItemKey"):Connect(v118);
            v21:HandleButton(v104, function() --[[ Line: 589 ]]
                -- upvalues: v111 (ref), v105 (copy), v104 (copy), l_v104_Attribute_1 (ref), v23 (ref), l_v104_Attribute_0 (ref)
                if v111 then
                    return;
                elseif v105 ~= nil and not v105(v104) then
                    return;
                elseif l_v104_Attribute_1 == "DevProducts" then
                    v23:PromptProductPurchase(l_v104_Attribute_0);
                    return;
                else
                    v23:PromptGamepassPurchase(l_v104_Attribute_0);
                    return;
                end;
            end);
            return;
        end;
    end, 
    _setupCrateOffer = function(v119, v120, v121) --[[ Line: 606 ]] --[[ Name: _setupCrateOffer ]]
        -- upvalues: v16 (copy), v9 (copy), v11 (copy), v15 (copy), v5 (copy), v7 (copy), v21 (ref), v8 (copy), v27 (ref), v22 (ref), v12 (copy), v24 (ref)
        if not v120 or not v121 then
            return;
        else
            local l_v16_RarityPool_0 = v16:GetRarityPool(v121);
            local l_v16_LootPool_0 = v16:GetLootPool(v121);
            local v124 = {};
            for v125, v126 in l_v16_RarityPool_0 do
                table.insert(v124, {
                    rarity = v125, 
                    weight = v126.weight
                });
            end;
            table.sort(v124, function(v127, v128) --[[ Line: 626 ]]
                return v127.weight > v128.weight;
            end);
            local v129 = 1;
            for _, v131 in v120.Main.Unit:GetChildren() do
                if v131:IsA("Frame") then
                    v131.Visible = false;
                end;
            end;
            for _, v133 in v124 do
                for _, v135 in l_v16_LootPool_0[v133.rarity] do
                    local l_FirstChild_1 = v120.Main.Unit:FindFirstChild((tostring(v129)));
                    if l_FirstChild_1 then
                        v9:SetImage(l_FirstChild_1.Inner.Icon, v135.Name or v135.name);
                        l_FirstChild_1.Inner.Chance.Text = ("%*%%"):format(v135.weight or 0);
                        l_FirstChild_1.Inner.Icon.ImageColor3 = v133.rarity == "Secret" and Color3.new(0, 0, 0) or Color3.new(1, 1, 1);
                        local v137 = select(2, v11:GetRarity(v135.Name or v135.name));
                        l_FirstChild_1.Backdrop:SetAttribute("Rarity", v137);
                        l_FirstChild_1.Glow:SetAttribute("Rarity", v137);
                        v15.new(l_FirstChild_1, {
                            Name = v135.Name or v135.name, 
                            IsUnit = true, 
                            IsSecretUnit = function() --[[ Line: 658 ]] --[[ Name: IsSecretUnit ]]
                                -- upvalues: v133 (copy)
                                return v133.rarity == "Secret";
                            end
                        });
                        l_FirstChild_1.Visible = true;
                        v129 = v129 + 1;
                    end;
                end;
            end;
            local v138 = v16:GetVariantPool(v121) or {};
            for v139, v140 in v138 do
                local l_weight_0 = v140.weight;
                if l_weight_0 then
                    local l_FirstChild_2 = v120.Main.Chances:FindFirstChild((("%*Chance"):format(v139)));
                    if l_FirstChild_2 then
                        l_FirstChild_2.Amount.Text = ("%*%%"):format(l_weight_0);
                    end;
                end;
            end;
            local v143;
            v138, v143 = v5.Find(v7, function(v144) --[[ Line: 687 ]]
                -- upvalues: v121 (copy)
                return v144.name == v121;
            end);
            if not v138 or not v143 then
                v120.Visible = false;
                return;
            else
                v120.Main.Buy.Content.Amount.Text = v138.cost.amount;
                v21:HandleButton(v120.Main.Buy, function() --[[ Line: 698 ]]
                    -- upvalues: v119 (copy), v138 (copy), v8 (ref), v27 (ref), v22 (ref), v143 (copy), v12 (ref), v24 (ref)
                    local v145 = v119.currencyAmounts[v138.cost.currency] or 0;
                    local l_amount_0 = v138.cost.amount;
                    local v147 = l_amount_0 <= v145;
                    local v148 = v145 // l_amount_0;
                    local l_currency_0 = v138.cost.currency;
                    local l_displayName_0 = v8.Currency[l_currency_0].displayName;
                    if v119._processingRequest then
                        return;
                    elseif v119.purchaseRequestProcessing or not v147 or v148 < 1 then
                        if not v147 or v148 < 1 then
                            v27:Notify({
                                text = ("You need %* more %* to purchase this!"):format(math.clamp(l_amount_0 - v145, 0, l_amount_0), l_displayName_0 or l_currency_0), 
                                duration = 3, 
                                isPositive = false
                            });
                        end;
                        return;
                    else
                        local function v154(v151) --[[ Line: 722 ]] --[[ Name: attemptPurchase ]]
                            -- upvalues: v119 (ref), v22 (ref), v143 (ref), v27 (ref), v12 (ref), v138 (ref)
                            v151 = v151 and tonumber(v151);
                            if not tonumber(v151) or v151 < 1 then
                                return;
                            else
                                v119._processingRequest = true;
                                v22:Purchase(script.Name, v143, v151):andThen(function(v152) --[[ Line: 732 ]]
                                    -- upvalues: v27 (ref), v12 (ref), v138 (ref), v151 (ref)
                                    if not v152 then
                                        v27:Notify({
                                            message = "Something went wrong", 
                                            duration = 3.5, 
                                            isPositive = false
                                        });
                                        return;
                                    else
                                        local v153 = v12:Pluralize(v138.crateDisplayName, v151 or 1);
                                        v27:Notify({
                                            message = ("Successfully purchased %*x %*!"):format(v151 or 1, v153), 
                                            duration = 3.5, 
                                            isPositive = true
                                        });
                                        return;
                                    end;
                                end):finally(function() --[[ Line: 751 ]]
                                    -- upvalues: v119 (ref)
                                    v119._processingRequest = false;
                                end);
                                return;
                            end;
                        end;
                        if v148 == 1 then
                            v154(1);
                            return;
                        else
                            v24:Prompt({
                                message = "How many would you like to purchase?", 
                                minAmount = 1, 
                                maxAmount = v148, 
                                maxMessage = ("You can buy a maximum of %%s %*."):format(v138.crateDisplayName), 
                                shopInfo = {
                                    baseCost = l_amount_0, 
                                    currencyName = v138.cost.currency
                                }, 
                                callback = v154
                            });
                            return;
                        end;
                    end;
                end);
                return;
            end;
        end;
    end
};