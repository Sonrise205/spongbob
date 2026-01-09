local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local l_speedMultiplier_0 = v3.speedMultiplier;
    local l_Attack_0 = v3.model.VFX.Attack;
    local l_Hit_0 = l_Attack_0.Hit;
    local l_Attack_1 = l_Attack_0.Attack;
    local l_PrimaryPart_0 = l_Attack_0.PrimaryPart;
    local l_Weld_0 = l_Hit_0:FindFirstChildOfClass("Weld");
    local v10 = v3.getHitPivot(l_Hit_0);
    local v11 = l_Attack_1.CFrame:ToObjectSpace(l_PrimaryPart_0.CFrame);
    local v12 = v10:ToObjectSpace(l_PrimaryPart_0.CFrame);
    l_Weld_0.C0 = v11;
    local v13 = {};
    local v14 = {};
    local v15 = {};
    local v16 = {};
    for _, v18 in l_Attack_0:GetChildren() do
        if v18.Name == "Charge" then
            v2:IterateClass(v18, "ParticleEmitter", function(v19) --[[ Line: 29 ]]
                -- upvalues: v13 (copy), v2 (ref), l_speedMultiplier_0 (copy)
                table.insert(v13, v19);
                v2:AdjustEmitterSpeed(v19, l_speedMultiplier_0);
            end);
        end;
    end;
    for _, v21 in l_Attack_1:GetDescendants() do
        if v21:IsA("ParticleEmitter") then
            table.insert(v14, v21);
            v2:AdjustEmitterSpeed(v21, l_speedMultiplier_0);
        elseif v21:IsA("Beam") then
            table.insert(v16, v21);
            v21.Enabled = false;
        end;
    end;
    v2:IterateClass(l_Hit_0, "ParticleEmitter", function(v22) --[[ Line: 46 ]]
        -- upvalues: v15 (copy), v2 (ref), l_speedMultiplier_0 (copy)
        table.insert(v15, v22);
        v2:AdjustEmitterSpeed(v22, l_speedMultiplier_0);
    end);
    return {
        Charge = function() --[[ Line: 52 ]] --[[ Name: Charge ]]
            -- upvalues: v2 (ref), v13 (copy)
            v2:ToggleEmitters(v13, true);
        end, 
        Attack = function() --[[ Line: 56 ]] --[[ Name: Attack ]]
            -- upvalues: v2 (ref), v14 (copy), v15 (copy), l_Weld_0 (copy), l_speedMultiplier_0 (copy), v12 (copy), v16 (copy)
            v2:ToggleEmitters(v14, true);
            v2:ToggleEmitters(v15, true);
            v2:Tween(l_Weld_0, TweenInfo.new(0.2 / l_speedMultiplier_0), {
                C0 = v12
            });
            for _, v24 in v16 do
                v24.Enabled = true;
            end;
        end, 
        StopAttack = function() --[[ Line: 67 ]] --[[ Name: StopAttack ]]
            -- upvalues: v2 (ref), v15 (copy), l_Weld_0 (copy), l_speedMultiplier_0 (copy), v11 (copy), v13 (copy), v14 (copy), v16 (copy)
            v2:ToggleEmitters(v15, false);
            v2:Tween(l_Weld_0, TweenInfo.new(0.5 / l_speedMultiplier_0), {
                C0 = v11
            }, function() --[[ Line: 70 ]]
                -- upvalues: v2 (ref), v13 (ref), v14 (ref), v16 (ref)
                v2:ToggleEmitters(v13, false);
                v2:ToggleEmitters(v14, false);
                for _, v26 in v16 do
                    v26.Enabled = false;
                end;
            end);
        end
    };
end;