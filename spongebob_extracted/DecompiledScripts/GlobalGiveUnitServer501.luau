local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.TraitsData);
local v3 = require(l_ReplicatedStorage_0.RelicsData);
local v4 = nil;
local v5 = nil;
local l_Friendlies_0 = l_ReplicatedStorage_0.Models.Friendlies;
local v7 = nil;
v1.OnStart():andThen(function() --[[ Line: 13 ]]
    -- upvalues: v4 (ref), v1 (copy), v5 (ref), v7 (ref)
    v4 = v1.GetService("UnitService");
    v5 = v1.GetService("VersionService");
    v7 = tonumber(v5:GetVersion());
end);
return function(_, v9, v10, v11, v12, v13, v14, v15, v16) --[[ Line: 20 ]]
    -- upvalues: v7 (ref), l_Friendlies_0 (copy), v2 (copy), v3 (copy), v4 (ref)
    if not v7 then
        return "Game version not initialized, please try again";
    else
        local l_l_Friendlies_0_FirstChild_0 = l_Friendlies_0:FindFirstChild(v9);
        if not l_l_Friendlies_0_FirstChild_0 then
            return (("Unit %* does not exist"):format(v9));
        else
            local l_l_l_Friendlies_0_FirstChild_0_Attribute_0 = l_l_Friendlies_0_FirstChild_0:GetAttribute("ReleaseVersion");
            if l_l_l_Friendlies_0_FirstChild_0_Attribute_0 and v7 < l_l_l_Friendlies_0_FirstChild_0_Attribute_0 then
                return (("Unit %* is not available in this version of the game"):format(v9));
            else
                local v19 = {};
                local v20 = if v13 and string.lower(v13) ~= "none" then {
                    Name = v13
                } else nil;
                if v20 and v2:HasTiers(v13) then
                    v20.Tier = 1;
                end;
                v11 = v11 and math.clamp(v11, 1, 100);
                v12 = v12 and math.clamp(v12, 0, 5);
                v15 = v15 and string.lower(v15);
                local v21 = {
                    Level = v11, 
                    Stars = v12, 
                    Trait = if v13 == "NeptunesCrown" then {
                        Name = "SecretFormula"
                    } else v20, 
                    Trait2 = if v13 == "NeptunesCrown" then {
                        Name = "Sidekick"
                    } else nil, 
                    Relic = if v14 and v3[v14] then v14 else nil
                };
                local v22 = true;
                if v15 ~= "shiny" then
                    v22 = v15 == "shinywumbo";
                end;
                v21.Shiny = v22;
                v22 = true;
                if v15 ~= "wumbo" then
                    v22 = v15 == "shinywumbo";
                end;
                v21.Mega = v22;
                for _ = 1, v10 do
                    table.insert(v19, {
                        UnitName = v9, 
                        ExtraData = v21
                    });
                end;
                v4:GloballyGiveUnits(v19, v16);
                return (("Globally gave x%* of %* (unit) to all players with a %*%% chance!"):format(v10, v9, v16));
            end;
        end;
    end;
end;