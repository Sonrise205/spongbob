--!native
local v0 = table.create(500);
local function v3(v1, v2, ...) --[[ Line: 6 ]] --[[ Name: RunFunction ]]
    -- upvalues: v0 (copy)
    v1(...);
    table.insert(v0, v2);
end;
local function v4() --[[ Line: 11 ]] --[[ Name: Yield ]]
    -- upvalues: v3 (copy)
    while true do
        v3(coroutine.yield());
    end;
end;
return function(v5, ...) --[[ Line: 17 ]] --[[ Name: FastDefer ]]
    -- upvalues: v0 (copy), v4 (copy)
    local v6 = nil;
    local v7 = #v0;
    if v7 > 0 then
        v6 = v0[v7];
        v0[v7] = nil;
    else
        v6 = coroutine.create(v4);
        coroutine.resume(v6);
    end;
    return task.defer(v6, v5, v6, ...);
end;