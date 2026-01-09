local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Knit);
local v2 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v3 = nil;
v1.OnStart():andThen(function() --[[ Line: 9 ]]
    -- upvalues: v3 (ref), v1 (copy)
    v3 = v1.GetService("DataService");
end);
return function(v4) --[[ Line: 13 ]]
    -- upvalues: v3 (ref), v2 (copy)
    v3:Set(v4.Executor, "NPEStage", v2.NPE.FINISHED_STAGE);
    v3:Set(v4.Executor, "NPECompleted", true);
end;