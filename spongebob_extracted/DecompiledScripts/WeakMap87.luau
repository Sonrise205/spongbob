local _ = require(script.Parent.Parent:WaitForChild("es7-types"));
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    return (setmetatable({
        _weakMap = setmetatable({}, {
            __mode = "k"
        })
    }, v1));
end;
v1.get = function(v2, v3) --[[ Line: 24 ]] --[[ Name: get ]]
    return v2._weakMap[v3];
end;
v1.set = function(v4, v5, v6) --[[ Line: 28 ]] --[[ Name: set ]]
    v4._weakMap[v5] = v6;
    return v4;
end;
v1.has = function(v7, v8) --[[ Line: 33 ]] --[[ Name: has ]]
    return v7._weakMap[v8] ~= nil;
end;
return v1;