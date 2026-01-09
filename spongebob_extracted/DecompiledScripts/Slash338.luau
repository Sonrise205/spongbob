local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v2 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local l_AttackFX_0 = l_ReplicatedStorage_0.VFX.TowerOfKarate.PlayerVFX.AttackFX;
return function(v4) --[[ Line: 8 ]]
    -- upvalues: l_AttackFX_0 (copy), v2 (copy)
    local l_UpperTorso_0 = v4.character:FindFirstChild("UpperTorso");
    if not l_UpperTorso_0 then
        return;
    else
        local v6 = l_UpperTorso_0.CFrame + Vector3.new(0, 1, 0, 0) * (l_UpperTorso_0.Size.Y / 2);
        local v7 = l_AttackFX_0:Clone();
        v7.Position = v6.Position;
        v7.Parent = workspace;
        v4.dumpster:Add(v7);
        local v8 = {};
        v2:IterateClass(v7, "ParticleEmitter", function(v9) --[[ Line: 24 ]]
            -- upvalues: v8 (copy)
            table.insert(v8, v9);
        end);
        return {
            Attack = function() --[[ Line: 29 ]] --[[ Name: Attack ]]
                -- upvalues: v2 (ref), v8 (copy)
                v2:ToggleEmitters(v8, true);
            end
        };
    end;
end;