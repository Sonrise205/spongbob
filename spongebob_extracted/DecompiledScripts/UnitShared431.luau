local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v6 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.LiveSheetsInterface);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v10 = require(l_ReplicatedStorage_0.Shared.Modules.Modifiers);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v12 = require(l_ReplicatedStorage_0.TraitsData);
local v13 = require(l_ReplicatedStorage_0.RelicsData);
local v14 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v15 = require(l_ReplicatedFirst_0.PlaceIds);
local v16 = require(l_ReplicatedStorage_0.DamageData);
local v17 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = l_RunService_0:IsServer();
local v25 = {};
local v26 = {
    constants = {
        MAX_UPGRADES = 5, 
        DEFAULT_ATTACK_MODE = "FirstInRange"
    }
};
local function _(v27, v28, v29) --[[ Line: 72 ]] --[[ Name: calculateMinMax ]]
    -- upvalues: v11 (copy)
    return (math.min(math.round(v27 * math.pow(math.pow(v28 / v27, 1 / (v11.MAX_UNIT_LEVEL - 1)), v29 - 1)), v28));
end;
v26.CreateLoadoutString = function(_, v32, v33) --[[ Line: 78 ]] --[[ Name: CreateLoadoutString ]]
    return (("%*_%*"):format(v32, v33));
end;
v26.ParseLoadout = function(_, v35) --[[ Line: 82 ]] --[[ Name: ParseLoadout ]]
    return table.unpack(string.split(v35, "_"));
end;
v26.GetUnitValues = function(_, v37) --[[ Line: 86 ]] --[[ Name: GetUnitValues ]]
    -- upvalues: v8 (copy), v9 (copy)
    local l_v8_Config_0 = v8:GetConfig((("UnitValues.%*"):format(v37)));
    if not l_v8_Config_0 then
        v9:Warn("UnitValues not found for unit:", v37);
        warn(debug.traceback());
        return;
    else
        return l_v8_Config_0;
    end;
end;
v26.GetSpawnUnitValues = function(_, v40) --[[ Line: 98 ]] --[[ Name: GetSpawnUnitValues ]]
    -- upvalues: v8 (copy), v9 (copy)
    local l_v8_Config_1 = v8:GetConfig((("SpawnUnitValues.%*"):format(v40)));
    if not l_v8_Config_1 then
        v9:Warn("SpawnUnitValues not found for unit:", v40);
        return;
    else
        return l_v8_Config_1;
    end;
end;
v26.GetUnitValue = function(_, v43, v44) --[[ Line: 109 ]] --[[ Name: GetUnitValue ]]
    -- upvalues: v8 (copy), v9 (copy)
    local l_v8_Value_0 = v8:GetValue((("UnitValues.%*.%*"):format(v43, v44)));
    if l_v8_Value_0 == nil then
        v9:Warn("UnitValue not found for unit:", v43, "value:", v44);
        warn(debug.traceback());
        return;
    else
        return l_v8_Value_0;
    end;
end;
v26.GetUnitAbilityValues = function(_, v47, v48) --[[ Line: 121 ]] --[[ Name: GetUnitAbilityValues ]]
    -- upvalues: v8 (copy), v9 (copy)
    local l_v8_Value_1 = v8:GetValue((("UnitAbilities.%*.%*"):format(v47, v48)));
    if l_v8_Value_1 == nil then
        v9:Warn("UnitAbilityValue not found for unit:", v47, "value:", v48);
        warn(debug.traceback());
        return;
    else
        return l_v8_Value_1;
    end;
end;
v26.GetSpawnUnitValue = function(_, v51, v52) --[[ Line: 133 ]] --[[ Name: GetSpawnUnitValue ]]
    -- upvalues: v8 (copy), v9 (copy)
    local l_v8_Value_2 = v8:GetValue((("SpawnUnitValues.%*.%*"):format(v51, v52)));
    if l_v8_Value_2 == nil then
        v9:Warn("SpawnUnitValue not found for unit:", v51, "value:", v52);
        warn(debug.traceback());
        return;
    else
        return l_v8_Value_2;
    end;
end;
v26.OnUnitValueChanged = function(_, v55, v56, v57, v58) --[[ Line: 145 ]] --[[ Name: OnUnitValueChanged ]]
    -- upvalues: v8 (copy)
    return v8:OnValueChanged(("UnitValues.%*.%*"):format(v55, v56), v57, v58);
