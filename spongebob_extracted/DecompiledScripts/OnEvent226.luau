local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = {};
local function v6(v4, v5) --[[ Line: 17 ]] --[[ Name: getProperty_unsafe ]]
    return v4[v5];
end;
return function(v7) --[[ Line: 24 ]] --[[ Name: OnEvent ]]
    -- upvalues: v3 (copy), v6 (copy), v2 (copy)
    local v8 = v3[v7];
    if v8 == nil then
        v8 = {
            type = "SpecialKey", 
            kind = "OnEvent", 
            stage = "observer", 
            apply = function(_, v10, v11, v12) --[[ Line: 33 ]] --[[ Name: apply ]]
                -- upvalues: v6 (ref), v7 (copy), v2 (ref)
                local l_status_0, l_result_0 = pcall(v6, v12, v7);
                if not l_status_0 or typeof(l_result_0) ~= "RBXScriptSignal" then
                    v2.logError("cannotConnectEvent", nil, v12.ClassName, v7);
                    return;
                elseif typeof(v11) ~= "function" then
                    v2.logError("invalidEventHandler", nil, v7);
                    return;
                else
                    table.insert(v10, l_result_0:Connect(v11));
                    return;
                end;
            end
        };
        v3[v7] = v8;
    end;
    return v8;
end;