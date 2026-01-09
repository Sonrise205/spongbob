local _ = game:GetService("Debris");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.BaseComponent);
local v3 = require(l_ReplicatedStorage_0.Packages.RailComponent);
local _ = require(l_ReplicatedStorage_0.Packages.RailUtil);
local _ = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local l_BaseEntity_ClientExtension_0 = require(script.Parent:WaitForChild("BaseEntity_ClientExtension"));
local v10 = v3.new({
    Tag = string.split(script.Name, "_")[1], 
    Ancestors = {
        workspace
    }, 
    Extensions = {
        v2, 
        l_BaseEntity_ClientExtension_0
    }
});
v10.Construct = function(_) --[[ Line: 58 ]] --[[ Name: Construct ]]

end;
v10.Start = function(v12) --[[ Line: 60 ]] --[[ Name: Start ]]
    -- upvalues: v8 (copy)
    local l_VFX_0 = v12.Instance:WaitForChild("VFX");
    local v14 = {};
    local v15 = {};
    local v16 = {};
    local v17 = {};
    v8:IterateClass(l_VFX_0.Charge, "ParticleEmitter", function(v18) --[[ Line: 68 ]]
        -- upvalues: v14 (copy)
        table.insert(v14, v18);
    end);
    v8:IterateClass(l_VFX_0.Hit, "ParticleEmitter", function(v19) --[[ Line: 72 ]]
        -- upvalues: v15 (copy)
        table.insert(v15, v19);
    end);
    v8:IterateClass(l_VFX_0.Impact, "ParticleEmitter", function(v20) --[[ Line: 76 ]]
        -- upvalues: v16 (copy)
        table.insert(v16, v20);
    end);
    v8:IterateClass(l_VFX_0.Attack, "ParticleEmitter", function(v21) --[[ Line: 80 ]]
        -- upvalues: v17 (copy)
        table.insert(v17, v21);
    end);
    v12:_SetAttackConfig({
        markers = {
            Charge = function() --[[ Line: 86 ]]
                -- upvalues: v8 (ref), v14 (copy)
                warn("charge");
                v8:ToggleEmitters(v14, true);
            end, 
            Attack = function() --[[ Line: 91 ]]
                -- upvalues: v8 (ref), v14 (copy), v17 (copy), v16 (copy)
                warn("attack");
                v8:ToggleEmitters(v14, false);
                v8:ToggleEmitters(v17, true, true);
                v8:ToggleEmitters(v16, true, true);
            end, 
            Hit = function() --[[ Line: 98 ]]
                -- upvalues: v8 (ref), v16 (copy), v15 (copy)
                warn("hit");
                v8:ToggleEmitters(v16, false);
                v8:ToggleEmitters(v15, true);
            end, 
            StopAttack = function() --[[ Line: 104 ]]
                -- upvalues: v8 (ref), v17 (copy)
                warn("stopattack");
                v8:ToggleEmitters(v17, false);
            end, 
            StopHit = function() --[[ Line: 109 ]]
                -- upvalues: v8 (ref), v15 (copy)
                warn("stophit");
                v8:ToggleEmitters(v15, false);
            end
        }
    });
end;
v10.Stop = function(_) --[[ Line: 117 ]] --[[ Name: Stop ]]

end;
return v10;