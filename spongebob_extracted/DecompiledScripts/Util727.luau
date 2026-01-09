local l_TextService_0 = game:GetService("TextService");
local v7 = {
    MakeDictionary = function(v1) --[[ Line: 17 ]] --[[ Name: MakeDictionary ]]
        local v2 = {};
        for v3 = 1, #v1 do
            v2[v1[v3]] = true;
        end;
        return v2;
    end, 
    DictionaryKeys = function(v4) --[[ Line: 30 ]] --[[ Name: DictionaryKeys ]]
        local v5 = {};
        for v6 in pairs(v4) do
            table.insert(v5, v6);
        end;
        return v5;
    end
};
local function _(v8) --[[ Line: 41 ]] --[[ Name: transformInstanceSet ]]
    local v9 = {};
    for v10 = 1, #v8 do
        v9[v10] = v8[v10].Name;
    end;
    return v9, v8;
end;
v7.MakeFuzzyFinder = function(v12) --[[ Line: 59 ]] --[[ Name: MakeFuzzyFinder ]]
    local v13 = nil;
    local v14 = {};
    if typeof(v12) == "Enum" then
        v12 = v12:GetEnumItems();
    end;
    if typeof(v12) == "Instance" then
        local l_v12_Children_0 = v12:GetChildren();
        local v16 = {};
        for v17 = 1, #l_v12_Children_0 do
            v16[v17] = l_v12_Children_0[v17].Name;
        end;
        local l_v16_0 = v16;
        local l_l_v12_Children_0_0 = l_v12_Children_0;
        v13 = l_v16_0;
        v14 = l_l_v12_Children_0_0;
    elseif typeof(v12) == "table" then
        if typeof(v12[1]) == "Instance" or typeof(v12[1]) == "EnumItem" or typeof(v12[1]) == "table" and typeof(v12[1].Name) == "string" then
            local l_v12_0 = v12;
            local v21 = {};
            for v22 = 1, #l_v12_0 do
                v21[v22] = l_v12_0[v22].Name;
            end;
            local l_v21_0 = v21;
            local l_l_v12_0_0 = l_v12_0;
            v13 = l_v21_0;
            v14 = l_l_v12_0_0;
        elseif type(v12[1]) == "string" then
            v13 = v12;
        elseif v12[1] ~= nil then
            error("[Cmdr] MakeFuzzyFinder only accepts tables of instances or strings.");
        else
            v13 = {};
        end;
    else
        error("[Cmdr] MakeFuzzyFinder only accepts a table, Enum, or Instance.");
    end;
    return function(v25, v26, v27) --[[ Line: 88 ]]
        -- upvalues: v13 (ref), v14 (ref)
        local v28 = {};
        for v29, v30 in pairs(v13) do
            local v31 = v14 and v14[v29] or v30;
            if v30:lower() == v25:lower() then
                if v26 then
                    return v31;
                else
                    table.insert(v28, 1, v31);
                end;
            elseif v27 then
                if v30:lower():sub(1, #v25) == v25:lower() then
                    v28[#v28 + 1] = v31;
                end;
            elseif v30:lower():find(v25:lower(), 1, true) then
                v28[#v28 + 1] = v31;
            end;
        end;
        if v26 then
            return v28[1];
        else
            return v28;
        end;
    end;
end;
v7.GetNames = function(v32) --[[ Line: 124 ]] --[[ Name: GetNames ]]
    local v33 = {};
    for v34 = 1, #v32 do
        v33[v34] = v32[v34].Name or tostring(v32[v34]);
    end;
    return v33;
end;
v7.SplitStringSimple = function(v35, v36) --[[ Line: 137 ]] --[[ Name: SplitStringSimple ]]
    if v36 == nil then
        v36 = "%s";
    end;
    local v37 = {};
    local v38 = 1;
    for v39 in string.gmatch(v35, "([^" .. v36 .. "]+)") do
        v37[v38] = v39;
        v38 = v38 + 1;
    end;
    return v37;
end;
local function v41(v40) --[[ Line: 150 ]] --[[ Name: charCode ]]
    return utf8.char((tonumber(v40, 16)));
end;
v7.ParseEscapeSequences = function(v42) --[[ Line: 157 ]] --[[ Name: ParseEscapeSequences ]]
    -- upvalues: v41 (copy)
    return v42:gsub("\\(.)", {
        t = "\t", 
        n = "\n"
    }):gsub("\\u(%x%x%x%x)", v41):gsub("\\x(%x%x)", v41);
end;
v7.EncodeEscapedOperator = function(v43, v44) --[[ Line: 169 ]] --[[ Name: EncodeEscapedOperator ]]
    local v45 = v44:sub(1, 1);
    local v46 = v44:gsub(".", "%%%1");
    return v43:gsub("(" .. ("%" .. v45) .. "+)(" .. v46 .. ")", function(v47, v48) --[[ Line: 174 ]]
        return (v47:sub(1, #v47 - 1) .. v48):gsub(".", function(v49) --[[ Line: 175 ]]
            return "\\u" .. string.format("%04x", string.byte(v49), 16);
        end);
    end);
end;
local v50 = {
    "&&", 
    "||", 
    ";"
};
v7.EncodeEscapedOperators = function(v51) --[[ Line: 185 ]] --[[ Name: EncodeEscapedOperators ]]
    -- upvalues: v50 (copy), v7 (copy)
    for _, v53 in ipairs(v50) do
        v51 = v7.EncodeEscapedOperator(v51, v53);
    end;
    return v51;
end;
local function _(v54) --[[ Line: 193 ]] --[[ Name: encodeControlChars ]]
    return (v54:gsub("\\\\", "___!CMDR_ESCAPE!___"):gsub("\\\"", "___!CMDR_QUOTE!___"):gsub("\\'", "___!CMDR_SQUOTE!___"):gsub("\\\n", "___!CMDR_NL!___"));
end;
local function _(v56) --[[ Line: 202 ]] --[[ Name: decodeControlChars ]]
    return (v56:gsub("___!CMDR_ESCAPE!___", "\\"):gsub("___!CMDR_QUOTE!___", "\""):gsub("___!CMDR_NL!___", "\n"));
end;
v7.SplitString = function(v58, v59) --[[ Line: 209 ]] --[[ Name: SplitString ]]
    -- upvalues: v7 (copy)
    v58 = v58:gsub("\\\\", "___!CMDR_ESCAPE!___"):gsub("\\\"", "___!CMDR_QUOTE!___"):gsub("\\'", "___!CMDR_SQUOTE!___"):gsub("\\\n", "___!CMDR_NL!___");
    v59 = v59 or 1e999;
    local v60 = {};
    local v61 = nil;
    local v62 = nil;
    for v63 in v58:gmatch("[^ ]+") do
        v63 = v7.ParseEscapeSequences(v63);
        local v64 = v63:match("^(['\"])");
        local v65 = v63:match("(['\"])$");
        local v66 = v63:match("(\\*)['\"]$");
        if v64 and not v62 and not v65 then
            v61 = v63;
            v62 = v64;
        elseif v61 and v65 == v62 and #v66 % 2 == 0 then
            v63 = v61 .. " " .. v63;
            v61 = nil;
            v62 = nil;
        elseif v61 then
            v61 = v61 .. " " .. v63;
        end;
        if not v61 then
            v60[#v60 + (v59 < #v60 and 0 or 1)] = v63:gsub("^(['\"])", ""):gsub("(['\"])$", ""):gsub("___!CMDR_ESCAPE!___", "\\"):gsub("___!CMDR_QUOTE!___", "\""):gsub("___!CMDR_NL!___", "\n");
        end;
    end;
    if v61 then
        v60[#v60 + (v59 < #v60 and 0 or 1)] = v61:gsub("___!CMDR_ESCAPE!___", "\\"):gsub("___!CMDR_QUOTE!___", "\""):gsub("___!CMDR_NL!___", "\n");
    end;
    return v60;
end;
v7.MashExcessArguments = function(v67, v68) --[[ Line: 242 ]] --[[ Name: MashExcessArguments ]]
    local v69 = {};
    for v70 = 1, #v67 do
        if v68 < v70 then
            v69[v68] = ("%s %s"):format(v69[v68] or "", v67[v70]);
        else
            v69[v70] = v67[v70];
        end;
    end;
    return v69;
end;
v7.TrimString = function(v71) --[[ Line: 257 ]] --[[ Name: TrimString ]]
    local _, v73 = string.find(v71, "^%s*");
    if v73 == #v71 then
        return "";
    else
        return (string.match(v71, ".*%S", v73 + 1));
    end;
end;
v7.GetTextSize = function(v74, v75, v76) --[[ Line: 266 ]] --[[ Name: GetTextSize ]]
    -- upvalues: l_TextService_0 (copy)
    return l_TextService_0:GetTextSize(v74, v75.TextSize, v75.Font, v76 or Vector2.new(v75.AbsoluteSize.X, 0));
end;
v7.MakeEnumType = function(v77, v78) --[[ Line: 274 ]] --[[ Name: MakeEnumType ]]
    -- upvalues: v7 (copy)
    local v79 = v7.MakeFuzzyFinder(v78);
    return {
        Validate = function(v80) --[[ Line: 277 ]] --[[ Name: Validate ]]
            -- upvalues: v79 (copy), v77 (copy)
            return v79(v80, true) ~= nil, ("Value %q is not a valid %s."):format(v80, v77);
        end, 
        Autocomplete = function(v81) --[[ Line: 280 ]] --[[ Name: Autocomplete ]]
            -- upvalues: v79 (copy), v7 (ref)
            local v82 = v79(v81);
            return type(v82[1]) ~= "string" and v7.GetNames(v82) or v82;
        end, 
        Parse = function(v83) --[[ Line: 284 ]] --[[ Name: Parse ]]
            -- upvalues: v79 (copy)
            return v79(v83, true);
        end
    };
end;
v7.ParsePrefixedUnionType = function(v84, v85) --[[ Line: 293 ]] --[[ Name: ParsePrefixedUnionType ]]
    -- upvalues: v7 (copy)
    local v86 = v7.SplitStringSimple(v84);
    local v87 = {};
    for v88 = 1, #v86, 2 do
        v87[#v87 + 1] = {
            prefix = v86[v88 - 1] or "", 
            type = v86[v88]
        };
    end;
    table.sort(v87, function(v89, v90) --[[ Line: 305 ]]
        return #v89.prefix > #v90.prefix;
    end);
    for v91 = 1, #v87 do
        local v92 = v87[v91];
        if v85:sub(1, #v92.prefix) == v92.prefix then
            return v92.type, v85:sub(#v92.prefix + 1), v92.prefix;
        end;
    end;
end;
v7.MakeListableType = function(v93, v94) --[[ Line: 325 ]] --[[ Name: MakeListableType ]]
    local v95 = {
        Listable = true, 
        Transform = v93.Transform, 
        Validate = v93.Validate, 
        ValidateOnce = v93.ValidateOnce, 
        Autocomplete = v93.Autocomplete, 
        Default = v93.Default, 
        ArgumentOperatorAliases = v93.ArgumentOperatorAliases, 
        Parse = function(...) --[[ Line: 334 ]] --[[ Name: Parse ]]
            -- upvalues: v93 (copy)
            return {
                v93.Parse(...)
            };
        end
    };
    if v94 then
        for v96, v97 in pairs(v94) do
            v95[v96] = v97;
        end;
    end;
    return v95;
end;
local function _(v98) --[[ Line: 348 ]] --[[ Name: encodeCommandEscape ]]
    return (v98:gsub("\\%$", "___!CMDR_DOLLAR!___"));
end;
local function _(v100) --[[ Line: 352 ]] --[[ Name: decodeCommandEscape ]]
    return (v100:gsub("___!CMDR_DOLLAR!___", "$"));
end;
v7.RunCommandString = function(v102, v103) --[[ Line: 361 ]] --[[ Name: RunCommandString ]]
    -- upvalues: v7 (copy)
    v103 = v7.ParseEscapeSequences(v103);
    local v104 = v7.EncodeEscapedOperators(v103):split("&&");
    local v105 = "";
    for v106, v107 in ipairs(v104) do
        local v108 = v105:gsub("%$", "\\x24"):gsub("%%", "%%%%");
        v107 = v107:gsub("||", v105:find("%s") and ("%q"):format(v108) or v108);
        v105 = tostring(v102:EvaluateAndRun((v7.RunEmbeddedCommands(v102, v107))));
        if v106 == #v104 then
            return v105;
        end;
    end;
end;
v7.RunEmbeddedCommands = function(v109, v110) --[[ Line: 386 ]] --[[ Name: RunEmbeddedCommands ]]
    -- upvalues: v7 (copy)
    v110 = v110:gsub("\\%$", "___!CMDR_DOLLAR!___");
    local v111 = {};
    for v112 in v110:gmatch("$(%b{})") do
        local v113 = true;
        local v114 = v112:sub(2, #v112 - 1);
        if v114:match("^{.+}$") then
            v113 = false;
            v114 = v114:sub(2, #v114 - 1);
        end;
        v111[v112] = v7.RunCommandString(v109, v114);
        if v113 and (v111[v112]:find("%s") or v111[v112] == "") then
            v111[v112] = string.format("%q", v111[v112]);
        end;
    end;
    return (v110:gsub("$(%b{})", v111):gsub("___!CMDR_DOLLAR!___", "$"));
end;
v7.SubstituteArgs = function(v115, v116) --[[ Line: 417 ]] --[[ Name: SubstituteArgs ]]
    v115 = v115:gsub("\\%$", "___!CMDR_DOLLAR!___");
    if type(v116) == "table" then
        for v117 = 1, #v116 do
            local v118 = tostring(v117);
            v116[v118] = v116[v117];
            if v116[v118]:find("%s") then
                v116[v118] = string.format("%q", v116[v118]);
            end;
        end;
    end;
    return (v115:gsub("($%d+)%b{}", "%1"):gsub("$(%w+)", v116):gsub("___!CMDR_DOLLAR!___", "$"));
end;
v7.MakeAliasCommand = function(v119, v120) --[[ Line: 437 ]] --[[ Name: MakeAliasCommand ]]
    -- upvalues: v7 (copy)
    local v121, v122 = unpack(v119:split("|"));
    local v123 = {};
    v120 = v7.EncodeEscapedOperators(v120);
    local v124 = {};
    for v125 in v120:gmatch("$(%d+)") do
        if v124[v125] == nil then
            v124[v125] = true;
            local v126 = v120:match((("$%*(%%b{})"):format(v125)));
            local v127 = nil;
            local v128 = nil;
            local v129 = nil;
            local v130 = nil;
            if v126 then
                local v131, v132, v133 = unpack(v126:sub(2, #v126 - 1):split("|"));
                v128 = v131;
                v129 = v132;
                v130 = v133;
            end;
            v127 = v128 and not not v128:match("%?$");
            v128 = if v128 then v128:match("^%w+") else "string";
            v129 = v129 or ("Argument %*"):format(v125);
            v130 = v130 or "";
            table.insert(v123, {
                Type = v128, 
                Name = v129, 
                Description = v130, 
                Optional = v127
            });
        end;
    end;
    return {
        Name = v121, 
        Aliases = {}, 
        Description = ("<Alias> %*"):format(v122 or v120), 
        Group = "UserAlias", 
        Args = v123, 
        ClientRun = function(v134) --[[ Line: 476 ]] --[[ Name: ClientRun ]]
            -- upvalues: v7 (ref), v120 (ref)
            return v7.RunCommandString(v134.Dispatcher, v7.SubstituteArgs(v120, v134.RawArguments));
        end
    };
end;
v7.MakeSequenceType = function(v135) --[[ Line: 490 ]] --[[ Name: MakeSequenceType ]]
    -- upvalues: v7 (copy)
    v135 = v135 or {};
    local v136 = true;
    if v135.Parse == nil then
        v136 = v135.Constructor ~= nil;
    end;
    assert(v136, "[Cmdr] MakeSequenceType: Must provide one of: Constructor, Parse");
    v135.TransformEach = v135.TransformEach or function(...) --[[ Line: 498 ]]
        return ...;
    end;
    v135.ValidateEach = v135.ValidateEach or function() --[[ Line: 502 ]]
        return true;
    end;
    return {
        Prefixes = v135.Prefixes, 
        Transform = function(v137) --[[ Line: 509 ]] --[[ Name: Transform ]]
            -- upvalues: v7 (ref), v135 (ref)
            return v7.Map(v7.SplitPrioritizedDelimeter(v137, {
                ",", 
                "%s"
            }), function(v138) --[[ Line: 510 ]]
                -- upvalues: v135 (ref)
                return v135.TransformEach(v138);
            end);
        end, 
        Validate = function(v139) --[[ Line: 515 ]] --[[ Name: Validate ]]
            -- upvalues: v135 (ref)
            if v135.Length and #v139 > v135.Length then
                return false, ("Maximum of %d values allowed in sequence"):format(v135.Length);
            else
                local v140 = 1;
                local v141 = v135.Length or #v139;
                for v142 = v140, v141 do
                    local v143, v144 = v135.ValidateEach(v139[v142], v142);
                    if not v143 then
                        return false, v144;
                    end;
                end;
                return true;
            end;
        end, 
        Parse = v135.Parse or function(v145) --[[ Line: 531 ]]
            -- upvalues: v135 (ref)
            return v135.Constructor(unpack(v145));
        end
    };
end;
v7.SplitPrioritizedDelimeter = function(v146, v147) --[[ Line: 540 ]] --[[ Name: SplitPrioritizedDelimeter ]]
    -- upvalues: v7 (copy)
    for v148, v149 in ipairs(v147) do
        if v146:find(v149) or v148 == #v147 then
            return v7.SplitStringSimple(v146, v149);
        end;
    end;
end;
v7.Map = function(v150, v151) --[[ Line: 552 ]] --[[ Name: Map ]]
    local v152 = {};
    for v153, v154 in ipairs(v150) do
        v152[v153] = v151(v154, v153);
    end;
    return v152;
end;
v7.Each = function(v155, ...) --[[ Line: 563 ]] --[[ Name: Each ]]
    local v156 = {};
    for v157, v158 in ipairs({
        ...
    }) do
        v156[v157] = v155(v158);
    end;
    return unpack(v156);
end;
v7.EmulateTabstops = function(v159, v160) --[[ Line: 572 ]] --[[ Name: EmulateTabstops ]]
    local v161 = 0;
    local v162 = #v159;
    local v163 = table.create(v162);
    for v164 = 1, v162 do
        local v165 = string.sub(v159, v164, v164);
        if v165 == "\t" then
            local v166 = v160 - v161 % v160;
            table.insert(v163, string.rep(" ", v166));
            v161 = v161 + v166;
        else
            table.insert(v163, v165);
            if v165 == "\n" then
                v161 = 0;
            elseif v165 ~= "\r" then
                v161 = v161 + 1;
            end;
        end;
    end;
    return table.concat(v163);
end;
v7.Mutex = function() --[[ Line: 594 ]] --[[ Name: Mutex ]]
    local v167 = {};
    local v168 = false;
    return function() --[[ Line: 598 ]]
        -- upvalues: v168 (ref), v167 (copy)
        if v168 then
            table.insert(v167, coroutine.running());
            coroutine.yield();
        else
            v168 = true;
        end;
        return function() --[[ Line: 606 ]]
            -- upvalues: v167 (ref), v168 (ref)
            if #v167 > 0 then
                coroutine.resume(table.remove(v167, 1));
                return;
            else
                v168 = false;
                return;
            end;
        end;
    end;
end;
return v7;