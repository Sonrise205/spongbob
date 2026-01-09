local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Instances.defaultProps);
local v4 = require(l_Parent_0.Instances.applyInstanceProps);
return function(v5, v6) --[[ Line: 19 ]] --[[ Name: New ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    if v6 == nil then
        v2.logError("scopeMissing", nil, "instances using New", "myScope:New \"" .. v5 .. "\" { ... }");
    end;
    return function(v7) --[[ Line: 31 ]]
        -- upvalues: v6 (copy), v2 (ref), v3 (ref), v5 (copy), v4 (ref)
        local l_status_0, l_result_0 = pcall(Instance.new, v6);
        if not l_status_0 then
            v2.logError("cannotCreateClass", nil, v6);
        end;
        local v10 = v3[v6];
        if v10 ~= nil then
            for v11, v12 in pairs(v10) do
                l_result_0[v11] = v12;
            end;
        end;
        table.insert(v5, l_result_0);
        v4(v5, v7, l_result_0);
        return l_result_0;
    end;
end;