local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("UserInputService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.Fusion);
local l_scoped_0 = v4.scoped;
local l_peek_0 = v4.peek;
local l_doCleanup_0 = v4.doCleanup;
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v9 = {
    HUD = 265, 
    NO_HUD = 50
};
local v10 = {
    POSITIVE = {
        BACKGROUND = Color3.fromRGB(42, 188, 26), 
        STROKE = Color3.fromRGB(12, 103, 20)
    }, 
    NEGATIVE = {
        BACKGROUND = Color3.fromRGB(188, 29, 50), 
        STROKE = Color3.fromRGB(138, 22, 30)
    }, 
    NEUTRAL = {
        BACKGROUND = Color3.fromRGB(38, 38, 118), 
        STROKE = Color3.fromRGB(24, 58, 111)
    }, 
    SPECIAL = {
        BACKGROUND = Color3.fromRGB(255, 191, 0), 
        STROKE = Color3.fromRGB(100, 78, 0)
    }, 
    ADMIN = {
        BACKGROUND = Color3.fromRGB(255, 191, 0), 
        STROKE = Color3.fromRGB(100, 78, 0)
    }
};
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = {};
local v16 = 0;
local v17 = 0;
return {
    primaryMenu = false, 
    Init = function(v18, _, v20) --[[ Line: 76 ]] --[[ Name: Init ]]
        -- upvalues: v11 (ref), v2 (copy), v12 (ref), v13 (ref)
        v18.currentMode = v20;
        v11 = v2.GetService("NotificationService");
        v12 = v2.GetController("AudioController");
        v13 = v2.GetController("UIController");
    end, 
    Start = function(v21, v22) --[[ Line: 86 ]] --[[ Name: Start ]]
        -- upvalues: v14 (ref), v13 (ref), v11 (ref), v9 (copy)
        v14 = v13:GetModuleAsync("HUD"):expect();
        v21.ui = v22;
        v21.main = v21.ui.Main;
        v21.template = v21.main.Template;
        v21.template.Visible = false;
        v21.template.UIScale.Scale = 1.5;
        v21.template.Content.UIScale.Scale = 0.5;
        v21.template.Content.BackgroundTransparency = 1;
        v21.template.Content.Label.TextTransparency = 1;
        v21.template.Content.Label.UIStroke.Transparency = 1;
        v11.Notify:Connect(function(v23) --[[ Line: 100 ]]
            -- upvalues: v21 (copy)
            v21:Notify(v23);
        end);
        v21.padding = v21.main.UIPadding;
        v21.originalPadding = v21.padding:GetAttribute("OriginalPaddingBottom") or v21.padding.PaddingBottom.Offset;
        local v24 = UDim.new(0, v21.originalPadding);
        v21.padding.PaddingBottom = v24;
        v21.padding:SetAttribute("OriginalPaddingBottom", v24);
        local function _(v25) --[[ Line: 112 ]] --[[ Name: adjustHUDPadding ]]
            -- upvalues: v21 (copy), v9 (ref)
            if v21.currentMode == "Cave" then
                v21:SetPadding(v9.NO_HUD);
                return;
            else
                v21:SetPadding(if v25 then v9.HUD else v9.NO_HUD);
                return;
            end;
        end;
        if v21.currentMode == "Cave" then
            v21:SetPadding(v9.NO_HUD);
        else
            v21:SetPadding(v9.HUD);
        end;
        v13.Toggling:Connect(function(v27, v28) --[[ Line: 124 ]]
            -- upvalues: v21 (copy), v9 (ref)
            if v27 == "HUD" then
                if v21.currentMode == "Cave" then
                    v21:SetPadding(v9.NO_HUD);
                    return;
                else
                    v21:SetPadding(if v28 then v9.HUD else v9.NO_HUD);
                end;
            end;
        end);
        v14.ToggledUnitsBar:Connect(function(v29) --[[ Line: 130 ]]
            -- upvalues: v21 (copy), v9 (ref)
            if v21.currentMode == "Cave" then
                v21:SetPadding(v9.NO_HUD);
                return;
            else
                v21:SetPadding(if v29 then v9.HUD else v9.NO_HUD);
                return;
            end;
        end);
    end, 
    CanOpen = function(_) --[[ Line: 135 ]] --[[ Name: CanOpen ]]
        return true;
    end, 
    Notify = function(v31, v32) --[[ Line: 140 ]] --[[ Name: Notify ]]
        -- upvalues: v16 (ref), v15 (copy), v17 (ref), l_scoped_0 (copy), v4 (copy), v10 (copy), l_peek_0 (copy), l_doCleanup_0 (copy), v13 (ref), v12 (ref)
        local v33 = v32.message or v32.text;
        local l_duration_0 = v32.duration;
        local l_isPositive_0 = v32.isPositive;
        local l_isSpecial_0 = v32.isSpecial;
        local v37 = v32.isAdminAnnouncement or false;
        local v38 = false;
        if l_isPositive_0 == nil then
            v38 = false;
            if l_isSpecial_0 == nil then
                v38 = v37 == nil;
            end;
        end;
        if v16 + 1 > 5 then
            if #v15 + 1 > 6 then
                return;
            else
                table.insert(v15, {
                    message = v33, 
                    duration = l_duration_0, 
                    isPositive = l_isPositive_0, 
                    isAdmin = v37
                });
                return;
            end;
        else
            l_duration_0 = l_duration_0 or 3;
            local v39 = false;
            v16 = v16 + 1;
            v17 = v17 + 1;
            local v40 = l_scoped_0(v4);
            local v41 = v40:Value(0);
            local v42 = v40:Spring(v41, 20, 1);
            local v43 = v31.template:Clone();
            local l_UIScale_0 = v43.UIScale;
            local l_Content_0 = v43.Content;
            local l_Label_0 = l_Content_0.Label;
            local l_UIScale_1 = l_Content_0.UIScale;
            v43.Name = v17;
            local v48 = if v38 then v10.NEUTRAL else if l_isPositive_0 then v10.POSITIVE else if l_isSpecial_0 then v10.SPECIAL else if v37 then v10.ADMIN else v10.NEGATIVE;
            l_Content_0.BackgroundColor3 = v48.BACKGROUND;
            l_Label_0.UIStroke.Color = v48.STROKE;
            l_Label_0.Text = v33;
            v40:Observer(v42):onBind(function() --[[ Line: 199 ]]
                -- upvalues: l_peek_0 (ref), v42 (copy), l_UIScale_1 (copy), l_Content_0 (copy), l_Label_0 (copy), v39 (ref), v37 (copy), l_UIScale_0 (copy), l_doCleanup_0 (ref), v40 (copy), v43 (copy)
                local v49 = l_peek_0(v42);
                l_UIScale_1.Scale = v49;
                l_Content_0.BackgroundTransparency = 1 - v49;
                l_Label_0.TextTransparency = 1 - v49;
                l_Label_0.UIStroke.Transparency = 1 - v49;
                if not v39 then
                    l_UIScale_0.Scale = (v37 and 2 or 1.5) - v49 * 0.5;
                end;
                if v39 and v49 == 0 then
                    l_doCleanup_0(v40);
                    v43:Destroy();
                end;
            end);
            v43.Visible = true;
            v43.Parent = if v37 then v31.ui.Main_Admin else v31.main;
            v41:set(1);
            v13:HandleShaker(l_Content_0, {
                speed = 0.05, 
                limit = 2, 
                rotation = 3
            }):Start(nil, true);
            if not v32.sfxName then
                if l_isPositive_0 ~= nil then
                    v12:PlaySound({
                        name = ("UI.%*"):format(l_isPositive_0 and "Success" or "Error"), 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
                if l_isSpecial_0 then
                    v12:PlaySound({
                        name = "UI.Special_Notification", 
                        soundGroup = "Master.SFX.UI"
                    });
                end;
            else
                v12:PlaySound({
                    name = v32.sfxName, 
                    soundGroup = "Master.SFX.UI"
                });
            end;
            task.delay(l_duration_0, function() --[[ Line: 250 ]]
                -- upvalues: v39 (ref), v41 (copy), v16 (ref), v15 (ref), v31 (copy)
                v39 = true;
                v41:set(0);
                v16 = v16 - 1;
                if #v15 > 0 then
                    local v50 = table.remove(v15, 1);
                    v31:Notify(v50);
                end;
            end);
            return;
        end;
    end, 
    AdjustPadding = function(v51, v52) --[[ Line: 262 ]] --[[ Name: AdjustPadding ]]
        v51.padding:SetAttribute("OriginalPaddingBottom", UDim.new(0, v51.originalPadding + v52));
    end, 
    SetPadding = function(v53, v54) --[[ Line: 266 ]] --[[ Name: SetPadding ]]
        v53.padding:SetAttribute("OriginalPaddingBottom", UDim.new(0, v54 or v53.originalPadding));
    end
};