end;
v26.GetLevelCost = function(v59, v60, v61) --[[ Line: 149 ]] --[[ Name: GetLevelCost ]]
    -- upvalues: v11 (copy)
    local l_v59_UnitValues_0 = v59:GetUnitValues(v60.Name);
    if not l_v59_UnitValues_0 then
        return;
    else
        v61 = v61 or v60.Level;
        if v60.Name == "BemmyBuddy" and v60.Temporary then
            for _, v64 in v11.BEMMY.LEVEL_REQUIREMENTS do
                if v61 <= v64[1] then
                    return v64[2];
                end;
            end;
        end;
        local l_Value_0 = l_v59_UnitValues_0.XPBase.Value;
        local l_Value_1 = l_v59_UnitValues_0.XPGrowth.Value;
        if v61 > 50 then
            return (math.round(v59:GetLevelCost(v60, 50) + l_Value_0 * math.pow(l_Value_1 - l_Value_1 % 1 * 0.5, v61 - 50)));
        else
            return (math.round(l_Value_0 * math.pow(l_Value_1, v61)));
        end;
    end;
end;
v26.GetNextLevelCost = function(v67, v68) --[[ Line: 178 ]] --[[ Name: GetNextLevelCost ]]
    local l_v67_MaxLevel_0 = v67:GetMaxLevel(v68);
    if v68.Name == "BemmyBuddy" and v68.Temporary then
        return v67:GetLevelCost(v68, (math.clamp(v68.Level + 1, 1, l_v67_MaxLevel_0)));
    else
        return v67:GetLevelCost(v68, (math.clamp(v68.Level + 1, 1, l_v67_MaxLevel_0)));
    end;
end;
v26.GetDamage = function(v70, v71, v72, v73, v74, v75, v76) --[[ Line: 188 ]] --[[ Name: GetDamage ]]
    -- upvalues: v26 (copy), v11 (copy), v12 (copy), v25 (ref), v13 (copy), v17 (copy)
    local v77 = if v74 then v70:GetSpawnUnitValues(v74) else v70:GetUnitValues(v71.Name);
    if not v77 then
        return;
    else
        local v78 = v71.Level or 1;
        v72 = v72 or 0;
        local l_Value_2 = v77.MinDamage.Value;
        local l_Value_3 = v77.MaxDamage.Value;
        if v75 then
            l_Value_2 = v26:GetUnitAbilityValues(v75, "MinDamage");
            l_Value_3 = v26:GetUnitAbilityValues(v75, "MaxDamage");
        end;
        local l_l_Value_2_0 = l_Value_2;
        local l_l_Value_3_0 = l_Value_3;
        local v83 = math.min(math.round(l_l_Value_2_0 * math.pow(math.pow(l_l_Value_3_0 / l_l_Value_2_0, 1 / (v11.MAX_UNIT_LEVEL - 1)), v78 - 1)), l_l_Value_3_0);
        if v78 > 50 then
            local l_l_Value_2_1 = l_Value_2;
            local l_l_Value_3_1 = l_Value_3;
            local v86 = v78 - 50;
            v83 = v83 + (math.min(math.round(l_l_Value_2_1 * math.pow(math.pow(l_l_Value_3_1 / l_l_Value_2_1, 1 / (v11.MAX_UNIT_LEVEL - 1)), v86 - 1)), l_l_Value_3_1) - l_Value_2);
        end;
        l_l_Value_2_0 = 0;
        l_l_Value_3_0 = v71.Trait;
        local v87 = l_l_Value_3_0 and v12:GetTraitBoosts(l_l_Value_3_0.Name, l_l_Value_3_0.Tier);
        local l_Trait2_0 = v71.Trait2;
        local v89 = l_Trait2_0 and v12:GetTraitBoosts(l_Trait2_0.Name, l_Trait2_0.Tier);
        if v71.Shiny or v71.Mega then
            l_l_Value_2_0 = l_l_Value_2_0 + v70:GetShinyMegaBoost(v71);
        end;
        if v71.Stars and v71.Stars > 0 then
            l_l_Value_2_0 = l_l_Value_2_0 + v11.STAR_BOOSTS[v71.Stars];
        end;
        local l_v70_Upgrade_0 = v70:GetUpgrade(v71.Name, v72);
        if not l_v70_Upgrade_0 then
            return;
        else
            l_l_Value_2_0 = l_l_Value_2_0 + (l_v70_Upgrade_0.Damage - 1) * 100;
            local v91 = v73 and v73.Buffs;
            if v91 and v91.damage then
                l_l_Value_2_0 = l_l_Value_2_0 + v91.damage;
            end;
            if v87 and v87.damage then
                local l_damage_0 = v87.damage;
                if v25.Drained then
                    l_damage_0 = l_damage_0 / 2;
                end;
                l_l_Value_2_0 = l_l_Value_2_0 + l_damage_0;
            end;
            if v89 and v89.damage then
                local l_damage_1 = v89.damage;
                if v25.Drained then
                    l_damage_1 = l_damage_1 / 2;
                end;
                l_l_Value_2_0 = l_l_Value_2_0 + l_damage_1;
            end;
            local v94 = if v71.Relic then v13[v71.Relic] else nil;
            if v94 and v94.damage then
                l_l_Value_2_0 = l_l_Value_2_0 + v94.damage;
            end;
            local v95 = v76 or {};
            for _, v97 in v95 do
                l_l_Value_2_0 = l_l_Value_2_0 + (v17:GetDamageBuff(v97) or 0);
            end;
            local l_v70_TowerStatCardModifier_0 = v70:GetTowerStatCardModifier("Damage", (v70:GetUnitValue(v71.Name, "Type")));
            if l_v70_TowerStatCardModifier_0 ~= 0 then
                l_l_Value_2_0 = l_l_Value_2_0 + l_v70_TowerStatCardModifier_0;
            end;
            local v99 = v83 * (l_l_Value_2_0 / 100 + 1);
            local v100 = v73 and v73.Reductions;
            if v100 and v100.Damage then
                v99 = v99 * (1 - v100.Damage / 100);
            end;
            return (math.max(0, (math.round(v99))));
        end;
    end;
