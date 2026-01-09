local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Logging.logError);
return function(v3) --[[ Line: 12 ]] --[[ Name: OnChange ]]
    -- upvalues: v2 (copy)
    return {
        type = "SpecialKey", 
        kind = "OnChange", 
        stage = "observer", 
        apply = function(_, v5, v6, v7) --[[ Line: 18 ]] --[[ Name: apply ]]
            -- upvalues: v3 (copy), v2 (ref)
            local l_status_0, l_result_0 = pcall(v6.GetPropertyChangedSignal, v6, v3);
            if not l_status_0 then
                v2("cannotConnectChange", nil, v6.ClassName, v3);
                return;
            elseif typeof(v5) ~= "function" then
                v2("invalidChangeHandler", nil, v3);
                return;
            else
                table.insert(v7, l_result_0:Connect(function() --[[ Line: 25 ]]
                    -- upvalues: v5 (copy), v6 (copy), v3 (ref)
                    v5(v6[v3]);
                end));
                return;
            end;
        end
    };
end;