local l_NaN_0 = require(script.Parent.Parent:WaitForChild("number")).NaN;
return function(v1, v2) --[[ Line: 7 ]]
    -- upvalues: l_NaN_0 (copy)
    if type(v2) ~= "number" then
        v2 = 1;
    end;
    local v3 = string.len(v1);
    if v2 < 1 or v3 < v2 then
        return l_NaN_0;
    else
        local v4 = utf8.offset(v1, v2);
        if v4 == nil or v3 < v4 then
            return l_NaN_0;
        else
            local v5 = utf8.codepoint(v1, v4, v4);
            if v5 == nil then
                return l_NaN_0;
            else
                return v5;
            end;
        end;
    end;
end;