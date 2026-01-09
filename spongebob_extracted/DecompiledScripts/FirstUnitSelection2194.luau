local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_GamepadService_0 = game:GetService("GamepadService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local _ = v7.STARTER_UNITS;
local l_STARTER_TEAMS_0 = v7.STARTER_TEAMS;
return {
    primaryMenu = false, 
    Init = function(_, _) --[[ Line: 41 ]] --[[ Name: Init ]]
        -- upvalues: v10 (ref), v4 (copy), v11 (ref), v12 (ref), v13 (ref), v14 (ref)
        v10 = v4.GetController("DataController");
        v11 = v4.GetController("UIController");
        v12 = v4.GetController("NPEController");
        v13 = v4.GetController("AudioController");
        v14 = v4.GetController("DeviceTypeController");
    end, 
    Start = function(v19, v20) --[[ Line: 50 ]] --[[ Name: Start ]]
        -- upvalues: v12 (ref), l_RunService_0 (copy), l_STARTER_TEAMS_0 (copy), l_TweenService_0 (copy), v11 (ref), v13 (ref), v8 (copy)
        v19.ui = v20;
        v19.main = v20.Main;
        v12.ConfirmationWindowClosed:Connect(function() --[[ Line: 54 ]]
            -- upvalues: v19 (copy), l_RunService_0 (ref)
            for _, v22 in v19.ui:GetChildren() do
                if v22:IsA("GuiButton") then
                    task.spawn(function() --[[ Line: 60 ]]
                        -- upvalues: v22 (copy), l_RunService_0 (ref)
                        v22.Visible = false;
                        l_RunService_0.RenderStepped:Wait();
                        l_RunService_0.RenderStepped:Wait();
                        l_RunService_0.RenderStepped:Wait();
                        l_RunService_0.RenderStepped:Wait();
                        l_RunService_0.RenderStepped:Wait();
                        l_RunService_0.RenderStepped:Wait();
                        v22.Visible = true;
                    end);
                end;
            end;
        end);
        for _, v24 in v19.main:GetChildren() do
            if v24:IsA("GuiButton") then
                local v25 = tonumber(v24.Name);
                if not v25 then
                    v24.Visible = false;
                else
                    local v26 = l_STARTER_TEAMS_0[v25] and l_STARTER_TEAMS_0[v25][1];
                    if not v26 then
                        v24.Visible = false;
                    else
                        local v27 = TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
                        local _ = {
                            l_TweenService_0:Create(v24.UnitInfo.UnitName, v27, {
                                Position = v24.UnitInfo.UnitName.Position
                            }), 
                            l_TweenService_0:Create(v24.UnitInfo.UnitRarity, v27, {
                                Position = v24.UnitInfo.UnitRarity.Position
                            })
                        };
                        local v29 = {
                            [v24.UnitInfo.UnitName] = {
                                Position = UDim2.fromScale(v24.UnitInfo.UnitName.Position.X.Scale, v24.UnitInfo.UnitName.Position.Y.Scale - 0.1)
                            }, 
                            [v24.UnitInfo.UnitRarity] = {
                                Position = UDim2.fromScale(v24.UnitInfo.UnitRarity.Position.X.Scale, v24.UnitInfo.UnitRarity.Position.Y.Scale + 0.2)
                            }
                        };
                        local function _() --[[ Line: 118 ]] --[[ Name: resetProps ]]
                            -- upvalues: v24 (copy), v29 (copy)
                            v24.UnitInfo.Visible = false;
                            for v30, v31 in v29 do
                                for v32, v33 in v31 do
                                    v30[v32] = v33;
                                end;
                            end;
                        end;
                        v11:HandleButton(v24, function() --[[ Line: 128 ]]
                            -- upvalues: v12 (ref), v25 (copy)
                            v12.TeamSelected:Fire(v25);
                        end, {
                            MouseEnter = function() --[[ Line: 132 ]]
                                -- upvalues: v12 (ref), v19 (copy), v13 (ref), v25 (copy)
                                if v12._messagePrompt then
                                    return;
                                else
                                    if v19._hoverSFX then
                                        v19._hoverSFX:Stop();
                                        v19._hoverSFX = nil;
                                    end;
                                    v19._hoverSFX = v13:PlaySound({
                                        name = "UI.NPEHover", 
                                        soundGroup = "Master.SFX.UI"
                                    });
                                    if v19._hoverSFX then
                                        v19._hoverSFX.Stopped:Once(function() --[[ Line: 150 ]]
                                            -- upvalues: v19 (ref)
                                            v19._hoverSFX = nil;
                                        end);
                                    end;
                                    v12.NPEHoverEntered:Fire(v25);
                                    return;
                                end;
                            end, 
                            MouseLeave = function() --[[ Line: 162 ]]
                                -- upvalues: v12 (ref), v25 (copy), v24 (copy), v29 (copy)
                                v12.NPEHoverLeft:Fire(v25);
                                if v12._messagePrompt then
                                    v12.ConfirmationWindowClosed:Wait();
                                end;
                                v24.UnitInfo.Visible = false;
                                for v35, v36 in v29 do
                                    for v37, v38 in v36 do
                                        v35[v37] = v38;
                                    end;
                                end;
                            end
                        });
                        local l_v8_UnitValue_0 = v8:GetUnitValue(v26, "FullName");
                        local v40 = select(2, v8:GetRarity(v26));
                        v24.UnitInfo.UnitRarity.Text = v40;
                        v24.UnitInfo.UnitName.Text = l_v8_UnitValue_0 .. "'s Team";
                        v24.BackgroundTransparency = 1;
                        v24.UnitInfo.Visible = false;
                        for v41, v42 in v29 do
                            for v43, v44 in v42 do
                                v41[v43] = v44;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end, 
    Opened = function(_) --[[ Line: 190 ]] --[[ Name: Opened ]]
        -- upvalues: v14 (ref), l_GamepadService_0 (copy)
        if v14:IsConsole() then
            l_GamepadService_0:EnableGamepadCursor(nil);
        end;
    end, 
    Closed = function(_) --[[ Line: 196 ]] --[[ Name: Closed ]]

    end
};