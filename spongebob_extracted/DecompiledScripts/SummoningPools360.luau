local v0 = require(game:GetService("ReplicatedStorage").Shared.Data.Variables);
local v1 = {};
for _, v3 in script:GetChildren() do
    if v3:IsA("ModuleScript") then
        v1[v3.Name] = require(v3);
    end;
end;
v1.IsForSale = function(_, v5) --[[ Line: 13 ]] --[[ Name: IsForSale ]]
    -- upvalues: v1 (copy)
    if not v1[v5] then
        return false;
    elseif v1[v5].ForSale == nil then
        return true;
    else
        return v1[v5].ForSale;
    end;
end;
v1.GetPool = function(_, v7) --[[ Line: 25 ]] --[[ Name: GetPool ]]
    -- upvalues: v1 (copy)
    return v1[v7] and v1[v7].Pool;
end;
v1.GetRarityPool = function(v8, v9) --[[ Line: 29 ]] --[[ Name: GetRarityPool ]]
    local l_v8_Pool_0 = v8:GetPool(v9);
    return l_v8_Pool_0 and l_v8_Pool_0.RaritiesPool;
end;
v1.GetUnitsPool = function(v11, v12) --[[ Line: 34 ]] --[[ Name: GetUnitsPool ]]
    local l_v11_Pool_0 = v11:GetPool(v12);
    return l_v11_Pool_0 and l_v11_Pool_0.UnitsPool;
end;
v1.GetBestUnits = function(v14, v15, v16) --[[ Line: 41 ]] --[[ Name: GetBestUnits ]]
    -- upvalues: v0 (copy)
    v16 = v16 or 3;
    local l_v14_UnitsPool_0 = v14:GetUnitsPool(v15);
    if not l_v14_UnitsPool_0 then
        return;
    else
        local v18 = {};
        local v19 = {};
        for v20, v21 in l_v14_UnitsPool_0 do
            local v22 = v0.RARITIES_FROM_NAME[v20];
            if v22 then
                for _, v24 in v21 do
                    table.insert(v19, {
                        rarity = v22, 
                        weight = v24.weight or v24.Weight, 
                        name = v24.name or v24.Name
                    });
                end;
            end;
        end;
        table.sort(v19, function(v25, v26) --[[ Line: 69 ]]
            if v25.rarity > v26.rarity then
                return true;
            elseif v26.rarity > v25.rarity then
                return false;
            elseif v25.weight < v26.weight then
                return true;
            else
                return false;
            end;
        end);
        for v27 = 1, v16 do
            table.insert(v18, v19[v27].name);
        end;
        table.clear(v19);
        v19 = nil;
        return v18;
    end;
end;
v1.GetCost = function(_, v29) --[[ Line: 92 ]] --[[ Name: GetCost ]]
    -- upvalues: v1 (copy)
    return v1[v29] and (v1[v29].Cost or v1[v29].Price);
end;
return v1;