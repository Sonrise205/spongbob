local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v3 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local l_Slash_0 = require(script.Parent:WaitForChild("Slash"));
local l_GroundSlamFX_0 = l_ReplicatedStorage_0.VFX.TowerOfKarate.PlayerVFX.GroundSlamFX;
local v6 = nil;
local v7 = RaycastParams.new();
v7.FilterDescendantsInstances = {
    workspace:WaitForChild("Map")
};
v7.FilterType = Enum.RaycastFilterType.Include;
return function(v8) --[[ Line: 19 ]]
    -- upvalues: l_GroundSlamFX_0 (copy), v3 (copy), l_Slash_0 (copy), v6 (ref), v1 (copy), v7 (copy)
    local v9 = l_GroundSlamFX_0:Clone();
    v8.dumpster:Add(v9);
    local v10 = {};
    v3:IterateClass(v9, "ParticleEmitter", function(v11) --[[ Line: 25 ]]
        -- upvalues: v10 (copy)
        table.insert(v10, v11);
    end);
    return {
        Attack = function() --[[ Line: 30 ]] --[[ Name: Attack ]]
            -- upvalues: l_Slash_0 (ref), v8 (copy), v6 (ref), v1 (ref)
            l_Slash_0(v8).Attack();
            if not v6 then
                v6 = v1.GetController("AudioController");
            end;
            v6:PlaySound({
                name = "SFX.Karate_GroundSlam", 
                position = v8.character:GetPivot().Position
            });
        end, 
        Hit = function() --[[ Line: 43 ]] --[[ Name: Hit ]]
            -- upvalues: v8 (copy), l_GroundSlamFX_0 (ref), v7 (ref), v9 (copy), v3 (ref), v10 (copy)
            local l_Pivot_0 = v8.character:GetPivot();
            local l_LookVector_0 = l_Pivot_0.LookVector;
            local v14 = l_Pivot_0.Position + l_LookVector_0 * (l_GroundSlamFX_0.Size.Z / 2);
            local v15 = workspace:Raycast(v14, Vector3.new(-0, -100, -0, -0), v7);
            if v15 and v15.Position then
                v14 = v15.Position;
            end;
            v9.Position = v14;
            v9.Parent = workspace;
            v3:ToggleEmitters(v10, true);
        end
    };
end;