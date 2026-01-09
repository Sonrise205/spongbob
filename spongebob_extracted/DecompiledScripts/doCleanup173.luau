local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.ExternalDebug);
local v4 = {};
local function v5(v6) --[[ Line: 23 ]] --[[ Name: doCleanup ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy), v3 (copy)
    if v4[v6] then
        return v2.logError("destroyedTwice");
    else
        v4[v6] = true;
        if typeof(v6) == "Instance" then
            v6:Destroy();
        elseif typeof(v6) == "RBXScriptConnection" then
            v6:Disconnect();
        elseif typeof(v6) == "thread" then
            local v7 = nil;
            if coroutine.running() ~= v6 then
                v7 = pcall(function() --[[ Line: 46 ]]
                    -- upvalues: v6 (copy)
                    task.cancel(v6);
                end);
            end;
            if not v7 then
                task.defer(function() --[[ Line: 53 ]]
                    -- upvalues: v6 (copy)
                    task.cancel(v6);
                end);
            end;
        elseif typeof(v6) == "function" then
            v6();
        elseif typeof(v6) == "table" then
            if typeof(v6.destroy) == "function" then
                v6:destroy();
            elseif typeof(v6.Destroy) == "function" then
                v6:Destroy();
            elseif v6[1] ~= nil then
                for v8 = #v6, 1, -1 do
                    v5(v6[v8]);
                    v6[v8] = nil;
                end;
                v3.untrackScope(v6);
            end;
        end;
        v4[v6] = nil;
        return;
    end;
end;
return v5;