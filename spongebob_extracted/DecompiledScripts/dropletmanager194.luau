local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.DropletUtil);
local _ = require(script.Client.Droplet);
local v3 = {
    Server = nil, 
    Client = nil, 
    Util = v1
};
setmetatable(v3, {
    __index = function(v4, v5) --[[ Line: 172 ]] --[[ Name: __index ]]
        -- upvalues: l_RunService_0 (copy)
        if v5 == "Server" then
            assert(l_RunService_0:IsServer(), "Attempted to access DropletManager.Server on client");
            v4[v5] = require(script.Server.DropletServerManager).new();
        elseif v5 == "Client" then
            assert(l_RunService_0:IsClient(), "Attempted to access DropletManager.Client on server");
            v4[v5] = require(script.Client.DropletClientManager).new();
        end;
        return v4[v5];
    end
});
return v3;