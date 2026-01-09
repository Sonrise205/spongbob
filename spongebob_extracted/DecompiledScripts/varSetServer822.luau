local l_DataStoreService_0 = game:GetService("DataStoreService");
local v1 = {};
local v2 = nil;
local v3 = nil;
task.spawn(function() --[[ Line: 5 ]]
    -- upvalues: v2 (ref), v3 (ref), l_DataStoreService_0 (copy), v1 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 6 ]]
        -- upvalues: l_DataStoreService_0 (ref)
        local l_l_DataStoreService_0_DataStore_0 = l_DataStoreService_0:GetDataStore("_package/eryn.io/Cmdr");
        l_l_DataStoreService_0_DataStore_0:GetAsync("test_key");
        return l_l_DataStoreService_0_DataStore_0;
    end);
    v2 = l_status_0;
    v3 = l_result_0;
    while #v1 > 0 do
        coroutine.resume(table.remove(v1, 1));
    end;
end);
return function(v7, v8, v9) --[[ Line: 17 ]]
    -- upvalues: v2 (ref), v1 (copy), v3 (ref)
    if v2 == nil then
        table.insert(v1, coroutine.running());
        coroutine.yield();
    end;
    local v10 = false;
    local v11 = true;
    if v8:sub(1, 1) == "$" then
        v8 = v8:sub(2);
        v10 = true;
    end;
    if v8:sub(1, 1) == "." then
        v8 = v8:sub(2);
        v11 = false;
    end;
    if v11 and not v2 then
        return "# You must publish this place to the web to use saved keys.";
    else
        local v12 = "var_" .. (v10 and "global" or tostring(v7.Executor.UserId));
        if v11 then
            local v13 = v12 .. "_" .. v8;
            v3:SetAsync(v13, v9);
            if type(v9) == "table" then
                return table.concat(v9, ",") or "";
            else
                return v9;
            end;
        else
            v7:GetStore(v12)[v8] = v9;
            if type(v9) == "table" then
                return table.concat(v9, ",") or "";
            else
                return v9;
            end;
        end;
    end;
end;