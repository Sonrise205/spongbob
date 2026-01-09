local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Packages.Component);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.EzVisuals);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = v2.new({
    Tag = script.Name, 
    Ancestors = {
        workspace, 
        v1.PlayerGui
    }
});
v6.Construct = function(v7) --[[ Line: 31 ]] --[[ Name: Construct ]]
    -- upvalues: v3 (copy), v4 (copy)
    v7.dump = v3.new();
    v7.dump:Add(v4.new(v7.Instance, "Rainbow", 0.4));
    v7.dump:Add(function() --[[ Line: 37 ]]
        -- upvalues: v7 (copy)
        v7.dump = nil;
    end);
end;
v6.Start = function(_) --[[ Line: 42 ]] --[[ Name: Start ]]

end;
v6.Stop = function(v9) --[[ Line: 46 ]] --[[ Name: Stop ]]
    if v9.dump then
        v9.dump:Destroy();
    end;
end;
return v6;