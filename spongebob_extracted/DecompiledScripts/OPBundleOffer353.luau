local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v4 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.TimeFormat);
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
return {
    primaryMenu = true, 
    blur = true, 
    ToggleAll = {}, 
    Init = function(v11, v12, v13) --[[ Line: 33 ]] --[[ Name: Init ]]
        -- upvalues: v7 (ref), v1 (copy), v8 (ref), v9 (ref), v10 (ref)
        v7 = v1.GetController("UIController");
        v8 = v1.GetController("DataController");
        v9 = v1.GetController("PurchaseController");
        v10 = v1.GetService("OPBundleService");
        v11.currentMode = v13;
        v11.ui = v12;
        v11.main = v12.Main;
        v11.inner = v11.main.Inner;
    end, 
    Start = function(v14) --[[ Line: 46 ]] --[[ Name: Start ]]
        -- upvalues: v7 (ref), v2 (copy), v8 (ref), v1 (copy), v4 (copy), v5 (copy), v6 (copy), v9 (ref), v10 (ref)
        v7:HandleButton(v14.inner.Exit, function() --[[ Line: 47 ]]
            -- upvalues: v7 (ref)
            v7:Toggle(script.Name, false);
        end);
        local l_Buy_0 = v14.inner.Buy;
        local l_Amount_0 = l_Buy_0.Content.AmountFrame.Amount;
        local l_Timer_0 = l_Buy_0.Timer;
        local v18 = v2.new();
        v8:OnChanged(v1.Player, "OPBundleServicedTimestamp", function(v19) --[[ Line: 57 ]]
            -- upvalues: v18 (copy), v4 (ref), v5 (ref), v7 (ref), v6 (ref), l_Timer_0 (copy)
            if v19 == nil then
                return;
            else
                v18:Destroy();
                v18:Add(v4.Simple(0.5, function() --[[ Line: 64 ]]
                    -- upvalues: v19 (copy), v5 (ref), v18 (ref), v7 (ref), v6 (ref), l_Timer_0 (ref)
                    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                    local v21 = v19 + v5.OP_BUNDLE_OFFER.EXPIRATION - l_workspace_ServerTimeNow_0;
                    if v21 <= 0 then
                        v18:Destroy();
                        v7:Toggle(script.Name, false);
                        return;
                    else
                        l_Timer_0.Text = ("EXPIRES IN: %*"):format((v6:FormatHHMMSS(v21)));
                        return;
                    end;
                end, true));
                return;
            end;
        end, true);
        local l_PURCHASE_NAME_0 = v5.OP_BUNDLE_OFFER.PURCHASE_NAME;
        v9:PromiseProductInfo(l_PURCHASE_NAME_0, Enum.InfoType.Product):andThen(function(v23) --[[ Line: 81 ]]
            -- upvalues: l_Amount_0 (copy)
            l_Amount_0.Text = v23 and v23.PriceInRobux or "?";
        end);
        v7:HandleButton(l_Buy_0, function() --[[ Line: 85 ]]
            -- upvalues: v9 (ref), l_PURCHASE_NAME_0 (copy)
            local l_v9_Product_0 = v9:GetProduct(l_PURCHASE_NAME_0);
            if not l_v9_Product_0 then
                return;
            else
                v9:PromptProductPurchase(l_v9_Product_0.purchaseId);
                return;
            end;
        end);
        v10.BundleAvailable:Observe(function(v25) --[[ Line: 94 ]]
            -- upvalues: v7 (ref)
            if not v25 then
                v7:Toggle(script.Name, false);
            end;
        end);
    end, 
    Opened = function(_) --[[ Line: 101 ]] --[[ Name: Opened ]]
        -- upvalues: v10 (ref)
        v10.SeenBundle:Fire();
    end, 
    Closed = function(_) --[[ Line: 105 ]] --[[ Name: Closed ]]

    end, 
    OnJoin = function(_) --[[ Line: 111 ]] --[[ Name: OnJoin ]]
        -- upvalues: v8 (ref), v1 (copy), v10 (ref)
        local v29 = v8:Get(v1.Player, "SeenOPBundleOffer"):expect();
        local v30 = v10.BundleAvailable:OnReady():expect();
        return not v29 and v30;
    end
};