local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("HttpService");
local v2 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v3 = require(l_ReplicatedStorage_0.Shared.Util.LiveSheetsInterface);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
return {
    GetFoodValues = function(_, v6) --[[ Line: 10 ]] --[[ Name: GetFoodValues ]]
        -- upvalues: v3 (copy), v2 (copy)
        local l_v3_Config_0 = v3:GetConfig((("FoodValues.%*"):format(v6)));
        if not l_v3_Config_0 then
            v2:Warn("FoodValues not found for unit:", v6);
            return;
        else
            return l_v3_Config_0;
        end;
    end, 
    GetRarity = function(v8, v9) --[[ Line: 21 ]] --[[ Name: GetRarity ]]
        -- upvalues: v4 (copy)
        local l_v8_FoodValues_0 = v8:GetFoodValues(v9);
        if not l_v8_FoodValues_0 then
            return;
        else
            return v4.RARITIES_FROM_INDEX[l_v8_FoodValues_0.Rarity.Value];
        end;
    end, 
    GetXP = function(v11, v12) --[[ Line: 31 ]] --[[ Name: GetXP ]]
        local l_v11_FoodValues_0 = v11:GetFoodValues(v12);
        if not l_v11_FoodValues_0 then
            return;
        else
            return l_v11_FoodValues_0.XP.Value;
        end;
    end
};