local l_Players_0 = game:GetService("Players");
local v1 = {};
local v2 = {};
l_Players_0.PlayerRemoving:Connect(function(v3) --[[ Line: 29 ]]
    -- upvalues: v2 (copy)
    if not v2[v3] then
        return;
    else
        table.clear(v2[v3]);
        v2[v3] = nil;
        return;
    end;
end);
local v4 = nil;
return function(v5, v6, v7) --[[ Line: 44 ]]
    -- upvalues: v4 (ref), v1 (copy), v2 (copy)
    assert(v6 > 0, "[Debouncer] Debounce must be greater than 0.");
    assert(typeof(v5) == "string", "[Debouncer] Key must be a string");
    v4 = v1;
    if v7 then
        if not v2[v7] then
            v2[v7] = {};
        end;
        v4 = v2[v7];
    end;
    if not v4[v5] then
        v4[v5] = os.clock();
        return true;
    elseif v4[v5] > os.clock() then
        return false;
    else
        v4[v5] = os.clock() + v6;
        return true;
    end;
end;