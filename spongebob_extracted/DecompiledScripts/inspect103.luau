local l_HttpService_0 = game:GetService("HttpService");
local l_isArray_0 = require(script.Parent:WaitForChild("Array"):WaitForChild("isArray"));
local _ = require(script.Parent.Parent:WaitForChild("es7-types"));
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local function v12(v8, v9) --[[ Line: 34 ]] --[[ Name: inspect ]]
    -- upvalues: v3 (ref)
    local v10 = v9 or {
        depth = 2
    };
    local v11 = v10.depth or 2;
    v10.depth = if v11 >= 0 then v11 else 2;
    return v3(v8, {}, v10);
end;
local function _(v13, v14) --[[ Line: 41 ]] --[[ Name: isIndexKey ]]
    local v15 = false;
    if type(v13) == "number" then
        v15 = false;
        if v13 <= v14 then
            v15 = false;
            if v13 >= 1 then
                v15 = math.floor(v13) == v13;
            end;
        end;
    end;
    return v15;
end;
local function _(v17) --[[ Line: 48 ]] --[[ Name: getTableLength ]]
    local v18 = 1;
    local v19 = rawget(v17, v18);
    while v19 ~= nil do
        v18 = v18 + 1;
        v19 = rawget(v17, v18);
    end;
    return v18 - 1;
end;
local function v25(v21, v22) --[[ Line: 58 ]] --[[ Name: sortKeysForPrinting ]]
    local v23 = type(v21);
    local v24 = type(v22);
    if v23 == v24 and (v23 == "number" or v23 == "string") then
        return v21 < v22;
    else
        return v23 < v24;
    end;
end;
local function _(v26) --[[ Line: 71 ]] --[[ Name: rawpairs ]]
    return next, v26, nil;
end;
local function v37(v28) --[[ Line: 75 ]] --[[ Name: getFragmentedKeys ]]
    -- upvalues: v25 (copy)
    local v29 = {};
    local v30 = 0;
    local v31 = 1;
    local v32 = rawget(v28, v31);
    while v32 ~= nil do
        v31 = v31 + 1;
        v32 = rawget(v28, v31);
    end;
    local v33 = v31 - 1;
    for v34, _ in next, v28 do
        local v36 = false;
        if type(v34) == "number" then
            v36 = false;
            if v34 <= v33 then
                v36 = false;
                if v34 >= 1 then
                    v36 = math.floor(v34) == v34;
                end;
            end;
        end;
        if not v36 then
            v30 = v30 + 1;
            v29[v30] = v34;
        end;
    end;
    table.sort(v29, v25);
    return v29, v30, v33;
end;
v3 = function(v38, v39, v40) --[[ Line: 89 ]] --[[ Name: formatValue ]]
    -- upvalues: l_HttpService_0 (copy), v4 (ref)
    local v41 = typeof(v38);
    if v41 == "string" then
        return l_HttpService_0:JSONEncode(v38);
    elseif v41 == "number" then
        if v38 ~= v38 then
            return "NaN";
        elseif v38 == 1e999 then
            return "Infinity";
        elseif v38 == -1e999 then
            return "-Infinity";
        else
            return (tostring(v38));
        end;
    elseif v41 == "function" then
        local v42 = "[function";
        local v43 = debug.info(v38, "n");
        if v43 ~= nil and v43 ~= "" then
            v42 = v42 .. " " .. v43;
        end;
        return v42 .. "]";
    elseif v41 == "table" then
        return v4(v38, v39, v40);
    else
        return (tostring(v38));
    end;
end;
v4 = function(v44, v45, v46) --[[ Line: 122 ]] --[[ Name: formatObjectValue ]]
    -- upvalues: v3 (ref), l_isArray_0 (copy), v5 (ref), v6 (ref)
    if table.find(v45, v44) ~= nil then
        return "[Circular]";
    else
        local v47 = {
            unpack(v45)
        };
        table.insert(v47, v44);
        if typeof(v44.toJSON) == "function" then
            local v48 = v44:toJSON(v44);
            if v48 ~= v44 then
                if typeof(v48) == "string" then
                    return v48;
                else
                    return v3(v48, v47, v46);
                end;
            end;
        elseif l_isArray_0(v44) then
            return v5(v44, v47, v46);
        end;
        return v6(v44, v47, v46);
    end;
end;
v6 = function(v49, v50, v51) --[[ Line: 147 ]] --[[ Name: formatObject ]]
    -- upvalues: v37 (copy), v7 (ref), v3 (ref)
    local v52 = "";
    local v53 = getmetatable(v49);
    if v53 and rawget(v53, "__tostring") then
        return (tostring(v49));
    else
        local v54, v55, v56 = v37(v49);
        if v56 == 0 and v55 == 0 then
            return v52 .. "{}";
        elseif #v50 > v51.depth then
            return v52 .. "[" .. v7(v49) .. "]";
        else
            local v57 = {};
            for v58 = 1, v56 do
                table.insert(v57, (v3(v49[v58], v50, v51)));
            end;
            for v59 = 1, v55 do
                local v60 = v54[v59];
                table.insert(v57, v60 .. ": " .. v3(v49[v60], v50, v51));
            end;
            return v52 .. "{ " .. table.concat(v57, ", ") .. " }";
        end;
    end;
end;
v5 = function(v61, v62, v63) --[[ Line: 183 ]] --[[ Name: formatArray ]]
    -- upvalues: v3 (ref)
    local v64 = #v61;
    if v64 == 0 then
        return "[]";
    elseif #v62 > v63.depth then
        return "[Array]";
    else
        local v65 = math.min(10, v64);
        local v66 = v64 - v65;
        local v67 = {};
        for v68 = 1, v65 do
            v67[v68] = v3(v61[v68], v62, v63);
        end;
        if v66 == 1 then
            table.insert(v67, "... 1 more item");
        elseif v66 > 1 then
            table.insert(v67, ("... %s more items"):format((tostring(v66))));
        end;
        return "[" .. table.concat(v67, ", ") .. "]";
    end;
end;
v7 = function(_) --[[ Line: 209 ]] --[[ Name: getObjectTag ]]
    return "Object";
end;
return v12;