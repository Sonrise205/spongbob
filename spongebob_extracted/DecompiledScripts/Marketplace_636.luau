local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("UserInputService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v7 = nil;
local l_MARKETPLACE_0 = v6.MARKETPLACE;
local _ = l_RunService_0:IsStudio();
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    Init = function(v10, v11, v12) --[[ Line: 35 ]] --[[ Name: Init ]]
        -- upvalues: v7 (ref), v3 (copy)
        v7 = v3.GetController("UIController");
        v10.currentMode = v12;
        v10.ui = v11;
        v10.main = v11.Main;
        v10.mainExitButton = v10.main.Exit;
        v10.itemDetails = v11.ItemDetails;
        v10.hoverTooltip = v11.HoverTooltip;
        local l_Top_0 = v10.main.Top;
        v10.buyLicenseButton = l_Top_0.BuyLicense;
        v10.offersButton = l_Top_0.Offers;
        v10.activityButton = l_Top_0.Activity;
        local l_Content_0 = v10.main.Content;
        v10.activityBin = l_Content_0.Activity;
        v10.offersBin = l_Content_0.Offers;
        v10.cooldownTimerBar = v10.main.CooldownBar;
        v10.cooldownTimerBarFill = v10.cooldownTimerBar.Bar.Fill;
        v10.cooldownTimerBarLabel = v10.cooldownTimerBar.Bar.Timer;
        v10.itemDetails.Visible = false;
        v10.main.Visible = true;
        v10.activityTemplate = v10.activityBin.Template:Clone();
        v10.offersTemplate = v10.offersBin.Template:Clone();
        local l_Main_0 = v10.itemDetails.Main;
        v10.detailsExitButton = l_Main_0.Exit;
        v10.detailsSinkButton = v10.itemDetails.Sink;
        local l_Main_1 = l_Main_0.Buttons.Main;
        v10.detailsHelpButton = l_Main_1.Help;
        v10.pricesRefreshButton = l_Main_1.Refresh;
        local l_Bar_0 = l_Main_0.TimerBar.Bar;
        v10.detailsTimerBarFill = l_Bar_0.Fill;
        v10.detailsTimerBarLabel = l_Bar_0.Timer;
        local l_Content_1 = l_Main_0.Content;
        v10.detailsItem = l_Content_1.Item.Item;
        local l_Info_0 = l_Content_1.Info;
        v10.detailsInfoSelling = l_Info_0.Selling;
        v10.detailsInfoSelecting = l_Info_0.Selecting;
        local l_Prices_0 = v10.detailsInfoSelling.Prices;
        v10.priceFloorLabel = l_Prices_0.FloorPrice.Amount.Amount;
        v10.playerPriceBin = l_Prices_0.PlayerPrices.Offer.Inner;
        v10.playerPriceTemplate = v10.playerPriceBin.Template:Clone();
        v10.listButton = v10.detailsInfoSelling.List;
        v10.activityBin.Template:Destroy();
        v10.offersBin.Template:Destroy();
        v10.playerPriceBin.Template:Destroy();
        v10.slots = {};
    end, 
    Start = function(v21) --[[ Line: 94 ]] --[[ Name: Start ]]
        -- upvalues: v7 (ref), l_MARKETPLACE_0 (copy)
        v7:HandleButton(v21.detailsExitButton, function() --[[ Line: 95 ]]
            -- upvalues: v21 (copy)
            v21:ToggleItemDetails(false);
        end);
        v7:HandleButton(v21.detailsSinkButton, function() --[[ Line: 99 ]]
            -- upvalues: v21 (copy)
            v21:ToggleItemDetails(false);
        end);
        v7:HandleButton(v21.mainExitButton, function() --[[ Line: 103 ]]
            -- upvalues: v7 (ref)
            v7:Toggle(script.Name, false);
        end);
        for v22 = 1, l_MARKETPLACE_0.MAX_SLOTS do
            local v23 = v21.offersTemplate:Clone();
            v23.Name = v22;
            v23.Parent = v21.offersBin;
            local l_Add_0 = v23.Add;
            v21.slots[v22] = {
                slot = v23, 
                addButton = l_Add_0
            };
            v7:HandleButton(l_Add_0, function() --[[ Line: 119 ]]
                -- upvalues: v21 (copy)
                v21:ToggleItemDetails(true);
            end);
        end;
    end, 
    Closed = function(_) --[[ Line: 125 ]] --[[ Name: Closed ]]

    end, 
    ToggleItemDetails = function(v26, v27) --[[ Line: 130 ]] --[[ Name: ToggleItemDetails ]]
        v26.itemDetails.Visible = v27;
        for _, v29 in v26.slots do
            v29.addButton:SetAttribute("Disabled", v27);
        end;
    end
};