local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.RailUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v4 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(script.Parent:WaitForChild("Slash"));
local l_TornadoKickFX_0 = l_ReplicatedStorage_0.VFX.TowerOfKarate.PlayerVFX.TornadoKickFX;
return function(v7) --[[ Line: 16 ]]
    -- upvalues: l_TornadoKickFX_0 (copy), v2 (copy), v4 (copy), v1 (copy)
    local v8 = l_TornadoKickFX_0:Clone();
    v8:PivotTo(v7.character:GetPivot());
    v8.Anchored = false;
    v8.Parent = workspace;
    v2.Instance.weld(v8, v7.character.PrimaryPart);
    v7.dumpster:Add(v8);
    local v9 = {};
    v4:IterateClass(v8, "ParticleEmitter", function(v10) --[[ Line: 27 ]]
        -- upvalues: v9 (copy)
        v10.LockedToPart = true;
        table.insert(v9, v10);
    end);
    local v11 = v1.GetController("AudioController"):PlaySound({
        name = "SFX.Karate_TornadoKick", 
        adornee = v7.character.PrimaryPart
    });
    return {
        Attack = function() --[[ Line: 40 ]] --[[ Name: Attack ]]
            -- upvalues: v4 (ref), v9 (copy)
            v4:ToggleEmitters(v9, true, true);
        end, 
        StopAttack = function() --[[ Line: 44 ]] --[[ Name: StopAttack ]]
            -- upvalues: v11 (ref), v4 (ref), v9 (copy)
            if v11 then
                v11:Destroy();
                v11 = nil;
            end;
            v4:ToggleEmitters(v9, false);
        end
    };
end;