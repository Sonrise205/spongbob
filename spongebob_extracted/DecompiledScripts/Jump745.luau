local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Platformer.Utility.simpleParticleBurst);
local l_JumpParticles_0 = l_ReplicatedStorage_0.Platformer.Effects.JumpParticles;
return function(v3) --[[ Line: 12 ]] --[[ Name: effect ]]
    -- upvalues: v1 (copy), l_JumpParticles_0 (copy)
    local l_HumanoidRootPart_0 = v3:FindFirstChild("HumanoidRootPart");
    local l_Humanoid_0 = v3:FindFirstChildOfClass("Humanoid");
    if not l_HumanoidRootPart_0 or not l_Humanoid_0 then
        return;
    else
        local v6 = l_HumanoidRootPart_0.CFrame * CFrame.new(0, -l_Humanoid_0.HipHeight, 0);
        v1(l_JumpParticles_0, v6);
        return;
    end;
end;