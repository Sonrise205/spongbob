local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Instances.defaultProps);
local v3 = require(l_Parent_0.Instances.applyInstanceProps);
local v4 = require(l_Parent_0.Logging.logError);
return function(v5) --[[ Line: 14 ]] --[[ Name: New ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    return function(v6) --[[ Line: 15 ]]
        -- upvalues: v5 (copy), v4 (ref), v2 (ref), v3 (ref)
        local l_status_0, l_result_0 = pcall(Instance.new, v5);
        if not l_status_0 then
            v4("cannotCreateClass", nil, v5);
        end;
        local v9 = v2[v5];
        if v9 ~= nil then
            for v10, v11 in pairs(v9) do
                l_result_0[v10] = v11;
            end;
        end;
        v3(v6, l_result_0);
        return l_result_0;
    end;
end;