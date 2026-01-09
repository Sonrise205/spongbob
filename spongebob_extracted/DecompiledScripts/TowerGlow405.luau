local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = require(l_ReplicatedStorage_0.Packages.Knit);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v5 = require(l_ReplicatedStorage_0.Packages.Component);
local v6 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
local v7 = v5.new({
    Tag = script.Name, 
    Ancestors = {
        workspace
    }
});
v7.Construct = function(v8) --[[ Line: 24 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v8.dumpster = v4.new();
end;
v7.Start = function(v9) --[[ Line: 28 ]] --[[ Name: Start ]]
    -- upvalues: l_TweenService_0 (copy), v6 (copy)
    local l_Instance_0 = v9.Instance;
    local v11 = v9.dumpster:Extend();
    local function v17() --[[ Line: 32 ]] --[[ Name: glow ]]
        -- upvalues: v11 (copy), l_Instance_0 (copy), l_TweenService_0 (ref), v6 (ref)
        v11:Destroy();
        local l_UpgradeVFX_0 = l_Instance_0:FindFirstChild("UpgradeVFX");
        if not l_UpgradeVFX_0 or not l_UpgradeVFX_0.Parent then
            return;
        else
            local l_SurfaceGui_0 = l_UpgradeVFX_0:FindFirstChildOfClass("SurfaceGui");
            local l_Brightness_0 = l_SurfaceGui_0.Brightness;
            local v15 = l_Brightness_0 + 2;
            local v16 = l_TweenService_0:Create(l_SurfaceGui_0, v6, {
                Brightness = v15
            });
            v11:Add(function() --[[ Line: 47 ]]
                -- upvalues: v16 (copy)
                v16:Cancel();
                v16:Destroy();
            end);
            v16.Completed:Once(function() --[[ Line: 52 ]]
                -- upvalues: l_SurfaceGui_0 (copy), l_Brightness_0 (copy)
                if l_SurfaceGui_0 and l_SurfaceGui_0.Parent then
                    l_SurfaceGui_0.Brightness = l_Brightness_0;
                end;
            end);
            v16:Play();
            return;
        end;
    end;
    v17();
    v9.dumpster:Add(l_Instance_0.ChildAdded:Connect(function(v18) --[[ Line: 63 ]]
        -- upvalues: v17 (copy)
        if v18:IsA("BasePart") and v18:FindFirstChildOfClass("SurfaceGui") then
            v17();
        end;
    end));
end;
v7.Stop = function(v19) --[[ Line: 70 ]] --[[ Name: Stop ]]
    v19.dumpster:Destroy();
end;
return v7;