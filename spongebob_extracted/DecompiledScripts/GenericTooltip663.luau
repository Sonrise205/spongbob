local l_GuiService_0 = game:GetService("GuiService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local l_PreferredInput_0 = require(l_ReplicatedStorage_0.Packages.Input).PreferredInput;
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v9 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v10 = require(l_ReplicatedStorage_0.Shared.Modules.RarityVisuals);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.FoodShared);
local v12 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v14 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedFirst_0.PlaceIds);
local v16 = require(l_ReplicatedStorage_0.TraitsData);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.CraftingData);
local v18 = require(l_ReplicatedStorage_0.Shared.Util.CraftingUtils);
local v19 = require(l_ReplicatedStorage_0.Shared.Data.SpritesheetAtlas);
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = UDim2.fromScale(-1, -1);
local v26 = Vector2.new(40, 0);
local v27 = l_ReplicatedStorage_0.GUI.Objects.GenericTooltip:Clone();
local v28 = {};
v28.__index = v28;
local v29 = {};
local v30 = nil;
local function _(v31, v32, v33) --[[ Line: 66 ]] --[[ Name: fillStatLabel ]]
    local v34 = v32 > 0 and "+" or "";
    local v35 = v33 and "" or "%";
    v31.StatAmount.Text = ("%*%*%*"):format(v34, v32, v35);
    v31.Visible = v32 ~= 0;
end;
v28.new = function(v37, v38, v39) --[[ Line: 74 ]] --[[ Name: new ]]
    -- upvalues: v20 (ref), v5 (copy), v21 (ref), v22 (ref), v23 (ref), v24 (ref), v27 (copy), v6 (copy), v28 (copy), v29 (copy)
    if not v20 then
        v20 = v5.GetController("DataController");
        v21 = v5.GetController("DeviceTypeController");
        v22 = v5.GetController("GlobalUnitTrackerController");
        v23 = v5.GetController("PurchaseController");
        v24 = v5.GetController("PetController");
    end;
    if not v38 or not v38.Name then
        return;
    else
        local v40 = if not (not not v38.IsUnitType or v38.IsAttackTypeDisplay or v38.IsTraitDisplay or v38.IsRelicDisplay) and (not v38.IsEffectType or v38.ShowEffectDescription) then if v38.IsEffectType and v38.ShowEffectDescription then v27.ConditionTooltip else if v38.IsUnit then v27.UnitTooltip else if v38.IsPet then v27.PetTooltip else if v38.IsCondition then v27.ConditionTooltip else v27.Tooltip else v27.UnitTypeTooltip;
        local v41 = setmetatable({
            Enabled = true, 
            object = v37, 
            tooltip = v40, 
            content = v40.Content, 
            props = v38, 
            predicate = v39, 
            cleanupTasks = {}, 
            dumpster = v6.new()
        }, v28);
        v41.dumpster:Add(function() --[[ Line: 119 ]]
            -- upvalues: v41 (copy)
            for _, v43 in v41.cleanupTasks do
                task.spawn(v43);
            end;
        end);
        v41.dumpster:Add(v37.AncestryChanged:Once(function() --[[ Line: 125 ]]
            -- upvalues: v41 (copy), v37 (copy)
            if v41.dumpster:Get("AncestryChanged") then
                v41.dumpster:Remove("AncestryChanged", true);
            end;
            if not v37.Parent then
                v41:Destroy();
            end;
        end), "AncestryChanged");
        v29[v37] = v41;
        return v41;
    end;
end;
v28.Hide = function(v44) --[[ Line: 142 ]] --[[ Name: Hide ]]
    -- upvalues: v30 (ref), v25 (copy)
    if v44.hoverDumpster then
        v44.hoverDumpster:Destroy();
    end;
    if v30 ~= v44 then
        return;
    else
        v30.tooltip.Position = v25;
        v30 = nil;
        return;
    end;
end;
v28.HideAll = function() --[[ Line: 155 ]] --[[ Name: HideAll ]]
    -- upvalues: v30 (ref)
    if v30 then
        v30:Hide();
    end;
