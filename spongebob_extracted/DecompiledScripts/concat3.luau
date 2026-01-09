local l___DEV___0 = _G.__DEV__;
local l_isArray_0 = require(script.Parent:WaitForChild("isArray"));
local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
return function(v3, ...) --[[ Line: 12 ]] --[[ Name: concat ]]
    -- upvalues: l_isArray_0 (copy), l___DEV___0 (copy)
    local v4 = nil;
    local v5 = 0;
    if l_isArray_0(v3) then
        v4 = table.clone(v3);
        v5 = #v3;
    else
        v5 = v5 + 1;
        v4 = {
            [v5] = v3
        };
    end;
    for v6 = 1, select("#", ...) do
        local v7 = select(v6, ...);
        local v8 = typeof(v7);
        if v7 ~= nil then
            if v8 == "table" then
                if l___DEV___0 and not l_isArray_0(v7) then
                    error("Array.concat(...) only works with array-like tables but it received an object-like table.\nYou can avoid this error by wrapping the object-like table into an array. Example: `concat({1, 2}, {a = true})` should be `concat({1, 2}, { {a = true} }`");
                end;
                for v9 = 1, #v7 do
                    v5 = v5 + 1;
                    v4[v5] = v7[v9];
                end;
            else
                v5 = v5 + 1;
                v4[v5] = v7;
            end;
        end;
    end;
    return v4;
end;