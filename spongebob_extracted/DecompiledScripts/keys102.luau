local l_Set_0 = require(script.Parent.Parent:WaitForChild("Set"));
local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
local v2 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"));
return function(v3) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), l_Set_0 (copy)
    if v3 == nil then
        error("cannot extract keys from a nil value");
    end;
    local v4 = typeof(v3);
    local v5 = nil;
    if v4 == "table" then
        v5 = {};
        if v2(v3, l_Set_0) then
            return v5;
        else
            for v6 in pairs(v3) do
                table.insert(v5, v6);
            end;
            return v5;
        end;
    else
        if v4 == "string" then
            local v7 = v3:len();
            v5 = table.create(v7);
            for v8 = 1, v7 do
                v5[v8] = tostring(v8);
            end;
        end;
        return v5;
    end;
end;