local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v4 = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.Shops.RaidShop);
local _ = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v11 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v12 = require(l_ReplicatedStorage_0.Shared.Util.RandomUnitDisplay);
local v13 = require(v1.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v14 = require(v1.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v15 = require(l_ReplicatedStorage_0.RNGRolls);
local v16 = require(l_ReplicatedStorage_0.Shared.Data.DNDCratePacks);
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
return {
    primaryMenu = true, 
    blur = true, 
    _processingRequest = false, 
    ToggleAll = {}, 
    Init = function(v24, v25) --[[ Line: 50 ]] --[[ Name: Init ]]
        -- upvalues: v17 (ref), v1 (copy), v18 (ref), v19 (ref), v20 (ref), v21 (ref), v2 (copy)
        v17 = v1.GetController("EventController");
        v18 = v1.GetController("DataController");
        v19 = v1.GetController("UIController");
        v20 = v1.GetService("VendorService");
        v21 = v1.GetController("PurchaseController");
        v24.ui = v25;
        v24.main = v25.Main;
        v24.shopWindow = v24.main.ShopWindow;
        v24.bin = v24.shopWindow.Content.Bin;
        v24.template = v24.bin.Grid.Template;
        v24.template.Parent = nil;
        v24.shopFrame = v24.shopWindow.Products;
        v24.animatedModels = {};
        for _, v27 in v24.shopWindow.Content.ViewportFrame.WorldModel:GetChildren() do
            if v27:IsA("Model") then
                table.insert(v24.animatedModels, v27);
            end;
        end;
        v24.currencyFrame = v24.shopWindow.Content.Header.Currencies.Inner;
        v24.exitBtn = v24.shopWindow.Exit;
        v24.dumpster = v2.new();
    end, 
    Start = function(v28, _) --[[ Line: 81 ]] --[[ Name: Start ]]
        -- upvalues: v23 (ref), v19 (ref), v22 (ref), v18 (ref), v1 (copy), v11 (copy), v17 (ref), v6 (copy), v14 (copy), v10 (copy), v9 (copy), v12 (copy), v8 (copy), v20 (ref), v4 (copy)
        v23 = v19:GetModuleAsync("NumberPrompt"):expect();
        v22 = v19:GetModuleAsync("Notification"):expect();
        v28.myCurrency = 0;
        v28.myCurrencyScales = 0;
        v18:OnChanged(v1.Player, "Currency.GoldenSpatula", function(v30) --[[ Line: 89 ]]
            -- upvalues: v28 (copy), v11 (ref)
            v28.myCurrency = v30 or 0;
            v28.currencyFrame.GoldenSpatulas.Content.Amount.Text = v11:CommaNumber(v30 or 0);
        end, true);
        v19:HandleButton(v28.exitBtn, function() --[[ Line: 94 ]]
            -- upvalues: v19 (ref)
            v19:Toggle(script.Name, false);
        end);
        v17.EventEnded:Connect(function() --[[ Line: 98 ]]

        end);
        for v31, v32 in v6 do
            if not v32.dontShow and (not v32.event or v17:IsActive()) then
                local v33 = v28.template:Clone();
                v33.Name = "Item-" .. v31;
                v33.Visible = true;
                v33.LayoutOrder = v31;
                if v32.event then
                    v33:AddTag("TemporaryEventObject");
                end;
                local v34 = v32.displayName or v32.name or v32.type;
                local v35 = v32.name or v32.type;
                if v32.type == "Unit" then
                    v14.new(v33.Main.Tooltip, {
                        Name = v35, 
                        IsUnit = v32.type == "Unit"
                    });
                    v35 = v10:GetUnitValue(v35, "FullName") or v35;
                else
                    v14.new(v33.Main.Tooltip, {
                        Name = v35
                    });
                end;
                v34 = string.gsub(v34, "{amount}", v32.amount);
                v34 = string.gsub(v34, "{name}", v35);
                v33.Main.Title.Text = v34;
                v33.Main.Buy.Content.Currency.Image = v9.Currency[v32.cost.currency] or "";
                v33.Main.Buy.Content.Amount.Text = v11:CommaNumber(v32.cost.amount or 0);
                for _, v37 in v33.Main.Status:GetChildren() do
                    if v37:IsA("ImageLabel") or v37:IsA("Frame") then
                        v37.Visible = false;
                    end;
                end;
                if v32.extraData then
                    v33.Main.Status.Shiny.Visible = v32.extraData.Shiny or false;
                    v33.Main.Status.Wumbo.Visible = v32.extraData.Wumbo or false;
                    v33.Main.Status.Stars.Visible = v32.extraData.Stars ~= nil;
                end;
                v33.Main.Mystery.Visible = v32.type == "RandomUnit";
                if v32.type == "RandomUnit" then
                    v12(v33.Main.Icon, v32.poolName, v32.rarity);
                elseif v32.type == "Unit" then
                    v8:SetImage(v33.Main.Icon, v32.name);
                else
                    v33.Main.Icon.Image = v11:GetIconFromRewardData(v32) or "";
                end;
                v33.Parent = v28.bin.Grid;
                do
                    local l_v34_0 = v34;
                    v19:HandleButton(v33.Main.Buy, function() --[[ Line: 171 ]]
                        -- upvalues: v28 (copy), v32 (copy), v22 (ref), v20 (ref), v31 (copy), l_v34_0 (ref)
                        if v28._processingRequest then
                            return;
                        elseif v28.myCurrency < v32.cost.amount then
                            v22:Notify({
                                message = ("You do not have enough %* to purchase this!"):format(v32.cost.currency == "DragonScales" and "Dragon Scales" or "Golden Spatulas"), 
                                duration = 3.5, 
                                isPositive = false
                            });
                            return;
                        else
                            v28._processingRequest = true;
                            v20:Purchase(script.Name, v31):andThen(function(v39) --[[ Line: 189 ]]
                                -- upvalues: v22 (ref), l_v34_0 (ref)
                                if not v39 then
                                    v22:Notify({
                                        message = "Something went wrong", 
                                        duration = 3.5, 
                                        isPositive = false
                                    });
                                    return;
                                else
                                    v22:Notify({
                                        message = ("Successfully purchased %*!"):format(l_v34_0), 
                                        duration = 3.5, 
                                        isPositive = true
                                    });
                                    return;
                                end;
                            end):finally(function() --[[ Line: 204 ]]
                                -- upvalues: v28 (ref)
                                v28._processingRequest = false;
                            end);
                            return;
                        end;
                    end);
                end;
            end;
        end;
        v28:_setupDragonCapsulePack((v4.Await(v28.shopWindow, "Products/ProgressiveChest/Main")));
        v28:_setupShop();
    end, 
    Opening = function(v40) --[[ Line: 216 ]] --[[ Name: Opening ]]
        -- upvalues: v13 (copy)
        for _, v42 in v40.animatedModels do
            local v43 = v42:GetAttribute("Animation") or v42.Name;
            local v44 = v13.new(v43, v42, "Friendlies");
            v44:Play("Idle");
            v40.dumpster:Add(v44);
        end;
        for _, v46 in v40.bin.CrateOffer.Main.Unit:GetChildren() do
            if v46:IsA("Frame") then
                v46.Backdrop:AddTag("VisualizeRarity");
                v46.Glow:AddTag("VisualizeRarity");
            end;
        end;
    end, 
    Closed = function(v47) --[[ Line: 234 ]] --[[ Name: Closed ]]
        -- upvalues: v19 (ref)
        v47.bin.CanvasPosition = Vector2.zero;
        for _, v49 in v47.bin.CrateOffer.Main.Unit:GetChildren() do
            if v49:IsA("Frame") then
                v49.Backdrop:RemoveTag("VisualizeRarity");
                v49.Glow:RemoveTag("VisualizeRarity");
            end;
        end;
        if v47.openedFrom then
            v19:Toggle(v47.openedFrom, true);
            v47.openedFrom = nil;
        end;
    end, 
    OpenFrom = function(v50, v51) --[[ Line: 254 ]] --[[ Name: OpenFrom ]]
        -- upvalues: v19 (ref)
        v19:Toggle(script.Name, true);
        v50.openedFrom = v51;
    end, 
    _setupShop = function(v52) --[[ Line: 260 ]] --[[ Name: _setupShop ]]
        -- upvalues: v21 (ref), v1 (copy), v18 (ref), v19 (ref), v15 (copy), v8 (copy), v10 (copy), v14 (copy)
        local function v62(v53) --[[ Line: 261 ]] --[[ Name: buttonAdded ]]
            -- upvalues: v21 (ref), v1 (ref), v18 (ref), v19 (ref)
            if not v53:IsA("GuiButton") and v53.Name ~= "Buy" then
                return;
            elseif v53:GetAttribute("ExternallyProcessed") then
                return;
            else
                local l_v53_Attribute_0 = v53:GetAttribute("PurchaseType");
                local l_v53_Attribute_1 = v53:GetAttribute("PurchaseName");
                local l_v53_Attribute_2 = v53:GetAttribute("OwnedDataKey");
                if not l_v53_Attribute_0 or not l_v53_Attribute_1 then
                    warn("no type or name", l_v53_Attribute_0, l_v53_Attribute_1);
                    return;
                else
                    local l_Product_0 = Enum.InfoType.Product;
                    local v58 = false;
                    if l_v53_Attribute_0 == "Gamepasses" then
                        l_Product_0 = Enum.InfoType.GamePass;
                        v53.Owned.Visible = false;
                        v53.Content.Visible = true;
                        v21:ListenToGamepassOwned(v1.Player, l_v53_Attribute_1, function(v59) --[[ Line: 287 ]]
                            -- upvalues: v53 (copy), v58 (ref)
                            v53.Owned.Visible = v59;
                            v53.Content.Visible = not v59;
                            v58 = v59;
                        end, true);
                    elseif l_v53_Attribute_0 == "DevProducts" and l_v53_Attribute_2 ~= nil then
                        v18:OnChanged(v1.Player, l_v53_Attribute_2, function(v60) --[[ Line: 293 ]]
                            -- upvalues: v53 (copy), v58 (ref)
                            v53.Owned.Visible = v60;
                            v53.Content.Visible = not v60;
                            v58 = v60;
                        end, true);
                    end;
                    v19:HandleButton(v53, function() --[[ Line: 300 ]]
                        -- upvalues: v58 (ref), l_v53_Attribute_0 (copy), v21 (ref), l_v53_Attribute_1 (copy)
                        if v58 then
                            return;
                        elseif l_v53_Attribute_0 == "DevProducts" then
                            v21:PromptProductPurchase(l_v53_Attribute_1);
                            return;
                        else
                            v21:PromptGamepassPurchase(l_v53_Attribute_1);
                            return;
                        end;
                    end);
                    v21:PromiseProductInfo(l_v53_Attribute_1, l_Product_0):andThen(function(v61) --[[ Line: 313 ]]
                        -- upvalues: v53 (copy)
                        if not v61 then
                            return;
                        elseif not v61.PriceInRobux then
                            return;
                        else
                            v53.Content.Amount.Text = v61.PriceInRobux;
                            return;
                        end;
                    end);
                    return;
                end;
            end;
        end;
        for _, v64 in v52.shopFrame:GetDescendants() do
            task.spawn(v62, v64);
        end;
        v52.shopFrame.DescendantAdded:Connect(v62);
        local l_v15_RarityPool_0 = v15:GetRarityPool("DragonEgg");
        local l_v15_LootPool_0 = v15:GetLootPool("DragonEgg");
        local v67 = {};
        for v68, v69 in l_v15_RarityPool_0 do
            table.insert(v67, {
                rarity = v68, 
                weight = v69.weight
            });
        end;
        table.sort(v67, function(v70, v71) --[[ Line: 345 ]]
            return v70.weight > v71.weight;
        end);
        local v72 = 1;
        local l_CrateOffer_0 = v52.bin.CrateOffer;
        for _, v75 in v67 do
            for _, v77 in l_v15_LootPool_0[v75.rarity] do
                local l_FirstChild_0 = l_CrateOffer_0.Main.Unit:FindFirstChild((tostring(v72)));
                if l_FirstChild_0 then
                    v8:SetImage(l_FirstChild_0.Inner.Icon, v77.Name or v77.name);
                    l_FirstChild_0.Inner.Chance.Text = ("%*%%"):format(v77.weight or 0);
                    l_FirstChild_0.Inner.Icon.ImageColor3 = v75.rarity == "Secret" and Color3.new(0, 0, 0) or Color3.new(1, 1, 1);
                    local v79 = select(2, v10:GetRarity(v77.Name or v77.name));
                    l_FirstChild_0.Backdrop:SetAttribute("Rarity", v79);
                    l_FirstChild_0.Glow:SetAttribute("Rarity", v79);
                    v14.new(l_FirstChild_0, {
                        Name = v77.Name or v77.name, 
                        IsUnit = true, 
                        IsSecretUnit = function() --[[ Line: 372 ]] --[[ Name: IsSecretUnit ]]
                            -- upvalues: v75 (copy)
                            return v75.rarity == "Secret";
                        end
                    });
                    v72 = v72 + 1;
                end;
            end;
        end;
        local v80 = v15:GetVariantPool("DragonEgg") or {};
        for v81, v82 in v80 do
            local l_weight_0 = v82.weight;
            if l_weight_0 then
                local l_FirstChild_1 = l_CrateOffer_0.Main.Chances:FindFirstChild((("%*Chance"):format(v81)));
                if l_FirstChild_1 then
                    l_FirstChild_1.Amount.Text = ("%*%%"):format(l_weight_0);
                end;
            end;
        end;
    end, 
    _setupDragonCapsulePack = function(_, v86) --[[ Line: 400 ]] --[[ Name: _setupDragonCapsulePack ]]
        -- upvalues: v16 (copy), v18 (ref), v1 (copy)
        v86.Visible = false;
    end, 
    _handlePurchaseButton = function(_, v88, v89, v90) --[[ Line: 469 ]] --[[ Name: _handlePurchaseButton ]]
        -- upvalues: v2 (copy), v21 (ref), v1 (copy), v18 (ref), v19 (ref)
        local l_v88_Attribute_0 = v88:GetAttribute("PurchaseName");
        local l_v88_Attribute_1 = v88:GetAttribute("PurchaseType");
        local l_v88_Attribute_2 = v88:GetAttribute("OwnedDataKey");
        local l_v88_Attribute_3 = v88:GetAttribute("OwnedItemKey");
        if not l_v88_Attribute_0 or not l_v88_Attribute_1 then
            return;
        else
            v88:SetAttribute("ExternallyProcessed", true);
            local l_Product_1 = Enum.InfoType.Product;
            local v96 = false;
            local v97 = v2.new();
            local function v104() --[[ Line: 486 ]] --[[ Name: update ]]
                -- upvalues: l_v88_Attribute_0 (ref), v88 (copy), l_v88_Attribute_1 (ref), l_v88_Attribute_2 (ref), l_v88_Attribute_3 (ref), v96 (ref), v97 (copy), l_Product_1 (ref), v21 (ref), v1 (ref), v18 (ref), v90 (copy)
                l_v88_Attribute_0 = v88:GetAttribute("PurchaseName");
                l_v88_Attribute_1 = v88:GetAttribute("PurchaseType");
                l_v88_Attribute_2 = v88:GetAttribute("OwnedDataKey");
                l_v88_Attribute_3 = v88:GetAttribute("OwnedItemKey");
                v96 = false;
                if not l_v88_Attribute_0 or not l_v88_Attribute_1 then
                    return;
                else
                    v97:Destroy();
                    if l_v88_Attribute_1 ~= "DevProducts" then
                        l_Product_1 = Enum.InfoType.GamePass;
                        v88.Owned.Visible = v96;
                        v21:ListenToGamepassOwned(v1.Player, l_v88_Attribute_0, function(v98) --[[ Line: 503 ]]
                            -- upvalues: v88 (ref), v96 (ref)
                            v88.Owned.Visible = v98;
                            v88.Content.Visible = not v98;
                            v96 = v98;
                        end, true);
                    elseif l_v88_Attribute_1 == "DevProducts" then
                        if l_v88_Attribute_2 ~= nil then
                            v18:OnChanged(v1.Player, l_v88_Attribute_2, function(v99) --[[ Line: 510 ]]
                                -- upvalues: v88 (ref), v96 (ref)
                                v88.Owned.Visible = v99;
                                v88.Content.Visible = not v99;
                                v96 = v99;
                            end, true);
                        end;
                        if l_v88_Attribute_3 ~= nil then
                            v18:OnChanged(v1.Player, "Inventory", function(v100) --[[ Line: 518 ]]
                                -- upvalues: l_v88_Attribute_3 (ref), v88 (ref), v96 (ref)
                                local v101 = v100[l_v88_Attribute_3] ~= nil;
                                v88.Owned.Visible = v101;
                                v88.Content.Visible = not v101;
                                v96 = v101;
                            end, true);
                        end;
                    end;
                    if v88.Content:FindFirstChild("Amount") then
                        v97:Add(v21:PromiseProductInfo(l_v88_Attribute_0, l_Product_1):andThen(function(v102) --[[ Line: 528 ]]
                            -- upvalues: v88 (ref), v90 (ref)
                            local l_Amount_0 = v88.Content.Amount;
                            if not l_Amount_0:IsA("TextLabel") then
                                l_Amount_0 = l_Amount_0:FindFirstChild("Amount");
                            end;
                            l_Amount_0.Text = v102.PriceInRobux or "???";
                            if v90 and typeof(v90) == "function" then
                                task.spawn(v90, v102.PriceInRobux);
                            end;
                        end));
                    end;
                    return;
                end;
            end;
            v104();
            v88:GetAttributeChangedSignal("PurchaseName"):Connect(v104);
            v88:GetAttributeChangedSignal("PurchaseType"):Connect(v104);
            v88:GetAttributeChangedSignal("OwnedDataKey"):Connect(v104);
            v88:GetAttributeChangedSignal("OwnedItemKey"):Connect(v104);
            v19:HandleButton(v88, function() --[[ Line: 551 ]]
                -- upvalues: v96 (ref), v89 (copy), v88 (copy), l_v88_Attribute_1 (ref), v21 (ref), l_v88_Attribute_0 (ref)
                if v96 then
                    return;
                elseif v89 ~= nil and not v89(v88) then
                    return;
                elseif l_v88_Attribute_1 == "DevProducts" then
                    v21:PromptProductPurchase(l_v88_Attribute_0);
                    return;
                else
                    v21:PromptGamepassPurchase(l_v88_Attribute_0);
                    return;
                end;
            end);
            return;
        end;
    end
};