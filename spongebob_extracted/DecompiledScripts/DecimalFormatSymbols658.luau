local v0 = require(script.Parent.Parent._internal);
local v1 = {};
local v2 = {};
local v3 = v0.class.create_init_function("DecimalFormatSymbols", nil, v2, nil, false);
v2.GetSymbol = function(v4, v5) --[[ Line: 8 ]] --[[ Name: GetSymbol ]]
    -- upvalues: v0 (copy)
    return v0.class.try_coerce(1, v4, "DecimalFormatSymbols")[v0.class.try_coerce_enum(2, v5, v0.enums.ENumberFormatSymbols)];
end;
v2.SetSymbol = function(v6, v7, v8) --[[ Line: 15 ]] --[[ Name: SetSymbol ]]
    -- upvalues: v0 (copy)
    v0.class.try_coerce(1, v6, "DecimalFormatSymbols")[v0.class.try_coerce_enum(2, v7, v0.enums.ENumberFormatSymbols)] = v0.class.try_coerce(3, v8, "string");
end;
v1.createWithLastResortData = function() --[[ Line: 24 ]] --[[ Name: createWithLastResortData ]]
    -- upvalues: v3 (copy), v0 (copy)
    return v3({
        [v0.enums.ENumberFormatSymbols.kDecimalSeparatorSymbol] = ".", 
        [v0.enums.ENumberFormatSymbols.kGroupingSeparatorSymbol] = "", 
        [v0.enums.ENumberFormatSymbols.kMinusSignSymbol] = "-", 
        [v0.enums.ENumberFormatSymbols.kPlusSignSymbol] = "+", 
        [v0.enums.ENumberFormatSymbols.kExponentialSymbol] = "E", 
        [v0.enums.ENumberFormatSymbols.kInfinitySymbol] = "\226\136\158", 
        [v0.enums.ENumberFormatSymbols.kNaNSymbol] = "\239\191\189"
    });
end;
return table.freeze(v1);