local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.CraftingData);
local v3 = require(l_ReplicatedStorage_0.Shared.Data.InventoryAtlas);
local v4 = nil;
local v5 = nil;
v1.OnStart():andThen(function() --[[ Line: 10 ]]
    -- upvalues: v4 (ref), v1 (copy), v5 (ref)
    v4 = v1.GetService("InventoryService");
    v5 = v1.GetService("RewardService");
end);
return function(_, v7, v8, v9) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (ref)
    v9 = v9 or 1;
    local l_v2_RecipeData_0 = v2:GetRecipeData(v8);
    if not l_v2_RecipeData_0 or not l_v2_RecipeData_0.materials then
        return "Failed";
    else
        local v11 = {};
        local v12 = {};
        for v13, v14 in l_v2_RecipeData_0.materials do
            if v3:IsCurrency(v13) then
                if not v12[v13] then
                    v12[v13] = 0;
                end;
                v12[v13] = v12[v13] + v9 * v14;
            else
                if not v11[v13] then
                    v11[v13] = 0;
                end;
                v11[v13] = v11[v13] + v9 * v14;
            end;
        end;
        local v15 = {};
        for v16, v17 in v11 do
            table.insert(v15, {
                type = "Inventory", 
                name = v16, 
                amount = v17
            });
        end;
        for v18, v19 in v12 do
            table.insert(v15, {
                type = "Currency", 
                name = v18, 
                amount = v19
            });
        end;
        if not v5:Reward(v7, v15, "DevCommand", false) then
            return "Failed 2";
        else
            return "Success";
        end;
    end;
end;