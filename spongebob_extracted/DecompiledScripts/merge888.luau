local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.External);
return function(v2, v3, ...) --[[ Line: 13 ]] --[[ Name: merge ]]
    -- upvalues: v1 (copy)
    local v4 = {
        ...
    };
    if #v4 < 1 then
        return v3;
    else
        for _, v6 in v4 do
            for v7, v8 in v6 do
                if v3[v7] == nil then
                    v3[v7] = v8;
                elseif not v2 then
                    v1.logError("mergeConflict", nil, (tostring(v7)));
                end;
            end;
        end;
        return v3;
    end;
end;