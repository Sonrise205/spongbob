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
v11.Construct = function(_) --[[ Line: 59 ]] --[[ Name: Construct ]]

end;
v11.Start = function(v13) --[[ Line: 61 ]] --[[ Name: Start ]]
    -- upvalues: v9 (copy), l_TweenService_0 (copy)
    local l_VFX_0 = v13.Instance:WaitForChild("VFX");
    local l_BeamEndAttachment_0 = l_VFX_0.Primary.BeamEndAttachment;
    local l_BeamStartAttachment_0 = l_VFX_0.Primary.BeamStartAttachment;
    local v17 = {};
    local v18 = {};
    local v19 = {};
    local v20 = {};
    v9:IterateClass(l_VFX_0.Primary, "Beam", function(v21) --[[ Line: 71 ]]
        -- upvalues: v20 (copy)
        table.insert(v20, v21);
    end);
    v9:IterateClass(l_VFX_0.Charge, "ParticleEmitter", function(v22) --[[ Line: 75 ]]
        -- upvalues: v17 (copy)
        table.insert(v17, v22);
    end);
    v9:IterateClass(l_VFX_0.Hit, "ParticleEmitter", function(v23) --[[ Line: 79 ]]
        -- upvalues: v18 (copy)
        table.insert(v18, v23);
    end);
    v9:IterateClass(l_VFX_0.Attack, "ParticleEmitter", function(v24) --[[ Line: 83 ]]
        -- upvalues: v19 (copy)
        table.insert(v19, v24);
    end);
    v13:_SetAttackConfig({
        markers = {
            Charge = function() --[[ Line: 89 ]]
                -- upvalues: v9 (ref), v17 (copy)
                v9:ToggleEmitters(v17, true);
            end, 
            Attack = function() --[[ Line: 93 ]]
                -- upvalues: v9 (ref), v19 (copy), v13 (copy), v20 (copy), l_TweenService_0 (ref), l_BeamEndAttachment_0 (copy)
                v9:ToggleEmitters(v19, true);
                local v25, v26 = v13:PromiseAttackPosition():await();
                if v25 and v26 then
                    for _, v28 in v20 do
                        v28.Enabled = true;
                    end;
                    l_TweenService_0:Create(l_BeamEndAttachment_0, TweenInfo.new(0.25), {
                        WorldPosition = v26
                    }):Play();
                end;
            end, 
            Hit = function() --[[ Line: 110 ]]
                -- upvalues: v13 (copy), l_VFX_0 (copy), v9 (ref), v18 (copy)
                local v29, v30 = v13:PromiseAttackPosition():await();
                if v29 and v30 then
                    l_VFX_0.Hit.Position = v30;
                end;
                v9:ToggleEmitters(v18, true, true);
            end, 
            StopAttack = function() --[[ Line: 120 ]]
                -- upvalues: l_TweenService_0 (ref), l_BeamEndAttachment_0 (copy), l_BeamStartAttachment_0 (copy), v20 (copy), v9 (ref), v17 (copy), v18 (copy)
                local v31 = l_TweenService_0:Create(l_BeamEndAttachment_0, TweenInfo.new(0.2), {
                    CFrame = l_BeamStartAttachment_0.CFrame
                });
                v31.Completed:Once(function() --[[ Line: 126 ]]
                    -- upvalues: v31 (ref), v20 (ref)
                    v31:Destroy();
                    v31 = nil;
                    for _, v33 in v20 do
                        v33.Enabled = false;
                    end;
                end);
                v31:Play();
                v9:ToggleEmitters(v17, false);
                v9:ToggleEmitters(v18, false);
            end
        }
    });
end;
v11.Stop = function(_) --[[ Line: 144 ]] --[[ Name: Stop ]]

end;
return v11;