local l_collections_0 = require(script.Parent.Parent.Parent:WaitForChild("collections"));
local l_Array_0 = l_collections_0.Array;
local l_Object_0 = l_collections_0.Object;
local l_boolean_0 = require(script.Parent.Parent.Parent:WaitForChild("boolean"));
local l_string_0 = require(script.Parent.Parent.Parent:WaitForChild("string"));
local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
local l_inspect_0 = l_collections_0.inspect;
local l_Error_0 = require(script.Parent.Parent:WaitForChild("Error"));
local v8 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"));
local v9 = {
    stderr = {
        isTTY = false, 
        columns = 0, 
        hasColors = function(...) --[[ Line: 45 ]] --[[ Name: hasColors ]]
            return true;
        end
    }
};
ErrorCaptureStackTrace = function(v10, ...) --[[ Line: 52 ]] --[[ Name: ErrorCaptureStackTrace ]]
    -- upvalues: l_Error_0 (copy)
    l_Error_0.captureStackTrace(v10, ...);
end;
local function _(v11) --[[ Line: 57 ]] --[[ Name: removeColors ]]
    return v11;
end;
local v13 = "";
local v14 = "";
local v15 = "";
local v16 = "";
local v17 = {
    deepStrictEqual = "Expected values to be strictly deep-equal:", 
    strictEqual = "Expected values to be strictly equal:", 
    strictEqualObject = "Expected \"actual\" to be reference-equal to \"expected\":", 
    deepEqual = "Expected values to be loosely deep-equal:", 
    notDeepStrictEqual = "Expected \"actual\" not to be strictly deep-equal to:", 
    notStrictEqual = "Expected \"actual\" to be strictly unequal to:", 
    notStrictEqualObject = "Expected \"actual\" not to be reference-equal to \"expected\":", 
    notDeepEqual = "Expected \"actual\" not to be loosely deep-equal to:", 
    notIdentical = "Values have same structure but are not reference-equal:", 
    notDeepEqualUnequal = "Expected values not to be loosely deep-equal:"
};
local _ = function(v18) --[[ Line: 85 ]] --[[ Name: copyError ]]
    -- upvalues: l_Object_0 (copy)
    local v19 = l_Object_0.keys(v18);
    local v20 = {};
    for _, v22 in v19 do
        v20[v22] = v18[v22];
    end;
    v20.message = v18.message;
    return v20;
end;
local function _(v24) --[[ Line: 96 ]] --[[ Name: inspectValue ]]
    -- upvalues: l_inspect_0 (copy)
    return l_inspect_0(v24, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = 1e999, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    });
