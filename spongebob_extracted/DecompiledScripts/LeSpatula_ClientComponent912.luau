local _ = game:GetService("Debris");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local v4 = require(l_ReplicatedStorage_0.Packages.BaseComponent);
local v5 = require(l_ReplicatedStorage_0.Packages.RailComponent);
local _ = require(l_ReplicatedStorage_0.Packages.RailUtil);
local _ = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v11 = require(l_ReplicatedFirst_0.PlaceIds);
local l_AttackingPet_ClientExtension_0 = require(script.Parent:WaitForChild("AttackingPet_ClientExtension"));
local v13 = v5.new({
    Tag = ("AttackingPet_%*"):format(string.split(script.Name, "_")[1]), 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        v4, 
        l_AttackingPet_ClientExtension_0, 
        {
            ShouldConstruct = function() --[[ Line: 41 ]] --[[ Name: ShouldConstruct ]]
                -- upvalues: v11 (copy)
                return v11:IsGame() == true;
            end
        }
    }
});
v13.Construct = function(_) --[[ Line: 56 ]] --[[ Name: Construct ]]

end;
v13.Start = function(v15) --[[ Line: 58 ]] --[[ Name: Start ]]
    -- upvalues: v10 (copy)
    local l_VFX_0 = v15._visualModel:WaitForChild("VFX");
    local v17 = {};
    local v18 = {};
    local l_Hit_0 = l_VFX_0:WaitForChild("Hit");
    local l_Attack_0 = l_VFX_0:WaitForChild("Attack");
    v10:IterateClass(l_Attack_0, "ParticleEmitter", function(v21) --[[ Line: 67 ]]
        -- upvalues: v17 (copy)
        table.insert(v17, v21);
    end);
    v10:IterateClass(l_Hit_0, "ParticleEmitter", function(v22) --[[ Line: 71 ]]
        -- upvalues: v18 (copy)
        table.insert(v18, v22);
    end);
    v15:_SetAttackConfig({
        markers = {
            Attack = function() --[[ Line: 77 ]]
                -- upvalues: v15 (copy), v10 (ref), l_Attack_0 (copy), v17 (copy), l_Hit_0 (copy)
                local l_v15_SpeedMultiplier_0 = v15:GetSpeedMultiplier();
                local _, v25 = v15:PromiseAttackPosition():await();
                local l_v10_2DDistance_0 = v10:Get2DDistance(l_Attack_0.Position, v25);
                for _, v28 in v17 do
                    v10:EmitterSpeedFromDistance(v28, l_v10_2DDistance_0, l_v15_SpeedMultiplier_0);
                end;
                l_Hit_0.Position = Vector3.new(v25.X, l_Attack_0.Position.Y, v25.Z);
                v10:ToggleEmitters(v17, true, true);
            end, 
            Hit = function() --[[ Line: 90 ]]
                -- upvalues: v10 (ref), v18 (copy)
                v10:ToggleEmitters(v18, true, true);
            end, 
            StopAttack = function() --[[ Line: 94 ]]
                -- upvalues: v10 (ref), v17 (copy)
                v10:ToggleEmitters(v17, false);
            end, 
            StopHit = function() --[[ Line: 98 ]]
                -- upvalues: v10 (ref), v18 (copy)
                v10:ToggleEmitters(v18, false);
            end
        }
    });
end;
v13.Stop = function(_) --[[ Line: 105 ]] --[[ Name: Stop ]]

end;
return v13;