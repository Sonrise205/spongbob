local l_RunService_0 = game:GetService("RunService");
return function(v1, v2, v3) --[[ Line: 3 ]]
    -- upvalues: l_RunService_0 (copy)
    local l_Color_0 = v1.Color;
    local v5 = {};
    local v6 = {};
    for _, v8 in l_Color_0.Keypoints do
        if v8.Time == 0 or v8.Time == 1 then
            v5[v8.Time] = v8.Value;
        else
            table.insert(v6, {
                baseTime = v8.Time, 
                color = v8.Value, 
                locked = false
            });
        end;
    end;
    local v9 = tick();
    return l_RunService_0.RenderStepped:Connect(function() --[[ Line: 22 ]]
        -- upvalues: v9 (copy), v3 (copy), v2 (copy), v5 (copy), v6 (copy), v1 (copy)
        local v10 = math.sin((tick() - v9) * v3 * 3.141592653589793 * 2) * v2;
        local v11 = {
            ColorSequenceKeypoint.new(0, v5[0]), 
            ColorSequenceKeypoint.new(1, v5[1])
        };
        for _, v13 in ipairs(v6) do
            local l_baseTime_0 = v13.baseTime;
            if not v13.locked then
                l_baseTime_0 = if v13.baseTime < 0.5 then math.clamp(v13.baseTime + v10, 0, 1) else math.clamp(v13.baseTime - v10, 0, 1);
            end;
            table.insert(v11, ColorSequenceKeypoint.new(l_baseTime_0, v13.color));
        end;
        table.sort(v11, function(v15, v16) --[[ Line: 43 ]]
            return v15.Time < v16.Time;
        end);
        v1.Color = ColorSequence.new(v11);
    end);
end;