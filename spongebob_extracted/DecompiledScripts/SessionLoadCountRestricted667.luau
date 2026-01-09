local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = v2.GetService("DataService");
local v7 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace, 
        v2.Player.PlayerGui
    }
});
v7.Construct = function(v8) --[[ Line: 28 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v8.dumpster = v4.new();
end;
v7.Start = function(v9) --[[ Line: 34 ]] --[[ Name: Start ]]
    -- upvalues: v6 (copy)
    local v10 = v9.Instance:GetAttribute("RequiredLoadCount") or 2;
    v9.dumpster:Add(v6.SessionLoadCount:Observe(function(v11) --[[ Line: 36 ]]
        -- upvalues: v10 (copy), v9 (copy)
        if v11 ~= nil and v11 < v10 then
            v9.Instance:Destroy();
        end;
    end));
end;
v7.Stop = function(v12) --[[ Line: 43 ]] --[[ Name: Stop ]]
    if v12.dumpster then
        v12.dumpster:Destroy();
    end;
end;
return v7;