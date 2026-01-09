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
return function(v8, v9, v10, v11, v12, v13, v14, v15, v16) --[[ Line: 20 ]]
    -- upvalues: v7 (ref), l_Friendlies_0 (copy), v2 (copy), v3 (copy), v4 (ref)
    if not v7 then
        return "Game version not initialized, please try again";
    else
        local l_l_Friendlies_0_FirstChild_0 = l_Friendlies_0:FindFirstChild(v10);
        if not l_l_Friendlies_0_FirstChild_0 then
            return (("Unit %* does not exist"):format(v10));
        else
            local l_l_l_Friendlies_0_FirstChild_0_Attribute_0 = l_l_Friendlies_0_FirstChild_0:GetAttribute("ReleaseVersion");
            if v9 ~= v8.Executor and l_l_l_Friendlies_0_FirstChild_0_Attribute_0 and v7 < l_l_l_Friendlies_0_FirstChild_0_Attribute_0 then
                return (("Unit %* is not available in this version of the game"):format(v10));
            else
                local v19 = {};
                local v20 = if v14 and string.lower(v14) ~= "none" then {
                    Name = v14
                } else nil;
                if v20 and v2:HasTiers(v14) then
                    v20.Tier = 1;
                end;
                v12 = v12 and math.clamp(v12, 1, 100);
                v13 = v13 and math.clamp(v13, 0, 5);
                v16 = v16 and string.lower(v16);
                local v21 = {
                    Level = v12, 
                    Stars = v13, 
                    Trait = if v14 == "NeptunesCrown" then {
                        Name = "SecretFormula"
                    } else v20, 
                    Trait2 = if v14 == "NeptunesCrown" then {
                        Name = "Sidekick"
                    } else nil, 
                    Relic = if v15 and v3[v15] then v15 else nil
                };
                local v22 = true;
                if v16 ~= "shiny" then
                    v22 = v16 == "shinywumbo";
                end;
                v21.Shiny = v22;
                v22 = true;
                if v16 ~= "wumbo" then
                    v22 = v16 == "shinywumbo";
                end;
                v21.Mega = v22;
                for _ = 1, v11 do
                    table.insert(v19, {
                        UnitName = v10, 
                        ExtraData = v21
                    });
                end;
                v4:Create(v9, v19);
                return (("Gave x%* %*'s to %*"):format(v11, v10, v9));
            end;
        end;
    end;
end;