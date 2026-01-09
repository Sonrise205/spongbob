local l_findOr_0 = require(script.Parent:WaitForChild("findOr"));
local l_slice_0 = require(script.Parent:WaitForChild("slice"));
local _ = require(script.Parent.Parent:WaitForChild("es7-types"));
local l_MAX_SAFE_INTEGER_0 = require(script.Parent.Parent:WaitForChild("number")).MAX_SAFE_INTEGER;
return function(v4, v5, v6) --[[ Line: 10 ]] --[[ Name: split ]]
    -- upvalues: l_MAX_SAFE_INTEGER_0 (copy), l_findOr_0 (copy), l_slice_0 (copy)
    if v5 == nil then
        return {
            v4
        };
    elseif v6 == 0 then
        return {};
    else
        local v7 = if not (v6 ~= nil) or v6 < 0 then l_MAX_SAFE_INTEGER_0 else v6;
        local v8 = nil;
        if typeof(v5) == "string" then
            if v5 == "" then
                local v9 = {};
                for v10 in v4:gmatch(".") do
                    table.insert(v9, v10);
                end;
                return v9;
            else
                v8 = {
                    v5
                };
            end;
        else
            v8 = v5;
        end;
        local v11 = 1;
        local v12 = {};
        local v13 = nil;
        local v14, v15 = utf8.len(v4);
        assert(v14 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v4, (tostring(v15))));
        repeat
            local v16 = l_findOr_0(v4, v8, v11);
            if v16 ~= nil then
                table.insert(v12, l_slice_0(v4, v11, v16.index));
                local v17 = utf8.len(v16.match);
                v11 = v16.index + v17;
            else
                table.insert(v12, l_slice_0(v4, v11, nil));
            end;
            if v16 ~= nil then
                v13 = v16;
            end;
        until v16 == nil or v14 < v11 or v7 <= #v12;
        if v13 ~= nil then
            local v18, v19 = utf8.len(v13.match);
            assert(v18 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v13.match, (tostring(v19))));
            if v13.index + v18 == v14 + 1 then
                table.insert(v12, "");
            end;
        end;
        return v12;
    end;
end;