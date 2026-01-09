local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v7 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v10 = require(l_ReplicatedStorage_0.Shared.Data.MythicBanners);
local v11 = require(l_ReplicatedStorage_0.Shared.Modules.UnitViewport);
local v12 = require(l_ReplicatedStorage_0.SummoningPools);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v15 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v16 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v18 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local v19 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v20 = require(v3.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v21 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = {
    Gems = {
        "GemsPack1", 
        "GemsPack2", 
        "GemsPack3", 
        "GemsPack4"
    }, 
    MagicConch = {
        "MagicConchPack1", 
        "MagicConchPack2", 
        "MagicConchPack3", 
        "MagicConchPack4"
    }
};
local v31 = {
    primaryMenu = true, 
    blur = true, 
    _bannerType = nil, 
    BannerIndexRetrieved = v7.new()
};
local function _(v32) --[[ Line: 73 ]] --[[ Name: formatTime ]]
    local v33 = math.floor(v32 / 60);
    v32 = math.floor(v32 % 60);
    return string.format("%02d:%02d", v33, v32);
end;
v31.Init = function(_, _) --[[ Line: 80 ]] --[[ Name: Init ]]
    -- upvalues: v22 (ref), v3 (copy), v23 (ref), v24 (ref), v25 (ref), v26 (ref), v27 (ref)
    v22 = v3.GetController("DataController");
    v23 = v3.GetService("UnitService");
    v24 = v3.GetController("UIController");
    v25 = v3.GetService("SettingsService");
    v26 = v3.GetController("PurchaseController");
    v27 = v3.GetController("DeviceTypeController");
end;
v31.Start = function(v37, v38) --[[ Line: 90 ]] --[[ Name: Start ]]
    -- upvalues: v28 (ref), v24 (ref), v29 (ref), v18 (copy), v3 (copy), v22 (ref), v23 (ref), v4 (copy), l_TweenService_0 (copy), v6 (copy), v26 (ref), v30 (copy), v17 (copy), v9 (copy), v21 (copy)
    v28 = v24:GetModuleAsync("HUD"):expect();
    v29 = v24:GetModuleAsync("PromptOverlay"):expect();
    v37.ui = v38;
    v37.main = v38.Main;
    v37.content = v37.main.Content;
    v37.banner = v37.content.Banner;
    v37.summonOptions = v37.banner.Options;
    v37.pityBars = v37.main.PityBars;
    v37.refreshTimer = v37.main.RefreshTimer;
    v37.exitBtn = v37.main.Exit;
    v37.bannerOptions = v37.content.BannerOptions;
    v37.devProductBin = v37.main.DevProducts;
    v37.purchaseTemplate = v37.devProductBin.Currency.Template;
    v37.purchaseTemplate.Parent = nil;
    v37.bannerDetails = v37.ui.BannerDetails;
    v37.detailsBin = v37.bannerDetails.Main.Content.Bin;
    v37.detailsExitBtn = v37.bannerDetails.Main.Exit;
    v37.detailUnitTemplate = v37.detailsBin.Common.Units.Template;
    v37.detailUnitTemplate.Parent = nil;
    v37.autoSellWindow = v37.ui.AutoSell;
    v37.autoSellCategories = v37.autoSellWindow.Main.SellType.Default;
    v37.autoSellBin = v37.autoSellWindow.Main.Content.Bin;
    v37.autoSellExitBtn = v37.autoSellWindow.Main.Exit;
    v37.autoSellUnitTemplate = v37.autoSellBin.Common.Units.Template:Clone();
    v37.autoSellBin.Common.Units.Template:Destroy();
    v37.main.Visible = true;
    v37.bannerDetails.Visible = false;
    v37.autoSellWindow.Visible = false;
    v24:HandleButton(v37.detailsExitBtn, function() --[[ Line: 129 ]]
        -- upvalues: v37 (copy)
        if v37.detailsDump then
            v37.detailsDump:Destroy();
        end;
        v37.bannerDetails.Visible = false;
        v37.main.Visible = true;
    end);
    v37.bannerDetails.Visible = false;
    v37.main.Visible = true;
    v37.PolicyInfo = v18(v3.Player):expect();
    if not v37.PolicyInfo then
        v3.Player:Kick("Failed to get policy info. (Please rejoin)");
        return;
    else
        v37.PaidItemsRestricted = v37.PolicyInfo.ArePaidRandomItemsRestricted or false;
        if v37.PaidItemsRestricted then
            v37.devProductBin.Visible = false;
            v37.main.Position = UDim2.fromScale(0.5, v37.main.Position.Y.Scale);
        end;
        v22:OnChanged(v3.Player, "Pity", function(v39) --[[ Line: 155 ]]
            -- upvalues: v37 (copy)
            v37._pity = v39;
            v37:_updatePityBars();
        end, true);
        v22:OnChanged(v3.Player, "Settings.UnitAutoSell", function(v40) --[[ Line: 160 ]]
            -- upvalues: v37 (copy)
            v37._unitAutoSellSettings = v40;
            if not v37._showingAutoSell then
                return;
            else
                if v37._autoSellType then
                    v37:_setAutoSellType(v37._autoSellType, true);
                end;
                return;
            end;
        end, true);
        v23.MythicBannerIndex:Observe(function(v41) --[[ Line: 172 ]]
            -- upvalues: v37 (copy)
            v37._bannerIndex = v41;
            v37.BannerIndexRetrieved:Fire();
            v37:_updateBannerUnits(v41);
        end);
        v23.MythicBannerRefreshAt:Observe(function(v42) --[[ Line: 179 ]]
            -- upvalues: v37 (copy), v4 (ref), l_TweenService_0 (ref), v6 (ref)
            if v37.timerDump then
                v37.timerDump:Destroy();
            end;
            v37.timerDump = v4.new();
            v37.timerDump:Add(function() --[[ Line: 186 ]]
                -- upvalues: v37 (ref)
                v37.timerDump = nil;
            end);
            local v43 = math.floor((math.clamp(v42.UnixTimestamp - DateTime.now().UnixTimestamp, 0, 1e999)));
            local v44 = math.clamp(1 - v43 / 1800, 0, 1);
            local v45 = l_TweenService_0:Create(v37.refreshTimer.Fill, TweenInfo.new(v43, Enum.EasingStyle.Linear), {
                Size = UDim2.fromScale(1, 1)
            });
            v37.refreshTimer.Fill.Size = UDim2.fromScale(v44, 1);
            local l_Timer_0 = v37.refreshTimer.Timer;
            local l_v43_0 = v43;
            local v48 = math.floor(l_v43_0 / 60);
            l_v43_0 = math.floor(l_v43_0 % 60);
            l_Timer_0.Text = string.format("%02d:%02d", v48, l_v43_0);
            v37.timerDump:Add(v6.Simple(1, function() --[[ Line: 202 ]]
                -- upvalues: v43 (ref), v37 (ref)
                v43 = v43 - 1;
                local l_Timer_1 = v37.refreshTimer.Timer;
                local l_v43_1 = v43;
                local v51 = math.floor(l_v43_1 / 60);
                l_v43_1 = math.floor(l_v43_1 % 60);
                l_Timer_1.Text = string.format("%02d:%02d", v51, l_v43_1);
            end));
            v45:Play();
            v37.timerDump:Add(v45);
        end);
        for _, v53 in v37.summonOptions:GetChildren() do
            if v53:IsA("GuiButton") then
                local v54 = string.match(v53.Name, "%d+");
                v54 = v54 and tonumber(v54);
                if not v54 then
                    --[[ close >= 7 ]]
                else
                    local v55 = false;
                    do
                        local l_v54_0, l_v55_0 = v54, v55;
                        v24:HandleButton(v53, function() --[[ Line: 225 ]]
                            -- upvalues: l_v55_0 (ref), v37 (copy), v29 (ref), v23 (ref), l_v54_0 (ref), v26 (ref)
                            if l_v55_0 then
                                return;
                            else
                                l_v55_0 = true;
                                if not v37._isRobuxBanner then
                                    local v58 = nil;
                                    v58 = task.delay(0.5, function() --[[ Line: 234 ]]
                                        -- upvalues: v58 (ref), v29 (ref)
                                        v58 = nil;
                                        v29:Toggle(true);
                                    end);
                                    v23:SummonUnits(v37._bannerType, l_v54_0):andThen(function() --[[ Line: 239 ]]
                                        -- upvalues: l_v55_0 (ref)
                                        task.delay(0.5, function() --[[ Line: 240 ]]
                                            -- upvalues: l_v55_0 (ref)
                                            l_v55_0 = false;
                                        end);
                                    end):catch(function() --[[ Line: 243 ]]
                                        -- upvalues: l_v55_0 (ref)
                                        task.delay(0.5, function() --[[ Line: 244 ]]
                                            -- upvalues: l_v55_0 (ref)
                                            l_v55_0 = false;
                                        end);
                                    end):finally(function() --[[ Line: 247 ]]
                                        -- upvalues: v29 (ref), v58 (ref)
                                        v29:Toggle(false);
                                        if v58 then
                                            task.cancel(v58);
                                        end;
                                    end);
                                    return;
                                else
                                    v26:PromptProductPurchase(v37._bannerType .. "_" .. l_v54_0);
                                    return;
                                end;
                            end;
                        end);
                    end;
                end;
            end;
        end;
        for _, v60 in v37.bannerOptions:GetChildren() do
            if v60:IsA("GuiButton") then
                v24:HandleButton(v60, function() --[[ Line: 267 ]]
                    -- upvalues: v37 (copy), v60 (copy)
                    v37:SetBanner(v60.Name);
                end);
            end;
        end;
        v37._currencyPurchases = {};
        for v61, v62 in v30 do
            if not v37._currencyPurchases[v61] then
                v37._currencyPurchases[v61] = {};
            end;
            for _, v64 in v62 do
                local l_v26_Product_0 = v26:GetProduct(v64);
                if l_v26_Product_0 then
                    local v66 = v37.purchaseTemplate:Clone();
                    v66.Inner.Title.Text = l_v26_Product_0.displayName or v64;
                    v66.LayoutOrder = l_v26_Product_0.purchaseData.currency.amount;
                    v66.Visible = false;
                    v66.Parent = v37.devProductBin.Currency;
                    v66.Inner.Icon.Image = v17.Currency[v61];
                    v26:PromiseProductInfo(v64, Enum.InfoType.Product):andThen(function(v67) --[[ Line: 294 ]]
                        -- upvalues: v9 (ref), v64 (copy), v66 (copy), v21 (ref)
                        if not v67 or not v67.PriceInRobux then
                            v9:Warn("Failed to get product info for " .. v64);
                            return;
                        else
                            v66.Inner.Buy.Content.Amount.Text = v21:CommaNumber(v67.PriceInRobux);
                            v66.Visible = true;
                            return;
                        end;
                    end);
                    v24:HandleButton(v66.Inner.Buy, function() --[[ Line: 305 ]]
                        -- upvalues: v26 (ref), v64 (copy)
                        v26:PromptProductPurchase(v64);
                    end);
                    v37._currencyPurchases[v61][v64] = v66;
                end;
            end;
        end;
        v37:_setupLuckFrame();
        v37:_setupAutoSellSettings();
        v24:HandleButton(v37.exitBtn, function() --[[ Line: 316 ]]
            -- upvalues: v37 (copy), v24 (ref)
            v37._bannerSet = false;
            v24:Toggle(script.Name, false);
        end);
        v24:HandleButton(v37.summonOptions.BannerDetails, function() --[[ Line: 321 ]]
            -- upvalues: v37 (copy)
            v37:ShowBannerDetails();
        end);
        v24:HandleButton(v37.summonOptions.AutoSell, function() --[[ Line: 325 ]]
            -- upvalues: v37 (copy)
            v37:ShowAutoSellWindow();
        end);
        if not v37._bannerIndex then
            v37.BannerIndexRetrieved:Wait();
        end;
        v37:SetBanner("Standard");
        if not v37.purchaseOneButton then
            v37.purchaseOneButton = v37.summonOptions:FindFirstChild("Buy1");
        end;
        v37:_setupCurrencyFrame();
        return;
    end;
end;
v31.Opening = function(v68) --[[ Line: 342 ]] --[[ Name: Opening ]]
    v68:SetBanner(v68._bannerType);
end;
v31.Opened = function(v69) --[[ Line: 353 ]] --[[ Name: Opened ]]
    -- upvalues: v28 (ref), v27 (ref), l_GuiService_0 (copy)
    v28:ToggleSideBar(false);
    v28:ToggleBottomBar(false);
    task.delay(0.2, function() --[[ Line: 357 ]]
        -- upvalues: v27 (ref), l_GuiService_0 (ref), v69 (copy)
        if v27:GetDeviceType() == "Console" then
            l_GuiService_0.SelectedObject = v69.purchaseOneButton;
        end;
    end);
end;
v31.Closed = function(v70) --[[ Line: 364 ]] --[[ Name: Closed ]]
    -- upvalues: v28 (ref)
    if v70._tooltip then
        v70._tooltip:Destroy();
    end;
    if v70.bannerDump then
        v70.bannerDump:Destroy();
    end;
    if v70.detailsDump then
        v70.detailsDump:Destroy();
    end;
    if v70.autoSellDump then
        v70.autoSellDump:Destroy();
    end;
    v28:ToggleSideBar(true);
    v28:ToggleBottomBar(true);
end;
v31.OpenOnBanner = function(v71, v72) --[[ Line: 385 ]] --[[ Name: OpenOnBanner ]]
    -- upvalues: v24 (ref)
    v71._bannerSet = true;
    v71._bannerType = v72;
    v24:Toggle(script.Name, true);
end;
v31.SetBanner = function(v73, v74) --[[ Line: 392 ]] --[[ Name: SetBanner ]]
    -- upvalues: v12 (copy), v9 (copy), v10 (copy), v26 (ref), v3 (copy), v17 (copy)
    local l_v12_Cost_0 = v12:GetCost(v74);
    if not l_v12_Cost_0 then
        v9:Warn("Missing banner variables for " .. v74);
        return;
    else
        v73._isRobuxBanner = string.lower(l_v12_Cost_0.currencyName or "") == "robux";
        v73._bannerType = v74;
        local v76 = v10[v73._bannerType];
        v73.refreshTimer.Visible = v76 and v76.isMythicBanner or false;
        for _, v78 in v73.summonOptions:GetChildren() do
            if v78:IsA("GuiButton") and string.find(string.lower(v78.Name), "buy") then
                local v79 = string.match(v78.Name, "%d+");
                v79 = v79 and tonumber(v79);
                if v79 then
                    local v80 = l_v12_Cost_0.price * v79;
                    local v81 = nil;
                    if v26:HasGamepass(v3.Player, "VIP") then
                        v81 = 0.2;
                    end;
                    if v26:HasGamepass(v3.Player, "UltraVIP") then
                        v81 = 0.3;
                    end;
                    if l_v12_Cost_0.currencyName ~= "Gems" then
                        v81 = nil;
                    end;
                    if v81 then
                        v80 = v80 - v80 * v81;
                    end;
                    v78.Content.Price.Icon.Image = v17.Currency[l_v12_Cost_0.currencyName] or "";
                    v78.Content.Price.Amount.Text = v80;
                end;
            end;
        end;
        local v82 = v73._currencyPurchases or {};
        for v83, v84 in v82 do
            local v85 = v84 or {};
            for _, v87 in v85 do
                v87.Visible = v83 == l_v12_Cost_0.currencyName;
            end;
        end;
        for _, v89 in v73.banner.BannerStyles:GetChildren() do
            if v89:IsA("Frame") then
                v89.Visible = v89.Name == v74;
            end;
        end;
        v82 = v74 == "Limited" and "Exclusive" or v74;
        v73.banner.BannerStyles[v74].Title.Text = string.upper(v82) .. " BANNER";
        v73:_updateBannerUnits(v73._bannerIndex);
        v73:_updatePityBars();
        return;
    end;
end;
v31.ShowBannerDetails = function(v90) --[[ Line: 473 ]] --[[ Name: ShowBannerDetails ]]
    -- upvalues: v4 (copy), v12 (copy), v10 (copy), v13 (copy), v20 (copy), v24 (ref), v11 (copy), v16 (copy)
    if not v90._bannerType then
        return;
    else
        if v90.detailsDump then
            v90.detailsDump:Destroy();
        end;
        v90.detailsDump = v4.new();
        local l_v12_UnitsPool_0 = v12:GetUnitsPool(v90._bannerType);
        if not l_v12_UnitsPool_0 then
            v90.detailsDump:Destroy();
            return;
        else
            local l_v12_RarityPool_0 = v12:GetRarityPool(v90._bannerType);
            for _, v94 in v90.detailsBin:GetChildren() do
                if v94:IsA("Frame") then
                    v94.Visible = false;
                end;
            end;
            local v95 = v10[v90._bannerType];
            local v96 = v95 and v95[v90._bannerIndex] or {};
            for v97, v98 in l_v12_UnitsPool_0 do
                local l_FirstChild_0 = v90.detailsBin:FindFirstChild(v97);
                local v100 = l_v12_RarityPool_0[v97] and l_v12_RarityPool_0[v97].weight;
                if l_FirstChild_0 and v100 then
                    l_FirstChild_0.Title.Chance.Text = ("%*%%"):format(v100);
                    for _, v102 in v98 do
                        local l_name_0 = v102.name;
                        local l_weight_0 = v102.weight;
                        local v105 = v90.detailUnitTemplate:Clone();
                        v105.Name = l_name_0;
                        if v97 == "Mythic" and v95.isMythicBanner then
                            v105.Content.BoostedFactor.Text = ("X%*"):format(v13.SUMMONING.MYTHIC_BANNER_WEIGHT_BOOST);
                            v105.Content.BoostedFactor.Visible = v96[l_name_0] ~= nil;
                        else
                            v105.Content.BoostedFactor.Visible = false;
                        end;
                        if v97 == "Secret" then
                            v105.Content.Amount.Text = "???";
                        else
                            v105.Content.Amount.Text = ("%*%%"):format(l_weight_0);
                        end;
                        v105.Content.Icon.Visible = false;
                        v105.Parent = l_FirstChild_0.Units;
                        v20.new(v105, {
                            Name = l_name_0, 
                            IsUnit = true, 
                            IsSecretUnit = function() --[[ Line: 546 ]] --[[ Name: IsSecretUnit ]]
                                -- upvalues: v97 (copy)
                                return v97 == "Secret";
                            end
                        });
                        v24:HandleButton(v105);
                        v90.detailsDump:Add(v11.new(v105.Content, l_name_0, {
                            ImageColor3 = if v97 == "Secret" then Color3.new(0, 0, 0) else Color3.new(1, 1, 1)
                        }));
                        v90.detailsDump:Add(v16.new(v105.Content.Backdrop, v97));
                        v90.detailsDump:Add(v16.new(v105.Content.Glow, v97));
                        v90.detailsDump:Add(v105);
                    end;
                    l_FirstChild_0.Visible = true;
                end;
            end;
            v90.bannerDetails.Visible = true;
            v90.main.Visible = false;
            v90.detailsDump:Add(function() --[[ Line: 568 ]]
                -- upvalues: v90 (copy)
                v90.detailsDump = nil;
                v90.bannerDetails.Visible = false;
                v90.main.Visible = true;
            end);
            return;
        end;
    end;
end;
v31.ShowAutoSellWindow = function(v106) --[[ Line: 575 ]] --[[ Name: ShowAutoSellWindow ]]
    -- upvalues: v4 (copy), v12 (copy), v10 (copy), v19 (copy), v24 (ref), v25 (ref), v16 (copy)
    if not v106._bannerType then
        return;
    else
        if v106.autoSellDump then
            v106.autoSellDump:Destroy();
        end;
        v106.autoSellDump = v4.new();
        v106._showingAutoSell = true;
        v106._currentUnitsPerRarity = {};
        local l_v12_UnitsPool_1 = v12:GetUnitsPool(v106._bannerType);
        if not l_v12_UnitsPool_1 then
            v106.autoSellDump:Destroy();
            return;
        else
            local _ = v12:GetRarityPool(v106._bannerType);
            for _, v110 in v106.autoSellBin:GetChildren() do
                if v110:IsA("Frame") then
                    v110.Visible = false;
                end;
            end;
            local v111 = v10[v106._bannerType];
            if not v111 or not v111[v106._bannerIndex] then
                local _ = {};
            end;
            for v113, v114 in l_v12_UnitsPool_1 do
                if v113 ~= "Secret" then
                    v106._currentUnitsPerRarity[v113] = {};
                    local l_FirstChild_1 = v106.autoSellBin:FindFirstChild(v113);
                    if l_FirstChild_1 then
                        for _, v117 in v114 do
                            local l_name_1 = v117.name;
                            local _ = v117.weight;
                            local v120 = v106.autoSellUnitTemplate:Clone();
                            v120.Name = l_name_1;
                            v120.Content.Icon.Visible = true;
                            v19:SetImage(v120.Content.Icon, l_name_1);
                            v120.Content.Shiny.ZIndex = v120.Content.Icon.ZIndex + 1;
                            v120.Content.Wumbo.ZIndex = v120.Content.Shiny.ZIndex;
                            v120:SetAttribute("InvertClick", true);
                            v120.Parent = l_FirstChild_1.Units;
                            table.insert(v106._currentUnitsPerRarity[v113], l_name_1);
                            v24:HandleButton(v120, function() --[[ Line: 639 ]]
                                -- upvalues: v25 (ref), l_name_1 (copy), v106 (copy)
                                v25:ToggleUnitAutoSell(l_name_1, v106._autoSellType);
                            end);
                            v106.autoSellDump:Add(v16.new(v120.Content.Backdrop, v113));
                            v106.autoSellDump:Add(v16.new(v120.Content.Glow, v113));
                            v106.autoSellDump:Add(v120);
                            do
                                local l_v120_0 = v120;
                                v106.autoSellDump:Add(function() --[[ Line: 652 ]]
                                    -- upvalues: l_v120_0 (ref)
                                    l_v120_0 = nil;
                                end);
                            end;
                        end;
                        l_FirstChild_1.Visible = true;
                    end;
                end;
            end;
            v106.autoSellDump:Add(function() --[[ Line: 660 ]]
                -- upvalues: v106 (copy)
                v106.autoSellDump = nil;
                v106.bannerDetails.Visible = false;
                v106.autoSellWindow.Visible = false;
                v106.main.Visible = true;
                v106._showingAutoSell = false;
                v106.autoSellBin.CanvasPosition = Vector2.zero;
                table.clear(v106._currentUnitsPerRarity);
                v106._currentUnitsPerRarity = nil;
            end);
            v106:_setAutoSellType("Basic");
            v106.bannerDetails.Visible = false;
            v106.main.Visible = false;
            v106.autoSellWindow.Visible = true;
            return;
        end;
    end;
end;
v31._setupCurrencyFrame = function(v122) --[[ Line: 679 ]] --[[ Name: _setupCurrencyFrame ]]
    -- upvalues: v21 (copy), v22 (ref), v3 (copy)
    local l_Currency_0 = v122.main.Currency;
    local function _(v124, v125) --[[ Line: 682 ]] --[[ Name: updateCurrency ]]
        -- upvalues: v21 (ref)
        v124.Title.Text = v21:CommaNumber(v125 or 0) or "[FAILED TO LOAD!]";
    end;
    for _, v128 in (l_Currency_0:GetChildren()) do
        if v128:IsA("ImageLabel") then
            v22:OnChanged(v3.Player, ("Currency.%*"):format(v128.Name), function(v129) --[[ Line: 688 ]]
                -- upvalues: v128 (copy), v21 (ref)
                v128.Title.Text = v21:CommaNumber(v129 or 0) or "[FAILED TO LOAD!]";
            end, true);
        end;
    end;
end;
v31._updateBannerUnits = function(v130, v131) --[[ Line: 695 ]] --[[ Name: _updateBannerUnits ]]
    -- upvalues: v4 (copy), v10 (copy), v12 (copy), v15 (copy), v16 (copy), v11 (copy)
    if v130.bannerDump then
        v130.bannerDump:Destroy();
    end;
    v130.bannerDump = v4.new();
    v130.bannerDump:Add(function() --[[ Line: 702 ]]
        -- upvalues: v130 (copy)
        v130.bannerDump = nil;
    end);
    if not v130._bannerType then
        v130.bannerDump:Destroy();
        return;
    else
        local v132 = v10[v130._bannerType];
        local v133 = v10[v130._bannerType];
        if v132.isMythicBanner then
            v133 = v133[v131];
        end;
        if not v133 then
            v133 = v12:GetBestUnits();
        end;
        local v134 = 1;
        local v135 = {};
        for v136, v137 in v133 do
            if v136 ~= "isMythicBanner" then
                table.insert(v135, {
                    name = v136, 
                    weight = v137, 
                    rarity = select(1, v15:GetRarity(v136))
                });
            end;
        end;
        table.sort(v135, function(v138, v139) --[[ Line: 739 ]]
            if not v138.rarity then
                return false;
            elseif not v139.rarity then
                return true;
            elseif v138.rarity > v139.rarity then
                return true;
            elseif v139.rarity > v138.rarity then
                return false;
            elseif v138.weight < v139.weight then
                return true;
            else
                return false;
            end;
        end);
        for _, v141 in v130.banner.Units:GetChildren() do
            if v141:IsA("Frame") then
                v141.Visible = false;
            end;
        end;
        for _, v143 in v135 do
            local l_name_2 = v143.name;
            local l_FirstChild_2 = v130.banner.Units:FindFirstChild((("Unit%*"):format(v134)));
            if l_FirstChild_2 then
                local _, v147 = v15:GetRarity(l_name_2);
                l_FirstChild_2.TowerInfo.Title.Text = v15:GetUnitValue(l_name_2, "FullName");
                l_FirstChild_2.TowerInfo.Rarity.Text = v147;
                v130.bannerDump:Add(v16.new(l_FirstChild_2.TowerInfo.Rarity, v147));
                v130.bannerDump:Construct(v11, l_FirstChild_2, l_name_2, false, true, {
                    Size = UDim2.fromScale(2, 2), 
                    positionAttribute = "SummonViewportOffset"
                });
                l_FirstChild_2.Visible = true;
            end;
            v134 = v134 + 1;
        end;
        return;
    end;
end;
v31._updatePityBars = function(v148) --[[ Line: 791 ]] --[[ Name: _updatePityBars ]]
    -- upvalues: v13 (copy)
    if not v148._bannerType then
        return;
    else
        local v149 = v148._pity[v148._bannerType] or {
            Mythic = 0, 
            Legendary = 0
        };
        for v150, v151 in v149 do
            local l_FirstChild_3 = v148.pityBars:FindFirstChild(v150);
            if l_FirstChild_3 then
                local v153 = v13.SUMMONING.MAX_PITY[v148._bannerType][v150];
                l_FirstChild_3.Fill.Size = UDim2.fromScale(math.clamp(v151 / v153, 0, 1), 1);
                l_FirstChild_3.Progression.Text = ("%*/%*"):format(v151, v153);
            end;
        end;
        return;
    end;
end;
v31._setupLuckFrame = function(v154) --[[ Line: 812 ]] --[[ Name: _setupLuckFrame ]]
    -- upvalues: v22 (ref), v3 (copy), l_TweenService_0 (copy), v13 (copy), v26 (ref), v24 (ref)
    local l_Main_0 = v154.devProductBin.SummonLuck.Main;
    local l_Buy_0 = l_Main_0.Buy;
    local l_LuckBoosts_0 = l_Main_0.LuckBoosts;
    l_LuckBoosts_0.Luck1.Text = "1x";
    l_LuckBoosts_0.Luck2.Text = "2x";
    local v158 = v22:Get(v3.Player, "ProgressiveSummonLuck"):expect() or 0;
    l_LuckBoosts_0.Luck1.Text = ("%*x"):format((math.pow(2, v158)));
    l_LuckBoosts_0.Luck2.Text = ("%*x"):format((math.pow(2, v158 + 1)));
    local v159 = TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, true, 0.15);
    local v160 = l_TweenService_0:Create(l_LuckBoosts_0.Luck2, v159, {
        Size = UDim2.fromScale(0, l_LuckBoosts_0.Luck2.Size.Y.Scale * 2.5)
    });
    local function v162() --[[ Line: 835 ]] --[[ Name: updatePrice ]]
        -- upvalues: v158 (ref), v13 (ref), l_Buy_0 (copy), v26 (ref)
        if v158 == #v13.SUMMONING.PROGRESSIVE_LUCK_BOOSTS then
            l_Buy_0.Visible = false;
            return;
        else
            l_Buy_0.Visible = true;
            v26:PromiseProductInfo(("SummonLuck%*"):format(v158 + 1), Enum.InfoType.Product):andThen(function(v161) --[[ Line: 843 ]]
                -- upvalues: l_Buy_0 (ref)
                l_Buy_0.Content.Amount.Text = v161.PriceInRobux;
            end);
            return;
        end;
    end;
    v162();
    v22:OnChanged(v3.Player, "ProgressiveSummonLuck", function(v163) --[[ Line: 850 ]]
        -- upvalues: v158 (ref), l_LuckBoosts_0 (copy), v162 (copy), v24 (ref), v26 (ref), v160 (copy)
        v158 = v163;
        l_LuckBoosts_0.Luck1.Text = ("%*x"):format((math.pow(2, v163)));
        l_LuckBoosts_0.Luck2.Text = ("%*x"):format((math.pow(2, v163 + 1)));
        v162();
        if not v24:GetToggleState(script.Name) then
            return;
        else
            if v26.promptingPurchase then
                v26.PurchasePromptClosed:Wait();
            end;
            v160:Play();
            return;
        end;
    end);
    v24:HandleButton(l_Buy_0, function() --[[ Line: 868 ]]
        -- upvalues: v26 (ref), v158 (ref)
        v26:PromptProductPurchase((("SummonLuck%*"):format(v158 + 1)));
    end);
