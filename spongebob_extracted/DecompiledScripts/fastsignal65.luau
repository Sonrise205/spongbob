--!native
local v0 = nil;
v0 = false;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local v2 = false;
do
    local l_v2_0 = v2;
    l_BindableEvent_0.Event:Connect(function() --[[ Line: 15 ]]
        -- upvalues: l_v2_0 (ref)
        l_v2_0 = true;
    end);
    l_BindableEvent_0:Fire();
    l_BindableEvent_0:Destroy();
    if l_v2_0 == false then
        v0 = true;
    end;
end;
return v0 and require(script.Deferred) or require(script.Immediate);