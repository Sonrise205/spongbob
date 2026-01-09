local v0 = require(script.Parent.Parent._internal);
local v1 = {};
local v2 = {};
local v3 = v0.class.create_init_function("IntegerWidth", nil, v2, nil, true);
v2.TruncateAt = function(v4, v5) --[[ Line: 8 ]] --[[ Name: TruncateAt ]]
    -- upvalues: v0 (copy), v3 (copy)
    local v6 = v0.class.try_coerce(1, v4, "IntegerWidth");
    v5 = tonumber(v5) and math.ceil(v5) == -1 and -1 or v0.class.try_coerce_range(1, v5, v6.min, 999);
    return v3({
        min = v6.min, 
        max = v5
    });
end;
v1.zeroFillTo = function(v7) --[[ Line: 25 ]] --[[ Name: zeroFillTo ]]
    -- upvalues: v0 (copy), v3 (copy)
    v7 = v0.class.try_coerce_range(1, v7, 0, 999);
    return v3({
        min = v7, 
        max = -1
    });
end;
return table.freeze(v1);