end;
v26.GetGold = function(v101, v102, v103, v104) --[[ Line: 294 ]] --[[ Name: GetGold ]]
    -- upvalues: v17 (copy)
    local v105 = v102.Level or 1;
    local v106 = v102.Stars or 0;
    v103 = v103 or 0;
    local l_v101_Upgrade_0 = v101:GetUpgrade(v102.Name, v103);
    if not l_v101_Upgrade_0 or not l_v101_Upgrade_0.GoldPerWave then
        return 0;
    else
        local v108 = 1;
        if v102.Shiny then
            v108 = v108 + 0.1;
        end;
        if v102.Mega then
            v108 = v108 + 0.15;
        end;
        if v105 > 1 then
            v108 = v108 + v105 * 0.0025;
        end;
        v108 = v108 + v106 * 0.05;
        local v109 = 0;
        local v110 = v104 or {};
        for _, v112 in v110 do
            local v113 = v17:GetGoldBuff(v112) or 0;
            v108 = v108 + v113 / 100;
            v109 = v109 + v113 / 100;
        end;
        return (math.round(l_v101_Upgrade_0.GoldPerWave * v108));
    end;
end;
v26.GetDamageData = function(v114, v115, v116) --[[ Line: 333 ]] --[[ Name: GetDamageData ]]
    -- upvalues: v16 (copy), v9 (copy)
    v116 = v116 or v114:GetUnitValue(v115, "Type");
    local v117 = v16[v115];
    local v118 = {
        "BusStation", 
        "BikiniBottomPD"
    };
    if not v117 and v116 ~= "Resource" and not table.find(v118, v115) then
        v9:Warn("[Critical] DamageData not found for unit:", v115);
    end;
    return v117;
end;
v26.GetTotalDamage = function(v119, v120, v121, v122, v123) --[[ Line: 345 ]] --[[ Name: GetTotalDamage ]]
    -- upvalues: v9 (copy)
    local l_v119_Damage_0 = v119:GetDamage(v120, v121, v122, nil, nil, v123);
    if not l_v119_Damage_0 then
        v9:Warn("[Critical] Damage not found for unit:", v120.Name);
        return;
    else
        local l_v119_DamageData_0 = v119:GetDamageData(v120.Name);
        if not l_v119_DamageData_0 then
            return l_v119_Damage_0;
        else
            local v126 = 0;
            if l_v119_DamageData_0.singleHits then
                for _, v128 in l_v119_DamageData_0.singleHits do
                    v126 = v126 + l_v119_Damage_0 * v128.multiplier;
                end;
            end;
            if l_v119_DamageData_0.sustainedHits then
                local l_v119_UnitValue_0 = v119:GetUnitValue(v120.Name, "DamageRate");
                for _, v131 in l_v119_DamageData_0.sustainedHits do
                    v126 = v126 + math.round((v131.stop - v131.start) / l_v119_UnitValue_0) * (l_v119_Damage_0 * v131.multiplier);
                end;
            end;
            return (math.round(v126));
        end;
    end;
end;
v26.CalculateDPSoffMax = function(v132, v133, v134) --[[ Line: 380 ]] --[[ Name: CalculateDPSoffMax ]]
    return (math.round(v132:CalculateDPS(v133, v134) * v132:GetMaxUnits(v133.Name, v133)));
