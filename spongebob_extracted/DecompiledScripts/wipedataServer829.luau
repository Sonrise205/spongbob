local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local _ = game:GetService("TeleportService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local _ = require(l_ReplicatedStorage_0.Packages.Promise);
local v6 = require(l_ReplicatedStorage_0.Packages.Tree);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v8 = nil;
if l_RunService_0:IsServer() then
    v8 = require(v6.Await(l_ServerStorage_0, "Knit/Modules/DataTemplate"));
end;
local v9 = nil;
v4.OnStart():andThen(function() --[[ Line: 21 ]]
    -- upvalues: v9 (ref), v4 (copy)
    v9 = v4.GetService("DataService");
end);
return function(_, v11) --[[ Line: 25 ]]
    -- upvalues: v9 (ref)
    if not v11 then
        return;
    else
        v9:WipeProfile(v11.UserId);
        v11:Kick("Your data has been wiped. Please rejoin.");
        return (("Successfully wiped data for %*."):format(v11.Name));
    end;
end;