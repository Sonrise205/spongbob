local v0 = {};
local function v3(v1, v2, ...) --[[ Line: 3 ]] --[[ Name: RunCallback ]]
    -- upvalues: v0 (copy)
    v1(...);
    table.insert(v0, v2);
end;
local function v4() --[[ Line: 8 ]] --[[ Name: Yielder ]]
    -- upvalues: v3 (copy)
    while true do
        v3(coroutine.yield());
    end;
end;
return function(v5, ...) --[[ Line: 14 ]]
    -- upvalues: v0 (copy), v4 (copy)
    local v6 = nil;
    if #v0 > 0 then
        v6 = v0[#v0];
        v0[#v0] = nil;
    else
        v6 = coroutine.create(v4);
        coroutine.resume(v6);
    end;
    task.spawn(v6, v5, v6, ...);
end;