local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Logging.logError);
local function v5(v3, v4) --[[ Line: 12 ]] --[[ Name: getProperty_unsafe ]]
    return v3[v4];
end;
return function(v6) --[[ Line: 16 ]] --[[ Name: OnEvent ]]
    -- upvalues: v5 (copy), v2 (copy)
    return {
        type = "SpecialKey", 
        kind = "OnEvent", 
        stage = "observer", 
        apply = function(_, v8, v9, v10) --[[ Line: 22 ]] --[[ Name: apply ]]
            -- upvalues: v5 (ref), v6 (copy), v2 (ref)
            local l_status_0, l_result_0 = pcall(v5, v9, v6);
            if not l_status_0 or typeof(l_result_0) ~= "RBXScriptSignal" then
                v2("cannotConnectEvent", nil, v9.ClassName, v6);
                return;
            elseif typeof(v8) ~= "function" then
                v2("invalidEventHandler", nil, v6);
                return;
            else
                table.insert(v10, l_result_0:Connect(v8));
                return;
            end;
        end
    };
end;