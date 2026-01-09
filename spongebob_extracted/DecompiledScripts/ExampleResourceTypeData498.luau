local l_Util_0 = require(script.Parent).Util;
local l_Part_0 = Instance.new("Part");
l_Part_0.Name = "GenericPart";
l_Part_0.Transparency = 1;
l_Part_0.Size = Vector3.new(1, 1, 1, 0);
l_Part_0.Anchored = true;
l_Part_0.CanCollide = false;
l_Part_0.CanTouch = false;
l_Part_0.CanQuery = false;
l_Part_0.Massless = true;
return {
    Defaults = {
        Value = NumberRange.new(0.6, 1.4), 
        Count = NumberRange.new(2, 5), 
        LifeTime = NumberRange.new(50, 60), 
        EjectionDuration = 1, 
        EjectionHorizontalVelocity = NumberRange.new(0, 25), 
        EjectionVerticalVelocity = NumberRange.new(25, 50), 
        CollectorMode = l_Util_0.Enums.CollectorMode.MultiCollector, 
        Mass = 1, 
        MaxForce = 1e999, 
        MaxVelocity = 150, 
        CollectionRadius = 1.5
    }, 
    SetupDroplet = function(v2) --[[ Line: 238 ]] --[[ Name: SetupDroplet ]]
        -- upvalues: l_Part_0 (copy)
        local l_v2_Value_0 = v2:GetValue();
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Name = "VisualModel";
        local v5 = l_Part_0:Clone();
        v5.Name = "Outer";
        v5.Material = Enum.Material.Glass;
        v5.Transparency = 0.5;
        v5.Color = Color3.fromRGB(16, 206, 16);
        v5.Size = Vector3.new(1, 1, 1, 0) * l_v2_Value_0;
        v5.Anchored = false;
        v5.Parent = l_Model_0;
        l_Model_0.PrimaryPart = v5;
        local v6 = Random.new();
        local v7 = v5:Clone();
        v7.Material = Enum.Material.Neon;
        v7.Name = "Inner";
        v7.Color = Color3.fromRGB(219, 189, 18);
        v7.Transparency = 0;
        v7.CastShadow = false;
        v7.Size = v7.Size * (0.6 + v6:NextNumber(-0.1, 0.1));
        v7.CFrame = v5.CFrame + Vector3.new(v6:NextNumber(-0.1, 0.1), v6:NextNumber(-0.1, 0.1), v6:NextNumber(-0.1, 0.1));
        v7.Parent = l_Model_0;
        local l_WeldConstraint_0 = Instance.new("WeldConstraint");
        l_WeldConstraint_0.Part0 = v5;
        l_WeldConstraint_0.Part1 = v7;
        l_WeldConstraint_0.Parent = l_Model_0;
        v2:AddTask(task.spawn(function() --[[ Line: 275 ]]
            -- upvalues: l_Model_0 (copy)
            for v9 = 0.025, 1, 0.025 do
                l_Model_0:ScaleTo(v9);
                task.wait();
            end;
            l_Model_0:ScaleTo(1);
        end), nil, "GrowThread");
        v2:AttachModel(l_Model_0);
        return {
            VisualModel = l_Model_0, 
            SpinDirection = math.random() > 0.5 and 1 or -1
        };
    end, 
    OnRenderUpdate = function(v10, v11) --[[ Line: 292 ]] --[[ Name: OnRenderUpdate ]]
        local l_v10_SetupData_0 = v10:GetSetupData();
        local v13 = CFrame.new();
        local v14 = -math.cos(v11 * 3.141592653589793 * 0.25) * 0.5;
        return v13 * CFrame.new(0, v14 + 1, 0) * CFrame.Angles(0, v11 * 3.141592653589793 * 0.25 * l_v10_SetupData_0.SpinDirection, 0);
    end, 
    OnDropletTimeout = function(v15) --[[ Line: 313 ]] --[[ Name: OnDropletTimeout ]]
        local l_VisualModel_0 = v15:GetSetupData().VisualModel;
        v15:RemoveTask("GrowThread");
        for v17 = 1, 0.025, -0.025 do
            l_VisualModel_0:ScaleTo(v17);
            task.wait();
        end;
    end, 
    OnClientClaim = function(_, _) --[[ Line: 322 ]] --[[ Name: OnClientClaim ]]

    end, 
    OnClientCollect = function(_, v21) --[[ Line: 331 ]] --[[ Name: OnClientCollect ]]
        -- upvalues: l_Part_0 (copy)
        local l_v21_Value_0 = v21:GetValue();
        local v23 = l_Part_0:Clone();
        v23.CFrame = v21:GetPivot();
        task.delay(2, function() --[[ Line: 337 ]]
            -- upvalues: v23 (copy)
            v23:Destroy();
        end);
        local l_Sound_0 = Instance.new("Sound");
        l_Sound_0.SoundId = "rbxassetid://402143943";
        l_Sound_0.Volume = 0.25;
        local l_PitchShiftSoundEffect_0 = Instance.new("PitchShiftSoundEffect");
        l_PitchShiftSoundEffect_0.Octave = 2 - l_v21_Value_0 / 1.5;
        l_PitchShiftSoundEffect_0.Parent = l_Sound_0;
        l_Sound_0.Parent = v23;
        v23.Parent = workspace;
        l_Sound_0:Play();
    end, 
    OnServerCollect = function(v26, v27, _) --[[ Line: 358 ]] --[[ Name: OnServerCollect ]]
        local l_leaderstats_0 = v26:FindFirstChild("leaderstats");
        if not l_leaderstats_0 then
            l_leaderstats_0 = Instance.new("Folder");
            l_leaderstats_0.Name = "leaderstats";
            l_leaderstats_0.Parent = v26;
        end;
        local l_Exp_0 = l_leaderstats_0:FindFirstChild("Exp");
        if not l_Exp_0 then
            l_Exp_0 = Instance.new("NumberValue");
            l_Exp_0.Name = "Exp";
            l_Exp_0.Parent = l_leaderstats_0;
        end;
        l_Exp_0.Value = l_Exp_0.Value + v27;
    end
};