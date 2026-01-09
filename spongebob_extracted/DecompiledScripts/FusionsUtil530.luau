local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.UnitShared);
local v5 = require(l_ReplicatedStorage_0.Shared.Data.PetShared);
return {
    CalculateRequiredBurners = function(_, v7) --[[ Line: 12 ]] --[[ Name: CalculateRequiredBurners ]]
        -- upvalues: v3 (copy)
        return v7 * (v3.FUSION.NEEDED - 1);
    end, 
    CalculateCost = function(_, v9, v10, v11) --[[ Line: 16 ]] --[[ Name: CalculateCost ]]
        -- upvalues: v5 (copy), v4 (copy), v3 (copy)
        if not v9 or not v10 then
            return;
        else
            local v12 = nil;
            v12 = if v11 then select(2, v5:GetRarity(v9.Name, true)) else select(2, v4:GetRarity(v9.Name, true));
            if not v12 or not v3.FUSION.COSTS[v12] then
                return;
            else
                return (math.floor(v10 * v3.FUSION.COSTS[v12]));
            end;
        end;
    end, 
    GetStarsLeft = function(_, v14) --[[ Line: 36 ]] --[[ Name: GetStarsLeft ]]
        -- upvalues: v3 (copy)
        if not v14 then
            return 0;
        else
            return v3.FUSION.MAX_STARS - (v14.Stars or 0);
        end;
    end, 
    SmartGetBurners = function(v15, v16, v17, v18, v19, v20) --[[ Line: 47 ]] --[[ Name: SmartGetBurners ]]
        -- upvalues: v1 (copy)
        if not v16 or not v17 or not v18 or not v19 then
            return;
        else
            local v21 = {};
            local v22 = {};
            local v23 = {};
            local v24 = {};
            local v25 = {};
            local v26 = {};
            local v27 = {};
            local v28 = {};
            for v29, v30 in v19 do
                if v29 ~= v17 and v30.Stars <= v18.Stars and not v30.Favorite then
                    v21[v29] = table.clone(v30);
                    if v30.Shiny and v30.Mega then
                        table.insert(v25, v29);
                    elseif v30.Relic then
                        table.insert(v28, v29);
                    elseif v30.Trait2 then
                        table.insert(v27, v29);
                    elseif v30.Mega then
                        table.insert(v24, v29);
                    elseif v30.Shiny then
                        table.insert(v23, v29);
                    elseif v30.Trait then
                        table.insert(v26, v29);
                    else
                        table.insert(v22, v29);
                    end;
                end;
            end;
            local v31 = {};
            for _, v33 in {
                v22, 
                v26, 
                v23, 
                v24, 
                v27, 
                v28, 
                v25
            } do
                table.sort(v33, function(v34, v35) --[[ Line: 109 ]]
                    -- upvalues: v21 (ref)
                    local v36 = v21[v34];
                    local v37 = v21[v35];
                    local v38 = v36 and v36.Trait and v36.Trait.Tier or 0;
                    local v39 = v37 and v37.Trait and v37.Trait.Tier or 0;
                    local v40 = 0;
                    if v36 and v36.Relic then
                        v40 = tonumber(string.match(v36.Relic, "_(%d+)$")) or 4;
                    end;
                    local v41 = 0;
                    if v37 and v37.Relic then
                        v41 = tonumber(string.match(v37.Relic, "_(%d+)$")) or 4;
                    end;
                    if v40 ~= v41 then
                        return v40 < v41;
                    else
                        if v36 and v36.Trait and not v36.Trait.Tier then
                            v38 = 4;
                        end;
                        if v37 and v37.Trait and not v37.Trait.Tier then
                            v39 = 4;
                        end;
                        if v38 ~= v39 then
                            return v38 < v39;
                        else
                            local v42 = v36 and v36.Stars or 0;
                            local v43 = v37 and v37.Stars or 0;
                            if v42 ~= v43 then
                                return v42 < v43;
                            else
                                local v44 = v36 and v36.Level or 0;
                                local v45 = v37 and v37.Level or 0;
                                if v44 ~= v45 then
                                    return v44 < v45;
                                else
                                    return (v36 and v36.Experience or 0) < (v37 and v37.Experience or 0);
                                end;
                            end;
                        end;
                    end;
                end);
                for _, v47 in v33 do
                    table.insert(v31, v47);
                end;
            end;
            local v48 = math.floor(v16 / v15:CalculateCost(v18, 1, v20));
            local v49 = v15:CalculateRequiredBurners((math.min(v15:GetStarsLeft(v18), v48)));
            v31 = v1.Filter(v31, function(_, v51) --[[ Line: 195 ]]
                -- upvalues: v49 (copy)
                return v51 <= v49;
            end);
            v21 = v1.Filter(v21, function(_, v53) --[[ Line: 199 ]]
                -- upvalues: v31 (ref)
                return table.find(v31, v53) ~= nil;
            end);
            return v31, v21;
        end;
    end
};