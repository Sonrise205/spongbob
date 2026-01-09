local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.Shops.PrestigeShop);
local _ = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v6 = require(l_ReplicatedStorage_0.Shared.Data.UnitImages);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v9 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.RandomUnitDisplay);
local v11 = require(v1.Player.PlayerScripts.Knit.Modules.UIClasses.GenericTooltip);
local v12 = nil;
local v13 = nil;
local v14 = nil;
return {
    primaryMenu = true, 
    blur = true, 
    _processingRequest = false, 
    ToggleAll = {}, 
    Init = function(v15, v16) --[[ Line: 42 ]] --[[ Name: Init ]]
        -- upvalues: v12 (ref), v1 (copy), v13 (ref), v14 (ref), v2 (copy)
        v12 = v1.GetController("DataController");
        v13 = v1.GetController("UIController");
        v14 = v1.GetService("VendorService");
        v15.ui = v16;
        v15.main = v16.Main;
        v15.shopWindow = v15.main.ShopWindow;
        v15.bin = v15.shopWindow.Content.Bin;
        v15.template = v15.bin.Template;
        v15.template.Parent = nil;
        v15.currencyFrame = v15.shopWindow.Content.Header.TotalCurrency.Content;
        v15.exitBtn = v15.shopWindow.Exit;
        v15.dumpster = v2.new();
    end, 
    Start = function(v17, _) --[[ Line: 60 ]] --[[ Name: Start ]]
        -- upvalues: v12 (ref), v1 (copy), v9 (copy), v13 (ref)
        v17.myCurrency = 0;
        v12:OnChanged(v1.Player, "Currency.PrestigeToken", function(v19) --[[ Line: 64 ]]
            -- upvalues: v17 (copy), v9 (ref)
            v17.myCurrency = v19 or 0;
            v17.currencyFrame.Amount.Text = v9:CommaNumber(v19 or 0);
        end, true);
        v13:HandleButton(v17.exitBtn, function() --[[ Line: 69 ]]
            -- upvalues: v13 (ref)
            v13:Toggle(script.Name, false);
        end);
    end, 
    Opening = function(v20) --[[ Line: 74 ]] --[[ Name: Opening ]]
        -- upvalues: v4 (copy), v8 (copy), v7 (copy), v9 (copy), v12 (ref), v1 (copy), v10 (copy), v6 (copy), v11 (copy), v13 (ref), v14 (ref)
        for v21, v22 in v4 do
            local v23 = v20.dumpster:Extend();
            local v24 = v20.template:Clone();
            v24.Name = "Item-" .. v21;
            v24.Visible = true;
            v24.LayoutOrder = v21;
            local v25 = v22.displayName or v22.name or v22.type;
            local v26 = v22.name or v22.type;
            if v22.type == "Unit" then
                v26 = v8:GetUnitValue(v26, "FullName") or v26;
            end;
            v25 = string.gsub(v25, "{amount}", v22.amount);
            v25 = string.gsub(v25, "{name}", v26);
            v24.Main.Title.Text = v25;
            v24.Main.Buy.Content.Currency.Image = v7.Currency[v22.cost.currency] or "";
            v24.Main.Buy.Content.Amount.Text = v9:CommaNumber(v22.cost.amount or 0);
            for _, v28 in v24.Main.Status:GetChildren() do
                if v28:IsA("ImageLabel") or v28:IsA("Frame") then
                    v28.Visible = false;
                end;
            end;
            if v22.extraData then
                v24.Main.Status.Shiny.Visible = v22.extraData.Shiny or false;
                v24.Main.Status.Wumbo.Visible = v22.extraData.Wumbo or false;
                v24.Main.Status.Stars.Visible = v22.extraData.Stars ~= nil;
            end;
            v24.Main.Mystery.Visible = v22.type == "RandomUnit";
            if v22.secret then
                v24.Main.Undiscovered.Visible = true;
                v24.Main.Icon.ImageColor3 = Color3.new();
                v23:AddPromise(v12:Get(v1.Player, "Units"):andThen(function(v29) --[[ Line: 120 ]]
                    -- upvalues: v22 (copy), v24 (copy), v8 (ref)
                    if v29[v22.name] then
                        v24.Main.Undiscovered.Visible = false;
                        v24.Main.Icon.ImageColor3 = Color3.new(1, 1, 1);
                        v24.Main.Title.Text = v8:GetUnitValue(v22.name, "FullName") or v22.name;
                    end;
                end));
            end;
            if v22.type == "RandomUnit" then
                v23:Add(v10(v24.Main.Icon, v22.poolName, v22.rarity));
            elseif v22.type == "Unit" then
                v6:SetImage(v24.Main.Icon, v22.name);
                v23:Add(v11.new(v24.Main.Tooltip, {
                    Name = "Spongehenge", 
                    IsUnit = true, 
                    IsSecretUnit = function() --[[ Line: 138 ]] --[[ Name: IsSecretUnit ]]
                        return true;
                    end
                }));
            else
                v24.Main.Icon.Image = v9:GetIconFromRewardData(v22) or "";
                v23:Add(v11.new(v24.Main.Tooltip, {
                    Name = v26
                }));
            end;
            v24.Parent = v20.bin;
            v23:Add(v24);
            v13:HandleButton(v24.Main.Buy, function() --[[ Line: 151 ]]
                -- upvalues: v20 (copy), v22 (copy), v14 (ref), v21 (copy)
                if v20._processingRequest then
                    return;
                elseif v20.myCurrency < v22.cost.amount then
                    return;
                else
                    v20._processingRequest = true;
                    v14:Purchase(script.Name, v21):finally(function() --[[ Line: 163 ]]
                        -- upvalues: v20 (ref)
                        v20._processingRequest = false;
                    end);
                    return;
                end;
            end);
        end;
    end, 
    Closed = function(v30) --[[ Line: 170 ]] --[[ Name: Closed ]]
        v30.bin.CanvasPosition = Vector2.zero;
        v30.dumpster:Destroy();
    end
};