end;
local function v57(v26, v27, v28) --[[ Line: 111 ]] --[[ Name: createErrDiff ]]
    -- upvalues: l_inspect_0 (copy), l_string_0 (copy), l_boolean_0 (copy), v17 (copy), v9 (copy), v13 (ref), v16 (ref), l_Array_0 (copy), v14 (ref), v15 (ref)
    local v29 = "";
    local v30 = "";
    local v31 = "";
    local v32 = false;
    local v33 = l_inspect_0(v26, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = 1e999, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    });
    local v34 = l_string_0.split(v33, "\n");
    local v35 = l_string_0.split(l_inspect_0(v27, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = 1e999, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    }), "\n");
    local v36 = 0;
    local v37 = "";
    if v28 == "strictEqual" and (typeof(v26) == "table" and v26 ~= nil and typeof(v27) == "table" and v27 ~= nil or typeof(v26) == "function" and typeof(v27) == "function") then
        v28 = "strictEqualObject";
    end;
    if #v34 == 1 and #v35 == 1 and v34[1] ~= v35[1] then
        local v38 = v34[1];
        local v39 = if l_boolean_0.toJSBoolean(false) then v35[1] else v35[1];
        local v40 = string.len(v38) + string.len(v39);
        if v40 <= 12 then
            if (typeof(v26) ~= "table" or v26 == nil) and (typeof(v27) ~= "table" or v27 == nil) and (v26 ~= 0 or v27 ~= 0) then
                return ("%s\n\n"):format(v17[v28]) .. ("%s !== %s\n"):format(v34[1], v35[1]);
            end;
        elseif v28 ~= "strictEqualObject" and v40 < if v9.stderr.isTTY then v9.stderr.columns else 80 then
            while string.sub(v38, v36 + 1, v36 + 1) == string.sub(v39, v36 + 1, v36 + 1) do
                v36 = v36 + 1;
            end;
            if v36 > 2 then
                v37 = ("\n  %s^"):format(string.rep(" ", v36));
                v36 = 0;
            end;
        end;
    end;
    local v41 = v34[#v34];
    local v42 = v35[#v35];
    while v41 == v42 do
        local l_v36_0 = v36;
        v36 = v36 + 1;
        if l_v36_0 < 3 then
            v31 = ("\n  %s%s"):format(v41, v31);
        else
            v29 = v41;
        end;
        table.remove(v34);
        table.remove(v35);
        if #v34 ~= 0 and #v35 ~= 0 then
            v41 = v34[#v34];
            v42 = v35[#v35];
        else
            break;
        end;
    end;
    local v44 = math.max(#v34, #v35);
    if v44 == 0 then
        local v45 = l_string_0.split(v33, "\n");
        if #v45 > 50 then
            v45[47] = ("%s...%s"):format(v13, v16);
            while #v45 > 47 do
                table.remove(v45);
            end;
        end;
        return ("%s\n\n"):format(v17.notIdentical) .. ("%s\n"):format(l_Array_0.join(v45, "\n"));
    else
        if v36 >= 5 then
            v31 = ("\n%s...%s%s"):format(v13, v16, v31);
            v32 = true;
        end;
        if v29 ~= "" then
            v31 = ("\n  %s%s"):format(v29, v31);
            v29 = "";
        end;
        local v46 = 0;
        local v47 = 0;
        local v48 = v17[v28] .. ("\n%s+ actual%s %s- expected%s"):format(v14, v16, v15, v16);
        local v49 = (" %s...%s Lines skipped"):format(v13, v16);
        local l_v34_0 = v34;
        local v51 = ("%s+%s"):format(v14, v16);
        local v52 = #v35;
        if #v34 < v44 then
            l_v34_0 = v35;
            v51 = ("%s-%s"):format(v15, v16);
            v52 = #v34;
        end;
        for v53 = 1, v44 do
            v36 = v53;
            if v52 < v53 then
                if v47 > 2 then
                    if v47 > 3 then
                        if v47 > 4 then
                            if v47 == 5 then
                                v30 = v30 .. ("\n  %s"):format(l_v34_0[v53 - 3]);
                                v46 = v46 + 1;
                            else
                                v30 = v30 .. ("\n%s...%s"):format(v13, v16);
                                v32 = true;
                            end;
                        end;
                        v30 = v30 .. ("\n  %s"):format(l_v34_0[v53 - 2]);
                        v46 = v46 + 1;
                    end;
                    v30 = v30 .. ("\n  %s"):format(l_v34_0[v53 - 1]);
                    v46 = v46 + 1;
                end;
                v47 = 0;
                if l_v34_0 == v34 then
                    v30 = v30 .. ("\n%s %s"):format(v51, l_v34_0[v53]);
                else
                    v29 = v29 .. ("\n%s %s"):format(v51, l_v34_0[v53]);
                end;
                v46 = v46 + 1;
            else
                local v54 = v35[v53];
                local v55 = v34[v53];
                local v56 = false;
                if v55 ~= v54 then
                    v56 = not l_boolean_0.toJSBoolean(l_string_0.endsWith(v55, ",")) or l_string_0.slice(v55, 0, -1) ~= v54;
                end;
                if v56 and l_string_0.endsWith(v54, ",") and l_string_0.slice(v54, 0, -1) == v55 then
                    v56 = false;
                    v55 = v55 .. ",";
                end;
                if v56 then
                    if v47 > 2 then
                        if v47 > 3 then
                            if v47 > 4 then
                                if v47 == 5 then
                                    v30 = v30 .. ("\n  %s"):format(v34[v53 - 3]);
                                    v46 = v46 + 1;
                                else
                                    v30 = v30 .. ("\n%s...%s"):format(v13, v16);
                                    v32 = true;
                                end;
                            end;
                            v30 = v30 .. ("\n  %s"):format(v34[v53 - 2]);
                            v46 = v46 + 1;
                        end;
                        v30 = v30 .. ("\n  %s"):format(v34[v53 - 1]);
                        v46 = v46 + 1;
                    end;
                    v47 = 0;
                    v30 = v30 .. ("\n%s+%s %s"):format(v14, v16, v55);
                    v29 = v29 .. ("\n%s-%s %s"):format(v15, v16, v54);
                    v46 = v46 + 2;
                else
                    v30 = v30 .. v29;
                    v29 = "";
                    v47 = v47 + 1;
                    if v47 <= 2 then
                        v30 = v30 .. ("\n  %s"):format(v55);
                        v46 = v46 + 1;
                    end;
                end;
            end;
            if v46 > 50 and v53 < v44 - 2 then
                return ("%s%s\n%s\n%s...%s%s\n"):format(v48, v49, v30, v13, v16, v29) .. ("%s...%s"):format(v13, v16);
            end;
        end;
        return ("%s%s\n%s%s%s%s"):format(v48, if v32 then v49 else "", v30, v29, v31, v37);
    end;
end;
local v58 = setmetatable({}, {
    __index = l_Error_0
});
v58.__index = v58;
v58.__tostring = function(v59) --[[ Line: 391 ]]
    return v59:toString();
end;
v58.new = function(v60) --[[ Line: 404 ]] --[[ Name: new ]]
    -- upvalues: l_Error_0 (copy), v58 (copy), v9 (copy), v13 (ref), v14 (ref), v16 (ref), v15 (ref), l_Array_0 (copy), l_Object_0 (copy), v8 (copy), v57 (copy), v17 (copy), l_string_0 (copy), l_inspect_0 (copy), l_boolean_0 (copy)
    local v61 = nil;
    local l_message_0 = v60.message;
    local l_operator_0 = v60.operator;
    local l_stackStartFn_0 = v60.stackStartFn;
    local l_actual_0 = v60.actual;
    local l_expected_0 = v60.expected;
    if l_message_0 ~= nil then
        v61 = setmetatable(l_Error_0.new((tostring(l_message_0))), v58);
    else
        if v9.stderr.isTTY then
            if v9.stderr:hasColors() then
                v13 = "\027[34m";
                v14 = "\027[32m";
                v16 = "\027[39m";
                v15 = "\027[31m";
            else
                v13 = "";
                v14 = "";
                v16 = "";
                v15 = "";
            end;
        end;
        if typeof(l_actual_0) == "table" and l_actual_0 ~= nil and typeof(l_expected_0) == "table" and l_expected_0 ~= nil and l_Array_0.indexOf(l_Object_0.keys(l_actual_0), "stack") ~= -1 and v8(l_actual_0, l_Error_0) and l_Array_0.indexOf(l_Object_0.keys(l_expected_0), "stack") ~= -1 and v8(l_expected_0, l_Error_0) then
            local l_l_actual_0_0 = l_actual_0;
            local v68 = l_Object_0.keys(l_l_actual_0_0);
            local v69 = {};
            for _, v71 in v68 do
                v69[v71] = l_l_actual_0_0[v71];
            end;
            v69.message = l_l_actual_0_0.message;
            l_actual_0 = v69;
            l_l_actual_0_0 = l_expected_0;
            v68 = l_Object_0.keys(l_l_actual_0_0);
            v69 = {};
            for _, v73 in v68 do
                v69[v73] = l_l_actual_0_0[v73];
            end;
            v69.message = l_l_actual_0_0.message;
            l_expected_0 = v69;
        end;
        if l_operator_0 == "deepStrictEqual" or l_operator_0 == "strictEqual" then
            v61 = setmetatable(l_Error_0.new(v57(l_actual_0, l_expected_0, l_operator_0)), v58);
        elseif l_operator_0 == "notDeepStrictEqual" or l_operator_0 == "notStrictEqual" then
            local v74 = v17[l_operator_0];
            local v75 = l_string_0.split(l_inspect_0(l_actual_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = 1e999, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            }), "\n");
            if l_operator_0 == "notStrictEqual" and (typeof(l_actual_0) == "table" and l_actual_0 ~= nil or typeof(l_actual_0) == "function") then
                v74 = v17.notStrictEqualObject;
            end;
            if #v75 > 50 then
                v75[47] = ("%s...%s"):format(v13, v16);
                while #v75 > 47 do
                    table.remove(v75);
                end;
            end;
            v61 = if #v75 == 1 then setmetatable(l_Error_0.new(("%s%s%s"):format(v74, string.len(v75[1]) > 5 and "\n\n" or " ", v75[1])), v58) else setmetatable(l_Error_0.new(("%s\n\n%s\n"):format(v74, l_Array_0.join(v75, "\n"))), v58);
        else
            local v76 = l_inspect_0(l_actual_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = 1e999, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            });
            local v77 = l_inspect_0(l_expected_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = 1e999, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            });
            local v78 = v17[tostring(l_operator_0)];
            if l_operator_0 == "notDeepEqual" and v76 == v77 then
                v76 = ("%s\n\n%s"):format(v78, v76);
                if string.len(v76) > 1024 then
                    v76 = ("%s..."):format(l_string_0.slice(v76, 0, 1021));
                end;
                v61 = setmetatable(l_Error_0.new(v76), v58);
            else
                if string.len(v76) > 512 then
                    v76 = ("%s..."):format(l_string_0.slice(v76, 0, 509));
                end;
                if string.len(v77) > 512 then
                    v77 = ("%s..."):format(l_string_0.slice(v77, 0, 509));
                end;
                if l_operator_0 == "deepEqual" then
                    v76 = ("%s\n\n%s\n\nshould loosely deep-equal\n\n"):format(v78, v76);
                else
                    local v79 = v17[("%sUnequal"):format((tostring(l_operator_0)))];
                    if l_boolean_0.toJSBoolean(v79) then
                        v76 = ("%s\n\n%s\n\nshould not loosely deep-equal\n\n"):format(v79, v76);
                    else
                        v77 = (" %s %s"):format(tostring(l_operator_0), v77);
                    end;
                end;
                v61 = setmetatable(l_Error_0.new(("%s%s"):format(v76, v77)), v58);
            end;
        end;
    end;
    v61.generatedMessage = not l_boolean_0.toJSBoolean(l_message_0);
    v61.name = "AssertionError [ERR_ASSERTION]";
    v61.code = "ERR_ASSERTION";
    v61.actual = l_actual_0;
    v61.expected = l_expected_0;
    v61.operator = l_operator_0;
    ErrorCaptureStackTrace(v61, l_stackStartFn_0 or v58.new);
    v61.name = "AssertionError";
    return v61;
end;
v58.toString = function(v80) --[[ Line: 573 ]] --[[ Name: toString ]]
    return ("%s [%s]: %s"):format(v80.name, v80.code, v80.message);
end;
v58.name = "AssertionError";
return {
    AssertionError = v58
};