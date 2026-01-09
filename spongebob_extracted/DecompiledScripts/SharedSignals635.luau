local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Signal);
local v2 = {};
return {
    new = function(v3) --[[ Line: 15 ]] --[[ Name: new ]]
        -- upvalues: v1 (copy), v2 (copy)
        local v4 = v1.new();
        v2[v3] = v4;
        return v4;
    end, 
    Subscribe = function(v5, v6, v7) --[[ Line: 26 ]] --[[ Name: Subscribe ]]
        return v5:Get(v6, true):Connect(v7);
    end, 
    Get = function(v8, v9, v10) --[[ Line: 35 ]] --[[ Name: Get ]]
        -- upvalues: v2 (copy)
        local v11 = v2[v9];
        if v10 and not v11 then
            v11 = v8.new(v9);
        end;
        return v11;
    end, 
    Fire = function(v12, v13, ...) --[[ Line: 48 ]] --[[ Name: Fire ]]
        v12:Get(v13, true):Fire(...);
    end
};