end;
v31._setupAutoSellSettings = function(v164) --[[ Line: 873 ]] --[[ Name: _setupAutoSellSettings ]]
    -- upvalues: v24 (ref), v25 (ref)
    v164._categoryActiveColor = v164.autoSellCategories.Basic.Content.UIGradient.Color;
    v164._categoryActiveStrokeColor = v164.autoSellCategories.Basic.Content.UIStroke.Color;
    v164._categoryInactiveColor = v164.autoSellCategories.Shiny.Content.UIGradient.Color;
    v164._categoryInactiveStrokeColor = v164.autoSellCategories.Shiny.Content.UIStroke.Color;
    for _, v166 in v164.autoSellCategories:GetChildren() do
        if v166:IsA("GuiButton") then
            v24:HandleButton(v166, function() --[[ Line: 885 ]]
                -- upvalues: v164 (copy), v166 (copy)
                v164:_setAutoSellType(v166.Name);
            end);
        end;
    end;
    for _, v168 in v164.autoSellBin:GetChildren() do
        if v168:IsA("Frame") then
            v24:HandleButton(v168.Title.SellAll, function() --[[ Line: 895 ]]
                -- upvalues: v164 (copy), v168 (copy), v25 (ref)
                local v169 = v164._currentUnitsPerRarity and v164._currentUnitsPerRarity[v168.Name];
                if not v164._autoSellType or not v169 then
                    return;
                else
                    local v170 = false;
                    for _, v172 in v169 do
                        if not v164._unitAutoSellSettings[v172] then
                            v170 = true;
                            break;
                        elseif not v164._unitAutoSellSettings[v172][v164._autoSellType] then
                            v170 = true;
                            break;
                        end;
                    end;
                    v25:ToggleUnitAutoSell(v169, v164._autoSellType, v170);
                    return;
                end;
            end);
        end;
    end;
    v24:HandleButton(v164.autoSellExitBtn, function() --[[ Line: 921 ]]
        -- upvalues: v164 (copy)
        if v164.autoSellDump then
            v164.autoSellDump:Destroy();
        end;
        v164.autoSellWindow.Visible = false;
        v164.main.Visible = true;
        v164._showingAutoSell = false;
    end);
