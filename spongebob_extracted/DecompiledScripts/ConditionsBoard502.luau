local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v9 = v2.GetController("UIController");
local v10 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
v10.Construct = function(v11) --[[ Line: 32 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v11.dumpster = v4.new();
end;
v10.Start = function(v12) --[[ Line: 37 ]] --[[ Name: Start ]]
    -- upvalues: v2 (copy), v8 (copy), v7 (copy), v9 (copy)
    local v13 = v12.Instance:Clone();
    v13.Parent = v2.Player.PlayerGui;
    v12.Instance.Enabled = false;
    v12.Instance.Active = false;
    v13.Enabled = true;
    v13.Active = true;
    v13.Adornee = v12.Instance.Adornee;
    local l_Conditions_0 = v13.Conditions;
    local l_Details_0 = v13.Details;
    local l_ConditionTooltip_0 = l_Details_0.Description.ConditionTooltip;
    local l_Title_0 = l_ConditionTooltip_0.Content.Main.Description.Title;
    local l_Cancel_0 = l_ConditionTooltip_0.Cancel;
    local l_Icon_0 = l_Details_0.Icon;
    local function v26(v20) --[[ Line: 55 ]] --[[ Name: showCondition ]]
        -- upvalues: v8 (ref), l_Title_0 (copy), l_Icon_0 (copy), l_Details_0 (copy), l_Conditions_0 (copy)
        local l_v8_ConditionData_0, v22 = v8:GetConditionData(v20);
        if not l_v8_ConditionData_0 then
            return;
        else
            local l_richDescription_0 = l_v8_ConditionData_0.richDescription;
            if v22 and v22.tiers then
                local v24 = v22.tiers[1];
                local v25 = v22.tiers[#v22.tiers];
                l_richDescription_0 = string.gsub(l_richDescription_0, "~modifier~", (("%*-%*"):format(v24.modifier, v25.modifier)));
            end;
            l_Title_0.Text = l_richDescription_0;
            l_Icon_0.Icon.Image = l_v8_ConditionData_0.icon;
            l_Icon_0.Title.Text = v20;
            l_Icon_0.UIGradient.Color = l_v8_ConditionData_0.colors;
            l_Icon_0.Title.UIGradient.Color = l_v8_ConditionData_0.colors;
            l_Details_0.Visible = true;
            l_Conditions_0.Visible = false;
            return;
        end;
    end;
    for v27 in v7.IN_GAME.CONDITIONS do
        local l_l_Conditions_0_FirstChild_0 = l_Conditions_0:FindFirstChild(v27);
        if l_l_Conditions_0_FirstChild_0 then
            v9:HandleButton(l_l_Conditions_0_FirstChild_0, function() --[[ Line: 84 ]]
                -- upvalues: v26 (copy), v27 (copy)
                v26(v27);
            end);
        end;
    end;
    v9:HandleButton(l_Cancel_0, function() --[[ Line: 89 ]]
        -- upvalues: l_Details_0 (copy), l_Conditions_0 (copy)
        l_Details_0.Visible = false;
        l_Conditions_0.Visible = true;
    end);
end;
v10.Stop = function(v29) --[[ Line: 95 ]] --[[ Name: Stop ]]
    v29.dumpster:Destroy();
end;
return v10;