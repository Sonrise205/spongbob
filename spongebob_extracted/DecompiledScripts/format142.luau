local v0 = require(script.Parent.enums);
local v1 = require(script.Parent.formatter_settings);
local v2 = {};
local function v11(v3, v4, v5, v6) --[[ Line: 5 ]] --[[ Name: internal_get_digits ]]
    local v7 = nil;
    local _ = nil;
    local v9 = nil;
    local v10 = nil;
    if v5 <= 0 then
        v7 = string.rep("0", -v5 + 1);
        v5 = 1;
    else
        v7 = "";
    end;
    v10 = v6 - math.max(v4, v5 - 1);
    if v10 <= 0 then
        v9 = "";
    else
        v6 = v4;
        v9 = string.rep("0", v10);
    end;
    return v7 .. (v4 < v5 and "" or string.char(table.unpack(v3, v5, v6))) .. v9;
end;
v2.strip_trailing_zero = function(v12, v13) --[[ Line: 32 ]] --[[ Name: strip_trailing_zero ]]
    if v13 < 0 then
        return 0;
    else
        while v12[v13] == 0 do
            v13 = v13 - 1;
        end;
        return v13;
    end;
end;
v2.round_sig = function(v14, v15, v16, v17, v18) --[[ Line: 43 ]] --[[ Name: round_sig ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v19 = 0;
    if v16 < v15 then
        local v20 = nil;
        local v21 = nil;
        v20 = v16 < 0 and -1 or v14[v16 + 1] > 5 and 1 or if v14[v16 + 1] == 5 then v16 + 1 < v15 and 1 or 0 else -1;
        if v18 == v0.RoundingMode.CEILING then
            v21 = v17 and 1 or -2;
        elseif v18 == v0.RoundingMode.FLOOR then
            v21 = v17 and -2 or 1;
        elseif v18 == v0.RoundingMode.UP then
            v21 = -2;
        elseif v18 == v0.RoundingMode.DOWN then
            v21 = 1;
        elseif v18 == v0.RoundingMode.HALF_EVEN then
            v21 = v16 <= 0 and 0 or v14[v16] % -2;
        elseif v18 == v0.RoundingMode.HALF_DOWN then
            v21 = 0;
        elseif v18 == v0.RoundingMode.HALF_UP then
            v21 = -1;
        end;
        v15 = v16;
        if v21 < v20 then
            while v14[v15] == 9 and v15 > 0 do
                v15 = v15 - 1;
            end;
            if v15 <= 0 then
                v14[1] = 1;
                v19 = 1 - v15;
                v15 = 1;
            else
                v14[v15] = v14[v15] + 1;
            end;
        end;
        v15 = v2.strip_trailing_zero(v14, v15);
    end;
    return v15, v19;
end;
v2.resolve_int_frac = function(v22, v23, v24, v25, v26, v27, v28) --[[ Line: 108 ]] --[[ Name: resolve_int_frac ]]
    -- upvalues: v11 (copy)
    local v29 = nil;
    local v30 = nil;
    local _ = nil;
    for v32 = 1, v23 do
        v22[v32] = v22[v32] + 48;
    end;
    if v24 < v25 and v26 < v24 + 1 then
        v29 = "0";
        v30 = "";
    else
        v29 = v11(v22, v23, v25, v24);
        v30 = v11(v22, v23, v24 + 1, v26);
    end;
    if v27 and v27 <= v24 - v25 + 1 then
        local v33 = nil;
        v33 = v28 == "%" and "%0%%" or if #v28 > 1 then "%0" .. string.reverse(v28) else "%0" .. v28;
        v29 = string.reverse((string.gsub(string.reverse(v29), "...", v33, (v24 - v25) / 3)));
    end;
    return v29, v30;
end;
v2.format_expt = function(v34, v35, v36, v37) --[[ Line: 145 ]] --[[ Name: format_expt ]]
    -- upvalues: v0 (copy)
    local v38 = "";
    local v39 = nil;
    if v34 < 0 then
        v39 = tostring(-v34);
        if v37.negative then
            v38 = v35[v0.ENumberFormatSymbols.kMinusSignSymbol];
        end;
    elseif v34 == 0 then
        v39 = "0";
        if v37.positiveZero then
            v38 = v35[v0.ENumberFormatSymbols.kPlusSignSymbol];
        end;
    else
        v39 = tostring(v34);
        if v37.positive then
            v38 = v35[v0.ENumberFormatSymbols.kPlusSignSymbol];
        end;
    end;
    v39 = string.rep("0", v36 - #v39) .. v39;
    return v35[v0.ENumberFormatSymbols.kExponentialSymbol] .. v38 .. v39;
end;
v2.resolve_with_notation = function(_, v41, v42, v43, v44) --[[ Line: 171 ]] --[[ Name: resolve_with_notation ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    local l_v42_0 = v42;
    if v41 <= 0 then
        if v43.type == v0._Internal.NotationType.SCIENTIFIC then
            v45 = v2.format_expt(0, v44, v43.minExponentDigits, v43.displayExponentSignAt);
        end;
    elseif v43.type == v0._Internal.NotationType.SIMPLE then
        l_v42_0 = l_v42_0 + v41;
    else
        local l_power10Scale_0 = v43.power10Scale;
        local v50 = l_v42_0 + v41 - 1;
        local v51 = math.floor(v50 / l_power10Scale_0);
        l_v42_0 = v50 - v51 * l_power10Scale_0 + 1;
        if v43.type == v0._Internal.NotationType.COMPACT then
            local l_suffixesLength_0 = v43.suffixesLength;
            if l_suffixesLength_0 < v51 then
                l_v42_0 = l_v42_0 + (v51 - l_suffixesLength_0) * l_power10Scale_0;
                v45 = v43.suffixes[l_suffixesLength_0];
            elseif v51 < 0 then
                l_v42_0 = l_v42_0 + v51 * l_power10Scale_0;
            elseif v51 ~= 0 then
                v45 = v43.suffixes[v51];
            end;
            if v51 >= 0 and v51 < l_suffixesLength_0 then
                v46 = l_power10Scale_0;
                v47 = v43.suffixes[v51 + 1];
            end;
        else
            v45 = v2.format_expt(v51 * l_power10Scale_0, v44, v43.minExponentDigits, v43.displayExponentSignAt);
            v47 = v2.format_expt((v51 + 1) * l_power10Scale_0, v44, v43.minExponentDigits, v43.displayExponentSignAt);
            v46 = l_power10Scale_0;
        end;
    end;
    return l_v42_0, v45, v46, v47;
end;
v2.format_unsigned_finite = function(v53, v54, v55, v56, v57) --[[ Line: 232 ]] --[[ Name: format_unsigned_finite ]]
    -- upvalues: v2 (copy), v1 (copy), v0 (copy)
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    local l_min_0 = v57.integerWidth.min;
    local l_max_0 = v57.integerWidth.max;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local l_notation_0 = v57.notation;
    local l_symbols_0 = v57.symbols;
    local v69, v70, v71, v72 = v2.resolve_with_notation(v53, v54, v55, l_notation_0, l_symbols_0);
    local v73, v74 = v1.resolve_min_max_sig(v57.precision, v69);
    v64 = v73;
    v73, v74 = v2.round_sig(v53, v54, v74, v56, v57.roundingMode);
    v54 = v73;
    v66 = v74;
    v59 = v54 == 0;
    if v66 > 0 then
        if v69 == v71 then
            assert(v66 == 1);
            v70 = v72;
            v69 = 1;
        else
            v69 = v69 + v66;
        end;
        v73, v74 = v1.resolve_min_max_sig(v57.precision, v69);
        v64 = v73;
        v65 = v74;
    elseif v59 then
        v73, v74 = v1.resolve_min_max_sig(v57.precision, 1);
        v64 = v73;
        v65 = v74;
        v69 = 1;
    end;
    v61 = if v69 < l_min_0 then l_min_0 else if l_max_0 ~= -1 and l_max_0 < v69 then l_max_0 else v69;
    v73, v74 = v2.resolve_int_frac(v53, v54, v69, math.max(v69, 0) - v61 + 1, math.max(v54, v64), v57.minGrouping, l_symbols_0[v0.ENumberFormatSymbols.kGroupingSeparatorSymbol]);
    v58 = v73;
    v60 = v74;
    if v57.alwaysDisplayDecimal or v60 ~= "" then
        v58 = v58 .. l_symbols_0[v0.ENumberFormatSymbols.kDecimalSeparatorSymbol] .. v60;
    end;
    if v70 then
        v58 = v58 .. v70;
    end;
    return v58, v59;
end;
v2.display_sign = function(v75, v76, v77, v78, v79) --[[ Line: 316 ]] --[[ Name: display_sign ]]
    -- upvalues: v0 (copy)
    local v80 = nil;
    local v81 = nil;
    if v76 then
        v80 = v79[v0.ENumberFormatSymbols.kMinusSignSymbol];
        v81 = if v77 then v78.negativeZero else v78.negative;
    else
        v80 = v79[v0.ENumberFormatSymbols.kPlusSignSymbol];
        v81 = if v77 then v78.positiveZero else v78.positive;
    end;
    if v81 then
        return v80 .. v75;
    else
        return v75;
    end;
end;
return table.freeze(v2);