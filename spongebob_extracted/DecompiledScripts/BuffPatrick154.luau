local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = {};
    local v7 = {};
    local v8 = {};
    local l_BeamEndAttachment_0 = l_Attack_0.Primary.BeamEndAttachment;
    local l_BeamStartAttachment_0 = l_Attack_0.Primary.BeamStartAttachment;
    local l_CFrame_0 = l_BeamEndAttachment_0.CFrame;
    local v12 = v3.getScaledEffectRange(37);
    local v13 = v3.range / (v12 * 0.5);
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v14) --[[ Line: 23 ]]
        -- upvalues: v6 (copy), v2 (ref), l_speedMultiplier_0 (copy), v13 (copy)
        table.insert(v6, v14);
        v2:AdjustEmitter(v14, l_speedMultiplier_0, v13);
    end);
    v2:ResizePart(l_Attack_0.Charge, v13);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v15) --[[ Line: 29 ]]
        -- upvalues: v7 (copy), v2 (ref), l_speedMultiplier_0 (copy), v13 (copy)
        table.insert(v7, v15);
        v2:AdjustEmitter(v15, l_speedMultiplier_0, v13);
    end);
    v2:ResizePart(l_Attack_0.Hit, v13);
    v2:IterateClass(l_Attack_0.Primary.Beams, "Beam", function(v16) --[[ Line: 35 ]]
        -- upvalues: v8 (copy)
        table.insert(v8, v16);
        v16.Enabled = false;
    end);
    return {
        Charge = function() --[[ Line: 41 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v6 (copy)
            v2:ToggleEmitters(v6, true);
        end, 
        Hit = function() --[[ Line: 45 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v7 (copy), l_BeamEndAttachment_0 (copy), l_BeamStartAttachment_0 (copy), v8 (copy), l_speedMultiplier_0 (copy), l_CFrame_0 (copy)
            v2:ToggleEmitters(v7, true, true);
            l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
            for _, v18 in v8 do
                v18.Enabled = true;
            end;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.15 / l_speedMultiplier_0), {
                CFrame = l_CFrame_0
            });
        end, 
        StopHit = function() --[[ Line: 60 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v6 (copy), v7 (copy), l_BeamEndAttachment_0 (copy), l_speedMultiplier_0 (copy), l_BeamStartAttachment_0 (copy), v8 (copy)
            v2:ToggleEmitters(v6, false);
            v2:ToggleEmitters(v7, false);
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.2 / l_speedMultiplier_0), {
                CFrame = l_BeamStartAttachment_0.CFrame
            }, function() --[[ Line: 68 ]]
                -- upvalues: v8 (ref)
                for _, v20 in v8 do
                    v20.Enabled = false;
                end;
            end);
        end
    };
end;