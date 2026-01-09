local l_Workspace_0 = game:GetService("Workspace");
return function(v1, v2, v3, v4) --[[ Line: 9 ]] --[[ Name: simpleParticleTimed ]]
    -- upvalues: l_Workspace_0 (copy)
    local v5 = v1:Clone();
    v5.CFrame = if v4 then v4.CFrame * v2 else v2;
    v5.Parent = l_Workspace_0;
    if v4 then
        local l_WeldConstraint_0 = Instance.new("WeldConstraint");
        l_WeldConstraint_0.Part0 = v4;
        l_WeldConstraint_0.Part1 = v5;
        l_WeldConstraint_0.Parent = v5;
    end;
    local v7 = {};
    local v8 = 0;
    for _, v10 in v5:GetDescendants() do
        if v10:IsA("ParticleEmitter") then
            table.insert(v7, v10);
            v8 = math.max(v8, v10.Lifetime.Max);
        end;
    end;
    task.delay(v3, function() --[[ Line: 34 ]]
        -- upvalues: v7 (copy), v8 (ref), v5 (copy)
        for _, v12 in v7 do
            v12.Enabled = false;
        end;
        task.delay(v8, function() --[[ Line: 41 ]]
            -- upvalues: v5 (ref)
            v5:Destroy();
        end);
    end);
end;