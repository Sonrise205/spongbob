local v0 = {
    ClassName = "ProbabilityDistributor"
};
v0.__index = v0;
v0.__call = function(v1, ...) --[[ Line: 90 ]]
    -- upvalues: v0 (copy)
    if v1 == v0 then
        return v0.new(...);
    else
        return v1:Roll(...);
    end;
end;
v0.new = function(v2, v3) --[[ Line: 106 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    assert(type(v2) == "table", "Weights must be a table.");
    local v4 = setmetatable({
        NumberGenerator = if typeof(v3) == "Random" then v3 else Random.new(v3), 
        MaxRepetitions = 100, 
        OrderedWeights = {}, 
        TotalWeight = 0
    }, v0);
    for v5, v6 in pairs(v2) do
        local l_Weight_0 = v6.Weight;
        if typeof(l_Weight_0) == "function" then
            l_Weight_0 = l_Weight_0();
        end;
        if typeof(l_Weight_0) == "NumberRange" then
            l_Weight_0 = math.random(l_Weight_0.Min, l_Weight_0.Max);
        end;
        assert(type(l_Weight_0) == "number", "Resultant Weight must be a number.");
        v4.TotalWeight = v4.TotalWeight + l_Weight_0;
        table.insert(v4.OrderedWeights, {
            Weight = l_Weight_0, 
            Value = v6.Value, 
            Order = v5
        });
    end;
    table.sort(v4.OrderedWeights, function(v8, v9) --[[ Line: 138 ]]
        return v8.Weight > v9.Weight;
    end);
    return v4;
end;
v0.Roll = function(v10, v11) --[[ Line: 153 ]] --[[ Name: Roll ]]
    local l_NumberGenerator_0 = v10.NumberGenerator;
    local l_TotalWeight_0 = v10.TotalWeight;
    local l_OrderedWeights_0 = v10.OrderedWeights;
    v11 = v11 or 0;
    local v15 = false;
    if v11 >= 0 then
        v15 = v11 <= 1;
    end;
    assert(v15, "Luck must be between 0 and 1. (inclusive)");
    local v16 = 0;
    v15 = v10.MaxRepetitions;
    local v17 = -1;
    local v18 = nil;
    repeat
        v16 = v16 + 1;
        local v19 = math.clamp(l_NumberGenerator_0:NextNumber() * l_TotalWeight_0, 0, l_TotalWeight_0);
        local v20 = 0;
        for v21 = 1, #l_OrderedWeights_0 do
            local v22 = l_OrderedWeights_0[v21];
            v20 = v20 + v22.Weight;
            if v19 <= v20 then
                if v17 < v22.Order then
                    v17 = v22.Order;
                    v18 = v22;
                    break;
                else
                    break;
                end;
            end;
        end;
    until v11 <= math.random() or v15 <= v16;
    return v18.Value;
end;
v0.Clone = function(v23) --[[ Line: 193 ]] --[[ Name: Clone ]]
    local v24 = table.clone(v23);
    v24.NumberGenerator = v24.NumberGenerator:Clone();
    return v24;
end;
v0.Sample = function(v25, v26, v27) --[[ Line: 209 ]] --[[ Name: Sample ]]
    v26 = v26 or 10000;
    local v28 = {};
    for _ = 1, v26 do
        local v30 = v25:Roll(v27);
        v28[v30] = (v28[v30] or 0) + 1;
    end;
    return v28;
end;
return table.freeze(v0);