local v0 = require(script.Parent._internal);
local v1 = require(script.Notation);
local v2 = require(script.Precision);
local v3 = require(script.IntegerWidth);
local v4 = require(script.DecimalFormatSymbols);
local l_enums_0 = v0.enums;
local v6 = {};
local v7 = {};
local v8 = v0.class.create_init_function("NumberFormatter", nil, v7, nil, true);
v7.Notation = function(v9, v10) --[[ Line: 22 ]] --[[ Name: Notation ]]
    -- upvalues: v0 (copy), v8 (copy)
    v0.class.try_coerce(1, v9, "NumberFormatter");
    v10 = v0.class.try_coerce(2, v10, "Notation");
    return v8({
        key = "notation", 
        value = v10, 
        parent = v0.class.get_data(v9)
    });
end;
v7.Precision = function(v11, v12) --[[ Line: 32 ]] --[[ Name: Precision ]]
    -- upvalues: v0 (copy), v8 (copy)
    v0.class.try_coerce(1, v11, "NumberFormatter");
    v12 = v0.class.try_coerce(2, v12, "Precision");
    return v8({
        key = "precision", 
        value = v12, 
        parent = v0.class.get_data(v11)
    });
end;
v7.RoundingMode = function(v13, v14) --[[ Line: 42 ]] --[[ Name: RoundingMode ]]
    -- upvalues: v0 (copy), l_enums_0 (copy), v8 (copy)
    v0.class.try_coerce(1, v13, "NumberFormatter");
    v14 = v0.class.try_coerce_enum(2, v14, l_enums_0.RoundingMode);
    return v8({
        key = "roundingMode", 
        value = v14, 
        parent = v0.class.get_data(v13)
    });
end;
v7.Grouping = function(v15, v16) --[[ Line: 52 ]] --[[ Name: Grouping ]]
    -- upvalues: v0 (copy), l_enums_0 (copy), v8 (copy)
    v0.class.try_coerce(1, v15, "NumberFormatter");
    v16 = v0.class.try_coerce_enum(2, v16, l_enums_0.GroupingStrategy);
    return v8({
        key = "grouping", 
        value = v16, 
        parent = v0.class.get_data(v15)
    });
end;
v7.IntegerWidth = function(v17, v18) --[[ Line: 62 ]] --[[ Name: IntegerWidth ]]
    -- upvalues: v0 (copy), v8 (copy)
    v0.class.try_coerce(1, v17, "NumberFormatter");
    v18 = v0.class.try_coerce(2, v18, "IntegerWidth");
    return v8({
        key = "integerWidth", 
        value = v18, 
        parent = v0.class.get_data(v17)
    });
end;
v7.Symbols = function(v19, v20) --[[ Line: 72 ]] --[[ Name: Symbols ]]
    -- upvalues: v0 (copy), v8 (copy)
    v0.class.try_coerce(1, v19, "NumberFormatter");
    v20 = v0.class.try_coerce(2, v20, "DecimalFormatSymbols");
    return v8({
        key = "symbols", 
        value = v20, 
        parent = v0.class.get_data(v19)
    });
end;
v7.Sign = function(v21, v22) --[[ Line: 82 ]] --[[ Name: Sign ]]
    -- upvalues: v0 (copy), l_enums_0 (copy), v8 (copy)
    v0.class.try_coerce(1, v21, "NumberFormatter");
    v22 = v0.class.try_coerce_enum(2, v22, l_enums_0.SignDisplay);
    return v8({
        key = "sign", 
        value = v22, 
        parent = v0.class.get_data(v21)
    });
end;
v7.Decimal = function(v23, v24) --[[ Line: 92 ]] --[[ Name: Decimal ]]
    -- upvalues: v0 (copy), l_enums_0 (copy), v8 (copy)
    v0.class.try_coerce(1, v23, "NumberFormatter");
    v24 = v0.class.try_coerce_enum(2, v24, l_enums_0.DecimalSeparatorDisplay);
    return v8({
        key = "decimal", 
        value = v24, 
        parent = v0.class.get_data(v23)
    });
end;
local function v26(v25) --[[ Line: 103 ]] --[[ Name: resolve_nf_data ]]
    -- upvalues: v0 (copy)
    return v0.formatter_settings.resolve_settings(v0.formatter_settings.linked_list_to_dict(v25));
end;
v7.Format = function(v27, v28) --[[ Line: 109 ]] --[[ Name: Format ]]
    -- upvalues: v0 (copy), v26 (copy), l_enums_0 (copy)
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    v0.class.try_coerce(1, v27, "NumberFormatter");
    if type(v28) == "string" then
        error("Argument #2 as a string interpreted as decimal is not currently supported, please cast the argument to a double if you want the string to be interpreted as a double", 2);
    end;
    v28 = v0.class.try_coerce(2, v28, "number");
    v30 = v0.class.get_resolved_data(v27, v26);
    v31 = v30.symbols;
    if v28 ~= v28 then
        v32 = string.byte(string.pack(">d", v28)) >= 128;
        v33 = true;
        v29 = v31[l_enums_0.ENumberFormatSymbols.kNaNSymbol];
    elseif v28 == 1e999 or v28 == -1e999 then
        v32 = v28 < 0;
        v33 = false;
        v29 = v31[l_enums_0.ENumberFormatSymbols.kInfinitySymbol];
    else
        local v34 = nil;
        local v35 = nil;
        local v36 = nil;
        if v28 == 0 then
            v32 = math.atan2(v28, -1) < 0;
            v34 = nil;
            v35 = 0;
            v36 = 1;
        else
            v32 = v28 < 0;
            local v37, v38, v39 = v0.decimal_conversion.from_double((math.abs(v28)));
            v34 = v37;
            v35 = v38;
            v36 = v39;
        end;
        local v40, v41 = v0.format.format_unsigned_finite(v34, v35, v36, v32, v30);
        v29 = v40;
        v33 = v41;
    end;
    return (v0.format.display_sign(v29, v32, v33, v30.displaySignAt, v30.symbols));
end;
v7.ToSkeleton = function(v42) --[[ Line: 162 ]] --[[ Name: ToSkeleton ]]
    -- upvalues: v0 (copy)
    local v43 = v0.class.try_coerce(1, v42, "NumberFormatter");
    return v0.skeleton.settings_to_skeleton(v0.formatter_settings.linked_list_to_dict(v43));
end;
v6.with = function() --[[ Line: 170 ]] --[[ Name: with ]]
    -- upvalues: v8 (copy)
    return v8(nil);
end;
v6.forSkeleton = function(v44) --[[ Line: 174 ]] --[[ Name: forSkeleton ]]
    -- upvalues: v0 (copy), v8 (copy)
    local v45 = nil;
    local v46 = nil;
    v44 = v0.class.try_coerce(1, v44, "string");
    local v47, v48 = v0.skeleton.to_option_linked_list(v44);
    v45 = v47;
    v46 = v48;
    v47 = v45;
    if v45 then
        return v47, (v8(v46));
    else
        return v47, v46;
    end;
end;
return table.freeze({
    NumberFormatter = table.freeze(v6), 
    Notation = v1, 
    Precision = v2, 
    RoundingPriority = l_enums_0.RoundingPriority, 
    RoundingMode = l_enums_0.RoundingMode, 
    GroupingStrategy = l_enums_0.GroupingStrategy, 
    IntegerWidth = v3, 
    DecimalFormatSymbols = v4, 
    ENumberFormatSymbols = l_enums_0.ENumberFormatSymbols, 
    SignDisplay = l_enums_0.SignDisplay, 
    DecimalSeparatorDisplay = l_enums_0.DecimalSeparatorDisplay
});