local l___DEV___0 = _G.__DEV__;
local l_inspect_0 = require(script.Parent:WaitForChild("inspect"));
local l_isArray_0 = require(script.Parent:WaitForChild("Array"):WaitForChild("isArray"));
local l_forEach_0 = require(script.Parent:WaitForChild("Array"):WaitForChild("forEach"));
local l_fromString_0 = require(script.Parent:WaitForChild("Array"):WaitForChild("from"):WaitForChild("fromString"));
local _ = require(script.Parent.Parent:WaitForChild("es7-types"));
local v9 = {
    __iter = function(v6) --[[ Line: 23 ]] --[[ Name: __iter ]]
        return next, v6._array;
    end, 
    __tostring = function(v7) --[[ Line: 26 ]] --[[ Name: __tostring ]]
        -- upvalues: l_inspect_0 (copy)
        local v8 = "Set ";
        if #v7._array > 0 then
            v8 = v8 .. "(" .. tostring(#v7._array) .. ") ";
        end;
        return v8 .. l_inspect_0(v7._array);
    end
};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 38 ]] --[[ Name: new ]]
    -- upvalues: l_isArray_0 (copy), l___DEV___0 (copy), l_fromString_0 (copy), v9 (copy)
    local v11 = nil;
    local v12 = {};
    if v10 ~= nil then
        local v13 = nil;
        if typeof(v10) == "table" then
            if l_isArray_0(v10) then
                v13 = table.clone(v10);
            else
                local v14 = getmetatable(v10);
                if v14 and rawget(v14, "__iter") then
                    v13 = v10;
                elseif l___DEV___0 then
                    error("cannot create array from an object-like table");
                end;
            end;
        elseif typeof(v10) == "string" then
            v13 = l_fromString_0(v10);
        else
            error(("cannot create array from value of type `%s`"):format((typeof(v10))));
        end;
        if v13 then
            v11 = table.create(#v13);
            for _, v16 in v13 do
                if not v12[v16] then
                    v12[v16] = true;
                    table.insert(v11, v16);
                end;
            end;
        else
            v11 = {};
        end;
    else
        v11 = {};
    end;
    return (setmetatable({
        size = #v11, 
        _map = v12, 
        _array = v11
    }, v9));
end;
v9.add = function(v17, v18) --[[ Line: 84 ]] --[[ Name: add ]]
    if not v17._map[v18] then
        v17.size = v17.size + 1;
        v17._map[v18] = true;
        table.insert(v17._array, v18);
    end;
    return v17;
end;
v9.clear = function(v19) --[[ Line: 94 ]] --[[ Name: clear ]]
    v19.size = 0;
    table.clear(v19._map);
    table.clear(v19._array);
end;
v9.delete = function(v20, v21) --[[ Line: 100 ]] --[[ Name: delete ]]
    if not v20._map[v21] then
        return false;
    else
        v20.size = v20.size - 1;
        v20._map[v21] = nil;
        local v22 = table.find(v20._array, v21);
        if v22 then
            table.remove(v20._array, v22);
        end;
        return true;
    end;
end;
v9.forEach = function(v23, v24, v25) --[[ Line: 116 ]] --[[ Name: forEach ]]
    -- upvalues: l_forEach_0 (copy)
    if typeof(v24) ~= "function" then
        error("callback is not a function");
    end;
    l_forEach_0(v23._array, function(v26) --[[ Line: 122 ]]
        -- upvalues: v25 (copy), v24 (copy), v23 (copy)
        if v25 ~= nil then
            v24(v25, v26, v26, v23);
            return;
        else
            v24(v26, v26, v23);
            return;
        end;
    end);
end;
v9.has = function(v27, v28) --[[ Line: 131 ]] --[[ Name: has ]]
    return v27._map[v28] ~= nil;
end;
v9.ipairs = function(v29) --[[ Line: 135 ]] --[[ Name: ipairs ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        warn(debug.traceback("`for _,_ in mySet:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in mySet do` instead\n", 2));
    end;
    return ipairs(v29._array);
end;
return v9;