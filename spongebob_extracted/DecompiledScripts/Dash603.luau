local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Platformer.Utility.simpleParticleTimed);
local l_DashParticles_0 = l_ReplicatedStorage_0.Platformer.Effects.DashParticles;
return function(v3) --[[ Line: 13 ]] --[[ Name: effect ]]
    -- upvalues: v1 (copy), l_DashParticles_0 (copy)
    local l_HumanoidRootPart_0 = v3:FindFirstChild("HumanoidRootPart");
    if not l_HumanoidRootPart_0 then
        return;
    else
        v1(l_DashParticles_0, CFrame.new(), 0.3, l_HumanoidRootPart_0);
        return;
    end;
end;