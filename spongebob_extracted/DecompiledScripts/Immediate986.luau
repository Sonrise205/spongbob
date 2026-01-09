--!native
local v0 = require(script.Parent.Deferred);
local v1 = {};
for v2, v3 in pairs(v0) do
    v1[v2] = v3;
end;
v1.__index = v1;
local v4 = nil;
local function v7(v5, ...) --[[ Line: 31 ]] --[[ Name: RunHandlerInFreeThread ]]
    -- upvalues: v4 (ref)
    local l_v4_0 = v4;
    v4 = nil;
    v5(...);
    v4 = l_v4_0;
end;
local function v8() --[[ Line: 40 ]] --[[ Name: CreateFreeThread ]]
    -- upvalues: v4 (ref), v7 (copy)
    v4 = coroutine.running();
    while true do
        v7(coroutine.yield());
    end;
end;
v1.new = function() --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    return (setmetatable({
        _active = true, 
        _head = nil
    }, v1));
end;
v1.Is = function(v9) --[[ Line: 55 ]] --[[ Name: Is ]]
    -- upvalues: v1 (copy)
    local v10 = false;
    if typeof(v9) == "table" then
        v10 = getmetatable(v9) == v1;
    end;
    return v10;
end;
v1.Fire = function(v11, ...) --[[ Line: 60 ]] --[[ Name: Fire ]]
    -- upvalues: v4 (ref), v8 (copy)
    local l__head_0 = v11._head;
    while l__head_0 ~= nil do
        if l__head_0._connection ~= nil then
            if v4 == nil then
                task.spawn(v8);
            end;
            task.spawn(v4, l__head_0._handler, ...);
        end;
        l__head_0 = l__head_0._next;
    end;
end;
return v1;