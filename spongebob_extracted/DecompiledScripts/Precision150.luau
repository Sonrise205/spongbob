local v0 = require(script.Parent.Parent._internal);
local v1 = {};
local v2 = {};
local v3 = v0.class.create_init_function("Precision", nil, v2, nil, true);
local v4 = {};
local v5 = v0.class.create_init_function("FractionPrecision", "Precision", v4, v2, true);
v4.WithMinDigits = function(v6, v7) --[[ Line: 13 ]] --[[ Name: WithMinDigits ]]
    -- upvalues: v0 (copy), v3 (copy)
    local v8 = v0.class.try_coerce(1, v6, "FractionPrecision");
    v7 = v0.class.try_coerce_range(2, v7, 1, 999);
    return v3({
        type = v0.enums._Internal.PrecisionType.FRACTION_SIGNIFICANT, 
        minFractionDigits = v8.min, 
        maxFractionDigits = v8.max, 
        minSignificantDigits = 1, 
        maxSignificantDigits = v7, 
        roundingPriority = v0.enums.RoundingPriority.RELAXED, 
        sourcedWithSignificantDigits = false
    });
end;
v4.WithMaxDigits = function(v9, v10) --[[ Line: 28 ]] --[[ Name: WithMaxDigits ]]
    -- upvalues: v0 (copy), v3 (copy)
    local v11 = v0.class.try_coerce(1, v9, "FractionPrecision");
    v10 = v0.class.try_coerce_range(2, v10, 1, 999);
    return v3({
        type = v0.enums._Internal.PrecisionType.FRACTION_SIGNIFICANT, 
        minFractionDigits = v11.min, 
        maxFractionDigits = v11.max, 
        minSignificantDigits = 1, 
        maxSignificantDigits = v10, 
        roundingPriority = v0.enums.RoundingPriority.STRICT, 
        sourcedWithSignificantDigits = false
    });
end;
v4.WithSignificantDigits = function(v12, v13, v14, v15) --[[ Line: 43 ]] --[[ Name: WithSignificantDigits ]]
    -- upvalues: v0 (copy), v3 (copy)
    local v16 = v0.class.try_coerce(1, v12, "FractionPrecision");
    v13 = v0.class.try_coerce_range(2, v13, 1, 999);
    v14 = v0.class.try_coerce_range(3, v14, 1, 999);
    v15 = v0.class.try_coerce_enum(4, v15, v0.enums.RoundingPriority);
    return v3({
        type = v0.enums._Internal.PrecisionType.FRACTION_SIGNIFICANT, 
        minFractionDigits = v16.min, 
        maxFractionDigits = v16.max, 
        minSignificantDigits = v13, 
        maxSignificantDigits = v14, 
        roundingPriority = v15, 
        sourcedWithSignificantDigits = true
    });
end;
local v17 = v0.class.create_init_function("SignificantDigitsPrecision", "Precision", {}, v2, true);
v1.unlimited = function() --[[ Line: 67 ]] --[[ Name: unlimited ]]
    -- upvalues: v3 (copy), v0 (copy)
    return v3({
        type = v0.enums._Internal.PrecisionType.UNLIMITED
    });
end;
v1.integer = function() --[[ Line: 73 ]] --[[ Name: integer ]]
    -- upvalues: v5 (copy), v0 (copy)
    return v5({
        type = v0.enums._Internal.PrecisionType.FRACTION, 
        min = 0, 
        max = 0
    });
end;
v1.fixedFraction = function(v18) --[[ Line: 81 ]] --[[ Name: fixedFraction ]]
    -- upvalues: v0 (copy), v5 (copy)
    v18 = v0.class.try_coerce_range(1, v18, 0, 999);
    return v5({
        type = v0.enums._Internal.PrecisionType.FRACTION, 
        min = v18, 
        max = v18
    });
end;
v1.minFraction = function(v19) --[[ Line: 91 ]] --[[ Name: minFraction ]]
    -- upvalues: v0 (copy), v5 (copy)
    v19 = v0.class.try_coerce_range(1, v19, 0, 999);
    return v5({
        type = v0.enums._Internal.PrecisionType.FRACTION, 
        min = v19, 
        max = v0.formatter_settings.MAX_PRECISION
    });
end;
v1.maxFraction = function(v20) --[[ Line: 101 ]] --[[ Name: maxFraction ]]
    -- upvalues: v0 (copy), v5 (copy)
    v20 = v0.class.try_coerce_range(1, v20, 0, 999);
    return v5({
        type = v0.enums._Internal.PrecisionType.FRACTION, 
        min = 0, 
        max = v20
    });
end;
v1.minMaxFraction = function(v21, v22) --[[ Line: 111 ]] --[[ Name: minMaxFraction ]]
    -- upvalues: v0 (copy), v5 (copy)
    v21 = v0.class.try_coerce_range(1, v21, 0, 999);
    v22 = v0.class.try_coerce_range(2, v22, v21, 999);
    return v5({
        type = v0.enums._Internal.PrecisionType.FRACTION, 
        min = v21, 
        max = v22
    });
end;
v1.fixedSignificantDigits = function(v23) --[[ Line: 122 ]] --[[ Name: fixedSignificantDigits ]]
    -- upvalues: v0 (copy), v17 (copy)
    v23 = v0.class.try_coerce_range(1, v23, 1, 999);
    return v17({
        type = v0.enums._Internal.PrecisionType.SIGNFICANT, 
        min = v23, 
        max = v23
    });
end;
v1.minSignificantDigits = function(v24) --[[ Line: 132 ]] --[[ Name: minSignificantDigits ]]
    -- upvalues: v0 (copy), v17 (copy)
    v24 = v0.class.try_coerce_range(1, v24, 1, 999);
    return v17({
        type = v0.enums._Internal.PrecisionType.SIGNFICANT, 
        min = v24, 
        max = v0.formatter_settings.MAX_PRECISION
    });
end;
v1.maxSignificantDigits = function(v25) --[[ Line: 142 ]] --[[ Name: maxSignificantDigits ]]
    -- upvalues: v0 (copy), v17 (copy)
    v25 = v0.class.try_coerce_range(1, v25, 1, 999);
    return v17({
        type = v0.enums._Internal.PrecisionType.SIGNFICANT, 
        min = 1, 
        max = v25
    });
end;
v1.minMaxSignificantDigits = function(v26, v27) --[[ Line: 152 ]] --[[ Name: minMaxSignificantDigits ]]
    -- upvalues: v0 (copy), v17 (copy)
    v26 = v0.class.try_coerce_range(1, v26, 1, 999);
    v27 = v0.class.try_coerce_range(2, v27, v26, 999);
    return v17({
        type = v0.enums._Internal.PrecisionType.SIGNFICANT, 
        min = v26, 
        max = v27
    });
end;
return table.freeze(v1);