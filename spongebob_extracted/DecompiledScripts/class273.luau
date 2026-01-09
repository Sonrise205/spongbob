local v0 = {};
local v1 = {};
local v2 = setmetatable({}, {
    __mode = "k"
});
local function v4(v3) --[[ Line: 5 ]] --[[ Name: proxy_tostring ]]
    -- upvalues: v2 (copy)
    return v2[v3].type_name .. ": " .. v2[v3].as_string;
end;
v0.create_init_function = function(v5, v6, v7, v8, v9) --[[ Line: 9 ]] --[[ Name: create_init_function ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy)
    local v10 = nil;
    v10 = if v8 then setmetatable(table.clone(v8), {
        __index = v7
    }) else v7;
    v1[v5] = v6 or "FormatNumberObject";
    return function(v11, v12) --[[ Line: 24 ]]
        -- upvalues: v9 (copy), v5 (copy), v10 (ref), v4 (ref), v2 (ref)
        local v13 = newproxy(true);
        local v14 = getmetatable(v13);
        if v9 and type(v11) == "table" then
            table.freeze(v11);
        end;
        v14.data = v11;
        v14.resolved_data = nil;
        v14.type_name = v5;
        v14.as_string = v12 or string.sub(tostring(v13), 11);
        v14.__index = v10;
        v14.__tostring = v4;
        v14.__metatable = "This metatable is locked";
        v2[v13] = v14;
        return v13;
    end;
end;
v0.is_a = function(v15, v16) --[[ Line: 47 ]] --[[ Name: is_a ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v17 = v2[v15];
    local v18 = v17 and v17.type_name;
    local v19 = false;
    if v18 == v16 then
        return true;
    else
        if v18 then
            repeat
                v18 = v1[v18];
                v19 = v18 == v16;
            until not v18 or v19;
        end;
        return v19;
    end;
end;
v0.get_data = function(v20) --[[ Line: 65 ]] --[[ Name: get_data ]]
    -- upvalues: v2 (copy)
    return v2[v20].data;
end;
v0.get_resolved_data = function(v21, v22) --[[ Line: 69 ]] --[[ Name: get_resolved_data ]]
    -- upvalues: v2 (copy)
    local v23 = v2[v21];
    local l_resolved_data_0 = v23.resolved_data;
    if not l_resolved_data_0 then
        l_resolved_data_0 = v22(v23.data);
        v23.resolved_data = l_resolved_data_0;
    end;
    return l_resolved_data_0;
end;
v0.try_coerce = function(v25, v26, v27, v28) --[[ Line: 81 ]] --[[ Name: try_coerce ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v29 = false;
    local v30 = nil;
    if v26 == nil and v28 ~= nil then
        v30 = v28;
        v29 = true;
    elseif v27 == "string" then
        if type(v26) == "string" then
            v30 = v26;
            v29 = true;
        elseif type(v26) == "number" then
            v30 = tostring(v26);
            v29 = true;
        else
            v29 = false;
        end;
    elseif v27 == "number" then
        v30 = tonumber(v26);
        if v30 then
            v29 = true;
        else
            v29 = false;
            v27 = v27 .. " object";
        end;
    elseif string.sub(v27, 1, 1) == "{" then
        local v31 = string.sub(v27, 2, -2);
        if type(v26) == "table" then
            v30 = table.move(v26, 1, #v26, 1, table.create(#v26));
            for v32, v33 in v30 do
                if type(v33) ~= v31 then
                    error(string.format("Values inside the table argument must be a %s, index %d got %s", v31, v32, (type(v33))), 3);
                end;
            end;
            v29 = true;
        else
            v27 = "table";
        end;
    elseif v0.is_a(v26, v27) then
        v30 = v2[v26].data;
        v29 = true;
    end;
    if not v29 then
        error(string.format("Argument #%d provided must be a %s", v25, v27), 3);
    end;
    return v30;
end;
v0.try_coerce_range = function(v34, v35, v36, v37, v38) --[[ Line: 132 ]] --[[ Name: try_coerce_range ]]
    local v39 = nil;
    if v35 == nil then
        v39 = v38;
    else
        local v40 = tonumber(v35);
        if v40 then
            v40 = if v40 < 0 then math.ceil(v40) else math.floor(v40);
            if v36 <= v40 and v40 <= v37 then
                v39 = v40;
            end;
        end;
    end;
    return v39 or error(string.format("Argument #%d provided must be an integer that is in the range of %d to (and including) %d", v34, v36, v37), 3);
end;
v0.try_coerce_enum = function(v41, v42, v43, v44) --[[ Line: 155 ]] --[[ Name: try_coerce_enum ]]
    local v45 = nil;
    if v42 == nil then
        v45 = v44;
    else
        local v46 = tonumber(v42);
        if v46 then
            v46 = bit32.bor(v46);
            for _, v48 in v43 do
                if v46 == v48 then
                    v45 = v48;
                    break;
                end;
            end;
        end;
    end;
    return v45 or error(string.format("Argument #%d provided is out of range", v41), 3);
end;
return table.freeze(v0);