end;
v28.AddCleanupTask = function(v45, v46) --[[ Line: 161 ]] --[[ Name: AddCleanupTask ]]
    if not typeof(v46) == "function" then
        return;
    else
        table.insert(v45.cleanupTasks, v46);
        return;
    end;
end;
v28.Destroy = function(v47) --[[ Line: 169 ]] --[[ Name: Destroy ]]
    -- upvalues: v29 (copy), v30 (ref)
    if v29[v47.object] then
        v29[v47.object] = nil;
    end;
    if v30 == v47 then
        v47:Hide();
    end;
    if v47.dumpster then
        v47.dumpster:Destroy();
        v47.dumpster = nil;
    end;
    if v47.OnDestroyed then
        task.spawn(v47.OnDestroyed);
    end;
    table.clear(v47);
    setmetatable(v47, nil);
end;
v28._show = function(v48) --[[ Line: 193 ]] --[[ Name: _show ]]
    -- upvalues: v27 (copy), v30 (ref), v14 (copy), v12 (copy), v10 (copy), v22 (ref), v13 (copy), v16 (copy), l_ReplicatedStorage_0 (copy), v9 (copy), v19 (copy), l_RunService_0 (copy), v17 (copy), v18 (copy), v11 (copy), v23 (ref), v20 (ref), v5 (copy), v21 (ref)
    for _, v50 in v27:GetChildren() do
        v50.Visible = v50 == v48.tooltip;
    end;
    v30 = v48;
    if v48.hoverDumpster then
        v48.hoverDumpster:Destroy();
    end;
    v48.hoverDumpster = v48.dumpster:Extend();
    if v48.props.IsCondition then
        local l_Name_0 = v48.props.Name;
        local l_Main_0 = v48.content.Main;
        local l_v14_ConditionData_0, v54 = v14:GetConditionData(l_Name_0);
        l_Main_0.Condition.Icon.Image = l_v14_ConditionData_0.icon;
        l_Main_0.Condition.Icon.UIGradient.Color = l_v14_ConditionData_0.colors;
        l_Main_0.Condition.Title.Text = l_Name_0;
        l_Main_0.Condition.Title.UIGradient.Color = l_v14_ConditionData_0.colors;
        local l_richDescription_0 = l_v14_ConditionData_0.richDescription;
        if v54 and v54.tiers and v48.props.Tier then
            local v56 = v54.tiers[v48.props.Tier];
            l_richDescription_0 = string.gsub(l_richDescription_0, "~modifier~", v56.modifier);
        end;
        l_Main_0.Description.Title.Text = l_richDescription_0;
        return;
    elseif v48.props.IsEffectType then
        local l_Name_1 = v48.props.Name;
        if v48.props.ShowEffectDescription then
            local l_Main_1 = v48.content.Main;
            local l_v14_EffectDescription_0 = v14:GetEffectDescription(l_Name_1);
            l_Main_1.Condition.Icon.Image = v14:GetEffectIcon(l_Name_1) or "";
            l_Main_1.Condition.Icon.UIGradient.Color = v14:GetEffectColor(l_Name_1);
            l_Main_1.Condition.Title.Text = l_Name_1;
            l_Main_1.Condition.Title.UIGradient.Color = v14:GetEffectColor(l_Name_1);
            l_Main_1.Description.Title.Text = l_v14_EffectDescription_0 or "";
            l_Main_1.Description.Title.Visible = l_v14_EffectDescription_0 ~= nil;
            return;
        else
            local l_Types_0 = v48.content.Types;
            local l_AttackType_0 = l_Types_0.AttackType;
            local l_EffectType_0 = l_Types_0.EffectType;
            l_AttackType_0.Visible = false;
            l_EffectType_0.Visible = true;
            local l_v14_EffectColor_0 = v14:GetEffectColor(l_Name_1);
            l_EffectType_0.Icon.UIGradient.Color = l_v14_EffectColor_0;
            l_EffectType_0.Title.UIGradient.Color = l_v14_EffectColor_0;
            l_EffectType_0.Icon.Image = v14:GetEffectIcon(l_Name_1) or "";
            l_EffectType_0.Title.Text = l_Name_1;
            return;
        end;
    elseif v48.props.IsUnitType then
        local l_Name_2 = v48.props.Name;
        local l_Types_1 = v48.content.Types;
        local l_AttackType_1 = l_Types_1.AttackType;
        local l_EffectType_1 = l_Types_1.EffectType;
        l_AttackType_1.Visible = true;
        local l_v12_UnitValue_0 = v12:GetUnitValue(l_Name_2, "Type");
        l_AttackType_1.Icon.Visible = true;
        l_AttackType_1.Icon.Image = v14:GetAttackTypeIcon(l_v12_UnitValue_0);
        l_AttackType_1.Icon.ImageRectSize = Vector2.zero;
        l_AttackType_1.Icon.ImageRectOffset = Vector2.zero;
        l_AttackType_1.Title.Text = l_v12_UnitValue_0;
        local l_v12_PrimaryEffect_0 = v12:GetPrimaryEffect(l_Name_2);
        l_EffectType_1.Visible = l_v12_PrimaryEffect_0 ~= nil;
        if l_v12_PrimaryEffect_0 then
            local l_v14_EffectColor_1 = v14:GetEffectColor(l_v12_PrimaryEffect_0);
            l_EffectType_1.Icon.UIGradient.Color = l_v14_EffectColor_1;
            l_EffectType_1.Title.UIGradient.Color = l_v14_EffectColor_1;
            l_EffectType_1.Icon.Image = v14:GetEffectIcon(l_v12_PrimaryEffect_0) or "";
            l_EffectType_1.Title.Text = l_v12_PrimaryEffect_0;
        end;
        return;
    elseif v48.props.IsUnit then
        local v71 = select(2, v12:GetRarity(v48.props.Name));
        local l_v12_UnitValue_1 = v12:GetUnitValue(v48.props.Name, "Type");
        v48.hoverDumpster:Add(v10.new(v48.tooltip, v71));
        v48.hoverDumpster:Add(v10.new(v48.content.UIStroke, v71));
        v48.hoverDumpster:Add(v10.new(v48.content.Top.Rarity, v71));
        if v48.props.ExtraData and not v48.props.UnitData then
            v48.props.UnitData = {
                Name = v48.props.Name
            };
            for v73, v74 in v48.props.ExtraData do
                v48.props.UnitData[v73] = v74;
            end;
        end;
        v48.content.ExistingCount.Visible = false;
        if not v48.props.HideExistCount then
            v48.hoverDumpster:Add(v22:ApplyCountToLabel(v48.props.Name, v48.props.ExtraData, v48.content.ExistingCount, false, "%s Exist", false):andThen(function(v75, v76) --[[ Line: 308 ]]
                -- upvalues: v48 (copy)
                if not v75 then
                    return;
                else
                    v48.content.ExistingCount.Visible = true;
                    v48.hoverDumpster:Add(v76);
                    return;
                end;
            end));
        end;
        local v77 = v48.props.HideName and v48.props.HideName();
        local v78 = v48.props.HideStats or false;
        local v79 = nil;
        v79 = if typeof(v48.props.IsSecretUnit) == "function" then v48.props.IsSecretUnit() else if v48.props.IsSecretUnit ~= nil then v48.props.IsSecretUnit else v71 == "Secret";
        if v77 or v79 then
            v48.content.Top.UnitName.Text = "???";
        else
            v48.content.Top.UnitName.Text = v12:GetUnitValue(v48.props.Name, "FullName");
        end;
        v48.content.Top.Rarity.Text = v71;
        local v80 = nil;
        local v81 = nil;
        local v82 = nil;
        local v83 = nil;
        if l_v12_UnitValue_1 ~= "Resource" then
            v80 = v12:GetTotalDamage(v48.props.UnitData or {
                Name = v48.props.Name
            });
            v81 = v12:GetRange(v48.props.UnitData or {
                Name = v48.props.Name
            });
            v82 = v12:GetAttackCooldown(v48.props.UnitData or {
                Name = v48.props.Name
            });
        else
            v83 = v12:GetGold({
                Name = v48.props.Name
            });
        end;
        local function _() --[[ Line: 351 ]] --[[ Name: hideUnitStats ]]
            -- upvalues: v80 (ref), v81 (ref), v82 (ref), v83 (ref)
            v80 = "???";
            v81 = "???";
            v82 = "???";
            v83 = "???";
        end;
        if v79 then
            v80 = "???";
            v81 = "???";
            v82 = "???";
            v83 = "???";
            v48.content.Type.Visible = false;
            v48.content.Effect.Visible = false;
            v48.content.MiddleDivider.Visible = false;
            v48.content.BottomDivider.Visible = false;
        else
            if v78 then
                v80 = "???";
                v81 = "???";
                v82 = "???";
                v83 = "???";
            end;
            v48.content.BottomDivider.Visible = v48.content.ExistingCount.Visible;
            local l_v12_UnitValue_2 = v12:GetUnitValue(v48.props.Name, "Type");
            v48.content.Type.StatIcon.Image = v14:GetAttackTypeIcon(l_v12_UnitValue_2);
            v48.content.Type.StatLabel.Text = l_v12_UnitValue_2;
            v48.content.Type.Visible = true;
            v48.content.MiddleDivider.Visible = true;
            local l_v12_PrimaryEffect_1 = v12:GetPrimaryEffect(v48.props.Name);
            v48.content.Effect.Visible = l_v12_PrimaryEffect_1 ~= nil;
            if l_v12_PrimaryEffect_1 then
                v48.content.Effect.StatLabel.Text = l_v12_PrimaryEffect_1;
                v48.content.Effect.StatIcon.Image = v14:GetEffectIcon(l_v12_PrimaryEffect_1);
                local l_v14_EffectColor_2 = v14:GetEffectColor(l_v12_PrimaryEffect_1);
                v48.content.Effect.StatLabel.UIGradient.Color = l_v14_EffectColor_2;
                v48.content.Effect.StatIcon.UIGradient.Color = l_v14_EffectColor_2;
            end;
        end;
        v48.content.DMG.Visible = l_v12_UnitValue_1 ~= "Resource";
        v48.content.RNG.Visible = l_v12_UnitValue_1 ~= "Resource";
        v48.content.SPA.Visible = l_v12_UnitValue_1 ~= "Resource";
        v48.content.GOLD.Visible = l_v12_UnitValue_1 == "Resource";
        v48.content.DMG.StatAmount.Text = v80 or "";
        v48.content.RNG.StatAmount.Text = v81 or "";
        v48.content.SPA.StatAmount.Text = v82 or "";
        v48.content.GOLD.StatAmount.Text = v83 or "";
        return;
    elseif v48.props.IsPet then
        local v88 = select(2, v13:GetRarity(v48.props.Name));
        v48.hoverDumpster:Add(v10.new(v48.tooltip, v88));
        v48.hoverDumpster:Add(v10.new(v48.content.UIStroke, v88));
        v48.hoverDumpster:Add(v10.new(v48.content.Top.Rarity, v88));
        if v48.props.ExtraData and not v48.props.UnitData then
            v48.props.UnitData = {
                Name = v48.props.Name, 
                Level = 1
            };
            for v89, v90 in v48.props.ExtraData do
                v48.props.UnitData[v89] = v90;
            end;
        end;
        v48.content.ExistingCount.Visible = false;
        if not v48.props.HideExistCount then
            v48.hoverDumpster:Add(v22:ApplyCountToLabel(v48.props.Name, v48.props.ExtraData, v48.content.ExistingCount, true, "%s Exist", false):andThen(function(v91, v92) --[[ Line: 426 ]]
                -- upvalues: v48 (copy)
                if not v91 then
                    return;
                else
                    v48.content.ExistingCount.Visible = true;
                    v48.hoverDumpster:Add(v92);
                    return;
                end;
            end));
        end;
        local v93 = v48.props.HideName and v48.props.HideName();
        local v94 = if v48.props.IsSecretUnit then v48.props.IsSecretUnit() else v88 == "Secret";
        local v95 = v48.props.HideStats or v94;
        if v93 or v94 then
            v48.content.Top.UnitName.Text = "???";
        else
            v48.content.Top.UnitName.Text = v13:GetPetValue(v48.props.Name, "FullName");
        end;
        v48.content.Top.Rarity.Text = v88;
        local v96 = v48.props.UnitData or {
            Name = v48.props.Name, 
            Level = 1
        };
        local l_v13_DamageBuff_0 = v13:GetDamageBuff(v96);
        local l_v13_RangeBuff_0 = v13:GetRangeBuff(v96);
        local l_v13_CooldownBuff_0 = v13:GetCooldownBuff(v96);
        local l_v13_GoldBuff_0 = v13:GetGoldBuff(v96);
        local l_v13_PlacementBuff_0 = v13:GetPlacementBuff(v96);
        if v94 then
            v48.content.BottomDivider.Visible = false;
        else
            v48.content.BottomDivider.Visible = v48.content.ExistingCount.Visible;
        end;
        if v95 then
            v48.content.DMG.Visible = true;
            v48.content.RNG.Visible = true;
            v48.content.SPA.Visible = true;
            v48.content.PLC.Visible = false;
            v48.content.GOLD.Visible = false;
            v48.content.DMG.StatAmount.Text = "???";
            v48.content.RNG.StatAmount.Text = "???";
            v48.content.SPA.StatAmount.Text = "???";
        end;
        local l_DMG_0 = v48.content.DMG;
        local v103 = l_v13_DamageBuff_0 > 0 and "+" or "";
        l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v103, l_v13_DamageBuff_0);
        l_DMG_0.Visible = l_v13_DamageBuff_0 ~= 0;
        l_DMG_0 = v48.content.RNG;
        v103 = l_v13_RangeBuff_0 > 0 and "+" or "";
        l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v103, l_v13_RangeBuff_0);
        l_DMG_0.Visible = l_v13_RangeBuff_0 ~= 0;
        l_DMG_0 = v48.content.SPA;
        v103 = l_v13_CooldownBuff_0 > 0 and "+" or "";
        l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v103, l_v13_CooldownBuff_0);
        l_DMG_0.Visible = l_v13_CooldownBuff_0 ~= 0;
        l_DMG_0 = v48.content.GOLD;
        v103 = l_v13_GoldBuff_0 > 0 and "+" or "";
        l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v103, l_v13_GoldBuff_0);
        l_DMG_0.Visible = l_v13_GoldBuff_0 ~= 0;
        l_DMG_0 = v48.content.PLC;
        v103 = l_v13_PlacementBuff_0 > 0 and "+" or "";
        l_DMG_0.StatAmount.Text = ("%*%*%%"):format(v103, l_v13_PlacementBuff_0);
        l_DMG_0.Visible = l_v13_PlacementBuff_0 ~= 0;
        return;
    elseif v48.props.IsAttackTypeDisplay and v48.props.AttackType then
        local l_Types_2 = v48.content.Types;
        local l_AttackType_2 = l_Types_2.AttackType;
        local l_EffectType_2 = l_Types_2.EffectType;
        l_AttackType_2.Visible = true;
        local l_AttackType_3 = v48.props.AttackType;
        l_AttackType_2.Icon.Visible = true;
        l_AttackType_2.Icon.Image = v14:GetAttackTypeIcon(l_AttackType_3);
        l_AttackType_2.Title.Text = l_AttackType_3;
        l_EffectType_2.Visible = false;
        return;
    elseif v48.props.IsTraitDisplay and v48.props.Trait then
        local l_Types_3 = v48.content.Types;
        local l_AttackType_4 = l_Types_3.AttackType;
        local l_EffectType_3 = l_Types_3.EffectType;
        l_AttackType_4.Visible = true;
        l_AttackType_4.Icon.Visible = false;
        local l_v16_TraitIcon_0 = v16:CreateTraitIcon(v48.props.Trait, l_AttackType_4);
        if l_v16_TraitIcon_0 then
            l_v16_TraitIcon_0.Position = l_AttackType_4.Icon.Position;
            l_v16_TraitIcon_0.Size = l_AttackType_4.Icon.Size;
            l_v16_TraitIcon_0.LayoutOrder = l_AttackType_4.Icon.LayoutOrder;
            v48.hoverDumpster:Add(l_v16_TraitIcon_0);
        end;
        local l_FirstChild_0 = l_ReplicatedStorage_0.GUI.Traits.Titles:FindFirstChild(v48.props.Trait);
        if l_FirstChild_0 then
            for _, v114 in l_FirstChild_0:GetChildren() do
                local v115 = v114:Clone();
                v115.Parent = l_AttackType_4.Title;
                v48.hoverDumpster:Add(v115);
                if v114:IsA("UIGradient") then
                    local v116 = v114:Clone();
                    v116.Parent = v48.content.UIStroke;
                    v48.hoverDumpster:Add(v116);
                    local v117 = v114:Clone();
                    v117.Parent = v48.content.Parent;
                    v48.hoverDumpster:Add(v117);
                end;
            end;
        end;
        l_AttackType_4.Title.Text = v16:GetTraitDisplayName(v48.props.Trait) or v48.props.Trait;
        if v48.props.TraitTier then
            local l_Title_0 = l_AttackType_4.Title;
            l_Title_0.Text = l_Title_0.Text .. (" %*"):format((v14:IntToRoman(v48.props.TraitTier)));
        end;
        l_EffectType_3.Visible = false;
        return;
    elseif v48.props.IsRelicDisplay and v48.props.Relic then
        local l_Types_4 = v48.content.Types;
        local l_AttackType_5 = l_Types_4.AttackType;
        local l_EffectType_4 = l_Types_4.EffectType;
        l_AttackType_5.Visible = true;
        l_EffectType_4.Visible = false;
        l_AttackType_5.Icon.Visible = true;
        l_AttackType_5.Title.Text = v9:GetDisplayName(v48.props.Relic);
        v19:SetImage(l_AttackType_5.Icon, v48.props.Relic);
        local l_UIGradient_0 = l_AttackType_5.Icon:FindFirstChildOfClass("UIGradient");
        if l_UIGradient_0 then
            v48.hoverDumpster:Add(l_UIGradient_0);
            local v123 = l_UIGradient_0:Clone();
            v123.Rotation = 90;
            v123.Parent = l_AttackType_5.Title;
            v48.hoverDumpster:Add(v123);
            local v124 = l_UIGradient_0:Clone();
            v124.Parent = v48.content.UIStroke;
            v48.hoverDumpster:Add(v124);
            local v125 = l_UIGradient_0:Clone();
            v125.Parent = v48.content.Parent;
            v48.hoverDumpster:Add(v125);
            v48.hoverDumpster:Add(l_RunService_0.PreRender:Connect(function(v126) --[[ Line: 568 ]]
                -- upvalues: v124 (copy), v125 (copy)
                local v127 = v126 * 30;
                local l_v124_0 = v124;
                l_v124_0.Rotation = l_v124_0.Rotation + v127;
                l_v124_0 = v125;
                l_v124_0.Rotation = l_v124_0.Rotation + v127;
            end));
        end;
        return;
    else
        local v129 = v48.props.ItemInfo or v9:GetByItemName(v48.props.Name);
        if v48.props.IsRecipe then
            v129 = v17:GetRecipeData(v48.props.Name);
        end;
        local v130 = v129.visualRarity or v129.rarity;
        local l_description_0 = v129.description;
        if v48.props.IsRecipe then
            v130 = v18:GetRecipeRarity(v129) or v130;
        end;
        if l_description_0 and string.find(l_description_0, "{numXP}") then
            l_description_0 = string.gsub(l_description_0, "{numXP}", v14:SuffixNumber(v11:GetXP(v48.props.Name) or 0, true, 1));
        end;
        v48.content.Description.Text = l_description_0 or "";
        v48.content.Description.Visible = l_description_0 ~= nil;
        v48.content.Top.ItemName.Text = v129.displayName or v129.DisplayName or v48.props.Name;
        v48.content.Top.ItemAmount.Visible = false;
        if v9:IsCurrencyGift(v48.props.Name) then
            local l_v23_Product_0 = v23:GetProduct(v129.currencyPackName);
            local v133 = l_v23_Product_0 and l_v23_Product_0.purchaseData and l_v23_Product_0.purchaseData.currency;
            if v133 then
                local l_name_0 = v133.name;
                local l_amount_0 = v133.amount;
                local l_v9_ByItemName_0 = v9:GetByItemName(l_name_0);
                if l_v9_ByItemName_0 then
                    local v137 = l_v9_ByItemName_0.displayName or l_v9_ByItemName_0.DisplayName or l_name_0;
                    v48.content.Top.ItemName.Text = ("(\240\159\142\129) %* %*"):format(l_amount_0, v137);
                end;
            end;
        end;
        v48.content.Rarity.Text = v130;
        if not v48.props.hideMaxAmount then
            v48.content.MaxOwn.Text = not v129.maxAmount and "" or ("Max Quantity: %*"):format(v129.maxAmount);
            v48.content.MaxOwn.Visible = v129.maxAmount ~= nil;
        else
            v48.content.MaxOwn.Visible = false;
        end;
        if not v48.props.hideOwnedAmount and not v129.isMount and v48.props.Name ~= "SoloCreds" then
            local v138 = "Inventory";
            if v129.isCurrency then
                v138 = "Currency";
            end;
            if v48.props.Name == "FactionPoint" then
                v138 = "Faction";
            end;
            v48.hoverDumpster:Add(v20:Get(v5.Player, v138):andThen(function(v139) --[[ Line: 650 ]]
                -- upvalues: v48 (copy), v14 (ref)
                if v48.hoverDumpster:Get("GetAmount") then
                    v48.hoverDumpster:Remove("GetAmount", true);
                end;
                v139 = if v48.props.Name == "FactionPoint" then v139 and v139.Balance or 0 else v139 and v139[v48.props.Name] or 0;
                v48.content.OwnAmount.Text = ("You Own: %*x"):format((v14:SuffixNumber(v139, true, 2)));
                v48.content.OwnAmount.Visible = true;
            end), "GetAmount");
        else
            v48.content.OwnAmount.Visible = false;
        end;
        if v129.hint and v129.hint ~= "" then
            v48.content.Hint.Visible = true;
            if typeof(v129.hint) == "table" then
                local l_v21_DeviceType_0 = v21:GetDeviceType();
                v48.content.Hint.Title.Text = v129.hint[l_v21_DeviceType_0];
            else
                v48.content.Hint.Title.Text = v129.hint;
            end;
        else
            v48.content.Hint.Visible = false;
        end;
        v48.hoverDumpster:Add(v10.new(v48.tooltip, v130));
        v48.hoverDumpster:Add(v10.new(v48.content.UIStroke, v130));
        v48.hoverDumpster:Add(v10.new(v48.content.Rarity, v130));
        v48.hoverDumpster:Add(v10.new(v48.content.OwnAmount, "Rare"));
        v48.hoverDumpster:Add(v10.new(v48.content.MaxOwn, "Common"));
        return;
    end;
