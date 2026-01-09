local l_RunService_0 = game:GetService("RunService");
local v1 = {};
v1.__index = v1;
v1.Simple = function(v2, v3, v4, v5, v6) --[[ Line: 13 ]] --[[ Name: Simple ]]
    -- upvalues: l_RunService_0 (copy)
    local v7 = v5 or l_RunService_0.Heartbeat;
    local v8 = v6 or time;
    local v9 = v8() + v2;
    if v4 then
        task.defer(v3);
    end;
    return v7:Connect(function() --[[ Line: 27 ]]
        -- upvalues: v8 (copy), v9 (ref), v2 (copy), v3 (copy)
        local v10 = v8();
        if v9 <= v10 then
            v9 = v10 + v2;
            v3();
        end;
    end);
end;
return v1;