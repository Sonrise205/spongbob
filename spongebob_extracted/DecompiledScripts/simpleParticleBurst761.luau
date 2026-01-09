local l_Workspace_0 = game:GetService("Workspace");
return function(v1, v2, v3) --[[ Line: 13 ]] --[[ Name: simpleParticleBurst ]]
    -- upvalues: l_Workspace_0 (copy)
    local v4 = v1:Clone();
    v4.CFrame = if v3 then v3.CFrame * v2 else v2;
    v4.Parent = l_Workspace_0;
    if v3 then
        local l_WeldConstraint_0 = Instance.new("WeldConstraint");
        l_WeldConstraint_0.Part0 = v3;
        l_WeldConstraint_0.Part1 = v4;
        l_WeldConstraint_0.Parent = v4;
    end;
    local v6 = 0;
    for _, v8 in v4:GetDescendants() do
        if v8:IsA("ParticleEmitter") then
            v6 = math.max(v6, v8.Lifetime.Max);
            local l_v8_Attribute_0 = v8:GetAttribute("emitAmount");
            if l_v8_Attribute_0 then
                v8:Emit(l_v8_Attribute_0);
            end;
        end;
    end;
    task.delay(v6, function() --[[ Line: 41 ]]
        -- upvalues: v4 (copy)
        v4:Destroy();
    end);
end;