local l_Promise_0 = script.Parent.Parent.Promise;
local v1 = require(l_Promise_0);
return function(_, v3) --[[ Line: 18 ]]
    -- upvalues: v1 (copy), l_Promise_0 (copy)
    local v4 = v3[1];
    if v1.is(v4) then
        if v3[2] then
            warn("Detected multiple return values with a Promise. This is not supported.\n", debug.traceback());
        end;
        local v5 = table.pack(v4:await());
        local v6 = v5[1];
        table.clear(v3);
        v3[1] = l_Promise_0;
        v3[2] = v6;
        v3[3] = table.pack(table.unpack(v5, 2, #v5));
    end;
    return true;
end;