local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.TraitsData);
local v3 = nil;
local v4 = nil;
local v5 = nil;
local l_Friendlies_0 = l_ReplicatedStorage_0.Models.Friendlies;
local v7 = nil;
v1.OnStart():andThen(function() --[[ Line: 13 ]]
    -- upvalues: v3 (ref), v1 (copy), v4 (ref), v5 (ref), v7 (ref)
    v3 = v1.GetService("UnitService");
    v4 = v1.GetService("VersionService");
    v5 = v1.GetService("ProgressionService");
    v7 = tonumber(v4:GetVersion());
end);
return function(_, v9, v10, v11) --[[ Line: 21 ]]
    -- upvalues: v7 (ref), l_Friendlies_0 (copy), v3 (ref), v5 (ref)
    if not v7 then
        return "Game version not initialized, please try again";
    else
        local l_l_Friendlies_0_FirstChild_0 = l_Friendlies_0:FindFirstChild(v10);
        if not l_l_Friendlies_0_FirstChild_0 then
            return (("Unit %* does not exist"):format(v10));
        else
            local l_l_l_Friendlies_0_FirstChild_0_Attribute_0 = l_l_Friendlies_0_FirstChild_0:GetAttribute("ReleaseVersion");
            if l_l_l_Friendlies_0_FirstChild_0_Attribute_0 and v7 < l_l_l_Friendlies_0_FirstChild_0_Attribute_0 then
                return (("Unit %* is not available in this version of the game"):format(v10));
            else
                local v14 = {};
                v11 = v11 and string.lower(v11);
                local v15 = {
                    Level = 1, 
                    Stars = 0, 
                    Trait = nil, 
                    Trait2 = nil
                };
                local v16 = true;
                if v11 ~= "shiny" then
                    v16 = v11 == "shinywumbo";
                end;
                v15.Shiny = v16;
                v16 = true;
                if v11 ~= "wumbo" then
                    v16 = v11 == "shinywumbo";
                end;
                v15.Mega = v16;
                table.insert(v14, {
                    UnitName = v10, 
                    ExtraData = v15
                });
                local v17;
                v16, v17 = v3:Create(v9, v14);
                if not v17 then
                    return "Failed to summon unit!";
                else
                    v3.Client.UnitsSummoned:Fire(v9, v17, {
                        fromNPE = false
                    });
                    v5:Increment(v9, "SummonUnits", 1);
                    return (("Summoned %* for %*"):format(v10, v9));
                end;
            end;
        end;
    end;
end;