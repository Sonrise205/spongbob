local _ = game:GetService("Debris");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = require(l_ReplicatedStorage_0.Packages.BaseComponent);
local v4 = require(l_ReplicatedStorage_0.Packages.RailComponent);
local _ = require(l_ReplicatedStorage_0.Packages.RailUtil);
local _ = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v9 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local l_BaseEntity_ClientExtension_0 = require(script.Parent:WaitForChild("BaseEntity_ClientExtension"));
local v11 = v4.new({
    Tag = string.split(script.Name, "_")[1], 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        v3, 
        l_BaseEntity_ClientExtension_0
    }
});
v11.Construct = function(_) --[[ Line: 49 ]] --[[ Name: Construct ]]

end;
v11.Start = function(v13) --[[ Line: 51 ]] --[[ Name: Start ]]
    -- upvalues: v9 (copy), l_TweenService_0 (copy)
    local l_VFX_0 = v13.Instance:WaitForChild("VFX");
    local v15 = {};
    local v16 = {};
    local l_BeamStartAttachment1_0 = l_VFX_0.Primary.BeamStartAttachment1;
    local l_BeamEndAttachment1_0 = l_VFX_0.Primary.BeamEndAttachment1;
    local l_BeamStartAttachment2_0 = l_VFX_0.Primary.BeamStartAttachment2;
    local l_BeamEndAttachment2_0 = l_VFX_0.Primary.BeamEndAttachment2;
    local v21 = {};
    local v22 = {};
    local _ = l_BeamEndAttachment1_0.Position;
    local _ = l_BeamEndAttachment2_0.Position;
    v9:IterateClass(l_VFX_0.Primary, "Beam", function(v25) --[[ Line: 68 ]]
        -- upvalues: v21 (copy), v22 (copy)
        if v25.Parent.Name == "Beams1" then
            table.insert(v21, v25);
            return;
        else
            table.insert(v22, v25);
            return;
        end;
    end);
    v9:IterateClass(l_VFX_0.Charge, "ParticleEmitter", function(v26) --[[ Line: 76 ]]
        -- upvalues: v15 (copy)
        table.insert(v15, v26);
    end);
    v9:IterateClass(l_VFX_0.Hit, "ParticleEmitter", function(v27) --[[ Line: 80 ]]
        -- upvalues: v16 (copy)
        table.insert(v16, v27);
    end);
    local v28 = RaycastParams.new();
    v28.FilterType = Enum.RaycastFilterType.Include;
    v28.CollisionGroup = "KarateFloor";
    v13:_SetAttackConfig({
        markers = {
            Charge = function() --[[ Line: 90 ]]
                -- upvalues: v9 (ref), v15 (copy)
                v9:ToggleEmitters(v15, true);
            end, 
            Attack = function() --[[ Line: 94 ]]
                -- upvalues: v13 (copy), v28 (copy), l_VFX_0 (copy), l_BeamEndAttachment1_0 (copy), l_BeamStartAttachment1_0 (copy), v9 (ref), v21 (copy), l_TweenService_0 (ref), l_BeamEndAttachment2_0 (copy), l_BeamStartAttachment2_0 (copy), v22 (copy)
                local v29 = select(2, v13:PromiseAttackPosition():await());
                if not v29 then
                    return;
                else
                    local v30 = workspace:Raycast(v29, Vector3.new(0, -20, 0, 0), v28);
                    if v30 and v30.Position then
                        v29 = v30.Position;
                    end;
                    local l_LookVector_0 = v13.Instance:GetPivot().LookVector;
                    local v32 = Vector3.new(0, 1, 0, 0) * (l_VFX_0.Hit.Size.Y / 2);
                    v29 = v29 + (l_LookVector_0 * l_VFX_0.Hit.Size.Z + v32);
                    l_BeamEndAttachment1_0.Position = l_BeamStartAttachment1_0.Position;
                    v9:ToggleInstances(v21, true);
                    l_TweenService_0:Create(l_BeamEndAttachment1_0, TweenInfo.new(0.2), {
                        WorldPosition = v29
                    }):Play();
                    task.wait(0.08);
                    l_BeamEndAttachment2_0.Position = l_BeamStartAttachment2_0.Position;
                    v9:ToggleInstances(v22, true);
                    l_TweenService_0:Create(l_BeamEndAttachment1_0, TweenInfo.new(0.15), {
                        WorldPosition = v29
                    }):Play();
                    return;
                end;
            end, 
            Hit = function() --[[ Line: 130 ]]
                -- upvalues: v13 (copy), v28 (copy), l_VFX_0 (copy), v9 (ref), v16 (copy)
                local v33 = select(2, v13:PromiseAttackPosition():await());
                if v33 then
                    local v34 = workspace:Raycast(v33, Vector3.new(0, -20, 0, 0), v28);
                    if v34 and v34.Position then
                        v33 = v34.Position;
                    end;
                    local l_LookVector_1 = v13.Instance:GetPivot().LookVector;
                    local v36 = Vector3.new(0, 1, 0, 0) * (l_VFX_0.Hit.Size.Y / 2);
                    l_VFX_0.Hit.Position = v33 + l_LookVector_1 * l_VFX_0.Hit.Size.Z + v36;
                end;
                v9:ToggleEmitters(v16, true, true);
            end, 
            StopAttack = function() --[[ Line: 148 ]]
                -- upvalues: l_TweenService_0 (ref), l_BeamEndAttachment2_0 (copy), l_BeamStartAttachment2_0 (copy), v9 (ref), v22 (copy), l_BeamEndAttachment1_0 (copy), l_BeamStartAttachment1_0 (copy), v21 (copy)
                local v37 = l_TweenService_0:Create(l_BeamEndAttachment2_0, TweenInfo.new(0.15), {
                    Position = l_BeamStartAttachment2_0.Position
                });
                do
                    local l_v37_0 = v37;
                    l_v37_0.Completed:Once(function() --[[ Line: 155 ]]
                        -- upvalues: l_v37_0 (ref), v9 (ref), v22 (ref)
                        l_v37_0:Destroy();
                        l_v37_0 = nil;
                        v9:ToggleInstances(v22, false);
                    end);
                    l_v37_0:Play();
                end;
                task.wait(0.1);
                v37 = l_TweenService_0:Create(l_BeamEndAttachment1_0, TweenInfo.new(0.25), {
                    Position = l_BeamStartAttachment1_0.Position
                });
                v37.Completed:Once(function() --[[ Line: 172 ]]
                    -- upvalues: v37 (ref), v9 (ref), v21 (ref)
                    v37:Destroy();
                    v37 = nil;
                    v9:ToggleInstances(v21, false);
                end);
                v37:Play();
            end, 
            StopHit = function() --[[ Line: 182 ]]
                -- upvalues: v9 (ref), v15 (copy), v16 (copy)
                v9:ToggleEmitters(v15, false);
                v9:ToggleEmitters(v16, false);
            end
        }
    });
end;
v11.Stop = function(_) --[[ Line: 190 ]] --[[ Name: Stop ]]

end;
return v11;