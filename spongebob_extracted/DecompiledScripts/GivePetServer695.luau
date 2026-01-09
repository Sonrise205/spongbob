local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = nil;
local v3 = nil;
local l_Pets_0 = l_ReplicatedStorage_0.Models.Pets;
local v5 = nil;
v1.OnStart():andThen(function() --[[ Line: 10 ]]
    -- upvalues: v2 (ref), v1 (copy), v3 (ref), v5 (ref)
    v2 = v1.GetService("VersionService");
    v3 = v1.GetService("PetService");
    v5 = tonumber(v2:GetVersion());
end);
return function(_, v7, v8, v9, v10, v11, v12) --[[ Line: 17 ]]
    -- upvalues: v5 (ref), l_Pets_0 (copy), v3 (ref)
    if not v5 then
        return "Game version not initialized, please try again";
    else
        local l_l_Pets_0_FirstChild_0 = l_Pets_0:FindFirstChild(v8);
        if not l_l_Pets_0_FirstChild_0 then
            return (("Pet %* does not exist"):format(v8));
        else
            local l_l_l_Pets_0_FirstChild_0_Attribute_0 = l_l_Pets_0_FirstChild_0:GetAttribute("ReleaseVersion");
            if l_l_l_Pets_0_FirstChild_0_Attribute_0 and v5 < l_l_l_Pets_0_FirstChild_0_Attribute_0 then
                return (("Pet %* is not available in this version of the game"):format(v8));
            else
                local v15 = {};
                v10 = v10 and math.clamp(v10, 1, 100);
                v11 = v11 and math.clamp(v11, 0, 5);
                v12 = v12 and string.lower(v12);
                local v16 = {
                    Level = v10, 
                    Stars = v11
                };
                local v17 = true;
                if v12 ~= "shiny" then
                    v17 = v12 == "shinywumbo";
                end;
                v16.Shiny = v17;
                v17 = true;
                if v12 ~= "wumbo" then
                    v17 = v12 == "shinywumbo";
                end;
                v16.Mega = v17;
                for _ = 1, v9 do
                    table.insert(v15, {
                        name = v8, 
                        extraData = v16
                    });
                end;
                v3:CreatePets(v7, v15);
                return (("Gave x%* %*'s to %*"):format(v9, v8, v7));
            end;
        end;
    end;
end;