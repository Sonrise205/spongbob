local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
return {
    primaryMenu = true, 
    blur = true, 
    Init = function(v11, v12) --[[ Line: 36 ]] --[[ Name: Init ]]
        -- upvalues: v6 (ref), v2 (copy), v7 (ref), v8 (ref), v9 (ref), v10 (ref)
        v6 = v2.GetController("DataController");
        v7 = v2.GetController("UIController");
        v8 = v2.GetService("PromoCodeService");
        v9 = v2.GetController("AudioController");
        v10 = v2.GetController("DeviceTypeController");
        v11.ui = v12;
        v11.main = v12.Main;
        v11.content = v11.main.Content;
        v11.inputBox = v11.content.TextBox;
        v11.placeholderText = v11.inputBox.PlaceholderText;
        v11.placeholderColor = v11.inputBox.PlaceholderColor3;
        v11.exitBtn = v11.main.Exit;
        v11.redeemBtn = v11.content.Redeem;
    end, 
    Start = function(v13, _) --[[ Line: 55 ]] --[[ Name: Start ]]
        -- upvalues: v7 (ref), v8 (ref), v5 (copy), v9 (ref)
        v7:HandleButton(v13.exitBtn, function() --[[ Line: 56 ]]
            -- upvalues: v7 (ref)
            v7:Toggle(script.Name, false);
        end);
        local v15 = false;
        v7:HandleButton(v13.redeemBtn, function() --[[ Line: 62 ]]
            -- upvalues: v15 (ref), v13 (copy), v8 (ref), v5 (ref), v9 (ref)
            if v15 then
                return;
            else
                v15 = true;
                v13.inputBox.Interactable = false;
                local _, v17, v18 = v8:Redeem(v13.inputBox.Text):await();
                local v19 = "Successfully Redeemed!";
                local v20 = "UI.Success";
                local l_Green_0 = v5.Solid.Green;
                if not v17 then
                    v19 = v18 or "Code Invalid!";
                    v20 = "UI.Error";
                    l_Green_0 = v5.Solid.Red;
                end;
                if v20 ~= "" then
                    v9:PlaySound({
                        name = v20, 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                v13.inputBox.Text = "";
                v13.inputBox.PlaceholderText = v19;
                v13.inputBox.PlaceholderColor3 = l_Green_0;
                task.wait(1.5);
                v13.inputBox.PlaceholderText = v13.placeholderText;
                v13.inputBox.PlaceholderColor3 = v13.placeholderColor;
                v15 = false;
                v13.inputBox.Interactable = true;
                return;
            end;
        end);
    end, 
    Opened = function(v22) --[[ Line: 102 ]] --[[ Name: Opened ]]
        -- upvalues: v10 (ref), l_GuiService_0 (copy)
        if v10:IsConsole() then
            l_GuiService_0.SelectedObject = v22.inputBox;
        end;
    end, 
    Closed = function(v23) --[[ Line: 108 ]] --[[ Name: Closed ]]
        v23.inputBox.Text = "";
    end
};