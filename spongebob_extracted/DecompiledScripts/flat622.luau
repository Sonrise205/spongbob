local l___DEV___0 = _G.__DEV__;
local l_isArray_0 = require(script.Parent:WaitForChild("isArray"));
local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
local function v3(v4, v5) --[[ Line: 5 ]] --[[ Name: flat ]]
    -- upvalues: l___DEV___0 (copy), l_isArray_0 (copy), v3 (copy)
    if l___DEV___0 then
        if typeof(v4) ~= "table" then
            error(string.format("Array.flat called on %s", (typeof(v4))));
        end;
        if v5 ~= nil and typeof(v5) ~= "number" then
            error("depth is not a number or nil");
        end;
    end;
    local v6 = v5 or 1;
    local v7 = {};
    for _, v9 in v4 do
        if l_isArray_0(v9) then
            local v10 = if v6 > 1 then v3(v9, v6 - 1) else v9;
            for _, v12 in v10 do
                table.insert(v7, v12);
            end;
        else
            table.insert(v7, v9);
        end;
    end;
    return v7;
end;
return v3;