end;
v31._setAutoSellType = function(v173, v174, v175) --[[ Line: 932 ]] --[[ Name: _setAutoSellType ]]
    v173._autoSellType = v174;
    for _, v177 in v173.autoSellCategories:GetChildren() do
        if v177:IsA("GuiButton") then
            local v178 = v177.Name == v174;
            local v179 = if v178 then v173._categoryActiveColor else v173._categoryInactiveColor;
            local v180 = if v178 then v173._categoryActiveStrokeColor else v173._categoryInactiveStrokeColor;
            v177.Content.UIGradient.Color = v179;
            v177.Content.UIStroke.Color = v180;
            v177.Content.Title.UIStroke.Color = v180;
        end;
    end;
    if not v175 then
        v173.autoSellBin.CanvasPosition = Vector2.zero;
    end;
    for _, v182 in v173.autoSellBin:GetChildren() do
        if v182:IsA("Frame") then
            for _, v184 in v182.Units:GetChildren() do
                if v184:IsA("GuiButton") then
                    v184.Content.Shiny.Visible = false;
                    v184.Content.Wumbo.Visible = false;
                    if v174 == "ShinyWumbo" then
                        v184.Content.Shiny.Visible = true;
                        v184.Content.Wumbo.Visible = true;
                    elseif v174 == "Shiny" then
                        v184.Content.Shiny.Visible = true;
                    elseif v174 == "Wumbo" then
                        v184.Content.Wumbo.Visible = true;
                    end;
                    local v185 = v173._unitAutoSellSettings and v173._unitAutoSellSettings[v184.Name];
                    if not v185 then
                        v184.Content.SellUnit.Visible = false;
                    else
                        v184.Content.SellUnit.Visible = v185[v174] or false;
                    end;
                end;
            end;
        end;
    end;
end;
return v31;