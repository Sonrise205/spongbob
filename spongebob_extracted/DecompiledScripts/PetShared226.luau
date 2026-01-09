local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local v6 = require(l_ReplicatedStorage_0.Packages.WaitFor);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.LiveSheetsInterface);
local v9 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Modifiers);
local v11 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v12 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v13 = require(l_ReplicatedFirst_0.PlaceIds);
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = l_RunService_0:IsServer();
local v21 = false;
local v22 = false;
local v62 = {
    constants = {
        BUFFS = {
            Shiny = 1, 
            Mega = 3, 
            ShinyMega = 5, 
            LevelBuffs = {
                [50] = 0.04081632653061224, 
                [100] = 0.06
            }, 
            Stars = {
                [1] = 1, 
                [2] = 2, 
                [3] = 3, 
                [4] = 4, 
                [5] = 5
            }
        }
    }, 
    CreateLoadoutString = function(_, v24, v25) --[[ Line: 54 ]] --[[ Name: CreateLoadoutString ]]
        return (("%*_%*"):format(v24, v25));
    end, 
    ParseLoadout = function(_, v27) --[[ Line: 58 ]] --[[ Name: ParseLoadout ]]
        return table.unpack(string.split(v27, "_"));
    end, 
    GetRarity = function(v28, v29, v30) --[[ Line: 62 ]] --[[ Name: GetRarity ]]
        -- upvalues: v11 (copy)
        local l_v28_PetValue_0 = v28:GetPetValue(v29, "Rarity");
        if not l_v28_PetValue_0 then
            return;
        elseif not v30 and v28:IsLimited(v29) then
            return l_v28_PetValue_0, "Limited";
        else
            return l_v28_PetValue_0, v11.RARITIES_FROM_INDEX[l_v28_PetValue_0];
        end;
    end, 
    IsLimited = function(v32, v33) --[[ Line: 75 ]] --[[ Name: IsLimited ]]
        return v32:GetPetValue(v33, "Limited") == true;
    end, 
    GetPetValues = function(_, v35) --[[ Line: 79 ]] --[[ Name: GetPetValues ]]
        -- upvalues: v8 (copy), v9 (copy)
        local l_v8_Config_0 = v8:GetConfig((("PetValues.%*"):format(v35)));
        if not l_v8_Config_0 then
            v9:Warn("PetValues not found for pet:", v35);
            warn(debug.traceback());
            return;
        else
            return l_v8_Config_0;
        end;
    end, 
    GetPetValue = function(_, v38, v39) --[[ Line: 91 ]] --[[ Name: GetPetValue ]]
        -- upvalues: v8 (copy), v9 (copy)
        local l_v8_Value_0 = v8:GetValue((("PetValues.%*.%*"):format(v38, v39)));
        if l_v8_Value_0 == nil then
            v9:Warn("PetValue not found for pet:", v38, "value:", v39);
            warn(debug.traceback());
            return;
        else
            return l_v8_Value_0;
        end;
    end, 
    GetMaxLevel = function(_, v42) --[[ Line: 103 ]] --[[ Name: GetMaxLevel ]]
        -- upvalues: v11 (copy)
        local v43 = v42.Stars or 0;
        return v11.MAX_UNIT_LEVEL + v43 * v11.MAX_LEVEL_PER_STAR;
    end, 
    GetLevelCost = function(v44, v45, v46) --[[ Line: 112 ]] --[[ Name: GetLevelCost ]]
        local l_v44_PetValues_0 = v44:GetPetValues(v45.Name);
        if not l_v44_PetValues_0 then
            return;
        else
            v46 = v46 or v45.Level;
            local l_Value_0 = l_v44_PetValues_0.XPBase.Value;
            local l_Value_1 = l_v44_PetValues_0.XPGrowth.Value;
            if v46 > 50 then
                return (math.round(v44:GetLevelCost(v45, 50) + l_Value_0 * math.pow(l_Value_1 - l_Value_1 % 1 * 0.5, v46 - 50)));
            else
                return (math.round(l_Value_0 * math.pow(l_Value_1, v46)));
            end;
        end;
    end, 
    GetNextLevelCost = function(v50, v51) --[[ Line: 133 ]] --[[ Name: GetNextLevelCost ]]
        local l_v50_MaxLevel_0 = v50:GetMaxLevel(v51);
        return v50:GetLevelCost(v51, (math.clamp(v51.Level + 1, 1, l_v50_MaxLevel_0)));
    end, 
    AddExperience = function(v53, v54, v55, v56, v57) --[[ Line: 138 ]] --[[ Name: AddExperience ]]
        -- upvalues: v5 (copy), v20 (copy), v14 (ref), v11 (copy), v15 (ref)
        if not v54 or not v55 or not v55.Name or not v56 then
            return;
        else
            v55 = v5.Copy(v55, true);
            v55.Name = v55.Name;
            local v58 = v55.Level or 1;
            local v59 = v55.Experience or 0;
            local l_v53_MaxLevel_0 = v53:GetMaxLevel(v55);
            local v61 = v53:GetNextLevelCost(v55) - v59;
            if l_v53_MaxLevel_0 <= v58 then
                return l_v53_MaxLevel_0, (math.round((v53:GetLevelCost(v55, v58))));
            else
                if not v20 then
                    if not v57 and v14:HasGamepass(v54, "UltraVIP") then
                        v56 = v56 * (1 + v11.VIP_BOOSTS.ULTRA_VIP_XP);
                    elseif not v57 and v14:HasGamepass(v54, "VIP") then
                        v56 = v56 * (1 + v11.VIP_BOOSTS.VIP_XP);
                    end;
                elseif not v57 and v15:HasGamepass(v54, "UltraVIP"):expect() then
                    v56 = v56 * (1 + v11.VIP_BOOSTS.ULTRA_VIP_XP);
                elseif not v57 and v15:HasGamepass(v54, "VIP"):expect() then
                    v56 = v56 * (1 + v11.VIP_BOOSTS.VIP_XP);
                end;
                while v61 <= v56 do
                    v58 = v58 + 1;
                    v59 = 0;
                    v55.Level = v58;
                    v55.Experience = v59;
                    v56 = v56 - v61;
                    v61 = v53:GetNextLevelCost(v55);
                    if l_v53_MaxLevel_0 <= v58 then
                        break;
                    end;
                end;
                if v56 >= 1 then
                    v59 = v59 + v56;
                end;
                if l_v53_MaxLevel_0 <= v58 then
                    v59 = v53:GetLevelCost(v55, v58);
                    v58 = l_v53_MaxLevel_0;
                end;
                return v58, (math.round(v59));
            end;
        end;
    end
};
v62.GetExtraBuffs = function(v63, v64) --[[ Line: 201 ]] --[[ Name: GetExtraBuffs ]]
    -- upvalues: v21 (ref), v12 (copy), v62 (copy)
    if v21 then
        return 0;
    else
        local v65 = 0;
        if not v64 then
            return v65;
        else
            local v66 = 0;
            if v64.Level > 1 then
                v66 = if v64.Level <= 50 then (v64.Level - 1) * v63.constants.BUFFS.LevelBuffs[50] else 2 + (v64.Level - 50) * v63.constants.BUFFS.LevelBuffs[100];
            end;
            if v66 > 0 then
                v65 = v65 + v12:FastTenthRound(v66);
            end;
            if v64.Shiny and v64.Mega then
                v65 = v65 + v62.constants.BUFFS.ShinyMega;
            elseif v64.Shiny then
                v65 = v65 + v62.constants.BUFFS.Shiny;
            elseif v64.Mega then
                v65 = v65 + v62.constants.BUFFS.Mega;
            end;
            if v64.Stars and v64.Stars > 0 then
                v65 = v65 + v62.constants.BUFFS.Stars[v64.Stars];
            end;
            return v65;
        end;
    end;
