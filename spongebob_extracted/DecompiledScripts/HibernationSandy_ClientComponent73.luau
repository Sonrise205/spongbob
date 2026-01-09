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
    local v17 = {};
    local l_Beam_0 = l_VFX_0.Primary.Beams.Beam;
    local l_BeamStartAttachment_0 = l_VFX_0.Primary.BeamStartAttachment;
    local l_BeamEndAttachment_0 = l_VFX_0.Primary.BeamEndAttachment;
    v9:IterateClass(l_VFX_0.Charge, "ParticleEmitter", function(v21) --[[ Line: 61 ]]
        -- upvalues: v15 (copy)
        table.insert(v15, v21);
    end);
    v9:IterateClass(l_VFX_0.Hit, "ParticleEmitter", function(v22) --[[ Line: 65 ]]
        -- upvalues: v17 (copy)
        table.insert(v17, v22);
    end);
    v9:IterateClass(l_VFX_0.Attack, "ParticleEmitter", function(v23) --[[ Line: 69 ]]
        -- upvalues: v16 (copy)
        table.insert(v16, v23);
    end);
    v13:_SetAttackConfig({
        markers = {
            Charge = function() --[[ Line: 75 ]]
                -- upvalues: v9 (ref), v15 (copy)
                v9:ToggleEmitters(v15, true);
            end, 
            Attack = function() --[[ Line: 79 ]]
                -- upvalues: v9 (ref), v16 (copy)
                v9:ToggleEmitters(v16, true);
            end, 
            Hit = function() --[[ Line: 84 ]]
                -- upvalues: v13 (copy), l_VFX_0 (copy), v9 (ref), v17 (copy), l_BeamEndAttachment_0 (copy), l_BeamStartAttachment_0 (copy), l_TweenService_0 (ref), l_Beam_0 (copy)
                local v24, v25 = v13:PromiseAttackPosition():await();
                if v24 and v25 then
                    l_VFX_0.Hit.Position = v25;
                    v9:ToggleEmitters(v17, true, true);
                    l_BeamEndAttachment_0.Position = l_BeamStartAttachment_0.Position;
                    l_TweenService_0:Create(l_BeamEndAttachment_0, TweenInfo.new(0.25), {
                        Position = l_VFX_0.Hit.Position
                    }):Play();
                    l_Beam_0.Enabled = true;
                end;
            end, 
            StopAttack = function() --[[ Line: 102 ]]
                -- upvalues: l_TweenService_0 (ref), l_BeamEndAttachment_0 (copy), l_BeamStartAttachment_0 (copy), l_Beam_0 (copy), v9 (ref), v15 (copy), v16 (copy)
                local v26 = l_TweenService_0:Create(l_BeamEndAttachment_0, TweenInfo.new(0.3), {
                    Position = l_BeamStartAttachment_0.Position
                });
                v26.Completed:Once(function() --[[ Line: 108 ]]
                    -- upvalues: l_Beam_0 (ref)
                    l_Beam_0.Enabled = false;
                end);
                v26:Play();
                v9:ToggleEmitters(v15, false);
                v9:ToggleEmitters(v16, false);
            end, 
            StopHit = function() --[[ Line: 118 ]]
                -- upvalues: v9 (ref), v15 (copy), v17 (copy)
                v9:ToggleEmitters(v15, false);
                v9:ToggleEmitters(v17, false);
            end
        }
    });
end;
v11.Stop = function(_) --[[ Line: 126 ]] --[[ Name: Stop ]]

end;
return v11;