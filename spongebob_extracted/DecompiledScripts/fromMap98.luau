local _ = require(script.Parent.Parent.Parent.Parent:WaitForChild("es7-types"));
return function(v1, v2, v3) --[[ Line: 8 ]]
    local v4 = {};
    if v2 then
        v4 = {};
        for v5, v6 in v1 do
            if v3 ~= nil then
                v4[v5] = v2(v3, v6, v5);
            else
                v4[v5] = v2(v6, v5);
            end;
        end;
        return v4;
    else
        v4 = {};
        for v7, v8 in v1 do
            v4[v7] = v8;
        end;
        return v4;
    end;
end;