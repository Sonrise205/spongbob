local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_Resource_0 = v3.model.VFX.Resource;
    v2:IterateClass(l_Resource_0.PrimaryPart, "ParticleEmitter", function(v5) --[[ Line: 10 ]]
        -- upvalues: v3 (copy)
        v5:Emit(v3.rng:NextInteger(5, 8));
    end);
end;