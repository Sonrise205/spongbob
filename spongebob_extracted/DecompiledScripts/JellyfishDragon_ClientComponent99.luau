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
    local l_Primary_0 = l_VFX_0:WaitForChild("Primary");
    local l_BeamStartAttachment_0 = l_Primary_0:WaitForChild("BeamStartAttachment");
    local l_BeamEndAttachment_0 = l_Primary_0:WaitForChild("BeamEndAttachment");
    local v18 = {};
    local v19 = {};
    local v20 = {};
    v9:IterateClass(l_Primary_0, "Beam", function(v21) --[[ Line: 61 ]]
        -- upvalues: v20 (copy)
        table.insert(v20, v21);
    end);
    v9:IterateClass(l_VFX_0:WaitForChild("Charge"), "ParticleEmitter", function(v22) --[[ Line: 65 ]]
        -- upvalues: v18 (copy)
        table.insert(v18, v22);
    end);
    v9:IterateClass(l_VFX_0:WaitForChild("Hit"), "ParticleEmitter", function(v23) --[[ Line: 69 ]]
        -- upvalues: v19 (copy)
        table.insert(v19, v23);
    end);
    v13:_SetAttackConfig({
        markers = {
            Charge = function() --[[ Line: 75 ]]
                -- upvalues: v9 (ref), v18 (copy)
                v9:ToggleEmitters(v18, true);
            end, 
            Attack = function() --[[ Line: 79 ]]
                -- upvalues: v13 (copy), v20 (copy), l_TweenService_0 (ref), l_BeamEndAttachment_0 (copy)
                local v24, v25 = v13:PromiseAttackPosition():await();
                if v24 and v25 then
                    for _, v27 in v20 do
                        v27.Enabled = true;
                    end;
                    l_TweenService_0:Create(l_BeamEndAttachment_0, TweenInfo.new(0.25), {
                        WorldPosition = v25
                    }):Play();
                end;
            end, 
            Hit = function() --[[ Line: 94 ]]
                -- upvalues: v13 (copy), l_VFX_0 (copy), v9 (ref), v19 (copy)
                local v28, v29 = v13:PromiseAttackPosition():await();
                if v28 and v29 then
                    l_VFX_0.Hit.Position = v29;
                end;
                v9:ToggleEmitters(v19, true, true);
            end, 
            StopAttack = function() --[[ Line: 104 ]]
                -- upvalues: l_TweenService_0 (ref), l_BeamEndAttachment_0 (copy), l_BeamStartAttachment_0 (copy), v20 (copy), v9 (ref), v18 (copy)
                local v30 = l_TweenService_0:Create(l_BeamEndAttachment_0, TweenInfo.new(0.2), {
                    CFrame = l_BeamStartAttachment_0.CFrame
                });
                v30.Completed:Once(function() --[[ Line: 110 ]]
                    -- upvalues: v30 (ref), v20 (ref)
                    v30:Destroy();
                    v30 = nil;
                    for _, v32 in v20 do
                        v32.Enabled = false;
                    end;
                end);
                v30:Play();
                v9:ToggleEmitters(v18, false);
            end, 
            StopHit = function() --[[ Line: 124 ]]
                -- upvalues: v9 (ref), v19 (copy)
                v9:ToggleEmitters(v19, false);
            end
        }
    });
end;
v11.Stop = function(_) --[[ Line: 131 ]] --[[ Name: Stop ]]

end;
return v11;