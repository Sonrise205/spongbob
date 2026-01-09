local _ = require(script.Parent.Parent.Parent.Parent:WaitForChild("es7-types"));
return function(v1, v2, v3) --[[ Line: 8 ]]
    local v4 = {};
    if v2 then
        local v5 = #v1;
        v4 = table.create(v5);
        for v6 = 1, v5 do
            if v3 ~= nil then
                v4[v6] = v2(v3, v1[v6], v6);
            else
                v4[v6] = v2(v1[v6], v6);
            end;
        end;
        return v4;
    else
        return (table.clone(v1));
    end;
end;