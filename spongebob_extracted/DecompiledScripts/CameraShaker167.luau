local l_RunService_0 = game:GetService("RunService");
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 6 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v2 = setmetatable({}, v1);
    v2._intensity = 0;
    v2._connection = nil;
    v2._currentOffset = Vector3.new();
    v2._targetOffset = Vector3.new();
    return v2;
end;
v1.Shake = function(v3, v4, v5) --[[ Line: 15 ]] --[[ Name: Shake ]]
    -- upvalues: l_RunService_0 (copy)
    v3._intensity = v4;
    if v3._connection then
        v3._connection:Disconnect();
    end;
    v3._connection = l_RunService_0.RenderStepped:Connect(function(v6) --[[ Line: 22 ]]
        -- upvalues: v5 (copy), v4 (copy), v3 (copy)
        local l_Magnitude_0 = (workspace.CurrentCamera.CFrame.Position - v5.Position).Magnitude;
        local v8 = v4 * (1 / l_Magnitude_0) * v6 * 60;
        v3._targetOffset = Vector3.new(math.random(-10, 10) * v8, math.random(-10, 10) * v8, math.random(-10, 10) * v8) * 0.1;
        v3._currentOffset = v3._currentOffset:Lerp(v3._targetOffset, 0.2);
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame * CFrame.new(v3._currentOffset);
    end);
end;
v1.Stop = function(v10) --[[ Line: 39 ]] --[[ Name: Stop ]]
    if v10._connection then
        v10._connection:Disconnect();
        v10._connection = nil;
    end;
    v10._intensity = 0;
    v10._currentOffset = Vector3.new();
    v10._targetOffset = Vector3.new();
end;
v1.Destroy = function(v11) --[[ Line: 49 ]] --[[ Name: Destroy ]]
    v11:Stop();
    setmetatable(v11, nil);
end;
return v1;