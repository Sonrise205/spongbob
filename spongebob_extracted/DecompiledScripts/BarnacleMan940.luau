local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local v6 = v3.getScaledEffectRange(19);
    local v7 = v3.range / (v6 * 0.5);
    local v8 = {};
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {};
    v2:IterateClass(l_Attack_0.Charge, "ParticleEmitter", function(v14) --[[ Line: 25 ]]
        -- upvalues: v8 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v8, v14);
        v2:AdjustEmitterSpeed(v14, l_speedMultiplier_0);
        if v14.Name == "Goo" or v14.Name == "Rain" then
            v14.Rate = v2:SetOriginalEmitterProps(v14).rate * v7;
        end;
    end);
    v2:ResizePart(l_Attack_0.Charge, v7);
    v2:IterateClass(l_Attack_0.ChargeAttack, "ParticleEmitter", function(v15) --[[ Line: 39 ]]
        -- upvalues: v2 (ref), l_speedMultiplier_0 (copy), v10 (copy), v9 (copy)
        v2:AdjustEmitterSpeed(v15, l_speedMultiplier_0);
        if v15.Parent:IsA("Attachment") then
            table.insert(v10, v15);
            return;
        else
            table.insert(v9, v15);
            return;
        end;
    end);
    v2:ResizePart(l_Attack_0.ChargeAttack, v7);
    v2:IterateClass(l_Attack_0.Attack1, "ParticleEmitter", function(v16) --[[ Line: 54 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v11, v16);
        v2:AdjustEmitterSpeed(v16, l_speedMultiplier_0);
        v16.Rate = v2:SetOriginalEmitterProps(v16).rate * v7;
    end);
    v2:ResizePart(l_Attack_0.Attack1, v7);
    v2:IterateClass(l_Attack_0.Attack2, "ParticleEmitter", function(v17) --[[ Line: 67 ]]
        -- upvalues: v11 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v11, v17);
        v2:AdjustEmitterSpeed(v17, l_speedMultiplier_0);
        v17.Rate = v2:SetOriginalEmitterProps(v17).rate * v7;
    end);
    v2:ResizePart(l_Attack_0.Attack2, v7);
    v2:IterateClass(l_Attack_0.Hit, "ParticleEmitter", function(v18) --[[ Line: 79 ]]
        -- upvalues: v12 (copy), v2 (ref), l_speedMultiplier_0 (copy), v7 (copy)
        table.insert(v12, v18);
        v2:AdjustEmitterSpeed(v18, l_speedMultiplier_0);
        v2:ScaleEmitterSize(v18, v7);
    end);
    v2:ResizePart(l_Attack_0.Hit, v7);
    v2:IterateClass(l_Attack_0.Primary, "Beam", function(v19) --[[ Line: 89 ]]
        -- upvalues: v13 (copy)
        table.insert(v13, v19);
        v19.Enabled = false;
    end);
    local _ = function(v20) --[[ Line: 95 ]] --[[ Name: toggleBeams ]]
        -- upvalues: v13 (copy)
        for _, v22 in v13 do
            v22.Enabled = v20;
        end;
    end;
    return {
        Charge = function() --[[ Line: 102 ]] --[[ Name: Charge ]]
            -- upvalues: v13 (copy), v2 (ref), v8 (copy), v10 (copy)
            for _, v25 in v13 do
                v25.Enabled = true;
            end;
            v2:ToggleEmitters(v8, true, true);
            v2:ToggleEmitters(v10, true, true);
        end, 
        ChargeAttack = function() --[[ Line: 108 ]] --[[ Name: ChargeAttack ]]
            -- upvalues: v2 (ref), v9 (copy)
            v2:ToggleEmitters(v9, true, true);
        end, 
        Attack = function() --[[ Line: 112 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v11 (copy), v12 (copy)
            v2:ToggleEmitters(v11, true, true);
            v2:ToggleEmitters(v12, true, true);
        end, 
        StopAttack = function() --[[ Line: 117 ]] --[[ Name: StopAttack ]]
            -- upvalues: v13 (copy), v2 (ref), v8 (copy), v10 (copy), v9 (copy), v11 (copy), v12 (copy)
            for _, v27 in v13 do
                v27.Enabled = false;
            end;
            v2:ToggleEmitters(v8, false);
            v2:ToggleEmitters(v10, false);
            v2:ToggleEmitters(v9, false);
            v2:ToggleEmitters(v11, false);
            v2:ToggleEmitters(v12, false);
        end
    };
end;