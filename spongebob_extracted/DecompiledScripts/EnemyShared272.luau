local l_HttpService_0 = game:GetService("HttpService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_ReplicatedStorage_0.Shared.Util.LiveSheetsInterface);
local v4 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v5 = require(l_ReplicatedStorage_0.TEST_FLAGS);
local v6 = l_RunService_0:IsStudio();
return {
    constants = {}, 
    GetUnitValues = function(_, v8) --[[ Line: 19 ]] --[[ Name: GetUnitValues ]]
        -- upvalues: v3 (copy), v4 (copy)
        local l_v3_Config_0 = v3:GetConfig((("EnemyValues.%*"):format(v8)));
        if not l_v3_Config_0 then
            v4:Warn("EnemyValues not found for unit:", v8);
            return;
        else
            return l_v3_Config_0;
        end;
    end, 
    GetUnitValue = function(_, v11, v12) --[[ Line: 30 ]] --[[ Name: GetUnitValue ]]
        -- upvalues: v3 (copy), v4 (copy), v6 (copy), v5 (copy)
        local l_v3_Value_0 = v3:GetValue((("EnemyValues.%*.%*"):format(v11, v12)));
        if not l_v3_Value_0 then
            v4:Warn("EnemyValue not found for unit:", v11, "value:", v12);
            return;
        elseif v6 and v12 == "Health" and v5.ENEMY_HEALTH_OVERRIDE then
            return v5.ENEMY_HEALTH_OVERRIDE;
        else
            return l_v3_Value_0;
        end;
    end, 
    OnUnitValueChanged = function(_, v15, v16, v17, v18) --[[ Line: 45 ]] --[[ Name: OnUnitValueChanged ]]
        -- upvalues: v3 (copy)
        return v3:OnValueChanged(("EnemyValues.%*.%*"):format(v15, v16), v17, v18);
    end, 
    GetDamageModifiers = function(v19, v20) --[[ Line: 49 ]] --[[ Name: GetDamageModifiers ]]
        -- upvalues: l_HttpService_0 (copy)
        local l_v19_UnitValue_0 = v19:GetUnitValue(v20, "DamageModifiers");
        return l_HttpService_0:JSONDecode(l_v19_UnitValue_0);
    end
};