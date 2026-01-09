local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.Data.CraftingData);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.TimeFormat);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(v5.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v7 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local l_MYSTERY_MARKET_REFRESH_COOLDOWN_0 = v1.Config.MYSTERY_MARKET_REFRESH_COOLDOWN;
local v9 = false;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = 0;
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    Init = function(v16, v17, v18) --[[ Line: 52 ]] --[[ Name: Init ]]
        -- upvalues: v10 (ref), v5 (copy), v11 (ref), v12 (ref), v13 (ref), v3 (copy)
        v10 = v5.GetController("UIController");
        v11 = v5.GetController("DataController");
        v12 = v5.GetService("MysteryMarketService");
        v13 = v5.GetController("PurchaseController");
        v16.ui = v17;
        v16.main = v17.Main;
        v16.shopWindow = v16.main.ShopWindow;
        v16.exitBtn = v16.shopWindow.Exit;
        local l_Bar_0 = v16.shopWindow.TimerBar.Bar;
        v16.timerBarFill = l_Bar_0.Fill;
        v16.timerBarTimer = l_Bar_0.Timer;
        v16.refreshButton = l_Bar_0.Parent.RefreshPurchase;
        v16.content = v16.shopWindow.Content;
        v16.hashSlingingSlasher = v16.content.ViewportFrame.WorldModel.HashSlingingSlasher;
        v16.bin = v16.content.Bin;
        v16.templates = v16.content.Templates;
        v16.gemsLabel = v16.content.Header.Currencies.Inner.Gems.Content.Amount;
        v16._batchDumpster = v3.new();
        v16.dumpster = v3.new();
        v16.currentMode = v18;
        v16.gemsAmount = 0;
    end, 
    Start = function(v20) --[[ Line: 80 ]] --[[ Name: Start ]]
        -- upvalues: v14 (ref), v10 (ref), v11 (ref), v5 (copy), v7 (copy), v12 (ref), v3 (copy), l_MYSTERY_MARKET_REFRESH_COOLDOWN_0 (copy), v2 (copy), v4 (copy), v13 (ref)
        if v20.currentMode ~= "Lobby" then
            return;
        else
            v14 = v10:GetModuleAsync("Notification"):expect();
            v11:OnChanged(v5.Player, "Currency.Gems", function(v21) --[[ Line: 87 ]]
                -- upvalues: v20 (copy), v7 (ref)
                v20.gemsLabel.Text = v7:SuffixNumber(v21, true);
                v20.gemsAmount = v21;
            end, true);
            v12.LastRefresh:Observe(function(v22) --[[ Line: 92 ]]
                -- upvalues: v20 (copy), v3 (ref), l_MYSTERY_MARKET_REFRESH_COOLDOWN_0 (ref), v2 (ref), v4 (ref)
                if v20.timerDumpster then
                    v20.timerDumpster:Destroy();
                end;
                v20.timerDumpster = v3.new();
                v20.timerDumpster:Add(function() --[[ Line: 98 ]]
                    -- upvalues: v20 (ref)
                    v20.timerDumpster = nil;
                end);
                local v23 = math.max(v22 + l_MYSTERY_MARKET_REFRESH_COOLDOWN_0 - os.time(), 0);
                local v24 = math.clamp(1 - v23 / l_MYSTERY_MARKET_REFRESH_COOLDOWN_0, 0, 1);
                v20.timerBarFill.Size = UDim2.fromScale(v24, 1);
                v20.timerBarTimer.Text = v2:FormatMMSS(v23);
                v20.timerDumpster:Add(v4.Simple(1, function() --[[ Line: 108 ]]
                    -- upvalues: v23 (ref), v20 (ref), v2 (ref), l_MYSTERY_MARKET_REFRESH_COOLDOWN_0 (ref)
                    v23 = math.max(v23 - 1, 0);
                    v20.timerBarTimer.Text = v2:FormatMMSS(v23);
                    v20.timerBarFill.Size = UDim2.fromScale(math.clamp(1 - v23 / l_MYSTERY_MARKET_REFRESH_COOLDOWN_0, 0, 1), 1);
                end));
            end);
            v10:HandleButton(v20.exitBtn, function() --[[ Line: 115 ]]
                -- upvalues: v10 (ref)
                v10:Toggle(script.Name, false);
            end);
            v10:HandleButton(v20.refreshButton, function() --[[ Line: 119 ]]
                -- upvalues: v13 (ref)
                v13:PromptProductPurchase("MysteryMarketRefresh");
            end);
            return;
        end;
    end, 
    Opening = function(v25) --[[ Line: 124 ]] --[[ Name: Opening ]]
        -- upvalues: v6 (copy), v12 (ref)
        local v26 = v6.new("HashSlingingSlasher", v25.hashSlingingSlasher, "Friendlies");
        v26:Play("Idle");
        v25.dumpster:Add(v26);
        v25.dumpster:Add(v12.MarketData:Observe(function(v27) --[[ Line: 129 ]]
            -- upvalues: v25 (copy)
            v25:_loadBatch(v27);
        end));
    end, 
    Closed = function(v28) --[[ Line: 134 ]] --[[ Name: Closed ]]
        v28.dumpster:Destroy();
    end, 
    _loadBatch = function(v29, v30) --[[ Line: 139 ]] --[[ Name: _loadBatch ]]
        -- upvalues: v1 (copy), v7 (copy), v10 (ref), v14 (ref), v15 (ref), v12 (ref), v9 (ref), v13 (ref)
        for _, v32 in v29.bin:GetChildren() do
            if v32:IsA("Frame") then
                v32:Destroy();
            end;
        end;
        local v33 = v30.MarketType == "FireSale";
        local v34 = v30.MarketType == "Overstock";
        v29.main.Special.FireSale.Visible = v33;
        v29.main.Special.Overstock.Visible = v34;
        for v35, v36 in v30.CurrentItems do
            local l_Material_0 = v36.Material;
            local v38 = nil;
            if not l_Material_0 then
                v38 = v29.templates.EmptyTemplate:Clone();
            else
                local l_v1_MaterialData_0 = v1:GetMaterialData(l_Material_0);
                local v40 = l_v1_MaterialData_0.price or 1;
                v38 = v29.templates.ItemTemplate:Clone();
                v38.Main.Title.Text = l_v1_MaterialData_0.displayName;
                v38.Name = l_Material_0;
                v7:SetIcon(v38.Main.Icon, l_Material_0, {
                    type = "Crafting"
                });
                local l_PurchaseOptions_0 = v38.Main.PurchaseOptions;
                local l_Buy_0 = l_PurchaseOptions_0.Buy;
                local v43 = v36.Stock or 0;
                local v44 = v43 <= 0;
                l_Buy_0.Unsorted.Stock.Text = string.upper((("%* left"):format(v43)));
                l_Buy_0.Content.Amount.Text = v7:SuffixNumber(v40, true);
                l_Buy_0.Content.Visible = not v44;
                l_Buy_0.Owned.Visible = v44;
                v10:HandleButton(l_Buy_0, function() --[[ Line: 173 ]]
                    -- upvalues: v44 (copy), v40 (copy), v29 (copy), v14 (ref), v15 (ref), l_v1_MaterialData_0 (copy), v12 (ref), v35 (copy)
                    if v44 or v40 > v29.gemsAmount then
                        local v45 = v44 and "This item is out of stock!" or "You do not have enough Gems to purchase this item!";
                        v14:Notify({
                            message = v45, 
                            duration = 3.5, 
                            isPositive = false
                        });
                        return;
                    else
                        local v46 = os.clock();
                        if v46 - v15 < 0.4 then
                            v14:Notify({
                                message = "Please wait a moment before making another purchase!", 
                                duration = 2, 
                                isPositive = false
                            });
                            return;
                        else
                            v15 = v46;
                            v14:Notify({
                                message = ("Successfully purchased 1x %*!"):format(l_v1_MaterialData_0.displayName), 
                                duration = 3.5, 
                                isPositive = true
                            });
                            v12.TryBuyMaterial:Fire(v35);
                            return;
                        end;
                    end;
                end);
                local l_RobuxBuy_0 = l_PurchaseOptions_0.RobuxBuy;
                l_RobuxBuy_0.Content.Amount.Text = 99;
                v10:HandleButton(l_RobuxBuy_0, function() --[[ Line: 206 ]]
                    -- upvalues: v9 (ref), v29 (copy), v12 (ref), v35 (copy), v13 (ref), v14 (ref)
                    if v9 then
                        return;
                    else
                        v29.dumpster:AddPromise(v12:CanPromptBuyMaterialWithProduct(v35):andThen(function(v48) --[[ Line: 211 ]]
                            -- upvalues: v13 (ref)
                            if v48 then
                                v13:PromptProductPurchase("MysteryMarketMaterial");
                            end;
                        end):finally(function() --[[ Line: 215 ]]
                            -- upvalues: v9 (ref)
                            v9 = false;
                        end):timeout(5):catch(function() --[[ Line: 217 ]]
                            -- upvalues: v14 (ref)
                            v14:Notify({
                                message = "An error occurred while trying to buy this item with Robux - try again!", 
                                duration = 3.5, 
                                isPositive = false
                            });
                        end));
                        return;
                    end;
                end);
            end;
            v38.LayoutOrder = v35;
            v38.Visible = true;
            v38.Parent = v29.bin;
        end;
    end
};