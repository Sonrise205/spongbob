return function(v0, v1, v2, v3, v4) --[[ Line: 8 ]]
    v2 = v2 or 0.5;
    v3 = v3 or 5;
    if v4 == nil then
        v4 = true;
    end;
    for v5 = 1, v1 do
        local l_status_0, l_result_0 = pcall(v0);
        if l_status_0 then
            return true, l_result_0;
        elseif v5 < v1 then
            local v8 = math.min(v2 * 2 ^ (v5 - 1), v3);
            if v4 then
                v8 = v8 * (0.5 + math.random());
            end;
            warn(string.format("Attempt %d failed, retrying in %.2f seconds...", v5, v8));
            task.wait(v8);
        else
            return false, l_result_0;
        end;
    end;
end;