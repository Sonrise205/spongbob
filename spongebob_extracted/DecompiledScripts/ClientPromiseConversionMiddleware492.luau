local l_Promise_0 = script.Parent.Parent.Parent.Promise;
local v1 = require(l_Promise_0);
return function(v2) --[[ Line: 17 ]]
    -- upvalues: l_Promise_0 (copy), v1 (copy)
    if v2[1] == l_Promise_0 then
        local v3 = v2[2];
        local v4 = nil;
        v4 = if not v3 then v1.reject(table.unpack(v2[3])) else v1.resolve(table.unpack(v2[3]));
        table.clear(v2);
        v2[1] = v4;
    end;
    return true;
end;