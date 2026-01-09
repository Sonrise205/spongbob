return function(v0, v1, v2) --[[ Line: 22 ]] --[[ Name: springCoefficients ]]
    if v0 == 0 or v2 == 0 then
        return 1, 0, 0, 1;
    else
        local _ = nil;
        local _ = nil;
        local _ = nil;
        local _ = nil;
        if v1 > 1 then
            local v7 = math.sqrt(v1 ^ 2 - 1);
            local v8 = -0.5 / (v7 * v2);
            local v9 = v2 * (v7 + v1) * -1;
            local v10 = v2 * (v7 - v1);
            local v11 = math.exp(v0 * v9);
            local v12 = math.exp(v0 * v10);
            return (v12 * v9 - v11 * v10) * v8, (v11 - v12) * v8 / v2, (v12 - v11) * v8 * v2, (v11 * v9 - v12 * v10) * v8;
        elseif v1 == 1 then
            local v13 = v0 * v2;
            local v14 = v13 * -1;
            local v15 = math.exp(v14);
            return v15 * (v13 + 1), v15 * v0, v15 * (v14 * v2), v15 * (v14 + 1);
        else
            local v16 = v2 * math.sqrt(1 - v1 ^ 2);
            local v17 = 1 / v16;
            local v18 = math.exp(v0 * -1 * v2 * v1);
            local v19 = math.sin(v16 * v0);
            local v20 = math.cos(v16 * v0);
            local v21 = v18 * v19;
            local v22 = v18 * v20;
            local v23 = v21 * v2 * v1 * v17;
            return v23 + v22, v21 * v17, (v21 * v16 + v2 * v1 * v23) * -1, v22 - v23;
        end;
    end;
end;