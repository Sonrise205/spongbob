local l___DEV___0 = _G.__DEV__;
local l_forEach_0 = require(script.Parent.Parent:WaitForChild("Array"):WaitForChild("forEach"));
local l_map_0 = require(script.Parent.Parent:WaitForChild("Array"):WaitForChild("map"));
local l_isArray_0 = require(script.Parent.Parent:WaitForChild("Array"):WaitForChild("isArray"));
local v4 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"));
local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
local v6 = {};
v6.new = function(v7) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: l_isArray_0 (copy), l___DEV___0 (copy), v4 (copy), v6 (copy)
    local v8 = nil;
    local v9 = nil;
    if v7 == nil then
        v8 = {};
        v9 = {};
    elseif l_isArray_0(v7) then
        if l___DEV___0 and #v7 > 0 and typeof(v7[1]) ~= "table" then
            error("Value `" .. typeof(v7[1]) .. "` is not an entry object.\n Cannot create Map from {K, V} form, it must be { {K, V}... }");
        end;
        v8 = table.create(#v7);
        v9 = {};
        for _, v11 in v7 do
            local v12 = v11[1];
            if l___DEV___0 and v12 == nil then
                error("cannot create Map from a table that isn't an array.");
            end;
            local v13 = v11[2];
            if v9[v12] == nil then
                table.insert(v8, v12);
            end;
            v9[v12] = v13;
        end;
    elseif v4(v7, v6) then
        v8 = table.clone(v7._array);
        v9 = table.clone(v7._map);
    else
        error(("`%s` `%s` is not iterable, cannot make Map using it"):format(typeof(v7), (tostring(v7))));
    end;
    return (setmetatable({
        size = #v8, 
        _map = v9, 
        _array = v8
    }, v6));
end;
v6.set = function(v14, v15, v16) --[[ Line: 71 ]] --[[ Name: set ]]
    if v14._map[v15] == nil then
        v14.size = v14.size + 1;
        table.insert(v14._array, v15);
    end;
    v14._map[v15] = v16;
    return v14;
end;
v6.get = function(v17, v18) --[[ Line: 83 ]] --[[ Name: get ]]
    return v17._map[v18];
end;
v6.clear = function(v19) --[[ Line: 87 ]] --[[ Name: clear ]]
    local l_table_0 = table;
    v19.size = 0;
    l_table_0.clear(v19._map);
    l_table_0.clear(v19._array);
end;
v6.delete = function(v21, v22) --[[ Line: 94 ]] --[[ Name: delete ]]
    if v21._map[v22] == nil then
        return false;
    else
        v21.size = v21.size - 1;
        v21._map[v22] = nil;
        local v23 = table.find(v21._array, v22);
        if v23 then
            table.remove(v21._array, v23);
        end;
        return true;
    end;
end;
v6.forEach = function(v24, v25, v26) --[[ Line: 110 ]] --[[ Name: forEach ]]
    -- upvalues: l___DEV___0 (copy), l_forEach_0 (copy)
    if l___DEV___0 and typeof(v25) ~= "function" then
        error("callback is not a function");
    end;
    l_forEach_0(v24._array, function(v27) --[[ Line: 117 ]]
        -- upvalues: v24 (copy), v26 (copy), v25 (copy)
        local v28 = v24._map[v27];
        if v26 ~= nil then
            v25(v26, v28, v27, v24);
            return;
        else
            v25(v28, v27, v24);
            return;
        end;
    end);
end;
v6.has = function(v29, v30) --[[ Line: 128 ]] --[[ Name: has ]]
    return v29._map[v30] ~= nil;
end;
v6.keys = function(v31) --[[ Line: 132 ]] --[[ Name: keys ]]
    return v31._array;
end;
v6.values = function(v32) --[[ Line: 136 ]] --[[ Name: values ]]
    -- upvalues: l_map_0 (copy)
    return l_map_0(v32._array, function(v33) --[[ Line: 137 ]]
        -- upvalues: v32 (copy)
        return v32._map[v33];
    end);
end;
v6.entries = function(v34) --[[ Line: 142 ]] --[[ Name: entries ]]
    -- upvalues: l_map_0 (copy)
    return l_map_0(v34._array, function(v35) --[[ Line: 143 ]]
        -- upvalues: v34 (copy)
        return {
            v35, 
            v34._map[v35]
        };
    end);
end;
v6.ipairs = function(v36) --[[ Line: 148 ]] --[[ Name: ipairs ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        warn(debug.traceback("`for _,_ in myMap:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in myMap do` instead\n", 2));
    end;
    return ipairs(v36:entries());
end;
v6.__iter = function(v37) --[[ Line: 160 ]] --[[ Name: __iter ]]
    return next, v37:entries();
end;
v6.__index = function(v38, v39) --[[ Line: 164 ]] --[[ Name: __index ]]
    -- upvalues: v6 (copy), l___DEV___0 (copy)
    local v40 = rawget(v6, v39);
    if v40 ~= nil then
        return v40;
    else
        if l___DEV___0 then
            assert(rawget(v38, "_map"), "Map has been corrupted, and is missing private state! Did you accidentally call table.clear() instead of map:clear()?");
        end;
        return v6.get(v38, v39);
    end;
end;
v6.__newindex = function(v41, v42, v43) --[[ Line: 180 ]] --[[ Name: __newindex ]]
    v41:set(v42, v43);
end;
return v6;