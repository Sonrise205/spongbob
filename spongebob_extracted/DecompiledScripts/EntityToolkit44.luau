local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(script.Parent.EntityData);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
return {
    getEntityData = function(v3) --[[ Line: 34 ]] --[[ Name: getEntityData ]]
        -- upvalues: v1 (copy)
        return v1["Entity_" .. v3];
    end
};