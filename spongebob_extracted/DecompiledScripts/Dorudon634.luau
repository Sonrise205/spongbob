local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local _ = l_Attack_0.Hit;
    local _ = l_Attack_0.PrimaryPart;
    local v8 = v3.getScaledEffectRange(50);
    local v9 = v3.range / (v8 * 0.5);
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {};
    local l_BeamStartAttachment_0 = l_Attack_0.Primary.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_Attack_0.Primary.BeamEndAttachment;
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v16) --[[ Line: 29 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v11, v16);
        v2:AdjustEmitter(v16, l_speedMultiplier_0, v9);
    end);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v17) --[[ Line: 34 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy), v9 (copy)
        table.insert(v10, v17);
        v2:AdjustEmitter(v17, l_speedMultiplier_0, v9);
    end);
    v2:IterateClass(l_Attack_0.Primary.Beams, "Beam", function(v18) --[[ Line: 39 ]]
        -- upvalues: v13 (copy), l_BeamStartAttachment_0 (copy), l_BeamEndAttachment_0 (copy)
        table.insert(v13, v18);
        v18.Enabled = false;
        v18.Attachment0 = l_BeamStartAttachment_0;
        v18.Attachment1 = l_BeamEndAttachment_0;
    end);
    v2:ResizePart(l_Attack_0.Hit, v9);
    return {
        Charge = function() --[[ Line: 50 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:ToggleEmitters(v11, true);
        end, 
        Attack = function() --[[ Line: 54 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v12 (copy), l_BeamEndAttachment_0 (copy), l_BeamStartAttachment_0 (copy), v13 (copy), l_speedMultiplier_0 (copy), l_Attack_0 (copy)
            v2:ToggleEmitters(v12, true, true);
            l_BeamEndAttachment_0.CFrame = l_BeamStartAttachment_0.CFrame;
            for _, v20 in v13 do
                v20.Enabled = true;
            end;
            v2:Tween(l_BeamEndAttachment_0, TweenInfo.new(0.15 / l_speedMultiplier_0), {
                WorldCFrame = l_Attack_0.Hit.CFrame
            });
        end, 
        Hit = function() --[[ Line: 71 ]] --[[ Name: Hit ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, true, true);
        end, 
        StopAttack = function() --[[ Line: 75 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v12 (copy), v13 (copy), v11 (copy)
            v2:ToggleEmitters(v12, false);
            for _, v22 in v13 do
                v22.Enabled = false;
            end;
            v2:ToggleEmitters(v11, false);
        end, 
        StopHit = function() --[[ Line: 85 ]] --[[ Name: StopHit ]]
            -- upvalues: v2 (ref), v10 (copy)
            v2:ToggleEmitters(v10, false);
        end
    };
end;