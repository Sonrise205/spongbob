local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_GamepadService_0 = game:GetService("GamepadService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local l_STARTER_UNITS_0 = v7.STARTER_UNITS;
return {
    primaryMenu = false, 
    Init = function(_, _) --[[ Line: 40 ]] --[[ Name: Init ]]
        -- upvalues: v10 (ref), v4 (copy), v11 (ref), v12 (ref), v13 (ref), v14 (ref)
        v10 = v4.GetController("DataController");
        v11 = v4.GetController("UIController");
        v12 = v4.GetController("NPEController");
        v13 = v4.GetController("AudioController");
        v14 = v4.GetController("DeviceTypeController");
    end, 
    Start = function(v18, v19) --[[ Line: 49 ]] --[[ Name: Start ]]
        -- upvalues: v12 (ref), l_RunService_0 (copy), l_TweenService_0 (copy), v11 (ref), v13 (ref), v8 (copy), l_STARTER_UNITS_0 (copy), v9 (copy)
        v18.ui = v19;
        v12.ConfirmationWindowClosed:Connect(function() --[[ Line: 52 ]]
            -- upvalues: v18 (copy), l_RunService_0 (ref)
            for _, v21 in v18.ui:GetChildren() do
                if v21:IsA("GuiButton") then
                    task.spawn(function() --[[ Line: 58 ]]
                        -- upvalues: v21 (copy), l_RunService_0 (ref)
                        v21.Visible = false;
                        l_RunService_0.RenderStepped:Wait();
                        l_RunService_0.RenderStepped:Wait();
                        l_RunService_0.RenderStepped:Wait();
                        l_RunService_0.RenderStepped:Wait();
                        l_RunService_0.RenderStepped:Wait();
                        l_RunService_0.RenderStepped:Wait();
                        v21.Visible = true;
                    end);
                end;
            end;
        end);
        for _, v23 in v18.ui:GetChildren() do
            if v23:IsA("GuiButton") then
                local v24 = tonumber(v23.Name);
                if v24 then
                    local v25 = TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
                    local v26 = {
                        l_TweenService_0:Create(v23.UnitInfo.UnitName, v25, {
                            Position = v23.UnitInfo.UnitName.Position
                        }), 
                        l_TweenService_0:Create(v23.UnitInfo.UnitRarity, v25, {
                            Position = v23.UnitInfo.UnitRarity.Position
                        })
                    };
                    local v27 = {
                        [v23.UnitInfo.UnitName] = {
                            Position = UDim2.fromScale(v23.UnitInfo.UnitName.Position.X.Scale, v23.UnitInfo.UnitName.Position.Y.Scale - 0.1)
                        }, 
                        [v23.UnitInfo.UnitRarity] = {
                            Position = UDim2.fromScale(v23.UnitInfo.UnitRarity.Position.X.Scale, v23.UnitInfo.UnitRarity.Position.Y.Scale + 0.2)
                        }
                    };
                    local function _() --[[ Line: 108 ]] --[[ Name: resetProps ]]
                        -- upvalues: v23 (copy), v27 (copy)
                        v23.UnitInfo.Visible = false;
                        for v28, v29 in v27 do
                            for v30, v31 in v29 do
                                v28[v30] = v31;
                            end;
                        end;
                    end;
                    v11:HandleButton(v23, function() --[[ Line: 118 ]]
                        -- upvalues: v12 (ref), v24 (copy)
                        v12.UnitSelected:Fire(v24);
                    end, {
                        MouseEnter = function() --[[ Line: 121 ]]
                            -- upvalues: v12 (ref), v23 (copy), v18 (copy), v13 (ref), v26 (copy), v24 (copy)
                            if v12._messagePrompt then
                                return;
                            else
                                v23.UnitInfo.Visible = true;
                                if v18._hoverSFX then
                                    v18._hoverSFX:Stop();
                                    v18._hoverSFX = nil;
                                end;
                                v18._hoverSFX = v13:PlaySound({
                                    name = "UI.NPEHover", 
                                    soundGroup = "Master.SFX.UI"
                                });
                                if v18._hoverSFX then
                                    v18._hoverSFX.Stopped:Once(function() --[[ Line: 139 ]]
                                        -- upvalues: v18 (ref)
                                        v18._hoverSFX = nil;
                                    end);
                                end;
                                for _, v34 in v26 do
                                    v34:Play();
                                end;
                                v12.NPEHoverEntered:Fire(v24);
                                return;
                            end;
                        end, 
                        MouseLeave = function() --[[ Line: 151 ]]
                            -- upvalues: v12 (ref), v24 (copy), v23 (copy), v27 (copy)
                            v12.NPEHoverLeft:Fire(v24);
                            if v12._messagePrompt then
                                v12.ConfirmationWindowClosed:Wait();
                            end;
                            v23.UnitInfo.Visible = false;
                            for v35, v36 in v27 do
                                for v37, v38 in v36 do
                                    v35[v37] = v38;
                                end;
                            end;
                        end
                    });
                    local l_v8_UnitValue_0 = v8:GetUnitValue(l_STARTER_UNITS_0[v24], "FullName");
                    local _, v41 = v8:GetRarity(l_STARTER_UNITS_0[v24]);
                    v9.new(v23.UnitInfo.UnitRarity, v41);
                    v23.UnitInfo.UnitRarity.Text = v41;
                    v23.UnitInfo.UnitName.Text = l_v8_UnitValue_0;
                    v23.BackgroundTransparency = 1;
                    v23.UnitInfo.Visible = false;
                    for v42, v43 in v27 do
                        for v44, v45 in v43 do
                            v42[v44] = v45;
                        end;
                    end;
                end;
            end;
        end;
    end, 
    Opened = function(_) --[[ Line: 179 ]] --[[ Name: Opened ]]
        -- upvalues: v14 (ref), l_GamepadService_0 (copy)
        if v14:IsConsole() then
            l_GamepadService_0:EnableGamepadCursor(nil);
        end;
    end, 
    Closed = function(_) --[[ Line: 185 ]] --[[ Name: Closed ]]

    end
};