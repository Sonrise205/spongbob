local l_None_0 = require(script.Parent.Parent:WaitForChild("Object"):WaitForChild("None"));
local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
local function v4(v2, v3) --[[ Line: 5 ]]
    return type(v2) .. tostring(v2) < type(v3) .. tostring(v3);
end;
return function(v5, v6) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), l_None_0 (copy)
    local l_v4_0 = v4;
    if v6 ~= nil and v6 ~= l_None_0 then
        if typeof(v6) ~= "function" then
            error("invalid argument to Array.sort: compareFunction must be a function");
        end;
        l_v4_0 = function(v8, v9) --[[ Line: 16 ]]
            -- upvalues: v6 (copy)
            local v10 = v6(v8, v9);
            if typeof(v10) ~= "number" then
                error(("invalid result from compare function, expected number but got %s"):format((typeof(v10))));
            end;
            return v10 < 0;
        end;
    end;
    table.sort(v5, l_v4_0);
    return v5;
end;