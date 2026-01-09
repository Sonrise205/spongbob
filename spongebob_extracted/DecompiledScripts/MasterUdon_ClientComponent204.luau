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
    v8:IterateClass(l_VFX_0.Charge, "ParticleEmitter", function(v17) --[[ Line: 66 ]]
        -- upvalues: v14 (copy)
        table.insert(v14, v17);
    end);
    v8:IterateClass(l_VFX_0.Hit, "ParticleEmitter", function(v18) --[[ Line: 70 ]]
        -- upvalues: v15 (copy)
        table.insert(v15, v18);
    end);
    v8:IterateClass(l_VFX_0.Impact, "ParticleEmitter", function(v19) --[[ Line: 74 ]]
        -- upvalues: v16 (copy)
        table.insert(v16, v19);
    end);
    v12:_SetAttackConfig({
        markers = {
            Charge = function() --[[ Line: 80 ]]
                -- upvalues: v8 (ref), v14 (copy)
                v8:ToggleEmitters(v14, true);
            end, 
            Hit = function() --[[ Line: 84 ]]
                -- upvalues: v8 (ref), v15 (copy), v16 (copy)
                v8:ToggleEmitters(v15, true, true);
                v8:JustEmit(v16);
            end, 
            StopHit = function() --[[ Line: 89 ]]
                -- upvalues: v8 (ref), v14 (copy), v15 (copy)
                v8:ToggleEmitters(v14, false);
                v8:ToggleEmitters(v15, false);
            end
        }
    });
end;
v10.Stop = function(_) --[[ Line: 97 ]] --[[ Name: Stop ]]

end;
return v10;