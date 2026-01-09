local v0 = Random.new();
local v1 = {};
for v2, v3 in pairs(table) do
    v1[v2] = v3;
end;
v1.contains = function(v4, v5) --[[ Line: 30 ]]
    -- upvalues: v1 (copy)
    return v1.indexOf(v4, v5) ~= nil;
end;
v1.indexOf = function(v6, v7) --[[ Line: 35 ]]
    -- upvalues: v1 (copy)
    local v8 = table.find(v6, v7);
    if v8 then
        return v8;
    else
        return v1.keyOf(v6, v7);
    end;
end;
v1.keyOf = function(v9, v10) --[[ Line: 44 ]]
    for v11, v12 in pairs(v9) do
        if v12 == v10 then
            return v11;
        end;
    end;
    return nil;
end;
v1.skip = function(v13, v14) --[[ Line: 54 ]]
    return table.move(v13, v14 + 1, #v13, 1, table.create(#v13 - v14));
end;
v1.take = function(v15, v16) --[[ Line: 59 ]]
    return table.move(v15, 1, v16, 1, table.create(v16));
end;
v1.range = function(v17, v18, v19) --[[ Line: 64 ]]
    return table.move(v17, v18, v19, 1, table.create(v19 - v18 + 1));
end;
v1.skipAndTake = function(v20, v21, v22) --[[ Line: 69 ]]
    return table.move(v20, v21 + 1, v21 + v22, 1, table.create(v22));
end;
v1.random = function(v23) --[[ Line: 74 ]]
    -- upvalues: v0 (copy)
    return v23[v0:NextInteger(1, #v23)];
end;
v1.join = function(v24, v25) --[[ Line: 79 ]]
    local v26 = table.create(#v24 + #v25);
    local _ = table.move(v24, 1, #v24, 1, v26);
    return table.move(v25, 1, #v25, #v24 + 1, v26);
end;
v1.removeObject = function(v28, v29) --[[ Line: 86 ]]
    -- upvalues: v1 (copy)
    local v30 = v1.indexOf(v28, v29);
    if v30 then
        table.remove(v28, v30);
    end;
end;
v1.expand = function(v31, v32) --[[ Line: 95 ]]
    if v32 < 0 then
        error("Cannot expand a table by a negative amount of objects.");
    end;
    local v33 = table.create(#v31 + v32);
    for v34 = 1, #v31 do
        v33[v34] = v31[v34];
    end;
    return v33;
end;
return v1;