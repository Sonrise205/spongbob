local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Symbol);
local v2 = v1("NAME");
local v3 = v1("COMM");
local v4 = v1("JANITOR");
local v5 = v1("NEW_IDX_SIG");
return {
    NAME_KEY = v2, 
    COMM_KEY = v3, 
    JANI_KEY = v4, 
    SIG_KEY = v5, 
    validateContext = function(v6, v7) --[[ Line: 35 ]] --[[ Name: validateContext ]]
        local l_RunService_0 = game:GetService("RunService");
        if v6 and not l_RunService_0:IsServer() then
            error((("%* can only be called on the server"):format(v7)));
            return;
        else
            if not v6 and not l_RunService_0:IsClient() then
                error((("%* can only be called on the client"):format(v7)));
            end;
            return;
        end;
    end
};