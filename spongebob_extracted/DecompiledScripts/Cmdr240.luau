local l_RunService_0 = game:GetService("RunService");
local l_Util_0 = require(script.Shared:WaitForChild("Util"));
if l_RunService_0:IsServer() == false then
    error("[Cmdr] Client scripts cannot require the server library. Please require the client library from the client to use Cmdr in your own code.");
end;
local v2 = nil;
v2 = setmetatable({
    ReplicatedRoot = nil, 
    RemoteFunction = nil, 
    RemoteEvent = nil, 
    Util = l_Util_0, 
    DefaultCommandsFolder = script.BuiltInCommands
}, {
    __index = function(v3, v4) --[[ Line: 47 ]] --[[ Name: __index ]]
        local v5 = v3.Registry[v4];
        if v5 and type(v5) == "function" then
            return function(_, ...) --[[ Line: 50 ]]
                -- upvalues: v5 (copy), v3 (copy)
                return v5(v3.Registry, ...);
            end;
        else
            return;
        end;
    end
});
v2.Registry = require(script.Shared.Registry)(v2);
v2.Dispatcher = require(script.Shared.Dispatcher)(v2);
require(script.Initialize)(v2);
v2.RemoteFunction.OnServerInvoke = function(v7, v8, v9) --[[ Line: 64 ]]
    -- upvalues: v2 (ref)
    if #v8 > 10000 then
        return "Input too long";
    else
        return v2.Dispatcher:EvaluateAndRun(v8, v7, v9);
    end;
end;
return v2;