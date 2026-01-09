local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local v7 = select(2, v3.pivotHitPart(l_Attack_0.HitUltimate1, l_PrimaryPart_0));
    v3.pivotHitPart(l_Attack_0.HitUltimate2, l_PrimaryPart_0);
    local v8 = {};
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {
        [1] = {}, 
        [2] = {}
    };
    local v14 = v3.attackInfo.AttackStyles[1].Size / (v3.getScaledEffectRange(38) * 0.5);
    v2:IterateClass(l_Attack_0.ChargeUltimate, "ParticleEmitter", function(v15) --[[ Line: 30 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v8, v15);
        v2:AdjustEmitter(v15, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.AttackUltimate1, "ParticleEmitter", function(v16) --[[ Line: 35 ]]
        -- upvalues: v9 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v9, v16);
        v2:AdjustEmitter(v16, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.AttackUltimate2, "ParticleEmitter", function(v17) --[[ Line: 40 ]]
        -- upvalues: v10 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v10, v17);
        v2:AdjustEmitter(v17, l_speedMultiplier_0);
    end);
    v2:IterateClass(l_Attack_0.HitUltimate1, "ParticleEmitter", function(v18) --[[ Line: 46 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v14 (copy)
        table.insert(v11, v18);
        v2:AdjustEmitter(v18, l_speedMultiplier_0, v14);
    end);
    v2:ResizePart(l_Attack_0.HitUltimate1, v14);
    v2:IterateClass(l_Attack_0.HitUltimate2, "ParticleEmitter", function(v19) --[[ Line: 54 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy), v14 (copy)
        table.insert(v12, v19);
        v2:AdjustEmitter(v19, l_speedMultiplier_0, v14);
    end);
    v2:IterateClass(l_PrimaryPart_0.Beams1, "Beam", function(v20) --[[ Line: 59 ]]
        -- upvalues: v13 (copy)
        table.insert(v13[1], v20);
        v20.Enabled = false;
    end);
    v2:IterateClass(l_PrimaryPart_0.Beams2, "Beam", function(v21) --[[ Line: 64 ]]
        -- upvalues: v13 (copy)
        table.insert(v13[2], v21);
        v21.Enabled = false;
    end);
    local v22 = Vector3.new(l_PrimaryPart_0.BeamEndAttachment1.Position.X, 30, -v7 / 2);
    local v23 = Vector3.new(l_PrimaryPart_0.BeamStartAttachment2.Position.X, -1.9, -v7);
    l_PrimaryPart_0.BeamEndAttachment1.Position = l_PrimaryPart_0.BeamStartAttachment1.Position;
    l_PrimaryPart_0.BeamEndAttachment2.Position = Vector3.new(l_PrimaryPart_0.BeamEndAttachment2.Position.X, 30, -v7 / 2);
    l_PrimaryPart_0.BeamStartAttachment2.Position = l_PrimaryPart_0.BeamEndAttachment2.Position;
    return {
        Charge = function() --[[ Line: 77 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v8 (copy), v3 (copy), l_speedMultiplier_0 (copy), v9 (copy)
            v2:ToggleEmitters(v8, true);
            v3.dumpster:Add(task.delay(0.4 / l_speedMultiplier_0, function() --[[ Line: 79 ]]
                -- upvalues: v2 (ref), v9 (ref)
                v2:ToggleEmitters(v9, true);
            end));
        end, 
        Attack1 = function() --[[ Line: 84 ]] --[[ Name: Attack1 ]]
            -- upvalues: v3 (copy), v2 (ref), l_PrimaryPart_0 (copy), l_speedMultiplier_0 (copy), v22 (copy), v13 (copy), v23 (copy), v9 (copy)
            v3.dumpster:Add(task.spawn(function() --[[ Line: 85 ]]
                -- upvalues: v2 (ref), l_PrimaryPart_0 (ref), l_speedMultiplier_0 (ref), v22 (ref), v13 (ref), v23 (ref), v9 (ref)
                v2:Tween(l_PrimaryPart_0.BeamEndAttachment1, TweenInfo.new(0.3 / l_speedMultiplier_0), {
                    Position = v22
                });
                for _, v25 in v13[1] do
                    v25.Enabled = true;
                end;
                task.wait(0.15 / l_speedMultiplier_0);
                v2:Tween(l_PrimaryPart_0.BeamEndAttachment2, TweenInfo.new(0.15 / l_speedMultiplier_0), {
                    Position = v23
                });
                for _, v27 in v13[2] do
                    v27.Enabled = true;
                end;
                task.wait(0.2 / l_speedMultiplier_0);
                v2:ToggleEmitters(v9, false);
                v2:Tween(l_PrimaryPart_0.BeamEndAttachment1, TweenInfo.new(0.15 / l_speedMultiplier_0), {
                    Position = l_PrimaryPart_0.BeamStartAttachment1.Position
                }, function() --[[ Line: 116 ]]
                    -- upvalues: v13 (ref), v2 (ref), l_PrimaryPart_0 (ref), l_speedMultiplier_0 (ref)
                    for _, v29 in v13[1] do
                        v29.Enabled = false;
                    end;
                    v2:Tween(l_PrimaryPart_0.BeamEndAttachment2, TweenInfo.new(0.15 / l_speedMultiplier_0), {
                        Position = l_PrimaryPart_0.BeamStartAttachment2.Position
                    }, function() --[[ Line: 125 ]]
                        -- upvalues: v13 (ref)
                        for _, v31 in v13[2] do
                            v31.Enabled = false;
                        end;
                    end);
                end);
            end));
        end, 
        Hit1 = function() --[[ Line: 136 ]] --[[ Name: Hit1 ]]
            -- upvalues: v2 (ref), v11 (copy)
            v2:JustEmit(v11);
        end, 
        Hit2 = function() --[[ Line: 140 ]] --[[ Name: Hit2 ]]
            -- upvalues: v2 (ref), v12 (copy), v10 (copy)
            v2:JustEmit(v12);
            v2:ToggleEmitters(v10, true);
        end, 
        StopAttack = function() --[[ Line: 145 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v10 (copy), v8 (copy)
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v8, false);
        end
    };
end;