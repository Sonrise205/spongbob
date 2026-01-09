return function(v0, v1, v2) --[[ Line: 14 ]] --[[ Name: springCoefficients ]]
    if v0 == 0 or v2 == 0 then
        return 1, 0, 0, 1;
    else
        local _ = nil;
        local _ = nil;
        local _ = nil;
        local _ = nil;
        if v1 > 1 then
            local v7 = v0 * v2;
            local v8 = math.sqrt(v1 ^ 2 - 1);
            local v9 = -0.5 / v8;
            local v10 = -v8 - v1;
            local v11 = 1 / v10;
            local v12 = math.exp(v7 * v10);
            local v13 = math.exp(v7 * v11);
            return (v13 * v10 - v12 * v11) * v9, (v12 - v13) * v9 / v2, (v13 - v12) * v9 * v2, (v12 * v10 - v13 * v11) * v9;
        elseif v1 == 1 then
            local v14 = v0 * v2;
            local v15 = math.exp(-v14);
            return v15 * (v14 + 1), v15 * v0, v15 * (-v14 * v2), v15 * (1 - v14);
        else
            local v16 = v0 * v2;
            local v17 = math.sqrt(1 - v1 ^ 2);
            local v18 = 1 / v17;
            local v19 = v17 * v16;
            local v20 = math.exp(-v16 * v1);
            local v21 = v20 * math.sin(v19);
            local v22 = v20 * math.cos(v19);
            local v23 = v21 * v18;
            local v24 = v23 * v1;
            return v24 + v22, v23, -(v24 * v1 + v21 * v17), v22 - v24;
        end;
    end;
end;