end;
v26.CalculateDPS = function(v135, v136, v137) --[[ Line: 387 ]] --[[ Name: CalculateDPS ]]
    local l_v135_UnitValue_0 = v135:GetUnitValue(v136.Name, "Type");
    if l_v135_UnitValue_0 == "Resource" then
        return 0;
    else
        local l_v135_DamageData_0 = v135:GetDamageData(v136.Name, l_v135_UnitValue_0);
        if not l_v135_DamageData_0 or not l_v135_DamageData_0.animationTime then
            return 0;
        else
            local l_animationTime_0 = l_v135_DamageData_0.animationTime;
            return (math.round(v135:GetTotalDamage(v136, v137) / (l_animationTime_0 + v135:GetAttackCooldown(v136, v137))));
        end;
    end;
end;
v26.GetRange = function(v141, v142, v143, v144, v145, v146) --[[ Line: 406 ]] --[[ Name: GetRange ]]
    -- upvalues: v11 (copy), v12 (copy), v25 (ref), v13 (copy), v17 (copy), v14 (copy)
    local v147 = if v145 then v141:GetSpawnUnitValues(v145) else v141:GetUnitValues(v142.Name);
    if not v147 then
        return;
    else
        local v148 = v142.Level or 1;
        v143 = v143 or 0;
        local l_Value_4 = v147.MinRange.Value;
        local l_Value_5 = v147.MaxRange.Value;
        local v151 = math.min(math.round(l_Value_4 * math.pow(math.pow(l_Value_5 / l_Value_4, 1 / (v11.MAX_UNIT_LEVEL - 1)), v148 - 1)), l_Value_5);
        if v148 > 50 then
            local v152 = v148 - 50;
            v151 = v151 + (math.min(math.round(l_Value_4 * math.pow(math.pow(l_Value_5 / l_Value_4, 1 / (v11.MAX_UNIT_LEVEL - 1)), v152 - 1)), l_Value_5) - l_Value_4);
        end;
        local v153 = 0;
        local l_Trait_0 = v142.Trait;
        local v155 = l_Trait_0 and v12:GetTraitBoosts(l_Trait_0.Name, l_Trait_0.Tier);
        local l_Trait2_1 = v142.Trait2;
        local v157 = l_Trait2_1 and v12:GetTraitBoosts(l_Trait2_1.Name, l_Trait2_1.Tier);
        if v142.Shiny or v142.Mega then
            v153 = v153 + v141:GetShinyMegaBoost(v142);
        end;
        local l_v141_Upgrade_0 = v141:GetUpgrade(v142.Name, v143);
        if not l_v141_Upgrade_0 then
            return;
        else
            v153 = v153 + (l_v141_Upgrade_0.Range - 1) * 100;
            local v159 = v144 and v144.Buffs;
            if v159 and v159.range then
                v153 = v153 + v159.range;
            end;
            if v155 and v155.range then
                local l_range_0 = v155.range;
                if v25.Drained then
                    l_range_0 = l_range_0 / 2;
                end;
                v153 = v153 + l_range_0;
            end;
            if v157 and v157.range then
                local l_range_1 = v157.range;
                if v25.Drained then
                    l_range_1 = l_range_1 / 2;
                end;
                v153 = v153 + l_range_1;
            end;
            local v162 = if v142.Relic then v13[v142.Relic] else nil;
            if v162 and v162.range then
                v153 = v153 + v162.range;
            end;
            local v163 = v146 or {};
            for _, v165 in v163 do
                v153 = v153 + (v17:GetRangeBuff(v165) or 0);
            end;
            local l_v141_TowerStatCardModifier_0 = v141:GetTowerStatCardModifier("Range", (v141:GetUnitValue(v142.Name, "Type")));
            if l_v141_TowerStatCardModifier_0 ~= 0 then
                v153 = v153 + l_v141_TowerStatCardModifier_0;
            end;
            local v167 = v151 * (v153 / 100 + 1);
            local v168 = v144 and v144.Reductions;
            if v168 and v168.Range then
                v167 = v167 * (1 - v168.Range / 100);
            end;
            return (math.max(0, v14:FastTenthRound(v167)));
        end;
    end;
