local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v4 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v5 = nil;
local v6 = nil;
local v7 = nil;
local l_Objects_0 = l_ReplicatedStorage_0.GUI.Objects;
local v9 = nil;
local v10 = {};
v10.__index = v10;
v10.new = function(v11) --[[ Line: 31 ]] --[[ Name: new ]]
    -- upvalues: v5 (ref), v1 (copy), v6 (ref), v7 (ref), v2 (copy), l_Objects_0 (copy), v10 (copy)
    if not v5 then
        v5 = v1.GetController("UIController");
        v6 = v1.GetController("TowerController");
        v7 = v5:GetModuleAsync("HUD"):expect();
    end;
    local v12 = setmetatable({
        model = v11, 
        dumpster = v2.new(), 
        ui = l_Objects_0[script.Name]:Clone()
    }, v10);
    v12.ui.Enabled = true;
    v12.ui.Parent = v1.PlayerGui;
    v12.main = v12.ui.Main;
    v12.dumpster:Add(v12.ui);
    v12.dumpster:Add(function() --[[ Line: 52 ]]
        -- upvalues: v12 (copy)
        v12.ui = nil;
        v12.main = nil;
    end);
    v12:Start();
    return v12;
end;
v10.Start = function(v13) --[[ Line: 63 ]] --[[ Name: Start ]]
    -- upvalues: v9 (ref), v4 (copy), v5 (ref), v6 (ref)
    local l_Conditions_0 = v9.LevelInfo:Get().Conditions;
    local l_Condition_0 = v13.main.Unsorted.Condition;
    local l_v4_PlacementConditionData_0, v17, v18 = v4:GetPlacementConditionData(l_Conditions_0);
    if l_v4_PlacementConditionData_0 and v17 then
        l_Condition_0.Icon.Image = l_v4_PlacementConditionData_0.icon;
        l_Condition_0.Icon.UIGradient.Color = l_v4_PlacementConditionData_0.colors;
        l_Condition_0.Title.UIGradient.Color = l_v4_PlacementConditionData_0.colors;
        l_Condition_0.Title.Text = v18;
        l_Condition_0.Visible = false;
        local function v19() --[[ Line: 77 ]] --[[ Name: updateCondition ]]
            -- upvalues: v13 (copy), l_Condition_0 (copy)
            l_Condition_0.Visible = not v13.model:GetAttribute("InPlacementCondition");
        end;
        l_Condition_0.Visible = not v13.model:GetAttribute("InPlacementCondition");
        v13.dumpster:Add(v13.model:GetAttributeChangedSignal("InPlacementCondition"):Connect(v19));
    else
        l_Condition_0:Destroy();
    end;
    v5:HandleButton(v13.main.Place, function() --[[ Line: 88 ]]
        -- upvalues: v6 (ref)
        v6:AttemptToPlaceTower();
    end);
    v5:HandleButton(v13.main.Rotate, function() --[[ Line: 92 ]]
        -- upvalues: v6 (ref)
        v6:UpdatePlacementRotation();
    end);
    v5:HandleButton(v13.main.Cancel, function() --[[ Line: 96 ]]
        -- upvalues: v6 (ref)
        v6:StopTowerPlacement();
    end);
end;
v10.Destroy = function(v20) --[[ Line: 101 ]] --[[ Name: Destroy ]]
    v20.dumpster:Destroy();
end;
v1.OnStart():andThen(function() --[[ Line: 107 ]]
    -- upvalues: v9 (ref), v1 (copy)
    v9 = v1.GetService("GameService");
end);
return v10;