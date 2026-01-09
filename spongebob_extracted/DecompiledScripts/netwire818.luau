local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.ServerWire);
local v2 = require(script.ClientWire);
local v3 = {
    Server = v1, 
    Client = v2
};
setmetatable(v3, {
    __call = function(_, ...) --[[ Line: 130 ]] --[[ Name: __call ]]
        -- upvalues: l_RunService_0 (copy), v1 (copy), v2 (copy)
        if l_RunService_0:IsServer() then
            return v1(...);
        else
            return v2(...);
        end;
    end, 
    __index = function(_, v6) --[[ Line: 137 ]] --[[ Name: __index ]]
        -- upvalues: l_RunService_0 (copy), v1 (copy), v2 (copy)
        if l_RunService_0:IsServer() then
            return v1[v6];
        else
            return v2[v6];
        end;
    end, 
    __metatable = "Dont look at me!"
});
return v3;