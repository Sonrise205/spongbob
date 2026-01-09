local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
return function(v2) --[[ Line: 17 ]] --[[ Name: updateAll ]]
    local v3 = {};
    local v4 = {};
    local v5 = {};
    local v6 = 0;
    local v7 = 1;
    for v8 in v2.dependentSet do
        v6 = v6 + 1;
        v5[v6] = v8;
        v4[v8] = true;
    end;
    while v7 <= v6 do
        local v9 = v5[v7];
        local v10 = v3[v9];
        v3[v9] = v10 == nil and 1 or v10 + 1;
        if v9.dependentSet ~= nil then
            for v11 in v9.dependentSet do
                v6 = v6 + 1;
                v5[v6] = v11;
            end;
        end;
        v7 = v7 + 1;
    end;
    v7 = 1;
    while v7 <= v6 do
        local v12 = v5[v7];
        local v13 = v3[v12] - 1;
        v3[v12] = v13;
        if v13 == 0 and v4[v12] and v12:update() and v12.dependentSet ~= nil then
            for v14 in v12.dependentSet do
                v4[v14] = true;
            end;
        end;
        v7 = v7 + 1;
    end;
end;