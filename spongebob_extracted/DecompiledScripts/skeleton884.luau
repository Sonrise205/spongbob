local v0 = require(script.Parent.formatter_settings);
local v1 = require(script.Parent.enums);
local v2 = {};
local v3 = {
    [v1.SignDisplay.AUTO] = nil, 
    [v1.SignDisplay.ALWAYS] = "sign-always", 
    [v1.SignDisplay.NEVER] = "sign-never", 
    [v1.SignDisplay.EXCEPT_ZERO] = "sign-except-zero", 
    [v1.SignDisplay.NEGATIVE] = "sign-negative"
};
local function v7(v4) --[[ Line: 14 ]] --[[ Name: notation_to_skeleton ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v5 = nil;
    local v6 = nil;
    if v4.type == v1._Internal.NotationType.SCIENTIFIC then
        v5 = true;
        v6 = v4.power10Scale == 3 and "engineering" or "scientific";
        if v4.minExponentDigits ~= 1 then
            v6 = v6 .. "/*" .. string.rep("e", v4.minExponentDigits);
        end;
        if v4.exponentSignDisplay ~= v1.SignDisplay.AUTO then
            return v5, v6 .. "/" .. v3[v4.exponentSignDisplay];
        end;
    elseif v4.type == v1._Internal.NotationType.SIMPLE then
        return true, nil;
    else
        v5 = false;
        v6 = "Compact notation skeleton is not supported for being represented as a skeleton string in this module";
    end;
    return v5, v6;
end;
local function v16(v8) --[[ Line: 40 ]] --[[ Name: precision_to_skeleton ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    if v8.type == v1._Internal.PrecisionType.FRACTION then
        v12 = v8.min;
        v13 = v8.max;
    elseif v8.type == v1._Internal.PrecisionType.SIGNFICANT then
        v14 = v8.min;
        v15 = v8.max;
    elseif v8.type == v1._Internal.PrecisionType.FRACTION_SIGNIFICANT then
        v12 = v8.minFractionDigits;
        v13 = v8.maxFractionDigits;
        if v8.sourcedWithSignificantDigits then
            v14 = v8.minSignificantDigits;
            v15 = v8.maxSignificantDigits;
        elseif v8.roundingPriority == v1.RoundingPriority.RELAXED then
            v14 = v8.maxSignificantDigits;
            v15 = v0.MAX_PRECISION;
        else
            v14 = 1;
            v15 = v8.maxSignificantDigits;
        end;
    else
        v9 = "precision-unlimited";
    end;
    if v12 then
        if v13 == 0 then
            v10 = "precision-integer";
        else
            v10 = "." .. string.rep("0", v12);
            v10 = if v13 == v0.MAX_PRECISION then v10 .. "*" else v10 .. string.rep("#", v13 - v12);
        end;
    end;
    if v14 then
        v11 = string.rep("@", v14);
        v11 = if v15 == v0.MAX_PRECISION then v11 .. "*" else v11 .. string.rep("#", v15 - v14);
    end;
    if v10 then
        v9 = v10;
        if v11 then
            v9 = v9 .. "/" .. v11;
            if v8.type == v1._Internal.PrecisionType.FRACTION_SIGNIFICANT and v8.sourcedWithSignificantDigits then
                if v8.roundingPriority == v1.RoundingPriority.RELAXED then
                    return v9 .. "r";
                else
                    return v9 .. "s";
                end;
            end;
        end;
    elseif v11 then
        v9 = v11;
    end;
    return v9;
end;
local v17 = {
    [v1.RoundingMode.CEILING] = "rounding-mode-ceiling", 
    [v1.RoundingMode.FLOOR] = "rounding-mode-floor", 
    [v1.RoundingMode.DOWN] = "rounding-mode-down", 
    [v1.RoundingMode.UP] = "rounding-mode-up", 
    [v1.RoundingMode.HALF_EVEN] = "rounding-mode-bankers", 
    [v1.RoundingMode.HALF_DOWN] = nil, 
    [v1.RoundingMode.HALF_UP] = "rounding-half-up"
};
local v18 = {
    [v1.GroupingStrategy.OFF] = "group-off", 
    [v1.GroupingStrategy.MIN2] = "group-min2", 
    [v1.GroupingStrategy.ON_ALIGNED] = "group-on-aligned"
};
local function v21(v19) --[[ Line: 122 ]] --[[ Name: int_width_to_skeleton ]]
    local _ = nil;
    if v19.max == -1 then
        return "integer-width/*" .. string.rep("0", v19.min);
    elseif v19.max == 0 and v19.min == 0 then
        return "integer-width-trunc";
    else
        return "integer-width/" .. string.rep("#", v19.max - v19.min) .. string.rep("0", v19.min);
    end;
end;
local v22 = {
    [v1.DecimalSeparatorDisplay.AUTO] = nil, 
    [v1.DecimalSeparatorDisplay.ALWAYS] = "decimal-always"
};
v2.settings_to_skeleton = function(v23) --[[ Line: 143 ]] --[[ Name: settings_to_skeleton ]]
    -- upvalues: v7 (copy), v16 (copy), v17 (copy), v18 (copy), v21 (copy), v22 (copy)
    local v24 = true;
    local v25 = {};
    local v26 = nil;
    if v23.notation then
        local v27 = nil;
        local v28, v29 = v7(v23.notation);
        v24 = v28;
        v27 = v29;
        if v24 then
            table.insert(v25, v27);
        else
            v26 = v27;
        end;
    end;
    if v24 then
        if v23.precision then
            table.insert(v25, (v16(v23.precision)));
        end;
        if v23.roundingMode then
            table.insert(v25, v17[v23.roundingMode]);
        end;
        if v23.grouping then
            table.insert(v25, v18[v23.grouping]);
        end;
        if v23.integerWidth then
            table.insert(v25, (v21(v23.integerWidth)));
        end;
        if v23.decimal then
            table.insert(v25, v22[v23.decimal]);
        end;
        v26 = table.concat(v25, " ");
    end;
    return v24, v26;
end;
local v30 = {
    ["notation-simple"] = "notation", 
    ["precision-unlimited"] = "precision", 
    [".+"] = "precision", 
    ["rounding-mode-ceiling"] = "roundingMode", 
    ["rounding-mode-floor"] = "roundingMode", 
    ["rounding-mode-down"] = "roundingMode", 
    ["rounding-mode-up"] = "roundingMode", 
    ["rounding-mode-half-even"] = "roundingMode", 
    ["rounding-mode-half-down"] = "roundingMode", 
    ["rounding-mode-half-up"] = "roundingMode", 
    ["group-off"] = "grouping", 
    ["group-min2"] = "grouping", 
    ["group-on-aligned"] = "grouping", 
    [",_"] = "grouping", 
    [",?"] = "grouping", 
    [",!"] = "grouping", 
    ["sign-auto"] = "sign", 
    ["sign-always"] = "sign", 
    ["sign-never"] = "sign", 
    ["sign-except-zero"] = "sign", 
    ["sign-negative"] = "sign", 
    ["+!"] = "sign", 
    ["+_"] = "sign", 
    ["+?"] = "sign", 
    ["+-"] = "sign", 
    ["decimal-auto"] = "decimal", 
    ["decimal-always"] = "decimal"
};
local v31 = {
    ["notation-simple"] = table.freeze({
        type = v1._Internal.NotationType.SIMPLE
    }), 
    ["precision-unlimited"] = table.freeze({
        type = v1._Internal.PrecisionType.UNLIMITED
    }), 
    [".+"] = table.freeze({
        type = v1._Internal.PrecisionType.UNLIMITED
    }), 
    ["rounding-mode-ceiling"] = v1.RoundingMode.CEILING, 
    ["rounding-mode-floor"] = v1.RoundingMode.FLOOR, 
    ["rounding-mode-down"] = v1.RoundingMode.DOWN, 
    ["rounding-mode-up"] = v1.RoundingMode.UP, 
    ["rounding-mode-half-even"] = v1.RoundingMode.HALF_EVEN, 
    ["rounding-mode-half-down"] = v1.RoundingMode.HALF_DOWN, 
    ["rounding-mode-half-up"] = v1.RoundingMode.HALF_UP, 
    ["group-off"] = v1.GroupingStrategy.OFF, 
    ["group-min2"] = v1.GroupingStrategy.MIN2, 
    ["group-on-aligned"] = v1.GroupingStrategy.ON_ALIGNED, 
    [",_"] = v1.GroupingStrategy.OFF, 
    [",?"] = v1.GroupingStrategy.MIN2, 
    [",!"] = v1.GroupingStrategy.ON_ALIGNED, 
    ["sign-auto"] = v1.SignDisplay.AUTO, 
    ["sign-always"] = v1.SignDisplay.ALWAYS, 
    ["sign-never"] = v1.SignDisplay.NEVER, 
    ["sign-except-zero"] = v1.SignDisplay.EXCEPT_ZERO, 
    ["sign-negative"] = v1.SignDisplay.NEGATIVE, 
    ["+!"] = v1.SignDisplay.ALWAYS, 
    ["+_"] = v1.SignDisplay.NEVER, 
    ["+?"] = v1.SignDisplay.EXCEPT_ZERO, 
    ["+-"] = v1.SignDisplay.NEGATIVE, 
    ["decimal-auto"] = v1.DecimalSeparatorDisplay.AUTO, 
    ["decimal-always"] = v1.DecimalSeparatorDisplay.ALWAYS
};
local function v38(v32) --[[ Line: 258 ]] --[[ Name: skeleton_to_scientific_notation ]]
    -- upvalues: v1 (copy), v31 (copy), v0 (copy)
    local v33, v34, v35 = string.match(v32, "^(%a+)/?([^/]*)/?([^/]*)$");
    local v36 = 1;
    local l_AUTO_0 = v1.SignDisplay.AUTO;
    if v33 ~= "scientific" and v33 ~= "engineering" then
        return nil;
    else
        if string.match(v34, "^[%*%+]e+$") then
            v36 = #v34 - 1;
            v34 = v35;
            v35 = "";
        elseif string.match(v35, "^[%*%+]e+$") then
            v36 = #v35 - 1;
        end;
        if v34 ~= "" then
            if string.sub(v34, 1, 5) ~= "sign-" then
                return nil;
            else
                l_AUTO_0 = v31[v34];
            end;
        end;
        if v36 > 999 then
            return nil;
        else
            return table.freeze({
                type = v1._Internal.NotationType.SCIENTIFIC, 
                power10Scale = v33 == "engineering" and 3 or 1, 
                minExponentDigits = v36, 
                exponentSignDisplay = l_AUTO_0, 
                displayExponentSignAt = v0.generate_from_sign_enum(l_AUTO_0)
            });
        end;
    end;
end;
local function v46(v39) --[[ Line: 296 ]] --[[ Name: skeleton_to_scientific_notation_concise ]]
    -- upvalues: v31 (copy), v1 (copy), v0 (copy)
    local v40 = nil;
    local l_v39_0 = v39;
    local v42 = nil;
    local v43 = nil;
    local v44, v45 = string.match(v39, "^(EE?)(.+)$");
    v42 = v44;
    l_v39_0 = v45;
    if not v42 then
        return nil;
    else
        v40 = l_v39_0;
        v44, v45 = string.match(l_v39_0, "^(%+[!%?])(.+)$");
        v43 = v44;
        l_v39_0 = v45;
        if v43 then
            v43 = v31[v43];
        else
            l_v39_0 = v40;
            v40 = nil;
            v43 = v1.SignDisplay.AUTO;
        end;
        if not string.match(l_v39_0, "^0+$") then
            return nil;
        elseif #l_v39_0 > 999 then
            return nil;
        else
            return table.freeze({
                type = v1._Internal.NotationType.SCIENTIFIC, 
                power10Scale = v42 == "EE" and 3 or 1, 
                minExponentDigits = #l_v39_0, 
                exponentSignDisplay = v43, 
                displayExponentSignAt = v0.generate_from_sign_enum(v43)
            });
        end;
    end;
end;
local function v62(v47) --[[ Line: 335 ]] --[[ Name: skeleton_to_precision ]]
    -- upvalues: v0 (copy), v1 (copy)
    local l_v47_0 = v47;
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    local v53, v54, v55 = string.match(v47, "^%.((0*)#*)(.*)$");
    v52 = v53;
    v51 = v54;
    l_v47_0 = v55;
    if not v52 then
        v53, v54 = string.match(v47, "^(precision%-integer)(.*)$");
        v52 = v53;
        l_v47_0 = v54;
    end;
    if v52 then
        v53 = nil;
        v54 = nil;
        if v52 == "precision-integer" then
            v53 = 0;
            v54 = 0;
        else
            v53 = #v51;
            v54 = #v52;
        end;
        if string.match(l_v47_0, "^[%*%+]") and v51 == v52 then
            v54 = -1;
            l_v47_0 = string.sub(l_v47_0, 2);
        end;
        if v53 > 999 or v54 > 999 then
            return nil;
        else
            if v54 == -1 then
                v54 = v0.MAX_PRECISION;
            end;
            if string.sub(l_v47_0, 1, 1) == "/" then
                v55 = nil;
                local v56 = nil;
                local v57 = nil;
                local v58 = false;
                local v59, v60, v61 = string.match(l_v47_0, "^/((@+)#*)([%*%+rs]?)$");
                v50 = v59;
                v49 = v60;
                v55 = v61;
                if not v50 or v55 == "" and v49 ~= "@" or (v55 == "*" or v55 == "+") and v49 ~= v50 then
                    return nil;
                else
                    if v55 == "" then
                        v56 = 1;
                        v57 = #v50;
                        v55 = "s";
                    elseif v55 == "*" or v55 == "+" then
                        v56 = 1;
                        v57 = #v49;
                        v55 = "r";
                    else
                        v58 = true;
                        v56 = #v49;
                        v57 = #v50;
                    end;
                    if v56 > 999 or v57 > 999 then
                        return nil;
                    else
                        return table.freeze({
                            type = v1._Internal.PrecisionType.FRACTION_SIGNIFICANT, 
                            minFractionDigits = v53, 
                            maxFractionDigits = v54, 
                            minSignificantDigits = v56, 
                            maxSignificantDigits = v57, 
                            roundingPriority = if v55 == "r" then v1.RoundingPriority.RELAXED else v1.RoundingPriority.STRICT, 
                            sourcedWithSignificantDigits = v58
                        });
                    end;
                end;
            elseif l_v47_0 ~= "" then
                return nil;
            else
                return table.freeze({
                    type = v1._Internal.PrecisionType.FRACTION, 
                    min = v53, 
                    max = v54
                });
            end;
        end;
    else
        v53, v54, v55 = string.match(v47, "^((@+)#*)([%*%+]?)$");
        v50 = v53;
        v49 = v54;
        l_v47_0 = v55;
        if v50 then
            v53 = #v49;
            v54 = #v50;
            if l_v47_0 ~= "" then
                if v53 ~= v54 then
                    return nil;
                else
                    v54 = -1;
                    l_v47_0 = string.sub(l_v47_0, 2);
                end;
            end;
            if v53 > 999 or v54 > 999 then
                return nil;
            else
                if v54 == -1 then
                    v54 = v0.MAX_PRECISION;
                end;
                return table.freeze({
                    type = v1._Internal.PrecisionType.SIGNFICANT, 
                    min = v53, 
                    max = v54
                });
            end;
        else
            return nil;
        end;
    end;
end;
local function v68(v63) --[[ Line: 455 ]] --[[ Name: skeleton_to_int_width ]]
    local v64 = nil;
    local v65 = nil;
    if v63 == "integer-width-trunc" then
        return table.freeze({
            min = 0, 
            max = 0
        });
    else
        v64 = string.match(v63, "^integer%-width/[%*%+](0*)$");
        if v64 then
            if #v64 > 999 then
                return nil;
            else
                return table.freeze({
                    min = #v64, 
                    max = -1
                });
            end;
        else
            local v66, v67 = string.match(v63, "^integer%-width/(#*(0*))$");
            v65 = v66;
            v64 = v67;
            if not v65 or v65 == "" or #v65 > 999 or #v64 > 999 then
                return nil;
            else
                return table.freeze({
                    min = #v64, 
                    max = #v65
                });
            end;
        end;
    end;
end;
local function v70(v69) --[[ Line: 487 ]] --[[ Name: skeleton_to_int_width_concise ]]
    if string.match(v69, "^0+$") and #v69 < 1000 then
        return (table.freeze({
            min = #v69, 
            max = -1
        }));
    else
        return nil;
    end;
end;
v2.to_option_linked_list = function(v71) --[[ Line: 493 ]] --[[ Name: to_option_linked_list ]]
    -- upvalues: v30 (copy), v31 (copy), v38 (copy), v46 (copy), v62 (copy), v68 (copy), v70 (copy)
    local v72 = nil;
    local v73 = {};
    for v74, v75 in string.gmatch(v71, "()(%S+)") do
        local v76 = nil;
        local v77 = nil;
        v76 = v30[v75];
        if v76 then
            v77 = v31[v75];
        end;
        if not v77 then
            v77 = v38(v75) or v46(v75);
            if v77 then
                v76 = "notation";
            end;
        end;
        if not v77 then
            v77 = v62(v75);
            if v77 then
                v76 = "precision";
            end;
        end;
        if not v77 then
            v77 = v68(v75) or v70(v75);
            if v77 then
                v76 = "integerWidth";
            end;
        end;
        if not v76 or v73[v76] then
            return false, string.format("number skeleton syntax error near '%s' at position %d", string.gsub(v75, "'", "\\'"), v74);
        else
            v73[v76] = true;
            v72 = {
                key = v76, 
                value = v77, 
                parent = v72
            };
        end;
    end;
    return true, v72;
end;
return v2;