end;
v26.GetAttackCooldown = function(v169, v170, v171, v172, _, v174) --[[ Line: 501 ]] --[[ Name: GetAttackCooldown ]]
    -- upvalues: v12 (copy), v25 (ref), v13 (copy), v17 (copy), v14 (copy)
    v171 = v171 or 0;
    local v175 = v169:GetUnitValue(v170.Name, "AttackCooldown") or 1;
    local function _(v176) --[[ Line: 506 ]] --[[ Name: applyBoost ]]
        -- upvalues: v175 (ref)
        if v176 == 0 then
            return;
        else
            v175 = v175 * (1 - v176 / 100);
            return;
        end;
    end;
    if v170.Shiny or v170.Mega then
        local l_v169_ShinyMegaBoost_0 = v169:GetShinyMegaBoost(v170);
        if l_v169_ShinyMegaBoost_0 ~= 0 then
            v175 = v175 * (1 - l_v169_ShinyMegaBoost_0 / 100);
        end;
    end;
    local l_v169_Upgrade_0 = v169:GetUpgrade(v170.Name, v171);
    if l_v169_Upgrade_0 then
        local v180 = (1 - l_v169_Upgrade_0.AttackCooldown) * 100;
        if v180 ~= 0 then
            local v181 = 1 - v180 / 100;
            v175 = v175 * v181;
        end;
    end;
    local l_Trait_1 = v170.Trait;
    local v183 = l_Trait_1 and v12:GetTraitBoosts(l_Trait_1.Name, l_Trait_1.Tier);
    if v183 and v183.cooldown then
        local l_cooldown_0 = v183.cooldown;
        if v25.Drained then
            l_cooldown_0 = l_cooldown_0 / 2;
        end;
        local l_l_cooldown_0_0 = l_cooldown_0;
        if l_l_cooldown_0_0 ~= 0 then
            local v186 = 1 - l_l_cooldown_0_0 / 100;
            v175 = v175 * v186;
        end;
    end;
    local l_Trait2_2 = v170.Trait2;
    local v188 = l_Trait2_2 and v12:GetTraitBoosts(l_Trait2_2.Name, l_Trait2_2.Tier);
    if v188 and v188.cooldown then
        local l_cooldown_1 = v188.cooldown;
        if v25.Drained then
            l_cooldown_1 = l_cooldown_1 / 2;
        end;
        local l_l_cooldown_1_0 = l_cooldown_1;
        if l_l_cooldown_1_0 ~= 0 then
            local v191 = 1 - l_l_cooldown_1_0 / 100;
            v175 = v175 * v191;
        end;
    end;
    local v192 = if v170.Relic then v13[v170.Relic] else nil;
    if v192 and v192.cooldown then
        local l_cooldown_2 = v192.cooldown;
        if l_cooldown_2 ~= 0 then
            local v194 = 1 - l_cooldown_2 / 100;
            v175 = v175 * v194;
        end;
    end;
    local v195 = v174 or {};
    for _, v197 in v195 do
        local l_v17_CooldownBuff_0 = v17:GetCooldownBuff(v197);
        if l_v17_CooldownBuff_0 then
            local v199 = -l_v17_CooldownBuff_0;
            if v199 ~= 0 then
                local v200 = 1 - v199 / 100;
                v175 = v175 * v200;
            end;
        end;
    end;
    local l_v169_TowerStatCardModifier_0 = v169:GetTowerStatCardModifier("Cooldown", (v169:GetUnitValue(v170.Name, "Type")));
    if l_v169_TowerStatCardModifier_0 ~= 0 then
        local v202 = -l_v169_TowerStatCardModifier_0;
        if v202 ~= 0 then
            local v203 = 1 - v202 / 100;
            v175 = v175 * v203;
        end;
    end;
    local v204 = v172 and v172.Buffs;
    if v204 and v204.cooldown then
        local l_cooldown_3 = v204.cooldown;
        if l_cooldown_3 ~= 0 then
            local v206 = 1 - l_cooldown_3 / 100;
            v175 = v175 * v206;
        end;
    end;
    v175 = math.max(0, v175);
    local v207 = v172 and v172.Reductions;
    if v207 and v207.AttackCooldown then
        v175 = v175 * (1 + v207.AttackCooldown / 100);
    end;
    if true then
        return v14:FastTenthRound(v175);
    else
        local l_v169_DamageData_0 = v169:GetDamageData(v170.Name);
        if not l_v169_DamageData_0 then
            return v14:FastTenthRound(v175);
        else
            local v209 = 0;
            local l_v14_0 = v14;
            local l_animationTime_1 = l_v169_DamageData_0.animationTime;
            return (math.max(v209, l_v14_0:FastTenthRound(v175 + l_animationTime_1)));
        end;
    end;
end;
v26.GetShinyMegaBoost = function(_, v213) --[[ Line: 591 ]] --[[ Name: GetShinyMegaBoost ]]
    -- upvalues: v11 (copy)
    if v213.Shiny and v213.Mega then
        return v11.SHINY_MEGA_BOOSTS.ShinyMega;
    elseif v213.Shiny then
        return v11.SHINY_MEGA_BOOSTS.Shiny;
    elseif v213.Mega then
        return v11.SHINY_MEGA_BOOSTS.Mega;
    else
        return 0;
    end;
end;
v26.GetUpgradesConfigs = function(_, v215) --[[ Line: 602 ]] --[[ Name: GetUpgradesConfigs ]]
    -- upvalues: v8 (copy)
    return v8:GetConfig((("UnitUpgrades.%*"):format(v215)));
