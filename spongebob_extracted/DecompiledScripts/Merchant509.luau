local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v7 = require(v2.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.TimeFormat);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v11 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v12 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v13 = require(v2.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v14 = require(l_ReplicatedStorage_0.MerchantRotation);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Utf8Library);
local v16 = require(l_ReplicatedStorage_0.Shared.Util.RandomUnitDisplay);
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    Init = function(v23, v24, v25) --[[ Line: 55 ]] --[[ Name: Init ]]
        -- upvalues: v17 (ref), v2 (copy), v18 (ref), v19 (ref), v20 (ref), v3 (copy)
        v17 = v2.GetController("UIController");
        v18 = v2.GetController("DataController");
        v19 = v2.GetService("MerchantService");
        v20 = v2.GetController("PurchaseController");
        v23.currentMode = v25;
        v23.ui = v24;
        v23.main = v24.Main;
        v23.shopWindow = v23.main.ShopWindow;
        v23.exitBtn = v23.shopWindow.Exit;
        local l_Bar_0 = v23.shopWindow.TimerBar.Bar;
        v23.timerBarFill = l_Bar_0.Fill;
        v23.timerBarTimer = l_Bar_0.Timer;
        v23.content = v23.shopWindow.Content;
        v23.mrKrabs = v23.content.ViewportFrame.WorldModel.MrKrabs;
        v23.bin = v23.content.Bin;
        v23.itemTemplate = v23.bin.Template:Clone();
        v23.currencyLabel = v23.content.Header.Currencies.Inner.Coins.Content.Amount;
        v23.gemsLabel = v23.content.Header.Currencies.Inner.Gems.Content.Amount;
        v23.refreshButton = l_Bar_0.Parent.RefreshPurchase;
        v23.bin.Template:Destroy();
        v23.dumpster = v3.new();
        v23.currencyAmount = 0;
    end, 
    Start = function(v27) --[[ Line: 88 ]] --[[ Name: Start ]]
        -- upvalues: v3 (copy), v21 (ref), v17 (ref), v22 (ref), v18 (ref), v2 (copy), v12 (copy), v19 (ref), l_TweenService_0 (copy), v8 (copy), v6 (copy), v20 (ref)
        if v27.currentMode ~= "Lobby" then
            return;
        else
            v27._batchDumpster = v3.new();
            v21 = v17:GetModuleAsync("NumberPrompt"):expect();
            v22 = v17:GetModuleAsync("Notification"):expect();
            v17:HandleButton(v27.exitBtn, function() --[[ Line: 98 ]]
                -- upvalues: v17 (ref)
                v17:Toggle(script.Name, false);
            end);
            v18:OnChanged(v2.Player, "Currency.Coins", function(v28) --[[ Line: 102 ]]
                -- upvalues: v27 (copy), v12 (ref)
                v27.currencyLabel.Text = v12:SuffixNumber(v28, true);
                v27.currencyAmount = v28;
            end, true);
            v18:OnChanged(v2.Player, "Currency.Gems", function(v29) --[[ Line: 107 ]]
                -- upvalues: v27 (copy), v12 (ref)
                v27.gemsLabel.Text = v12:SuffixNumber(v29, true);
                v27.gemsAmount = v29;
            end, true);
            v18:OnChanged(v2.Player, "Currency", function(v30) --[[ Line: 112 ]]
                -- upvalues: v27 (copy), v12 (ref)
                v27.currencyLabel.Text = v12:SuffixNumber(v30.Coins, true);
                v27.currencyAmount = v30.Coins;
                v27.gemsAmount = v30.Gems;
            end, true);
            v19.ShopRefresh:Observe(function(v31) --[[ Line: 118 ]]
                -- upvalues: v27 (copy), v3 (ref), l_TweenService_0 (ref), v8 (ref), v6 (ref)
                if v27.timerDumpster then
                    v27.timerDumpster:Destroy();
                end;
                v27.timerDumpster = v3.new();
                v27.timerDumpster:Add(function() --[[ Line: 125 ]]
                    -- upvalues: v27 (ref)
                    v27.timerDumpster = nil;
                end);
                local v32 = math.floor((math.clamp(v31.UnixTimestamp - workspace:GetServerTimeNow(), 0, 1e999)));
                local v33 = math.clamp(1 - v32 / 900, 0, 1);
                local v34 = l_TweenService_0:Create(v27.timerBarFill, TweenInfo.new(v32, Enum.EasingStyle.Linear), {
                    Size = UDim2.fromScale(1, 1)
                });
                v27.timerBarFill.Size = UDim2.fromScale(v33, 1);
                v27.timerBarTimer.Text = v8:FormatMMSS(v32);
                v27.timerDumpster:Add(v6.Simple(1, function() --[[ Line: 142 ]]
                    -- upvalues: v32 (ref), v27 (ref), v8 (ref)
                    v32 = v32 - 1;
                    v27.timerBarTimer.Text = v8:FormatMMSS(v32);
                end));
                v34:Play();
                v27.timerDumpster:Add(v34);
            end);
            v17:HandleButton(v27.refreshButton, function() --[[ Line: 151 ]]
                -- upvalues: v20 (ref)
                v20:PromptProductPurchase("MerchantRefresh");
            end);
            return;
        end;
    end, 
    Opening = function(v35) --[[ Line: 164 ]] --[[ Name: Opening ]]
        -- upvalues: v7 (copy), v19 (ref)
        local v36 = v7.new("MrKrabs", v35.mrKrabs, "Friendlies");
        v36:Play("Idle");
        v35.dumpster:Add(v36);
        v35.dumpster:Add(v19.ShopBatch:Observe(function(v37) --[[ Line: 169 ]]
            -- upvalues: v35 (copy)
            v35:_loadBatch(v37);
        end));
    end, 
    Closed = function(v38) --[[ Line: 174 ]] --[[ Name: Closed ]]
        v38.dumpster:Destroy();
    end, 
    _loadBatch = function(v39, v40) --[[ Line: 182 ]] --[[ Name: _loadBatch ]]
        -- upvalues: v14 (copy), v18 (ref), v2 (copy), v12 (copy), v10 (copy), v13 (copy), v3 (copy), v16 (copy), v11 (copy), v22 (ref), v17 (ref), v19 (ref), v21 (ref)
        for _, v42 in v39.bin:GetChildren() do
            if v42:IsA("Frame") then
                v42:Destroy();
            end;
        end;
        if v39._batchDumpster then
            v39._batchDumpster:Clean();
        end;
        local v43 = v40.Batch or 1;
        local l_SpecialOfferIndex_0 = v40.SpecialOfferIndex;
        local v45 = v14[v43];
        if not v45 then
            return;
        else
            v45 = table.clone(v45);
            if l_SpecialOfferIndex_0 and v14.SpecialOffers[l_SpecialOfferIndex_0] then
                table.remove(v45, #v45);
                local v46 = table.clone(v14.SpecialOffers[l_SpecialOfferIndex_0]);
                v46.isSpecialOffer = true;
                table.insert(v45, v46);
            end;
            local v47 = v18:Get(v2.Player, "MerchantBought"):expect();
            for v48, v49 in v45 do
                local v50 = v39.itemTemplate:Clone();
                v50.Name = v49.item.name or v49.item.type;
                local v51 = v49.isSpecialOffer or false;
                local l_Buy_0 = v50.Main.Buy;
                local l_Stock_0 = l_Buy_0.Unsorted.Stock;
                local l_UIGradient_0 = l_Buy_0.Unsorted.StockBar.UIGradient;
                local l_Amount_0 = l_Buy_0.Amount;
                local l_Amount_1 = l_Amount_0.Amount;
                local l_Max_0 = l_Buy_0.Max;
                local v58 = v47[tostring(v43)];
                local l_stock_0 = v49.stock;
                local l_cost_0 = v49.cost;
                local v61 = v49.currency or "Coins";
                local v62 = v49.item.extraData or {};
                v50.Main.Status.Wumbo.Visible = v62.Wumbo or v62.Mega or false;
                v50.Main.Status.Shiny.Visible = v62.Shiny or false;
                v50.Main.Status.Stars.Visible = v62.Stars ~= nil;
                v50.Main.Mystery.Visible = v49.item.type == "RandomUnit";
                v50.Main.SpecialTitle.Visible = v51;
                v50.Main.UIStroke.UIGradient_Normal.Enabled = not v51;
                v50.Main.UIStroke.UIGradient_Special.Enabled = v51;
                v50.Main.Pattern.UIGradient_Normal.Enabled = not v51;
                v50.Main.Pattern.UIGradient_Special.Enabled = v51;
                local v63 = v58 and v58[tostring(v48)];
                if typeof(v63) ~= "number" then
                    v63 = v63 and 1 or 0;
                end;
                local v64 = math.max(0, l_stock_0 - v63);
                do
                    local l_v63_0, l_v64_0 = v63, v64;
                    local function v67() --[[ Line: 258 ]] --[[ Name: updateInfo ]]
                        -- upvalues: l_Stock_0 (copy), l_v64_0 (ref), l_stock_0 (copy), l_Max_0 (copy), l_v63_0 (ref), l_Amount_0 (copy), l_UIGradient_0 (copy), l_Amount_1 (copy), v12 (ref), l_cost_0 (copy), v10 (ref), v61 (copy)
                        l_Stock_0.Text = ("%* / %*  LEFT"):format(l_v64_0, l_stock_0);
                        l_Max_0.Visible = l_stock_0 <= l_v63_0;
                        l_Amount_0.Visible = l_v63_0 < l_stock_0;
                        l_UIGradient_0.Offset = Vector2.new(-(l_v63_0 / l_stock_0), 0);
                        l_Amount_1.Text = v12:SuffixNumber(l_cost_0, true);
                        l_Amount_0.Currency.Image = v10:GetByItemName(v61).icon or "";
                    end;
                    v67();
                    local v68 = "";
                    if v49.item.type ~= "RandomUnit" then
                        v68 = v10:GetDisplayName(v49.item.name);
                        v50.Main.Title.Text = v68;
                    else
                        v50.Main.Title.Text = ("Random %* Unit"):format(v49.item.rarity);
                    end;
                    v50.Parent = v39.bin;
                    local l_v10_ByItemName_0 = v10:GetByItemName(v49.item.name);
                    if v49.item.type ~= "RandomUnit" and v49.item.type ~= "Unit" then
                        v39._batchDumpster:Add(v13.new(v50.Main.Tooltip, {
                            Name = v49.item.name
                        }));
                    end;
                    if v49.item.type ~= "Unit" and v49.item.type ~= "RandomUnit" then
                        v50.Main.Icon.Image = l_v10_ByItemName_0 and l_v10_ByItemName_0.icon or "";
                    elseif v49.item.type == "RandomUnit" then
                        v68 = "Random Unit";
                        local v70 = v3.new();
                        v70:Add(v16(v50.Main.Icon, v49.item.poolName, v49.item.rarity, 1));
                        v70:AttachTo(v50);
                    else
                        v50.Main.Icon.Visible = false;
                        local v71 = v3.new();
                        v71:Construct(v11, v50.Main.Unit, v49.item.name);
                        v71:AttachTo(v50);
                    end;
                    local function v75(v72, v73) --[[ Line: 307 ]] --[[ Name: processPurchase ]]
                        -- upvalues: l_v63_0 (ref), l_v64_0 (ref), v67 (copy), v12 (ref), v22 (ref), v68 (ref)
                        if not v73 then
                            return;
                        else
                            l_v63_0 = l_v63_0 + v72;
                            l_v64_0 = l_v64_0 - v72;
                            v67();
                            local v74 = v12:SuffixNumber(v72, true);
                            v22:Notify({
                                message = ("Purchased %* %*!"):format(v74, v68), 
                                duration = 3.5, 
                                isPositive = true
                            });
                            return;
                        end;
                    end;
                    v17:HandleButton(l_Buy_0, function() --[[ Line: 325 ]]
                        -- upvalues: l_v63_0 (ref), l_stock_0 (copy), v39 (copy), v61 (copy), l_cost_0 (copy), v22 (ref), l_v64_0 (ref), v19 (ref), v48 (copy), v75 (copy), v21 (ref), v68 (ref)
                        if l_v63_0 + 1 > l_stock_0 then
                            return;
                        else
                            local l_currencyAmount_0 = v39.currencyAmount;
                            if v61 == "Gems" then
                                l_currencyAmount_0 = v39.gemsAmount;
                            end;
                            if l_currencyAmount_0 < l_cost_0 then
                                v22:Notify({
                                    message = ("You do not have enough %* to purchase this item!"):format(v61), 
                                    duration = 3.5, 
                                    isPositive = false
                                });
                                return;
                            else
                                local v77 = math.min(math.floor(l_currencyAmount_0 / l_cost_0), l_v64_0);
                                if v77 == 1 then
                                    v19:Purchase(v48, 1):andThen(function(v78) --[[ Line: 350 ]]
                                        -- upvalues: v75 (ref)
                                        v75(1, v78);
                                    end);
                                    return;
                                else
                                    v21:Prompt({
                                        message = "How many would you like to purchase?", 
                                        maxAmount = v77, 
                                        maxMessage = ("You can buy %%s %*"):format(v68), 
                                        shopInfo = {
                                            baseCost = l_cost_0, 
                                            currencyName = v61
                                        }, 
                                        callback = function(v79) --[[ Line: 367 ]] --[[ Name: callback ]]
                                            -- upvalues: v19 (ref), v48 (ref), v75 (ref)
                                            if v79 == 0 then
                                                return;
                                            else
                                                v19:Purchase(v48, v79):andThen(function(v80) --[[ Line: 373 ]]
                                                    -- upvalues: v75 (ref), v79 (copy)
                                                    v75(v79, v80);
                                                end);
                                                return;
                                            end;
                                        end
                                    });
                                    return;
                                end;
                            end;
                        end;
                    end);
                end;
            end;
            return;
        end;
    end
};