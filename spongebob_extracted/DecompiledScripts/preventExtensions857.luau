local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
return function(v1) --[[ Line: 8 ]] --[[ Name: preventExtensions ]]
    local v2 = tostring(v1);
    return (setmetatable(v1, {
        __newindex = function(_, v4, _) --[[ Line: 13 ]] --[[ Name: __newindex ]]
            -- upvalues: v2 (copy)
            local v6 = ("%q (%s) is not a valid member of %s"):format(tostring(v4), typeof(v4), v2);
            error(v6, 2);
        end, 
        __metatable = false
    }));
end;