end;
v5.OnStart():andThen(function() --[[ Line: 690 ]]
    -- upvalues: v27 (copy), v25 (copy), v5 (copy), l_GuiService_0 (copy), l_PreferredInput_0 (copy), v26 (copy), v29 (copy), v30 (ref), v28 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), v6 (copy)
    local l_UIListLayout_0 = v27:FindFirstChildOfClass("UIListLayout");
    if l_UIListLayout_0 then
        l_UIListLayout_0:Destroy();
    end;
    for _, v143 in v27:GetChildren() do
        v143.Position = v25;
        v143.Visible = false;
    end;
    v27.Parent = v5.PlayerGui;
    l_UIListLayout_0 = Vector2.new(0, l_GuiService_0.TopbarInset.Height);
    local v144 = false;
    local v145 = true;
    local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
    local l_zero_0 = Vector2.zero;
    local function _() --[[ Line: 712 ]] --[[ Name: updatePositionInfo ]]
        -- upvalues: l_zero_0 (ref), l_PreferredInput_0 (ref), v26 (ref), l_ViewportSize_0 (ref)
        l_zero_0 = if l_PreferredInput_0.Current == "Touch" then v26 else Vector2.zero;
        l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
    end;
    local function v153(v149) --[[ Line: 717 ]] --[[ Name: scan ]]
        -- upvalues: l_UIListLayout_0 (ref), v5 (ref), v29 (ref), v30 (ref), v25 (ref), v145 (ref), v28 (ref)
        v149 = v149 - l_UIListLayout_0;
        local l_GuiObjectsAtPosition_0 = v5.PlayerGui:GetGuiObjectsAtPosition(v149.X, v149.Y);
        for v151 = #l_GuiObjectsAtPosition_0, 1, -1 do
            local v152 = v29[l_GuiObjectsAtPosition_0[v151]];
            if v30 and v30 == v152 then
                if not v30.Enabled or v30.predicate and not v30.predicate() then
                    v30:Hide();
                end;
                return;
            elseif v152 and v152.Enabled and (not v152.predicate or v152.predicate()) then
                if v30 then
                    v30.hoverDumpster:Destroy();
                    v30.tooltip.Position = v25;
                end;
                v145 = true;
                v152:_show();
                return v152;
            end;
        end;
        v28.HideAll();
    end;
    l_GuiService_0:GetPropertyChangedSignal("TopbarInset"):Connect(function() --[[ Line: 754 ]]
        -- upvalues: l_UIListLayout_0 (ref), l_GuiService_0 (ref)
        l_UIListLayout_0 = Vector2.new(0, l_GuiService_0.TopbarInset.Height);
    end);
    l_RunService_0.RenderStepped:Connect(function() --[[ Line: 758 ]]
        -- upvalues: v29 (ref), l_PreferredInput_0 (ref), v144 (ref), v30 (ref), l_UserInputService_0 (ref), v153 (copy), v145 (ref), v25 (ref), l_zero_0 (ref), v26 (ref), l_ViewportSize_0 (ref)
        if not next(v29) then
            return;
        elseif l_PreferredInput_0.Current == "Touch" and not v144 then
            if v30 then
                v30:Hide();
            end;
            return;
        else
            local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
            if v153(l_l_UserInputService_0_MouseLocation_0) then
                return;
            elseif not v30 then
                return;
            else
                if v145 then
                    v30.tooltip.Position = v25;
                    l_zero_0 = if l_PreferredInput_0.Current == "Touch" then v26 else Vector2.zero;
                    l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
                    v145 = false;
                end;
                local l_AbsoluteSize_0 = v30.tooltip.AbsoluteSize;
                local v156 = math.clamp(if l_l_UserInputService_0_MouseLocation_0.X > l_ViewportSize_0.X / 2 then l_l_UserInputService_0_MouseLocation_0.X - l_AbsoluteSize_0.X - l_zero_0.X else l_l_UserInputService_0_MouseLocation_0.X + l_zero_0.X, 0, l_ViewportSize_0.X - l_AbsoluteSize_0.X);
                local v157 = math.clamp(l_l_UserInputService_0_MouseLocation_0.Y + l_zero_0.Y, 0, l_ViewportSize_0.Y - l_AbsoluteSize_0.Y);
                v30.tooltip.Position = UDim2.fromOffset(v156, v157);
                return;
            end;
        end;
    end);
    local v158 = v6.new();
    l_UserInputService_0.InputBegan:Connect(function(v159) --[[ Line: 814 ]]
        -- upvalues: v158 (copy), v144 (ref)
        if v159.UserInputType == Enum.UserInputType.Touch then
            v158:Add(task.delay(0.06, function() --[[ Line: 816 ]]
                -- upvalues: v144 (ref)
                v144 = true;
            end));
        end;
    end);
    l_UserInputService_0.InputEnded:Connect(function(v160) --[[ Line: 822 ]]
        -- upvalues: v144 (ref), v158 (copy), v28 (ref)
        if v160.UserInputType == Enum.UserInputType.Touch then
            v144 = false;
            v158:Destroy();
            v28.HideAll();
        end;
    end);
end);
return v28;