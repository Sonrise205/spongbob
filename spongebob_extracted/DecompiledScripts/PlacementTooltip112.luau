local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local l_Objects_0 = l_ReplicatedStorage_0.GUI.Objects;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v8 = {};
v8.__index = v8;
local v9 = nil;
local function _(v10) --[[ Line: 28 ]] --[[ Name: getXScale ]]
    -- upvalues: l_CurrentCamera_0 (copy)
    return v10 * (l_CurrentCamera_0.ViewportSize.X / 1920);
end;
local function _(v12) --[[ Line: 35 ]] --[[ Name: getYScale ]]
    -- upvalues: l_CurrentCamera_0 (copy)
    return v12 * (l_CurrentCamera_0.ViewportSize.Y / 1079);
end;
v8.new = function(v14) --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_Objects_0 (copy), v8 (copy), v2 (copy), l_RunService_0 (copy)
    if not v14 then
        return;
    else
        local v15 = setmetatable({
            dumpster = v3.new(), 
            model = v14, 
            ui = l_Objects_0.PlacementTooltip:Clone()
        }, v8);
        v15.ui.Enabled = false;
        v15.ui.Parent = v2.PlayerGui;
        v15.main = v15.ui.Main;
        v15.uiScale = v15.main.UIScale;
        v15.dumpster:Add(v15.ui);
        v15.dumpster:Add(function() --[[ Line: 61 ]]
            -- upvalues: v15 (copy)
            v15.ui = nil;
            v15.main = nil;
        end);
        l_RunService_0.Heartbeat:Once(function() --[[ Line: 66 ]]
            -- upvalues: v15 (copy)
            v15:Start();
        end);
        return v15;
    end;
end;
v8.Start = function(v16) --[[ Line: 74 ]] --[[ Name: Start ]]
    -- upvalues: v9 (ref), v5 (copy), l_CurrentCamera_0 (copy)
    local l_Conditions_0 = v9.LevelInfo:Get().Conditions;
    if not v16.main then
        return;
    else
        local l_Condition_0 = v16.main.Condition;
        local l_v5_PlacementConditionData_0, v20, v21 = v5:GetPlacementConditionData(l_Conditions_0);
        if l_v5_PlacementConditionData_0 and v20 then
            l_Condition_0.Icon.Image = l_v5_PlacementConditionData_0.icon;
            l_Condition_0.Icon.UIGradient.Color = l_v5_PlacementConditionData_0.colors;
            l_Condition_0.Title.UIGradient.Color = l_v5_PlacementConditionData_0.colors;
            l_Condition_0.Title.Text = v21;
            l_Condition_0.Visible = false;
            local function v22() --[[ Line: 92 ]] --[[ Name: updateCondition ]]
                -- upvalues: v16 (copy), l_Condition_0 (copy)
                l_Condition_0.Visible = not v16.model:GetAttribute("InPlacementCondition");
            end;
            l_Condition_0.Visible = not v16.model:GetAttribute("InPlacementCondition");
            v16.dumpster:Add(v16.model:GetAttributeChangedSignal("InPlacementCondition"):Connect(v22));
        else
            l_Condition_0:Destroy();
        end;
        v16.dumpster:BindToRenderStep("PlacementTooltip", Enum.RenderPriority.Camera.Value + 1, function() --[[ Line: 103 ]]
            -- upvalues: v16 (copy), l_CurrentCamera_0 (ref)
            if not v16.model or not v16.model.PrimaryPart then
                v16:Destroy();
                return;
            else
                local l_Position_0 = v16.model.PrimaryPart.Position;
                local v24 = l_CurrentCamera_0:WorldToScreenPoint(l_Position_0);
                local l_Magnitude_0 = (l_Position_0 - l_CurrentCamera_0.CFrame.Position).Magnitude;
                local v26 = 1;
                if l_Magnitude_0 >= 24 then
                    v26 = math.clamp(1 / ((l_Magnitude_0 - 24) * 0.1), 0.65, 1);
                end;
                v16.uiScale.Scale = v26;
                local v27 = v26 * 100 * (l_CurrentCamera_0.ViewportSize.X / 1920);
                local v28 = v26 * 6 * (l_CurrentCamera_0.ViewportSize.Y / 1079);
                v16.main.Position = UDim2.fromOffset(v24.X + v27, v24.Y + v28);
                v16.ui.Enabled = true;
                return;
            end;
        end);
        return;
    end;
end;
v8.Destroy = function(v29) --[[ Line: 132 ]] --[[ Name: Destroy ]]
    v29.dumpster:Destroy();
end;
v2.OnStart():andThen(function() --[[ Line: 137 ]]
    -- upvalues: v9 (ref), v2 (copy)
    v9 = v2.GetService("GameService");
end);
return v8;