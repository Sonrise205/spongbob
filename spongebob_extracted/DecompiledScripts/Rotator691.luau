local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.ObserveAttribute);
local v8 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
v8.Construct = function(v9) --[[ Line: 32 ]] --[[ Name: Construct ]]
    -- upvalues: v2 (copy), v4 (copy)
    v2.OnStart():await();
    v9.dump = v4.new();
    v9.canRotate = true;
    v9.rotationInfluence = v9.Instance:GetAttribute("ROTATION_INFLUENCE") or Vector3.new(0, 1, 0, 0);
    v9.dump:Add(v9.Instance:GetAttributeChangedSignal("ROTATION_INFLUENCE"):Connect(function() --[[ Line: 40 ]]
        -- upvalues: v9 (copy)
        v9.rotationInfluence = v9.Instance:GetAttribute("ROTATION_INFLUENCE") or Vector3.new(0, 1, 0, 0);
    end));
    v9.dump:Add(function() --[[ Line: 45 ]]
        -- upvalues: v9 (copy)
        v9.rotationInfluence = nil;
        v9.dump = nil;
    end);
    v9.dump:AttachTo(v9.Instance);
end;
v8.Start = function(v10) --[[ Line: 53 ]] --[[ Name: Start ]]
    -- upvalues: l_RunService_0 (copy)
    v10.dump:Connect(l_RunService_0.RenderStepped, function(v11) --[[ Line: 54 ]]
        -- upvalues: v10 (copy)
        local v12 = math.rad(v10.rotationInfluence.X * v11);
        local v13 = math.rad(v10.rotationInfluence.Y * v11);
        local v14 = math.rad(v10.rotationInfluence.Z * v11);
        v10.Instance:PivotTo(v10.Instance:GetPivot() * CFrame.Angles(v12, v13, v14));
    end);
end;
v8.Stop = function(v15) --[[ Line: 67 ]] --[[ Name: Stop ]]
    if v15.dump then
        v15.dump:Destroy();
    end;
end;
return v8;