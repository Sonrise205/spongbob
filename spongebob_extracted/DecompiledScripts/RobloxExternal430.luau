local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.External);
local v7 = {
    policies = {
        allowWebLinks = l_RunService_0:IsStudio()
    }, 
    doChoreImmediate = function(v4, ...) --[[ Line: 24 ]] --[[ Name: doChoreImmediate ]]
        task.spawn(v4, ...);
    end, 
    doChoreDeferred = function(v5, ...) --[[ Line: 34 ]] --[[ Name: doChoreDeferred ]]
        task.defer(v5, ...);
    end, 
    logErrorNonFatal = function(v6) --[[ Line: 44 ]] --[[ Name: logErrorNonFatal ]]
        task.spawn(error, v6, 0);
    end, 
    logWarn = warn
};
local function v8() --[[ Line: 58 ]] --[[ Name: performUpdateStep ]]
    -- upvalues: v3 (copy)
    v3.performUpdateStep(os.clock());
end;
local v9 = nil;
v7.startScheduler = function() --[[ Line: 66 ]] --[[ Name: startScheduler ]]
    -- upvalues: v9 (ref), l_RunService_0 (copy), l_HttpService_0 (copy), v8 (copy)
    if v9 ~= nil then
        return;
    elseif l_RunService_0:IsClient() then
        local v10 = "FusionUpdateStep_" .. l_HttpService_0:GenerateGUID();
        l_RunService_0:BindToRenderStep(v10, Enum.RenderPriority.First.Value, v8);
        v9 = function() --[[ Line: 79 ]]
            -- upvalues: l_RunService_0 (ref), v10 (copy)
            l_RunService_0:UnbindFromRenderStep(v10);
        end;
        return;
    else
        local v11 = l_RunService_0.Heartbeat:Connect(v8);
        v9 = function() --[[ Line: 84 ]]
            -- upvalues: v11 (copy)
            v11:Disconnect();
        end;
        return;
    end;
end;
v7.stopScheduler = function() --[[ Line: 93 ]] --[[ Name: stopScheduler ]]
    -- upvalues: v9 (ref)
    if v9 ~= nil then
        v9();
        v9 = nil;
    end;
end;
return v7;