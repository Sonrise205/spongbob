local v0 = require(script.Parent.Parent.Parent.Promise);
local v1 = require(script.Parent.Parent.Parent.Signal);
local v2 = require(script.Parent.ClientRemoteSignal);
local _ = require(script.Parent.Parent.Types);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6, v7) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy), v0 (copy)
    local v8 = setmetatable({}, v4);
    v8._rs = v2.new(v5, v6, v7);
    v8._ready = false;
    v8._value = nil;
    v8.Changed = v1.new();
    v8._rs:Fire();
    local v9 = nil;
    v8._readyPromise = v0.new(function(v10) --[[ Line: 45 ]]
        -- upvalues: v9 (ref)
        v9 = v10;
    end);
    v8._changed = v8._rs:Connect(function(v11) --[[ Line: 49 ]]
        -- upvalues: v8 (copy), v9 (ref)
        local v12 = v11 ~= v8._value;
        v8._value = v11;
        if not v8._ready then
            v8._ready = true;
            v12 = true;
            v9(v11);
        end;
        if v12 then
            v8.Changed:Fire(v11);
        end;
    end);
    return v8;
end;
v4.Get = function(v13) --[[ Line: 75 ]] --[[ Name: Get ]]
    return v13._value;
end;
v4.OnReady = function(v14) --[[ Line: 98 ]] --[[ Name: OnReady ]]
    return v14._readyPromise;
end;
v4.IsReady = function(v15) --[[ Line: 114 ]] --[[ Name: IsReady ]]
    return v15._ready;
end;
v4.Observe = function(v16, v17) --[[ Line: 139 ]] --[[ Name: Observe ]]
    if v16._ready then
        task.spawn(v17, v16._value);
    end;
    return v16.Changed:Connect(v17);
end;
v4.Destroy = function(v18) --[[ Line: 149 ]] --[[ Name: Destroy ]]
    v18._rs:Destroy();
    if v18._readyPromise then
        v18._readyPromise:cancel();
    end;
    if v18._changed then
        v18._changed:Disconnect();
    end;
    v18.Changed:Destroy();
end;
return v4;