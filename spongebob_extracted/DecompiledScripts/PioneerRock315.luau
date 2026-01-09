local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_VisualModel_0 = v3.model.VisualModel;
    local l_Trail_0 = l_VisualModel_0.Rock.Trail;
    local l_VFX_0 = l_VisualModel_0.Clouds.VFX;
    local v9 = v3.getScaledEffectRange(20);
    local v10 = v3.range / (v9 * 0.5);
    local v11 = {};
    v2:IterateClass(l_Attack_0.Attack, "ParticleEmitter", function(v12) --[[ Line: 21 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v10 (copy)
        table.insert(v11, v12);
        v2:AdjustEmitter(v12, l_speedMultiplier_0, v10);
    end);
    v2:ResizePart(l_Attack_0.Attack, v10);
    l_VFX_0.Enabled = true;
    l_Trail_0.Enabled = true;
    return {
        Attack = function() --[[ Line: 37 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        StopAttack = function() --[[ Line: 41 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v11 (copy), l_VFX_0 (copy), l_Trail_0 (copy)
            v2:ToggleEmitters(v11, false);
            l_VFX_0.Enabled = false;
            l_Trail_0.Enabled = false;
        end
    };
end;