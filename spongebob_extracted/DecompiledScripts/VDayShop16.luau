local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Quests);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local _ = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v11 = require(l_ReplicatedStorage_0.Shared.Util.GetButtons);
local v12 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v14 = require(v3.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v15 = require(l_ReplicatedStorage_0.RNGRolls);
local v16 = require(v3.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = {};
return {
    primaryMenu = true, 
    purchaseRequestProcessing = false, 
    ToggleAll = {}, 
    Init = function(v24, v25) --[[ Line: 53 ]] --[[ Name: Init ]]
        -- upvalues: v17 (ref), v3 (copy), v18 (ref), v19 (ref), v20 (ref), v11 (copy)
        v17 = v3.GetController("DataController");
        v18 = v3.GetController("UIController");
        v19 = v3.GetService("ProgressionService");
        v20 = v3.GetController("PurchaseController");
        v24.ui = v25;
        v24.main = v25.Main.ShopWindow;
        v24.ogMainPosition = v24.main.Position;
        v24.presentOffer = v24.main.Content.Bin.PresentOffer;
        v24.purchaseBtn = v24.presentOffer.Main.Buy;
        v24.questsFrame = v24.main.Content.Bin.EventQuests.Main.Bin;
        v24.shopFrame = v24.main.Products;
        v24.timerBar = v24.main.TimerBar;
        v24.shopFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 72 ]]
            -- upvalues: v24 (copy)
            if not v24.shopFrame.Visible then
                v24.main.Position = UDim2.fromScale(0.5, v24.ogMainPosition.Y.Scale);
                return;
            else
                v24.main.Position = v24.ogMainPosition;
                return;
            end;
        end);
        v24._questButtons = v11(v24.questsFrame, nil, function(v26) --[[ Line: 82 ]]
            -- upvalues: v18 (ref), v24 (copy), v19 (ref)
            local l_Name_0 = v26.Name;
            local v28 = false;
            v18:HandleButton(v26.Content.Info.Claim, function() --[[ Line: 86 ]]
                -- upvalues: v28 (ref), v24 (ref), l_Name_0 (copy), v19 (ref)
                if v28 then
                    return;
                else
                    local v29 = v24.questsData and v24.questsData[l_Name_0];
                    if not v29 or not v29.Finished then
                        return;
                    elseif v29.Claimed then
                        return;
                    else
                        v28 = true;
                        v19:Claim("Quests", {
                            Category = "VDay", 
                            Name = l_Name_0
                        }):finally(function() --[[ Line: 106 ]]
                            -- upvalues: v28 (ref)
                            task.delay(1, function() --[[ Line: 107 ]]
                                -- upvalues: v28 (ref)
                                v28 = false;
                            end);
                        end);
                        return;
                    end;
                end;
            end);
        end, true);
    end, 
    Start = function(v30, _) --[[ Line: 116 ]] --[[ Name: Start ]]
        -- upvalues: v21 (ref), v18 (ref), v22 (ref), v7 (copy), v23 (copy), v19 (ref), v8 (copy), v9 (copy), v12 (copy), v17 (ref), v3 (copy), v15 (copy), v14 (copy)
        v21 = v18:GetModuleAsync("Notification"):expect();
        v22 = v18:GetModuleAsync("NumberPrompt"):expect();
        local v32 = v7:GetQuests("VDay") or {};
        for v33, v34 in v32 do
            if typeof(v33) == "number" then
                v23[v34.Name] = v34;
            end;
        end;
        v30.questsData = v19:RetrieveInitialData("Quests"):expect();
        v30.questsData = v30.questsData and v30.questsData.VDay;
        v30:UpdateQuests();
        v19.InformProgressionUpdates:Connect(function(v35) --[[ Line: 133 ]]
            -- upvalues: v30 (copy)
            if not v35 then
                return;
            else
                for v36, v37 in v35 do
                    local v38, v39 = table.unpack(string.split(v36, "."));
                    if v38 and v39 and v38 == "VDay" then
                        v30.questsData[v39] = v37;
                    end;
                end;
                v30:UpdateQuests();
                return;
            end;
        end);
        v18:HandleButton(v30.main.Exit, function() --[[ Line: 151 ]]
            -- upvalues: v18 (ref)
            v18:Toggle(script.Name, false);
        end);
        v32 = v8.VDAY_PRESENT_INFO;
        v30.purchaseBtn.Content.Currency.Image = v9.Currency.Hearts;
        v30.purchaseBtn.Content.Amount.Text = v12:CommaNumber(v32.cost.amount or 0);
        v18:HandleButton(v30.purchaseBtn, function() --[[ Line: 159 ]]
            -- upvalues: v30 (copy), v32 (copy), v21 (ref), v22 (ref)
            local v40 = v30.myCurrency or 0;
            local l_amount_0 = v32.cost.amount;
            local v42 = l_amount_0 <= v40;
            local v43 = math.floor(v40 / l_amount_0) or 0;
            if v30.purchaseRequestProcessing or not v42 or v43 < 1 then
                if not v42 or v43 < 1 then
                    v21:Notify({
                        text = ("You need %* more Hearts to purchase this!"):format((math.clamp(l_amount_0 - v40, 0, l_amount_0))), 
                        duration = 3, 
                        isPositive = false
                    });
                end;
                return;
            elseif v43 == 1 then
                v30:_attemptPurchaseGift(1, v43);
                return;
            else
                v22:Prompt({
                    message = "How many would you like to purchase?", 
                    maxAmount = v43, 
                    maxMessage = "You can buy a maximum of %s Parade Presents.", 
                    shopInfo = {
                        baseCost = l_amount_0, 
                        currencyName = "Hearts"
                    }, 
                    callback = function(v44) --[[ Line: 190 ]] --[[ Name: callback ]]
                        -- upvalues: v30 (ref), v43 (copy)
                        v30:_attemptPurchaseGift(v44, v43);
                    end
                });
                return;
            end;
        end);
        v17:OnChanged(v3.Player, "Currency.Hearts", function(v45) --[[ Line: 215 ]]
            -- upvalues: v30 (copy), v12 (ref)
            v30.myCurrency = v45 or 0;
            v30.main.Content.Header.TotalCurrency.Content.Amount.Text = v12:CommaNumber(v30.myCurrency);
        end, true);
        local l_v15_LootPool_0 = v15:GetLootPool("VDayGift");
        local l_new_0 = v14.new;
        local l_Unit_0 = v30.presentOffer.Main.Unit;
        local v49 = {
            Name = l_v15_LootPool_0[2].name
        };
        local v50 = true;
        if l_v15_LootPool_0[2].type ~= "Unit" then
            v50 = l_v15_LootPool_0[2].type == "RandomUnit";
        end;
        v49.IsUnit = v50;
        l_new_0(l_Unit_0, v49);
        v14.new(v30.presentOffer.Main.XPFood, {
            Name = l_v15_LootPool_0[1].name
        });
        v30.presentOffer.Main.XPFood.Content.Chance.Text = ("%*%%"):format(l_v15_LootPool_0[1].weight);
        v30.presentOffer.Main.XPFood.Content.Inner.Amount.Text = ("x%*"):format(l_v15_LootPool_0[1].amount);
        v30.presentOffer.Main.Unit.Content.Inner.Chance.Text = ("%*%%"):format(l_v15_LootPool_0[2].weight);
        v30.animatedModels = {
            v30.main.Content.ViewportFrame.WorldModel:FindFirstChildOfClass("Model"), 
            v30.presentOffer.Main.Unit.Content.Inner.ViewportFrame.WorldModel:FindFirstChildOfClass("Model")
        };
        v30:_setupShop();
    end, 
    Opening = function(v51) --[[ Line: 279 ]] --[[ Name: Opening ]]
        -- upvalues: v4 (copy), v16 (copy)
        v51._dump = v4.new();
        v51.presentOffer.Main.Unit.Content.Backdrop:SetAttribute("Rarity", "Limited");
        v51.presentOffer.Main.Unit.Content.Glow:SetAttribute("Rarity", "Limited");
        v51.presentOffer.Main.XPFood.Content.Backdrop:SetAttribute("Rarity", "Epic");
        v51.presentOffer.Main.XPFood.Content.Glow:SetAttribute("Rarity", "Epic");
        v51.presentOffer.Main.Unit.Content.Backdrop:AddTag("VisualizeRarity");
        v51.presentOffer.Main.Unit.Content.Glow:AddTag("VisualizeRarity");
        v51.presentOffer.Main.XPFood.Content.Backdrop:AddTag("VisualizeRarity");
        v51.presentOffer.Main.XPFood.Content.Glow:AddTag("VisualizeRarity");
        for _, v53 in v51.animatedModels do
            local l_Name_1 = v53.Name;
            local v55 = v16.new(l_Name_1, v53, "Friendlies");
            if v55 then
                v55:Play("Idle");
                v51._dump:Add(v55);
            end;
        end;
        v51._dump:Add(function() --[[ Line: 304 ]]
            -- upvalues: v51 (copy)
            v51._dump = nil;
        end);
    end, 
    Closed = function(v56) --[[ Line: 309 ]] --[[ Name: Closed ]]
        if v56._dump then
            v56._dump:Destroy();
        end;
        v56.presentOffer.Main.Unit.Content.Backdrop:RemoveTag("VisualizeRarity");
        v56.presentOffer.Main.Unit.Content.Glow:RemoveTag("VisualizeRarity");
        v56.presentOffer.Main.XPFood.Content.Backdrop:RemoveTag("VisualizeRarity");
        v56.presentOffer.Main.XPFood.Content.Glow:RemoveTag("VisualizeRarity");
    end, 
    UpdateQuests = function(v57) --[[ Line: 321 ]] --[[ Name: UpdateQuests ]]
        -- upvalues: v23 (copy)
        for v58, v59 in v57._questButtons do
            local v60 = v23[v58];
            if v60 then
                local v61 = v57.questsData and v57.questsData[v58] or {
                    Value = 0, 
                    Finished = false, 
                    Claimed = false
                };
                local l_Claim_0 = v59.Content.Info.Claim;
                local v63 = v61.Value or 0;
                local v64 = v60.RequiredValue or 0;
                l_Claim_0.Claimed.Visible = false;
                l_Claim_0.NotCompleted.Amount.Text = ("%*/%*"):format(v63, v64);
                l_Claim_0.NotCompleted.Fill.Size = UDim2.fromScale(math.clamp(v63 / v64, 0, 1), 1);
                v59.Content.Info.Description.Text = v60.Description;
                local v65 = v61.Finished or false;
                local l_Claimed_0 = v61.Claimed;
                l_Claim_0.Content.Visible = v65 and not l_Claimed_0;
                l_Claim_0.NotCompleted.Visible = not v65;
                v59.Content.ClaimNotifier.Visible = v65 and not l_Claimed_0;
                v59.Content.Claimed.Visible = l_Claimed_0;
            end;
        end;
    end, 
    _attemptPurchaseGift = function(v67, v68, v69) --[[ Line: 357 ]] --[[ Name: _attemptPurchaseGift ]]
        if not v68 or v68 < 1 or v69 < v68 then
            return;
        elseif v67.purchaseRequestProcessing then
            return;
        else
            v67.purchaseRequestProcessing = true;
            return;
        end;
    end, 
    _setupShop = function(v70) --[[ Line: 388 ]] --[[ Name: _setupShop ]]
        -- upvalues: v20 (ref), v3 (copy), v17 (ref), v18 (ref)
        for _, v72 in v70.shopFrame:GetDescendants() do
            if v72:IsA("GuiButton") or v72.Name == "Buy" then
                local l_v72_Attribute_0 = v72:GetAttribute("PurchaseType");
                local l_v72_Attribute_1 = v72:GetAttribute("PurchaseName");
                local l_v72_Attribute_2 = v72:GetAttribute("OwnedDataKey");
                if not l_v72_Attribute_0 or not l_v72_Attribute_1 then
                    warn("no type or name", l_v72_Attribute_0, l_v72_Attribute_1);
                else
                    local l_Product_0 = Enum.InfoType.Product;
                    local v77 = false;
                    do
                        local l_v77_0 = v77;
                        if l_v72_Attribute_0 == "Gamepasses" then
                            l_Product_0 = Enum.InfoType.GamePass;
                            v72.Owned.Visible = false;
                            v72.Content.Visible = true;
                            v20:ListenToGamepassOwned(v3.Player, l_v72_Attribute_1, function(v79) --[[ Line: 412 ]]
                                -- upvalues: v72 (copy), l_v77_0 (ref)
                                v72.Owned.Visible = v79;
                                v72.Content.Visible = not v79;
                                l_v77_0 = v79;
                            end, true);
                        elseif l_v72_Attribute_0 == "DevProducts" and l_v72_Attribute_2 ~= nil then
                            v17:OnChanged(v3.Player, l_v72_Attribute_2, function(v80) --[[ Line: 418 ]]
                                -- upvalues: v72 (copy), l_v77_0 (ref)
                                v72.Owned.Visible = v80;
                                v72.Content.Visible = not v80;
                                l_v77_0 = v80;
                            end, true);
                        end;
                        v18:HandleButton(v72, function() --[[ Line: 425 ]]
                            -- upvalues: l_v77_0 (ref), l_v72_Attribute_0 (copy), v20 (ref), l_v72_Attribute_1 (copy)
                            if l_v77_0 then
                                return;
                            elseif l_v72_Attribute_0 == "DevProducts" then
                                v20:PromptProductPurchase(l_v72_Attribute_1);
                                return;
                            else
                                v20:PromptGamepassPurchase(l_v72_Attribute_1);
                                return;
                            end;
                        end);
                        v20:PromiseProductInfo(l_v72_Attribute_1, l_Product_0):andThen(function(v81) --[[ Line: 438 ]]
                            -- upvalues: v72 (copy)
                            v72.Content.Amount.Text = v81.PriceInRobux;
                        end);
                    end;
                end;
            end;
        end;
    end
};