end;
v26.GetUpgrades = function(_, v217) --[[ Line: 606 ]] --[[ Name: GetUpgrades ]]
    -- upvalues: v8 (copy)
    local v218 = {};
    local l_v8_Config_2 = v8:GetConfig((("UnitUpgrades.%*"):format(v217)));
    if not l_v8_Config_2 then
        return;
    else
        for _, v221 in l_v8_Config_2:GetChildren() do
            local v222 = {};
            v218[tonumber(v221.Name)] = v222;
            for _, v224 in v221:GetChildren() do
                v222[v224.Name] = v224.Value;
            end;
        end;
        return v218;
    end;
end;
v26.GetMaxUpgrades = function(v225, v226) --[[ Line: 625 ]] --[[ Name: GetMaxUpgrades ]]
    local l_v225_Upgrades_0 = v225:GetUpgrades(v226);
    if not l_v225_Upgrades_0 then
        return;
    else
        return #l_v225_Upgrades_0;
    end;
end;
v26.IsMaxUpgrade = function(v228, v229, v230) --[[ Line: 634 ]] --[[ Name: IsMaxUpgrade ]]
    return v228:GetMaxUpgrades(v229) <= v230;
end;
v26.GetUpgrade = function(_, v232, v233) --[[ Line: 638 ]] --[[ Name: GetUpgrade ]]
    -- upvalues: v8 (copy)
    local l_v8_Config_3 = v8:GetConfig(("UnitUpgrades.%*.%*"):format(v232, v233), false, true);
    if not l_v8_Config_3 then
        return;
    else
        local v235 = {};
        for _, v237 in l_v8_Config_3:GetChildren() do
            v235[v237.Name] = v237.Value;
        end;
        return v235;
    end;
end;
v26.GetUpgradeValue = function(v238, v239, v240, v241) --[[ Line: 655 ]] --[[ Name: GetUpgradeValue ]]
    -- upvalues: v9 (copy)
    local l_v238_Upgrade_0 = v238:GetUpgrade(v239, v240);
    if not l_v238_Upgrade_0 then
        return;
    else
        local v243 = l_v238_Upgrade_0[v241];
        if not v243 then
            v9:Warn("UpgradeValue not found for unit:", v239, "upgrade:", v240, "value:", v241);
            return;
        else
            return v243;
        end;
    end;
end;
v26.GetUpgradeCost = function(v244, v245, v246) --[[ Line: 671 ]] --[[ Name: GetUpgradeCost ]]
    -- upvalues: v12 (copy), v25 (ref)
    local v247 = false;
    if v245 ~= nil then
        v247 = v245.Name ~= nil;
    end;
    assert(v247, "unitData must be provided with a valid Name");
    local l_v244_UpgradeValue_0 = v244:GetUpgradeValue(v245.Name, v246, "Cost");
    if not l_v244_UpgradeValue_0 then
        return;
    else
        v247 = 0;
        local l_Trait_2 = v245.Trait;
        local v250 = l_Trait_2 and v12:GetTraitBoosts(l_Trait_2.Name, l_Trait_2.Tier);
        local l_Trait2_3 = v245.Trait2;
        local v252 = l_Trait2_3 and v12:GetTraitBoosts(l_Trait2_3.Name, l_Trait2_3.Tier);
        if v250 and v250.upgradeCost then
            local l_upgradeCost_0 = v250.upgradeCost;
            if v25.Drained then
                l_upgradeCost_0 = l_upgradeCost_0 / 2;
            end;
            v247 = v247 + l_upgradeCost_0;
        end;
        if v252 and v252.upgradeCost then
            local l_upgradeCost_1 = v252.upgradeCost;
            if v25.Drained then
                l_upgradeCost_1 = l_upgradeCost_1 / 2;
            end;
            v247 = v247 + l_upgradeCost_1;
        end;
        local l_v244_CardModifier_0 = v244:GetCardModifier("UpgradeCost");
        if l_v244_CardModifier_0 then
            v247 = v247 - l_v244_CardModifier_0;
        end;
        return (math.max(0, (math.round(l_v244_UpgradeValue_0 * (-v247 / 100 + 1)))));
    end;
end;
v26.GetModifiers = function(v256, v257, v258) --[[ Line: 714 ]] --[[ Name: GetModifiers ]]
    -- upvalues: l_HttpService_0 (copy), v10 (copy), v9 (copy)
    local l_v256_UpgradeValue_0 = v256:GetUpgradeValue(v257, v258, "Modifiers");
    local v260 = l_HttpService_0:JSONDecode(l_v256_UpgradeValue_0);
    local v261 = {};
    for _, v263 in v260 do
        local v264 = v10[v263];
        if not v264 then
            v9:Warn("Modifier not found:", v263);
        else
            v261[v263] = v264;
        end;
    end;
    return v261;
