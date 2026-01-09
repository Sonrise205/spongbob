--!native
local v9 = {
    snap = function(v0, ...) --[[ Line: 28 ]] --[[ Name: snap ]]
        local v1 = 1e999;
        local l_v0_0 = v0;
        local v3 = if typeof(...) == "number" then {
            (...)
        } else ...;
        for _, v5 in ipairs(v3) do
            local v6 = math.abs(v0 - v5);
            if v6 < v1 then
                v1 = v6;
                l_v0_0 = v5;
            end;
        end;
        return l_v0_0;
    end, 
    random = function(v7, v8) --[[ Line: 51 ]] --[[ Name: random ]]
        if v8 < v7 then
            error("Max must be greater than min.");
        end;
        return math.random() * (v8 - v7) + v7;
    end
};
v9.randomFromNumberRange = function(v10) --[[ Line: 63 ]] --[[ Name: randomFromNumberRange ]]
    -- upvalues: v9 (copy)
    return v9.random(v10.Min, v10.Max);
end;
v9.randomFromArray = function(v11) --[[ Line: 73 ]] --[[ Name: randomFromArray ]]
    return v11[math.random(1, #v11)];
end;
v9.randomFromRanges = function(...) --[[ Line: 86 ]] --[[ Name: randomFromRanges ]]
    -- upvalues: v9 (copy)
    local v12 = {
        ...
    };
    local v13 = 0;
    for v14, v15 in ipairs(v12) do
        if typeof(v15) == "NumberRange" then
            v15 = {
                v15.Min, 
                v15.Max
            };
            v12[v14] = v15;
        end;
        if v15[2] < v15[1] then
            local v16 = v15[2];
            local v17 = v15[1];
            v15[1] = v16;
            v15[2] = v17;
        end;
        v15.Weight = v15.Weight or v15[2] - v15[1];
        v13 = v13 + v15.Weight;
    end;
    local v18 = math.random() * v13;
    for _, v20 in ipairs(v12) do
        v18 = v18 - v20.Weight;
        if v18 <= 0 then
            return v9.random(v20[1], v20[2]);
        end;
    end;
    error("Failed to generate random number from ranges.");
end;
v9.randomFromNumberSequence = function(_) --[[ Line: 123 ]] --[[ Name: randomFromNumberSequence ]]
    error(".randomFromNumberSequence Not implemented yet.");
    return 0;
end;
v9.tryRandom = function(v22, ...) --[[ Line: 134 ]] --[[ Name: tryRandom ]]
    -- upvalues: v9 (copy)
    if typeof(v22) == "number" then
        local v23 = ...;
        if not v23 then
            return v22;
        else
            assert(typeof(v23) == "number", "If data is a number, max must be a number.");
            return v9.random(v22, v23);
        end;
    elseif typeof(v22) == "table" then
        if ... then
            return v9.randomFromRanges(v22, ...);
        else
            return v9.randomFromArray(v22);
        end;
    elseif typeof(v22) == "NumberRange" then
        return v9.randomFromNumberRange(v22);
    elseif typeof(v22) == "NumberSequence" then
        return v9.randomFromNumberSequence(v22);
    else
        error("Invalid data type. Got type: " .. typeof(v22));
        return;
    end;
end;
v9.round = function(v24, v25) --[[ Line: 164 ]] --[[ Name: round ]]
    assert(typeof(v24) == "number", "numToRound must be a number.");
    if not v25 then
        return (math.round(v24));
    else
        assert(typeof(v25) == "number", "multiple must be a number.");
        local v26 = v24 + v25 / 2;
        return v26 - v26 % v25;
    end;
end;
v9.lerp = function(v27, v28, v29) --[[ Line: 182 ]] --[[ Name: lerp ]]
    return v27 + (v28 - v27) * v29;
end;
v9.isBetween = function(v30, v31, v32) --[[ Line: 193 ]] --[[ Name: isBetween ]]
    assert(typeof(v30) == "number", "numToCheck must be a number.");
    assert(typeof(v31) == "number", "bound1 must be a number.");
    assert(typeof(v32) == "number", "bound2 must be a number.");
    return v31 <= v30 and v30 <= v32 or v32 <= v30 and v30 <= v31;
end;
v9.isClose = function(v33, v34, v35) --[[ Line: 207 ]] --[[ Name: isClose ]]
    -- upvalues: v9 (copy)
    v35 = v35 or 0.001;
    assert(typeof(v35) == "number", "epsilon must be a number.");
    return v9.isBetween(v33, v34 - v35, v34 + v35);
end;
v9.numbersToSequence = function(v36, v37) --[[ Line: 226 ]] --[[ Name: numbersToSequence ]]
    v37 = v37 or {};
    if typeof(v37) == "number" then
        v37 = {
            v37
        };
    end;
    if typeof(v36) == "number" then
        v36 = {
            v36
        };
    end;
    local v38 = #v36;
    assert(v38 > 0, "You must have at least one value");
    assert(v38 - 1 == #v37, "You must have one less sequence point than values");
    if v38 == 1 then
        return NumberSequence.new(v36[1]);
    else
        local v39 = {};
        for v40 = 1, v38 do
            local v41 = v36[v40];
            local v42 = v37[v40 - 1];
            local v43 = v37[v40];
            v42 = (not v42 or #v39 == 0) and 0 or v42 + 0.001;
            v43 = v43 or 1;
            v42 = math.clamp(v42, 0, 1);
            v43 = math.clamp(v43, 0, 1);
            if v43 > v42 then
                table.insert(v39, NumberSequenceKeypoint.new(v42, v41));
                if v43 + 0.001 >= 1 then
                    table.insert(v39, NumberSequenceKeypoint.new(1, v41));
                    break;
                else
                    table.insert(v39, NumberSequenceKeypoint.new(v43, v41));
                end;
            end;
        end;
        return NumberSequence.new(v39);
    end;
end;
v9.operate = function(v44, v45, v46) --[[ Line: 281 ]] --[[ Name: operate ]]
    if v45 == "+" then
        return v44 + v46;
    elseif v45 == "-" then
        return v44 - v46;
    elseif v45 == "*" then
        return v44 * v46;
    elseif v45 == "/" then
        return v44 / v46;
    elseif v45 == "^" then
        return v44 ^ v46;
    elseif v45 == "%" then
        return v44 % v46;
    else
        error("Invalid operator: " .. v45);
        return;
    end;
end;
return table.freeze(v9);