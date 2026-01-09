local l_Debris_0 = game:GetService("Debris");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local v3 = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Component);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v7 = require(l_ReplicatedStorage_0.Shared.Modules.ColorPalette);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v9 = v3.GetController("AudioController");
local v10 = v4.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
v10.Construct = function(v11) --[[ Line: 36 ]] --[[ Name: Construct ]]
    -- upvalues: v5 (copy)
    v11.dumpster = v5.new();
    v11.accumulatedDeltaTime = 0;
    v11.startPivot = v11.Instance:GetPivot();
    v11.targetPivot = CFrame.new(v11.Instance:GetAttribute("TargetPosition"));
    v11.impactRange = v11.Instance:GetAttribute("ImpactRange");
    v11.arc = v11.Instance:GetAttribute("Arc");
    v11.epoch = v11.Instance:GetAttribute("Epoch");
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    v11.impactTime = v11.Instance:GetAttribute("ImpactTime") - (l_workspace_ServerTimeNow_0 - v11.epoch);
end;
v10.Start = function(v13) --[[ Line: 52 ]] --[[ Name: Start ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v6 (copy), v7 (copy)
    local v14 = l_ReplicatedStorage_0.Objects.AttackCircle:Clone();
    v14:PivotTo(v13.targetPivot * CFrame.fromAxisAngle(Vector3.new(0, 0, 1, 0), 1.5707963267948966));
    v13.dumpster:Add(v14);
    local l_Outline_0 = v14.Outline;
    l_Outline_0.Size = Vector3.new(0.676, v13.impactRange, v13.impactRange);
    l_Outline_0.Transparency = 1;
    local l_Fill_0 = v14.Fill;
    l_Fill_0.Size = Vector3.new(0.6759999990463257, 0, 0, 0);
    l_Fill_0.Transparency = 1;
    v14.Parent = workspace;
    local l_PointLight_0 = Instance.new("PointLight");
    l_PointLight_0.Brightness = 3.5;
    l_PointLight_0.Shadows = false;
    l_PointLight_0.Range = 16;
    l_PointLight_0.Parent = v13.Instance;
    local v18 = TweenInfo.new(v13.impactTime, Enum.EasingStyle.Linear);
    local v19 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
    local v20 = v13.impactRange * 0.875;
    local v21 = v6:Tween(l_Fill_0, v18, {
        Size = Vector3.new(0.676, v20, v20), 
        Color = v7.Solid.LightRed, 
        Transparency = 0.4
    });
    local v22 = v6:Tween(l_Outline_0, v19, {
        Transparency = 0.5
    });
    local v23 = v6:Tween(l_PointLight_0, v18, {
        Brightness = 0
    });
    v13.dumpster:Add(function() --[[ Line: 103 ]]
        -- upvalues: v21 (copy), v22 (copy), v23 (copy)
        v21:Cancel();
        v22:Cancel();
        v23:Cancel();
    end);
end;
v10.Stop = function(v24) --[[ Line: 110 ]] --[[ Name: Stop ]]
    if v24.dumpster then
        v24.dumpster:Destroy();
    end;
end;
v10.HeartbeatUpdate = function(v25, v26) --[[ Line: 116 ]] --[[ Name: HeartbeatUpdate ]]
    v25.accumulatedDeltaTime = math.min(v25.accumulatedDeltaTime + v26 / v25.impactTime, 1);
    local v27 = v25.startPivot:Lerp(v25.targetPivot, v25.accumulatedDeltaTime);
    local l_Y_0 = v27.Y;
    local v29 = math.sin(3.141592653589793 * v25.accumulatedDeltaTime) * v25.arc;
    v25.Instance.CFrame = v27.Rotation + Vector3.new(v27.X, l_Y_0 + v29, v27.Z);
    if v25.accumulatedDeltaTime == 1 then
        v25:_Impact();
        v25.Instance:Destroy();
    end;
end;
v10._Impact = function(v30) --[[ Line: 140 ]] --[[ Name: _Impact ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v6 (copy), l_Debris_0 (copy), v9 (copy)
    local v31 = l_ReplicatedStorage_0.VFX.General.ProjectileImpact:Clone();
    v31.CFrame = CFrame.new(v30.targetPivot.Position) * CFrame.fromAxisAngle(Vector3.new(0, 0, 1, 0), 1.5707963267948966) + Vector3.new(0, 0.25, 0, 0);
    v31.Parent = workspace;
    local v32 = {};
    local v33 = v30.impactRange / 2 / 6;
    for _, v35 in v31:GetDescendants() do
        if v35:IsA("ParticleEmitter") then
            table.insert(v32, v35);
            v6:AdjustEmitter(v35, 1, v33);
        end;
    end;
    v6:JustEmit(v32);
    local l_v6_EmittersMaxLifetime_0 = v6:GetEmittersMaxLifetime(v32);
    l_Debris_0:AddItem(v31, l_v6_EmittersMaxLifetime_0 + 0.5);
    v9:PlaySound({
        name = "SFX.ProjectileImpact", 
        position = v31.Position, 
        soundGroup = "Master.SFX.VFX"
    });
end;
return v10;