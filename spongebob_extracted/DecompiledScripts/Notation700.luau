local v0 = require(script.Parent.Parent._internal);
local v1 = {};
local v2 = {};
local v3 = v0.class.create_init_function("Notation", nil, v1, nil, true);
local v4 = {};
local v5 = v0.class.create_init_function("ScientificNotation", "Notation", v4, v2, true);
v4.WithMinExponentDigits = function(v6, v7) --[[ Line: 13 ]] --[[ Name: WithMinExponentDigits ]]
    -- upvalues: v0 (copy), v5 (copy)
    local v8 = v0.class.try_coerce(1, v6, "ScientificNotation");
    v7 = v0.class.try_coerce_range(2, v7, 1, 999);
    v8 = table.clone(v8);
    v8.minExponentDigits = v7;
    return v5(v8);
end;
v4.WithExponentSignDisplay = function(v9, v10) --[[ Line: 23 ]] --[[ Name: WithExponentSignDisplay ]]
    -- upvalues: v0 (copy), v5 (copy)
    local v11 = v0.class.try_coerce(1, v9, "ScientificNotation");
    v10 = v0.class.try_coerce_enum(2, v10, v0.enums.SignDisplay);
    v11 = table.clone(v11);
    v11.exponentSignDisplay = v10;
    v11.displayExponentSignAt = v0.formatter_settings.generate_from_sign_enum(v10);
    return v5(v11);
end;
local _ = v0.class.create_init_function("CompactNotation", "Notation", {}, v2, true);
local _ = v0.class.create_init_function("SimpleNotation", "Notation", {}, v2, true);
v1.scientific = function() --[[ Line: 47 ]] --[[ Name: scientific ]]
    -- upvalues: v5 (copy), v0 (copy)
    return v5({
        type = v0.enums._Internal.NotationType.SCIENTIFIC, 
        power10Scale = 1, 
        minExponentDigits = 1, 
        exponentSignDisplay = v0.enums.SignDisplay.AUTO, 
        displayExponentSignAt = v0.formatter_settings.generate_from_sign_enum(v0.enums.SignDisplay.AUTO)
    });
end;
v1.engineering = function() --[[ Line: 58 ]] --[[ Name: engineering ]]
    -- upvalues: v5 (copy), v0 (copy)
    return v5({
        type = v0.enums._Internal.NotationType.SCIENTIFIC, 
        power10Scale = 3, 
        minExponentDigits = 1, 
        exponentSignDisplay = v0.enums.SignDisplay.AUTO, 
        displayExponentSignAt = v0.formatter_settings.generate_from_sign_enum(v0.enums.SignDisplay.AUTO)
    });
end;
v1.compactWithSuffixThousands = function(v14) --[[ Line: 69 ]] --[[ Name: compactWithSuffixThousands ]]
    -- upvalues: v0 (copy), v3 (copy)
    local v15 = nil;
    v14 = v0.class.try_coerce(1, v14, "{string}");
    v15 = table.find(v14, ",");
    if v15 then
        error(string.format("Index %d is an empty string, please double check the suffixes", v15), 2);
    elseif #v14 == 0 then
        error("Suffixes is empty", 2);
    end;
    return v3({
        type = v0.enums._Internal.NotationType.COMPACT, 
        power10Scale = 3, 
        suffixes = v14, 
        suffixesLength = #v14
    });
end;
v1.simple = function() --[[ Line: 89 ]] --[[ Name: simple ]]
    -- upvalues: v3 (copy), v0 (copy)
    return v3({
        type = v0.enums._Internal.NotationType.SIMPLE
    });
end;
return table.freeze(v1);