end;
v62.GetGoldBuff = function(v67, v68) --[[ Line: 241 ]] --[[ Name: GetGoldBuff ]]
    -- upvalues: v21 (ref)
    if v21 then
        return 0;
    else
        local v69 = v67:GetPetValue(v68.Name, "GoldBuff") or 0;
        return (math.round(v69 + (v69 ~= 0 and v67:GetExtraBuffs(v68) or 0)));
    end;
end;
v62.GetDamageBuff = function(v70, v71) --[[ Line: 253 ]] --[[ Name: GetDamageBuff ]]
    -- upvalues: v21 (ref)
    if v21 then
        return 0;
    else
        local v72 = v70:GetPetValue(v71.Name, "DamageBuff") or 0;
        return (math.round(v72 + (v72 ~= 0 and v70:GetExtraBuffs(v71) or 0)));
    end;
end;
v62.GetCooldownBuff = function(v73, v74) --[[ Line: 265 ]] --[[ Name: GetCooldownBuff ]]
    -- upvalues: v21 (ref)
    if v21 then
        return 0;
    else
        local v75 = v73:GetPetValue(v74.Name, "CooldownBuff") or 0;
        return (math.round(v75 - (v75 ~= 0 and v73:GetExtraBuffs(v74) or 0)));
    end;
