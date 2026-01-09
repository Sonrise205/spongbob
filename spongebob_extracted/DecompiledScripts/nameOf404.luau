local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utility.nicknames);
return function(v2, v3) --[[ Line: 14 ]] --[[ Name: nameOf ]]
    -- upvalues: v1 (copy)
    local v4 = v1[v2];
    if typeof(v4) == "string" then
        return v4;
    else
        if typeof(v2) == "table" then
            if typeof(v2.name) == "string" then
                return v2.name;
            elseif typeof(v2.kind) == "string" then
                return v2.kind;
            elseif typeof(v2.type) == "string" then
                return v2.type;
            end;
        end;
        return v3;
    end;
end;