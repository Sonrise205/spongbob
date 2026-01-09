local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Tree);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    for v4, v5 in v3 do
        local v6 = nil;
        if v1.Exists(v2, v4) then
            v6 = v1.Find(v2, v4);
        end;
        if v6 then
            for v7, v8 in v5 do
                v6[v7] = v8;
            end;
        end;
    end;
end;