end;
v62.GetRangeBuff = function(v76, v77) --[[ Line: 277 ]] --[[ Name: GetRangeBuff ]]
    -- upvalues: v21 (ref)
    if v21 then
        return 0;
    else
        local v78 = v76:GetPetValue(v77.Name, "RangeBuff") or 0;
        return (math.round(v78 + (v78 ~= 0 and v76:GetExtraBuffs(v77) or 0)));
    end;
end;
v62.GetPlacementBuff = function(v79, v80) --[[ Line: 289 ]] --[[ Name: GetPlacementBuff ]]
    -- upvalues: v21 (ref)
    if v21 then
        return 0;
    else
        return v79:GetPetValue(v80.Name, "PlacementBuff") or 0;
    end;
end;
v62.IsDisabled = function(_) --[[ Line: 299 ]] --[[ Name: IsDisabled ]]
    -- upvalues: v21 (ref)
    return v21;
end;
v62.IsInitialized = function(_) --[[ Line: 303 ]] --[[ Name: IsInitialized ]]
    -- upvalues: v22 (ref)
    return v22;
end;
v4.OnStart():andThen(function() --[[ Line: 307 ]]
    -- upvalues: v20 (copy), v14 (ref), v4 (copy), v18 (ref), v15 (ref), v16 (ref), v17 (ref), v19 (ref), v13 (copy), v6 (copy), v21 (ref), v22 (ref)
    if not v20 then
        v14 = v4.GetController("PurchaseController");
        v18 = v4.GetController("PetController");
    end;
    v15 = v4.GetService("PurchaseService");
    v16 = v4.GetService("GameService");
    v17 = v4.GetService("PetService");
    v19 = v4.GetService("TowerKarateService");
    if v13:IsGame() then
        if v20 then
            v6.Custom(function() --[[ Line: 320 ]]
                -- upvalues: v16 (ref)
                if v16.isActive then
                    return true;
                else
                    return nil;
                end;
            end):andThen(function() --[[ Line: 322 ]]
                -- upvalues: v16 (ref), v21 (ref), v22 (ref)
                local l_v16_SessionData_0 = v16:GetSessionData();
                if l_v16_SessionData_0.Mode == "Event" and l_v16_SessionData_0.World == "NewKelpCity" then
                    v21 = true;
                end;
                v22 = true;
            end):catch(function() --[[ Line: 329 ]]

            end);
            v6.Custom(function() --[[ Line: 331 ]]
                -- upvalues: v19 (ref)
                if v19.isActive then
                    return true;
                else
                    return nil;
                end;
            end):andThen(function() --[[ Line: 333 ]]
                -- upvalues: v19 (ref), v21 (ref), v22 (ref)
                local l_v19_SessionData_0 = v19:GetSessionData();
                if l_v19_SessionData_0 and l_v19_SessionData_0.Mode == "TowerOfKarate" then
                    v21 = true;
                end;
                v22 = true;
            end):catch(function() --[[ Line: 341 ]]

            end);
            return;
        else
            v16.LevelInfo:Observe(function(v85) --[[ Line: 343 ]]
                -- upvalues: v21 (ref), v22 (ref)
                if v85 and v85.Mode == "Event" and v85.WorldName2 == "NewKelpCity" then
                    v21 = true;
                end;
                v22 = true;
            end);
            v19.LevelInfo:Observe(function(v86) --[[ Line: 351 ]]
                -- upvalues: v21 (ref), v22 (ref)
                if v86 and v86.Mode == "TowerOfKarate" then
                    v21 = true;
                end;
                v22 = true;
            end);
            return;
        end;
    else
        v22 = true;
        return;
    end;
end);
return v62;