local _ = require(script.Parent.Parent:WaitForChild("shared"));
local l_invariant_0 = require(script.Parent.Parent:WaitForChild("shared")).invariant;
local l_ReactSymbols_0 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols;
local l_getIteratorFn_0 = l_ReactSymbols_0.getIteratorFn;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_REACT_PORTAL_TYPE_0 = l_ReactSymbols_0.REACT_PORTAL_TYPE;
local l_Array_0 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Array;
local l_ReactElement_0 = require(script.Parent:WaitForChild("ReactElement"));
local l_isValidElement_0 = l_ReactElement_0.isValidElement;
local l_cloneAndReplaceKey_0 = l_ReactElement_0.cloneAndReplaceKey;
local function _(v10) --[[ Line: 43 ]] --[[ Name: escape ]]
    local v11 = string.gsub(v10, "=", "=0");
    return "$" .. string.gsub(v11, ":", "=2");
end;
local function _(v13) --[[ Line: 58 ]] --[[ Name: escapeUserProvidedKey ]]
    return v13;
end;
local function _(v15, v16) --[[ Line: 71 ]] --[[ Name: getElementKey ]]
    if typeof(v15) == "table" and v15 ~= nil and v15.key ~= nil then
        local v17 = tostring(v15.key);
        local v18 = string.gsub(v17, "=", "=0");
        return "$" .. string.gsub(v18, ":", "=2");
    else
        return (tostring(v16));
    end;
end;
local function v20(v21, v22, v23, v24, v25) --[[ Line: 84 ]] --[[ Name: mapIntoArray ]]
    -- upvalues: l_REACT_ELEMENT_TYPE_0 (copy), l_REACT_PORTAL_TYPE_0 (copy), l_Array_0 (copy), v20 (copy), l_isValidElement_0 (copy), l_cloneAndReplaceKey_0 (copy), l_getIteratorFn_0 (copy)
    local v26 = typeof(v21);
    if v26 == "nil" or v26 == "boolean" or v26 == "userdata" then
        v21 = nil;
    end;
    local v27 = false;
    if v21 == nil then
        v27 = true;
    elseif v26 == "string" or v26 == "number" then
        v27 = true;
    elseif v26 == "table" then
        local v28 = v21["$$typeof"];
        if v28 == l_REACT_ELEMENT_TYPE_0 or v28 == l_REACT_PORTAL_TYPE_0 then
            v27 = true;
        end;
    end;
    if v27 then
        local l_v21_0 = v21;
        local v30 = v25(l_v21_0);
        local v31;
        if v24 == "" then
            local v32 = ".";
            local v33;
            if typeof(l_v21_0) == "table" and l_v21_0 ~= nil and l_v21_0.key ~= nil then
                local v34 = tostring(l_v21_0.key);
                local v35 = string.gsub(v34, "=", "=0");
                v33 = "$" .. string.gsub(v35, ":", "=2");
            else
                v33 = tostring(1);
            end;
            v31 = v32 .. v33;
        else
            v31 = v24;
        end;
        if l_Array_0.isArray(v30) then
            local v36 = "";
            if v31 ~= nil then
                v36 = v31 .. "/";
            end;
            v20(v30, v22, v36, "", function(v37) --[[ Line: 133 ]]
                return v37;
            end);
        elseif v30 ~= nil then
            if l_isValidElement_0(v30) then
                local l_key_0 = v30.key;
                v30 = l_cloneAndReplaceKey_0(v30, v23 .. (if l_key_0 and (not l_v21_0 or l_v21_0.key ~= l_key_0) then tostring(l_key_0) .. "/" else "") .. v31);
            end;
            table.insert(v22, v30);
        end;
        return 1;
    else
        local v39 = nil;
        local v40 = nil;
        local v41 = 0;
        local v42 = v24 == "" and "." or v24 .. ":";
        if l_Array_0.isArray(v21) then
            for v43 = 1, #v21 do
                v39 = v21[v43];
                local l_v42_0 = v42;
                local l_v39_0 = v39;
                local v46;
                if typeof(l_v39_0) == "table" and l_v39_0 ~= nil and l_v39_0.key ~= nil then
                    local v47 = tostring(l_v39_0.key);
                    local v48 = string.gsub(v47, "=", "=0");
                    v46 = "$" .. string.gsub(v48, ":", "=2");
                else
                    v46 = tostring(v43);
                end;
                v40 = l_v42_0 .. v46;
                v41 = v41 + v20(v39, v22, v23, v40, v25);
            end;
            return v41;
        else
            local v49 = l_getIteratorFn_0(v21);
            if typeof(v49) == "function" then
                local v50 = v49(v21);
                local v51 = nil;
                local v52 = 1;
                v51 = v50.next();
                while not v51.done do
                    v39 = v51.value;
                    local l_v42_1 = v42;
                    local l_v39_1 = v39;
                    local l_v52_0 = v52;
                    local v56;
                    if typeof(l_v39_1) == "table" and l_v39_1 ~= nil and l_v39_1.key ~= nil then
                        local v57 = tostring(l_v39_1.key);
                        local v58 = string.gsub(v57, "=", "=0");
                        v56 = "$" .. string.gsub(v58, ":", "=2");
                    else
                        v56 = tostring(l_v52_0);
                    end;
                    v40 = l_v42_1 .. v56;
                    v52 = v52 + 1;
                    v41 = v41 + v20(v39, v22, v23, v40, v25);
                    v51 = v50.next();
                end;
            end;
            return v41;
        end;
    end;
end;
local function v66(v59, v60, _) --[[ Line: 251 ]] --[[ Name: mapChildren ]]
    -- upvalues: v20 (copy)
    if v59 == nil then
        return nil;
    else
        local v62 = {};
        local v63 = 1;
        v20(v59, v62, "", "", function(v64) --[[ Line: 261 ]]
            -- upvalues: v60 (copy), v63 (ref)
            local v65 = v60(v64, v63);
            v63 = v63 + 1;
            return v65;
        end);
        return v62;
    end;
end;
return {
    forEach = function(v67, v68, v69) --[[ Line: 303 ]] --[[ Name: forEachChildren ]]
        -- upvalues: v66 (copy)
        v66(v67, function(...) --[[ Line: 308 ]]
            -- upvalues: v68 (copy)
            v68(...);
        end, v69);
    end, 
    map = v66, 
    count = function(v70) --[[ Line: 279 ]] --[[ Name: countChildren ]]
        -- upvalues: v66 (copy)
        local v71 = 0;
        v66(v70, function() --[[ Line: 281 ]]
            -- upvalues: v71 (ref)
            v71 = v71 + 1;
        end);
        return v71;
    end, 
    only = function(v72) --[[ Line: 343 ]] --[[ Name: onlyChild ]]
        -- upvalues: l_invariant_0 (copy), l_isValidElement_0 (copy)
        l_invariant_0(l_isValidElement_0(v72), "React.Children.only expected to receive a single React element child.");
        return v72;
    end, 
    toArray = function(v73) --[[ Line: 322 ]] --[[ Name: toArray ]]
        -- upvalues: v66 (copy)
        return v66(v73, function(v74) --[[ Line: 323 ]]
            return v74;
        end) or {};
    end
};