end;
v26.GetEffects = function(v265, v266, v267) --[[ Line: 733 ]] --[[ Name: GetEffects ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_v265_UpgradeValue_0 = v265:GetUpgradeValue(v266, v267, "Effects");
    return l_HttpService_0:JSONDecode(l_v265_UpgradeValue_0);
end;
v26.GetPrimaryEffect = function(_, v270) --[[ Line: 739 ]] --[[ Name: GetPrimaryEffect ]]
    -- upvalues: v26 (copy)
    local l_v26_Effects_0 = v26:GetEffects(v270, 0);
    return l_v26_Effects_0 and l_v26_Effects_0[1] and l_v26_Effects_0[1][1];
end;
v26.AddExperience = function(v272, v273, v274, v275, v276) --[[ Line: 745 ]] --[[ Name: AddExperience ]]
    -- upvalues: v5 (copy), v24 (copy), v18 (ref), v11 (copy), v19 (ref)
    if not v273 or not v274 or not v274.Name or not v275 then
        return;
    else
        v274 = v5.Copy(v274, true);
        v274.Name = v274.Name;
        local v277 = v274.Level or 1;
        local v278 = v274.Experience or 0;
        local l_v272_MaxLevel_0 = v272:GetMaxLevel(v274);
        local v280 = v272:GetNextLevelCost(v274) - v278;
        if l_v272_MaxLevel_0 <= v277 then
            return l_v272_MaxLevel_0, (math.round((v272:GetLevelCost(v274, v277))));
        else
            if not v24 then
                if not v276 and v18:HasGamepass(v273, "UltraVIP") then
                    v275 = v275 * (1 + v11.VIP_BOOSTS.ULTRA_VIP_XP);
                elseif not v276 and v18:HasGamepass(v273, "VIP") then
                    v275 = v275 * (1 + v11.VIP_BOOSTS.VIP_XP);
                end;
            elseif not v276 and v19:HasGamepass(v273, "UltraVIP"):expect() then
                v275 = v275 * (1 + v11.VIP_BOOSTS.ULTRA_VIP_XP);
            elseif not v276 and v19:HasGamepass(v273, "VIP"):expect() then
                v275 = v275 * (1 + v11.VIP_BOOSTS.VIP_XP);
            end;
            while v280 <= v275 do
                v277 = v277 + 1;
                v278 = 0;
                v274.Level = v277;
                v274.Experience = v278;
                v275 = v275 - v280;
                v280 = v272:GetNextLevelCost(v274);
                if l_v272_MaxLevel_0 <= v277 then
                    break;
                end;
            end;
            if v275 >= 1 then
                v278 = v278 + v275;
            end;
            if l_v272_MaxLevel_0 <= v277 then
                v278 = v272:GetLevelCost(v274, v277);
                v277 = l_v272_MaxLevel_0;
            end;
            return v277, (math.round(v278));
        end;
    end;
end;
v26.GetRarity = function(v281, v282, v283) --[[ Line: 807 ]] --[[ Name: GetRarity ]]
    -- upvalues: v11 (copy)
    local l_v281_UnitValue_0 = v281:GetUnitValue(v282, "Rarity");
    if not l_v281_UnitValue_0 then
        return;
    elseif not v283 and v281:IsLimited(v282) then
        return l_v281_UnitValue_0, "Limited";
    else
        return l_v281_UnitValue_0, v11.RARITIES_FROM_INDEX[l_v281_UnitValue_0];
    end;
end;
v26.IsLimited = function(v285, v286) --[[ Line: 820 ]] --[[ Name: IsLimited ]]
    return v285:GetUnitValue(v286, "Limited") == true;
end;
v26.GetMaxLevel = function(_, v288) --[[ Line: 825 ]] --[[ Name: GetMaxLevel ]]
    -- upvalues: v11 (copy)
    if v288.Name == "BemmyBuddy" and v288.Temporary then
        return 100;
    else
        local v289 = v288.Stars or 0;
        return v11.MAX_UNIT_LEVEL + v289 * v11.MAX_LEVEL_PER_STAR;
    end;
end;
v26.GetMaxUnits = function(v290, v291, v292, v293) --[[ Line: 839 ]] --[[ Name: GetMaxUnits ]]
    -- upvalues: v12 (copy), v17 (copy)
    local v294 = v290:GetUnitValue(v291, "MaxUnits") or 1;
    local v295 = v292 and v292.Trait;
    local v296 = v295 and v12:GetTraitBoosts(v295.Name, v295.Tier);
    local v297 = v292 and v292.Trait2;
    local v298 = v297 and v12:GetTraitBoosts(v297.Name, v297.Tier);
    local v299 = v293 or {};
    for _, v301 in v299 do
        v294 = v294 + (v17:GetPlacementBuff(v301) or 0);
    end;
    if v296 and v296.extraMaxUnits then
        return v294 + v296.extraMaxUnits;
    elseif v298 and v298.extraMaxUnits then
        return v294 + v298.extraMaxUnits;
    else
        return v294;
    end;
end;
v26.GetTowerStatCardModifier = function(_, v303, v304) --[[ Line: 861 ]] --[[ Name: GetTowerStatCardModifier ]]
    -- upvalues: v24 (copy), v21 (ref), v22 (ref)
    return (if v24 then v21 else v22):GetTowerStatModifier(v303, v304);
end;
v26.GetCardModifier = function(_, v306) --[[ Line: 867 ]] --[[ Name: GetCardModifier ]]
    -- upvalues: v24 (copy), v21 (ref), v22 (ref)
    return (if v24 then v21 else v22):GetModifier(v306);
end;
v26.ValidateRogueUnitSelection = function(v307, v308, v309, v310) --[[ Line: 873 ]] --[[ Name: ValidateRogueUnitSelection ]]
    -- upvalues: v11 (copy)
    local v311 = {};
    if v307:GetUnitValue(v309, "Type") == "Resource" then
        return false, "You cannot have a Resource unit in your loadout!";
    else
        local function v318(v312) --[[ Line: 881 ]] --[[ Name: countUnit ]]
            -- upvalues: v307 (copy), v11 (ref), v311 (copy)
            local v313 = select(2, v307:GetRarity(v312));
            local v314 = v307:IsLimited(v312);
            for v315, v316 in v11.ROGUELIKE.LOADOUT_RESTRICTIONS do
                if table.find(v316.rarities, v313) or v314 and table.find(v316.rarities, "Limited") then
                    local v317 = (v311[v315] or 0) + 1;
                    if v316.max < v317 then
                        return false, (string.gsub(v316.message, "<amount>", v316.max));
                    else
                        v311[v315] = v317;
                        break;
                    end;
                end;
            end;
            return true;
        end;
        for v319, v320 in v308 do
            if v319 ~= v310 and v320 ~= "" then
                local v321, v322 = v318((v307:ParseLoadout(v320)));
                if not v321 then
                    return false, v322;
                end;
            end;
        end;
        return v318(v309);
    end;
end;
v26.GetLoadoutKey = function(_) --[[ Line: 921 ]] --[[ Name: GetLoadoutKey ]]
    -- upvalues: v15 (copy), v24 (copy), v6 (copy), v20 (ref), v23 (ref)
    if not v15:IsGame() then
        return "Loadout";
    elseif v24 then
        if v6.Custom(function() --[[ Line: 931 ]]
            -- upvalues: v20 (ref)
            return v20:GetLevelInfo();
        end):expect().Mode == "Roguelike" then
            return "RoguelikeLoadout";
        else
            return "Loadout";
        end;
    else
        v6.Custom(function() --[[ Line: 942 ]]
            -- upvalues: v20 (ref)
            return v20;
        end):await();
        local v324 = v6.Custom(function() --[[ Line: 946 ]]
            -- upvalues: v20 (ref), v23 (ref)
            return v20.LevelInfo:Get() or v23.LevelInfo:Get();
        end):expect();
        if v324 and v324.Mode == "Roguelike" then
            return "RoguelikeLoadout";
        else
            return "Loadout";
        end;
    end;
end;
v4.OnStart():andThen(function() --[[ Line: 957 ]]
    -- upvalues: v24 (copy), v18 (ref), v4 (copy), v22 (ref), v19 (ref), v20 (ref), v21 (ref), v23 (ref), v25 (ref)
    if not v24 then
        v18 = v4.GetController("PurchaseController");
        v22 = v4.GetController("CardController");
    end;
    v19 = v4.GetService("PurchaseService");
    v20 = v4.GetService("GameService");
    v21 = v4.GetService("CardService");
    v23 = v4.GetService("TowerKarateService");
    local function v326(v325) --[[ Line: 968 ]] --[[ Name: updateConditions ]]
        -- upvalues: v25 (ref)
        v25 = v325;
    end;
    if v24 then
        v25 = v20:GetConditions();
        v20.ConditionsChanged:Connect(v326);
        return;
    else
        v20.Conditions:Observe(function(v327) --[[ Line: 976 ]]
            -- upvalues: v25 (ref)
            v25 = v327;
        end);
        return;
    end;
end);
return v26;