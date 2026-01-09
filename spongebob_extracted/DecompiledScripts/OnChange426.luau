local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = {};
return function(v4) --[[ Line: 17 ]] --[[ Name: OnChange ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v5 = v3[v4];
    if v5 == nil then
        v5 = {
            type = "SpecialKey", 
            kind = "OnChange", 
            stage = "observer", 
            apply = function(_, v7, v8, v9) --[[ Line: 26 ]] --[[ Name: apply ]]
                -- upvalues: v4 (copy), v2 (ref)
                local l_status_0, l_result_0 = pcall(v9.GetPropertyChangedSignal, v9, v4);
                if not l_status_0 then
                    v2.logError("cannotConnectChange", nil, v9.ClassName, v4);
                    return;
                elseif typeof(v8) ~= "function" then
                    v2.logError("invalidChangeHandler", nil, v4);
                    return;
                else
                    table.insert(v7, l_result_0:Connect(function() --[[ Line: 39 ]]
                        -- upvalues: v8 (copy), v9 (copy), v4 (ref)
                        v8(v9[v4]);
                    end));
                    return;
                end;
            end
        };
        v3[v4] = v5;
    end;
    return v5;
end;