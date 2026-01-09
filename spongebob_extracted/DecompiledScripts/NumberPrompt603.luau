local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v3 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.Icons);
local v5 = nil;
local v6 = nil;
return {
    primaryMenu = false, 
    Init = function(v7, v8, v9) --[[ Line: 30 ]] --[[ Name: Init ]]
        -- upvalues: v5 (ref), v1 (copy), v6 (ref), v2 (copy)
        v5 = v1.GetController("UIController");
        v6 = v1.GetController("DeviceTypeController");
        v7.currentMode = v9;
        v7.ui = v8;
        v7.main = v8.Main;
        v7.messageLabel = v7.main.Message;
        v7.maxAmountLabel = v7.main.Max;
        local l_Input_0 = v7.main.Input;
        v7.addButton = l_Input_0.Add;
        v7.minusButton = l_Input_0.Minus;
        v7.inputBox = l_Input_0.Input;
        v7.closeButton = v7.ui.Close;
        local l_BottomButtons_0 = v7.main.BottomButtons;
        v7.confirmButton = l_BottomButtons_0.Confirm;
        v7.cancelButton = l_BottomButtons_0.Cancel;
        v7.shopTotalFrame = v7.main.ShopTotal;
        v7.dumpster = v2.new();
    end, 
    Start = function(v12) --[[ Line: 55 ]] --[[ Name: Start ]]
        -- upvalues: v5 (ref)
        v5:HandleButton(v12.cancelButton, function() --[[ Line: 56 ]]
            -- upvalues: v5 (ref)
            v5:Toggle(script.Name, false);
        end);
    end, 
    Closed = function(v13) --[[ Line: 61 ]] --[[ Name: Closed ]]
        v13.inputBox.Text = "0";
        v13.highPriority = false;
        v13.dumpster:Destroy();
    end, 
    BindToClose = function(v14, v15) --[[ Line: 67 ]] --[[ Name: BindToClose ]]
        v14.dumpster:Add(v15);
    end, 
    Prompt = function(v16, v17) --[[ Line: 73 ]] --[[ Name: Prompt ]]
        -- upvalues: v5 (ref), v3 (copy), v4 (copy), v6 (ref)
        if v17.highPriority then
            v16.highPriority = true;
        end;
        local v18 = v17.minAmount or 0;
        v16.inputBox.Text = v18;
        v5:Toggle(script.Name, true);
        v16.messageLabel.Text = v17.message or "";
        v16.maxAmountLabel.Visible = v17.hasAmount ~= nil;
        v16.shopTotalFrame.Visible = v17.shopInfo ~= nil;
        if v17.hasAmount then
            v16.maxAmountLabel.Text = ("You have x%* of this item"):format(v17.hasAmount);
        end;
        if v17.maxAmount and v17.maxMessage then
            v16.maxAmountLabel.Text = string.format(v17.maxMessage, v3:CommaNumber(v17.maxAmount or 0));
            v16.maxAmountLabel.Visible = true;
        end;
        v16.dumpster:Add(v5:HandleButton(v16.confirmButton, function() --[[ Line: 96 ]]
            -- upvalues: v17 (copy), v18 (ref), v5 (ref)
            if v17.callback then
                task.spawn(v17.callback, v18);
            end;
            v5:Toggle(script.Name, false);
        end));
        local function _(v19) --[[ Line: 104 ]] --[[ Name: updateShopTotal ]]
            -- upvalues: v17 (copy), v16 (copy), v3 (ref), v4 (ref)
            local v20 = (v17.shopInfo.baseCost or v17.shopInfo.basePrice or 0) * (v19 or 0);
            v16.shopTotalFrame.Amount.Text = v3:CommaNumber(v20);
            v16.shopTotalFrame.Icon.Image = v4.Currency[v17.shopInfo.currencyName];
            v16.shopTotalFrame.Visible = true;
        end;
        local function _(v22) --[[ Line: 111 ]] --[[ Name: clampInput ]]
            -- upvalues: v17 (copy), v16 (copy), v3 (ref), v4 (ref)
            local v23 = math.round(if v17.maxAmount then math.clamp(v22, v17.minAmount or 0, v17.maxAmount) else v22);
            if v17.shopInfo then
                local v24 = (v17.shopInfo.baseCost or v17.shopInfo.basePrice or 0) * (v23 or 0);
                v16.shopTotalFrame.Amount.Text = v3:CommaNumber(v24);
                v16.shopTotalFrame.Icon.Image = v4.Currency[v17.shopInfo.currencyName];
                v16.shopTotalFrame.Visible = true;
            end;
            return v23;
        end;
        if v17.shopInfo then
            local v26 = v18 or 0;
            local v27 = (v17.shopInfo.baseCost or v17.shopInfo.basePrice or 0) * (v26 or 0);
            v16.shopTotalFrame.Amount.Text = v3:CommaNumber(v27);
            v16.shopTotalFrame.Icon.Image = v4.Currency[v17.shopInfo.currencyName];
            v16.shopTotalFrame.Visible = true;
        end;
        v16.dumpster:Add(v16.inputBox.FocusLost:Connect(function() --[[ Line: 126 ]]
            -- upvalues: v16 (copy), v18 (ref), v17 (copy), v3 (ref), v4 (ref)
            local l_Text_0 = v16.inputBox.Text;
            local v29 = tonumber(l_Text_0);
            if not v29 or v29 ~= v29 or v29 < 0 then
                v16.inputBox.Text = v18;
                return;
            else
                local v30 = math.round(if v17.maxAmount then math.clamp(l_Text_0, v17.minAmount or 0, v17.maxAmount) else l_Text_0);
                if v17.shopInfo then
                    local v31 = (v17.shopInfo.baseCost or v17.shopInfo.basePrice or 0) * (v30 or 0);
                    v16.shopTotalFrame.Amount.Text = v3:CommaNumber(v31);
                    v16.shopTotalFrame.Icon.Image = v4.Currency[v17.shopInfo.currencyName];
                    v16.shopTotalFrame.Visible = true;
                end;
                v18 = v30;
                v16.inputBox.Text = v18;
                return;
            end;
        end));
        v16.dumpster:Add(v5:HandleButton(v16.addButton, function() --[[ Line: 139 ]]
            -- upvalues: v18 (ref), v17 (copy), v16 (copy), v3 (ref), v4 (ref)
            local v32 = v18 + 1;
            local v33 = math.round(if v17.maxAmount then math.clamp(v32, v17.minAmount or 0, v17.maxAmount) else v32);
            if v17.shopInfo then
                local v34 = (v17.shopInfo.baseCost or v17.shopInfo.basePrice or 0) * (v33 or 0);
                v16.shopTotalFrame.Amount.Text = v3:CommaNumber(v34);
                v16.shopTotalFrame.Icon.Image = v4.Currency[v17.shopInfo.currencyName];
                v16.shopTotalFrame.Visible = true;
            end;
            v18 = v33;
            v16.inputBox.Text = v18;
        end));
        v16.dumpster:Add(v5:HandleButton(v16.minusButton, function() --[[ Line: 144 ]]
            -- upvalues: v18 (ref), v17 (copy), v16 (copy), v3 (ref), v4 (ref)
            local v35 = v18 - 1;
            local v36 = math.round(if v17.maxAmount then math.clamp(v35, v17.minAmount or 0, v17.maxAmount) else v35);
            if v17.shopInfo then
                local v37 = (v17.shopInfo.baseCost or v17.shopInfo.basePrice or 0) * (v36 or 0);
                v16.shopTotalFrame.Amount.Text = v3:CommaNumber(v37);
                v16.shopTotalFrame.Icon.Image = v4.Currency[v17.shopInfo.currencyName];
                v16.shopTotalFrame.Visible = true;
            end;
            v18 = v36;
            v16.inputBox.Text = v18;
        end));
        local v38 = v6:ObserveGamepadButtonPress(Enum.KeyCode.ButtonL2, function() --[[ Line: 149 ]]
            -- upvalues: v17 (copy), v18 (ref), v5 (ref)
            if v17.callback then
                task.spawn(v17.callback, v18);
            end;
            v5:Toggle(script.Name, false);
        end);
        local v39 = v6:ObserveGamepadButtonPress(Enum.KeyCode.ButtonR2, function() --[[ Line: 157 ]]
            -- upvalues: v5 (ref)
            v5:Toggle(script.Name, false);
        end);
        v16.dumpster:Add(function() --[[ Line: 161 ]]
            -- upvalues: v17 (copy), v38 (ref), v39 (ref)
            if v17.onFinished and typeof(v17.onFinished) == "function" then
                v17.onFinished();
            end;
            v38();
            v38 = nil;
            v39();
            v39 = nil;
        end);
    end
};