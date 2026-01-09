local v0 = {};
local v1 = {
    VDayGift = true, 
    RandomBoosts = true
};
for _, v3 in script:GetChildren() do
    if v3:IsA("ModuleScript") then
        v0[v3.Name] = table.freeze(require(v3));
    end;
end;
v0.GetRarityPool = function(v4, v5, v6, v7) --[[ Line: 17 ]] --[[ Name: GetRarityPool ]]
    local v8 = v4[v5] and v4[v5].RaritiesPool;
    if v7 and v4[v5] and v4[v5].BoostedRaritiesPool then
        v8 = v4[v5].BoostedRaritiesPool;
    end;
    return v8 and v8[v6] or v8;
end;
v0.GetVariantPool = function(v9, v10, v11) --[[ Line: 27 ]] --[[ Name: GetVariantPool ]]
    local v12 = v9[v10] and v9[v10].VariantsPool;
    return v12 and (v12[v11] or v12);
end;
v0.GetLootPool = function(v13, v14) --[[ Line: 34 ]] --[[ Name: GetLootPool ]]
    -- upvalues: v1 (copy)
    if v1[v14] then
        return v13[v14];
    else
        return v13[v14] and v13[v14].LootPool;
    end;
end;
v0.HasPityEnabled = function(v15, v16) --[[ Line: 43 ]] --[[ Name: HasPityEnabled ]]
    local v17 = v15[v16];
    return v17 and v17.PityEnabled or false;
end;
v0.GetPityItems = function(v18, v19) --[[ Line: 48 ]] --[[ Name: GetPityItems ]]
    if not v18:GetLootPool(v19) then
        return;
    else
        local v20 = {};
        for v21, v22 in v18:GetLootPool(v19) do
            for _, v24 in v22 do
                if v24.pityAmount then
                    local v25 = table.clone(v24);
                    v25._rarityPool = v21;
                    table.insert(v20, v25);
                end;
            end;
        end;
        return v20;
    end;
end;
v0.GetRewardFromPity = function(v26, v27, v28) --[[ Line: 70 ]] --[[ Name: GetRewardFromPity ]]
    local l_v26_PityItems_0 = v26:GetPityItems(v27);
    if not l_v26_PityItems_0 or #l_v26_PityItems_0 < 1 then
        return nil, false;
    else
        local v30 = {};
        for _, v32 in l_v26_PityItems_0 do
            if v28 % v32.pityAmount == 0 then
                table.insert(v30, v32);
            end;
        end;
        if #v30 >= 1 then
            table.sort(v30, function(v33, v34) --[[ Line: 87 ]]
                return v33.weight < v34.weight;
            end);
            return v30[1], false;
        else
            return nil, false;
        end;
    end;
end;
return v0;