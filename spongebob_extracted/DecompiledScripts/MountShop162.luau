local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local l_PreferredInput_0 = require(l_ReplicatedStorage_0.Packages.Input).PreferredInput;
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.Shops.MountShop);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v9 = require(v1.Player.PlayerScripts.Knit.Modules.ClientAnimator);
local v10 = require(v1.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = {
    "DriverLicense", 
    "ChallengeToken", 
    "GoldenSpatula"
};
return {
    primaryMenu = true, 
    blur = true, 
    _processingRequest = false, 
    ToggleAll = {}, 
    Init = function(v18, v19) --[[ Line: 42 ]] --[[ Name: Init ]]
        -- upvalues: v11 (ref), v1 (copy), v12 (ref), v13 (ref), v14 (ref), v15 (ref), v2 (copy)
        v11 = v1.GetController("DataController");
        v12 = v1.GetController("UIController");
        v13 = v1.GetService("VendorService");
        v14 = v1.GetController("PurchaseController");
        v15 = v1.GetController("DeviceTypeController");
        v18.ui = v19;
        v18.main = v19.Main;
        v18.shopWindow = v18.main.ShopWindow;
        v18.bin = v18.shopWindow.Content.Bin;
        v18.template = v18.bin.Template;
        v18.template.Parent = nil;
        v18.tipPlatforms = v18.main.HelpfulTip.Inner.Platform;
        v18.animatedModels = {};
        for _, v21 in v18.shopWindow.Content.ViewportFrame.WorldModel:GetChildren() do
            if v21:IsA("Model") then
                table.insert(v18.animatedModels, v21);
            end;
        end;
        v18.currencyFrames = v18.shopWindow.Content.Header.Currencies.Inner;
        v18.exitBtn = v18.shopWindow.Exit;
        v18.dumpster = v2.new();
    end, 
    Start = function(v22, _) --[[ Line: 73 ]] --[[ Name: Start ]]
        -- upvalues: v16 (ref), v12 (ref), v17 (copy), v11 (ref), v1 (copy), v8 (copy), v5 (copy), v6 (copy), v10 (copy), v14 (ref), v7 (copy), v13 (ref), l_PreferredInput_0 (copy), v15 (ref)
        v16 = v12:GetModuleAsync("Notification"):expect();
        local v24 = {};
        for _, v26 in v17 do
            local l_FirstChild_0 = v22.currencyFrames:FindFirstChild(v26);
            if l_FirstChild_0 then
                v11:OnChanged(v1.Player, ("Currency.%*"):format(v26), function(v28) --[[ Line: 85 ]]
                    -- upvalues: v24 (copy), v26 (copy), l_FirstChild_0 (copy), v8 (ref)
                    v24[v26] = v28 or 0;
                    l_FirstChild_0.Content.Amount.Text = v8:CommaNumber(v28 or 0);
                end, true);
            end;
        end;
        v12:HandleButton(v22.exitBtn, function() --[[ Line: 91 ]]
            -- upvalues: v12 (ref)
            v12:Toggle(script.Name, false);
        end);
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        for v30, v31 in v5 do
            if not v31.inactiveAfter or v31.inactiveAfter > l_workspace_ServerTimeNow_0 then
                local v32 = v22.template:Clone();
                v32.Name = "Item-" .. v30;
                v32.Visible = true;
                v32.LayoutOrder = v30;
                if v31.inactiveAfter then
                    task.delay(v31.inactiveAfter - l_workspace_ServerTimeNow_0, function() --[[ Line: 109 ]]
                        -- upvalues: v32 (copy)
                        v32.Visible = false;
                    end);
                end;
                local l_v6_ByItemName_0 = v6:GetByItemName(v31.name);
                local l_v6_DisplayName_0 = v6:GetDisplayName(v31.name);
                v10.new(v32.Main.Tooltip, {
                    Name = v31.name
                });
                v32.Main.Title.Text = l_v6_DisplayName_0;
                v32.Main.Icon.Image = l_v6_ByItemName_0.icon or "";
                v32.Main.Rarity.Text = l_v6_ByItemName_0.rarity;
                v32.Main.Rarity:SetAttribute("Rarity", l_v6_ByItemName_0.rarity);
                v32.Main.Rarity:AddTag("VisualizeRarity");
                v32.Main.Buy.Content.Robux.Visible = v31.cost.purchaseType ~= nil;
                v32.Main.Buy.Content.Currency.Visible = v31.cost.currency ~= nil;
                if v31.cost.purchaseType then
                    local v35 = if v31.cost.purchaseType == "Gamepasses" then Enum.InfoType.GamePass else Enum.InfoType.Product;
                    v14:PromiseProductInfo(v31.cost.purchaseName, v35):andThen(function(v36) --[[ Line: 140 ]]
                        -- upvalues: v32 (copy)
                        v32.Main.Buy.Content.Amount.Text = v36.PriceInRobux;
                    end);
                elseif v31.cost.currency then
                    v32.Main.Buy.Content.Currency.Image = v7.Currency[v31.cost.currency] or "";
                    v32.Main.Buy.Content.Amount.Text = v8:CommaNumber(v31.cost.amount or 0);
                end;
                v32.Parent = v22.bin;
                v12:HandleButton(v32.Main.Buy, function() --[[ Line: 150 ]]
                    -- upvalues: v22 (copy), v31 (copy), v14 (ref), v6 (ref), v8 (ref), v24 (copy), v16 (ref), v13 (ref), v30 (copy), l_v6_DisplayName_0 (copy)
                    if v22._processingRequest then
                        return;
                    elseif v31.cost.purchaseType == "DevProducts" then
                        v14:PromptProductPurchase(v31.cost.purchaseName);
                        return;
                    elseif v31.cost.purchaseType == "Gamepasses" then
                        v14:PromptGamepassPurchase(v31.cost.purchaseName);
                        return;
                    else
                        local l_v6_DisplayName_1 = v6:GetDisplayName(v31.cost.currency);
                        l_v6_DisplayName_1 = v8:Pluralize(l_v6_DisplayName_1, v31.cost.amount);
                        if v31.cost.amount and v24[v31.cost.currency] < v31.cost.amount then
                            v16:Notify({
                                message = ("You do not have enough %* to purchase this mount!"):format(l_v6_DisplayName_1), 
                                duration = 3.5, 
                                isPositive = false
                            });
                            return;
                        else
                            v22._processingRequest = true;
                            v13:Purchase(script.Name, v30):andThen(function(v38) --[[ Line: 182 ]]
                                -- upvalues: v16 (ref), l_v6_DisplayName_0 (ref)
                                if not v38 then
                                    v16:Notify({
                                        message = "Something went wrong", 
                                        duration = 3.5, 
                                        isPositive = false
                                    });
                                    return;
                                else
                                    v16:Notify({
                                        message = ("Successfully purchased %*!"):format(l_v6_DisplayName_0), 
                                        duration = 3.5, 
                                        isPositive = true
                                    });
                                    return;
                                end;
                            end):finally(function() --[[ Line: 199 ]]
                                -- upvalues: v22 (ref)
                                v22._processingRequest = false;
                            end);
                            return;
                        end;
                    end;
                end);
            end;
        end;
        l_PreferredInput_0.Observe(function(v39) --[[ Line: 205 ]]
            -- upvalues: v15 (ref), v22 (copy)
            local l_v15_RemappedInput_0 = v15:GetRemappedInput(v39);
            for _, v42 in v22.tipPlatforms:GetChildren() do
                if v42:IsA("Frame") then
                    v42.Visible = v42.Name == l_v15_RemappedInput_0;
                end;
            end;
        end);
    end, 
    Opening = function(v43) --[[ Line: 218 ]] --[[ Name: Opening ]]
        -- upvalues: v9 (copy)
        for _, v45 in v43.animatedModels do
            local v46 = v45:GetAttribute("Animation") or v45.Name;
            local v47 = v9.new(v46, v45, "Friendlies");
            v47:Play("Idle");
            v43.dumpster:Add(v47);
        end;
    end, 
    Closed = function(v48) --[[ Line: 227 ]] --[[ Name: Closed ]]
        v48.bin.CanvasPosition = Vector2.zero;
    end
};