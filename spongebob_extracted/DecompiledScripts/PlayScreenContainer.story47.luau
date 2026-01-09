local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v2 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v3 = require(script.Parent.PlayScreenContainer);
return {
    fusion = v2, 
    controls = {}, 
    story = function(v4) --[[ Line: 28 ]] --[[ Name: story ]]
        -- upvalues: v1 (copy), v3 (copy)
        local l_scope_0 = v4.scope;
        local _ = v4.controls;
        local v7 = v1.new();
        local _ = v3(l_scope_0, {
            Size = UDim2.fromOffset(256, 256), 
            Parent = v4.target
        });
        v7:Add(task.defer(function() --[[ Line: 40 ]]

        end));
        return function() --[[ Line: 44 ]]
            -- upvalues: v7 (copy)
            warn("Destroying [PlayScreenContainer]");
            v7:Destroy();
        end;
    end
};