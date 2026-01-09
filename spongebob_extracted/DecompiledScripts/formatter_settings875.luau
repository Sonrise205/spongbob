local v0 = require(script.Parent.enums);
local v1 = {
    MAX_PRECISION = 2147483647
};
v1.resolve_min_max_sig = function(v2, v3) --[[ Line: 5 ]] --[[ Name: resolve_min_max_sig ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v4 = nil;
    local v5 = nil;
    if v2.type == v0._Internal.PrecisionType.SIGNFICANT then
        return v2.min, v2.max;
    elseif v2.type == v0._Internal.PrecisionType.FRACTION then
        return v3 + v2.min, v3 + v2.max;
    else
        if v2.type == v0._Internal.PrecisionType.FRACTION_SIGNIFICANT then
            local v6 = v3 + v2.minFractionDigits;
            local v7 = v3 + v2.maxFractionDigits;
            local l_minSignificantDigits_0 = v2.minSignificantDigits;
            local l_maxSignificantDigits_0 = v2.maxSignificantDigits;
            if v2.roundingPriority == v0.RoundingPriority.RELAXED then
                v4 = math.max(v6, l_minSignificantDigits_0);
                v5 = math.max(v7, l_maxSignificantDigits_0);
            else
                v4 = math.min(v6, l_minSignificantDigits_0);
                v5 = math.min(v7, l_maxSignificantDigits_0);
            end;
            if not v2.sourcedWithSignificantDigits then
                return v6, v5;
            end;
        elseif v2.type == v0._Internal.PrecisionType.UNLIMITED then
            v4 = 1;
            v5 = v1.MAX_PRECISION;
        end;
        return v4, v5;
    end;
end;
local v10 = table.freeze({
    [v0.ENumberFormatSymbols.kDecimalSeparatorSymbol] = ".", 
    [v0.ENumberFormatSymbols.kGroupingSeparatorSymbol] = ",", 
    [v0.ENumberFormatSymbols.kMinusSignSymbol] = "-", 
    [v0.ENumberFormatSymbols.kPlusSignSymbol] = "+", 
    [v0.ENumberFormatSymbols.kExponentialSymbol] = "E", 
    [v0.ENumberFormatSymbols.kInfinitySymbol] = "\226\136\158", 
    [v0.ENumberFormatSymbols.kNaNSymbol] = "NaN"
});
v1.generate_from_sign_enum = function(v11) --[[ Line: 50 ]] --[[ Name: generate_from_sign_enum ]]
    -- upvalues: v0 (copy)
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    if v11 == v0.SignDisplay.AUTO then
        v12 = true;
        v13 = true;
        v15 = false;
        v14 = false;
    elseif v11 == v0.SignDisplay.ALWAYS then
        v12 = true;
        v13 = true;
        v15 = true;
        v14 = true;
    elseif v11 == v0.SignDisplay.NEVER then
        v12 = false;
        v13 = false;
        v15 = false;
        v14 = false;
    elseif v11 == v0.SignDisplay.NEGATIVE then
        v12 = true;
        v13 = false;
        v15 = false;
        v14 = false;
    elseif v11 == v0.SignDisplay.EXCEPT_ZERO then
        v12 = true;
        v13 = false;
        v15 = true;
        v14 = false;
    end;
    return table.freeze({
        negative = v12, 
        negativeZero = v13, 
        positiveZero = v14, 
        positive = v15
    });
end;
v1.linked_list_to_dict = function(v16) --[[ Line: 79 ]] --[[ Name: linked_list_to_dict ]]
    local v17 = {};
    local l_v16_0 = v16;
    while l_v16_0 do
        if not v17[l_v16_0.key] then
            v17[l_v16_0.key] = l_v16_0.value;
        end;
        l_v16_0 = l_v16_0.parent;
    end;
    return table.freeze(v17);
end;
v1.resolve_settings = function(v19) --[[ Line: 92 ]] --[[ Name: resolve_settings ]]
    -- upvalues: v0 (copy), v10 (copy), v1 (copy)
    local v20 = nil;
    local v21 = {
        notation = v19.notation or table.freeze({
            type = v0._Internal.NotationType.SIMPLE
        })
    };
    v20 = v21.notation.type == v0._Internal.NotationType.COMPACT;
    if v19.precision then
        v21.precision = v19.precision;
    else
        v21.precision = if v20 then table.freeze({
            type = v0._Internal.PrecisionType.FRACTION_SIGNIFICANT, 
            minFractionDigits = 0, 
            maxFractionDigits = 0, 
            minSignificantDigits = 1, 
            maxSignificantDigits = 2, 
            roundingPriority = v0.RoundingPriority.RELAXED
        }) else table.freeze({
            type = v0._Internal.PrecisionType.FRACTION, 
            min = 0, 
            max = 6
        });
    end;
    if v19.roundingMode then
        v21.roundingMode = v19.roundingMode;
    else
        v21.roundingMode = if not not v20 or v21.notation.type == v0._Internal.NotationType.SCIENTIFIC then v0.RoundingMode.DOWN else v0.RoundingMode.HALF_EVEN;
    end;
    if v19.grouping then
        local l_grouping_0 = v19.grouping;
        local _ = nil;
        v21.minGrouping = l_grouping_0 == v0.GroupingStrategy.MIN2 and 5 or l_grouping_0 == v0.GroupingStrategy.ON_ALIGNED and 4 or nil;
    else
        v21.minGrouping = v20 and 5 or 4;
    end;
    v21.integerWidth = v19.integerWidth or table.freeze({
        min = 1, 
        max = -1
    });
    v21.symbols = v19.symbols or v10;
    if v19.sign then
        v21.displaySignAt = v1.generate_from_sign_enum(v19.sign);
    else
        v21.displaySignAt = v1.generate_from_sign_enum(v0.SignDisplay.AUTO);
    end;
    v21.alwaysDisplayDecimal = v19.decimal == v0.DecimalSeparatorDisplay.ALWAYS;
    return table.freeze(v21);
end;
return table.freeze(v1);