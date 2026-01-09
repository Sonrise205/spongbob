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
v10.Construct = function(_) --[[ Line: 48 ]] --[[ Name: Construct ]]

end;
v10.Start = function(v12) --[[ Line: 50 ]] --[[ Name: Start ]]
    -- upvalues: v8 (copy)
    local l_VFX_0 = v12.Instance:WaitForChild("VFX");
    local v14 = {};
    v8:IterateClass(l_VFX_0.Hit, "ParticleEmitter", function(v15) --[[ Line: 54 ]]
        -- upvalues: v14 (copy)
        table.insert(v14, v15);
    end);
    v12:_SetAttackConfig({
        markers = {
            Hit = function() --[[ Line: 60 ]]
                -- upvalues: v8 (ref), v14 (copy)
                v8:JustEmit(v14);
            end
        }
    });
end;
v10.Stop = function(_) --[[ Line: 67 ]] --[[ Name: Stop ]]

end;
return v10;