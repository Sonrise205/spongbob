local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = {};
    for _, v8 in l_Attack_0:GetChildren() do
        if v8.Name == "Attack" then
            v2:IterateClass(v8, "ParticleEmitter", function(v9) --[[ Line: 16 ]]
                -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy)
                local l_v9_Attribute_0 = v9:GetAttribute("EmitCount");
                table.insert(v6, {
                    emitter = v9, 
                    emitCount = l_v9_Attribute_0
                });
                v2:AdjustEmitterSpeed(v9, l_speedMultiplier_0);
            end);
        end;
    end;
    return {
        Attack = function() --[[ Line: 25 ]] --[[ Name: Attack ]]
            -- upvalues: v6 (copy), v3 (copy)
            for _, v12 in v6 do
                local l_emitCount_0 = v12.emitCount;
                if typeof(l_emitCount_0) == "NumberRange" then
                    l_emitCount_0 = v3.rng:NextInteger(l_emitCount_0.Min, l_emitCount_0.Max);
                end;
                v12.emitter:Emit(l_emitCount_0);
            end;
        end
    };
end;