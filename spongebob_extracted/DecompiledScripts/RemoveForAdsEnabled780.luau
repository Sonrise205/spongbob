local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Component);
local v4 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Shared.Util.PromisePolicyInfo);
local v7 = v3.new({
    Tag = script.Name, 
    Ancestors = {
        workspace, 
        v2.PlayerGui
    }
});
v7.Construct = function(v8) --[[ Line: 31 ]] --[[ Name: Construct ]]
    -- upvalues: v4 (copy)
    v8.dump = v4.new();
    v8.dump:Add(function() --[[ Line: 35 ]]
        -- upvalues: v8 (copy)
        v8.dump = nil;
    end);
    v8.dump:AttachTo(v8.Instance);
end;
v7.Start = function(v9) --[[ Line: 42 ]] --[[ Name: Start ]]
    -- upvalues: v6 (copy)
    local v10, v11 = v6():await();
    if not v10 then
        v9.Instance:Destroy();
        return;
    elseif v11.AreAdsAllowed then
        v9.Instance:Destroy();
        return;
    else
        return;
    end;
end;
v7.Stop = function(v12) --[[ Line: 56 ]] --[[ Name: Stop ]]
    if v12.dump then
        v12.dump:Destroy();
    end;
end;
return v7;