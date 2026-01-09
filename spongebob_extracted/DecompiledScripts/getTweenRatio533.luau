local l_TweenService_0 = game:GetService("TweenService");
return function(v1, v2) --[[ Line: 13 ]] --[[ Name: getTweenRatio ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_DelayTime_0 = v1.DelayTime;
    local l_Time_0 = v1.Time;
    local l_Reverses_0 = v1.Reverses;
    local v6 = 1 + v1.RepeatCount;
    local l_EasingStyle_0 = v1.EasingStyle;
    local l_EasingDirection_0 = v1.EasingDirection;
    local v9 = l_DelayTime_0 + l_Time_0;
    if l_Reverses_0 then
        v9 = v9 + l_Time_0;
    end;
    if v2 == 1e999 then
        return 1;
    elseif v9 * v6 <= v2 and v1.RepeatCount > -1 then
        return 1;
    else
        local v10 = v2 % v9;
        if v10 <= l_DelayTime_0 then
            return 0;
        else
            local v11 = (v10 - l_DelayTime_0) / l_Time_0;
            if v11 > 1 then
                v11 = 2 - v11;
            end;
            return (l_TweenService_0:GetValue(v11, l_EasingStyle_0, l_EasingDirection_0));
        end;
    end;
end;