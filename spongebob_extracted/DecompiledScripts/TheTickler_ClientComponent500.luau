local _ = game:GetService("Debris");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
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
    -- upvalues: v9 (copy)
    local l_VFX_0 = v13.Instance:WaitForChild("VFX");
    local v15 = {};
    local v16 = {};
    local v17 = {};
    v9:IterateClass(l_VFX_0.Charge, "ParticleEmitter", function(v18) --[[ Line: 57 ]]
        -- upvalues: v15 (copy)
        table.insert(v15, v18);
    end);
    v9:IterateClass(l_VFX_0.Hit, "ParticleEmitter", function(v19) --[[ Line: 61 ]]
        -- upvalues: v17 (copy)
        table.insert(v17, v19);
    end);
    v9:IterateClass(l_VFX_0.Attack1, "ParticleEmitter", function(v20) --[[ Line: 65 ]]
        -- upvalues: v16 (copy)
        table.insert(v16, v20);
    end);
    v9:IterateClass(l_VFX_0.Attack2, "ParticleEmitter", function(v21) --[[ Line: 69 ]]
        -- upvalues: v16 (copy)
        table.insert(v16, v21);
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
                -- upvalues: v13 (copy), l_VFX_0 (copy), v9 (ref), v17 (copy)
                local v22, v23 = v13:PromiseAttackPosition():await();
                if v22 and v23 then
                    l_VFX_0.Hit.Position = v23;
                    v9:ToggleEmitters(v17, true, true);
                end;
            end, 
            StopAttack = function() --[[ Line: 94 ]]
                -- upvalues: v9 (ref), v16 (copy)
                v9:ToggleEmitters(v16, false);
            end, 
            StopHit = function() --[[ Line: 98 ]]
                -- upvalues: v9 (ref), v15 (copy), v17 (copy)
                v9:ToggleEmitters(v15, false);
                v9:ToggleEmitters(v17, false);
            end
        }
    });
end;
v11.Stop = function(_) --[[ Line: 106 ]] --[[ Name: Stop ]]

end;
return v11;