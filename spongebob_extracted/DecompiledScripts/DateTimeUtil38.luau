local v0 = {};
local function v4(v1, v2) --[[ Line: 9 ]] --[[ Name: getDaysInMonth ]]
    local v3 = {
        31, 
        28, 
        31, 
        30, 
        31, 
        30, 
        31, 
        31, 
        30, 
        31, 
        30, 
        31
    };
    if v2 == 2 and (v1 % 4 == 0 and v1 % 100 ~= 0 or v1 % 400 == 0) then
        return 29;
    else
        return v3[v2];
    end;
end;
v0.IsCDT = function(_, v6) --[[ Line: 35 ]] --[[ Name: IsCDT ]]
    local v7 = v6 or DateTime.now();
    local l_Year_0 = v7:ToUniversalTime().Year;
    local v9 = DateTime.fromUniversalTime(l_Year_0, 3, 1);
    local v10 = (7 - tonumber(v9:FormatUniversalTime("d", "en-us"))) % 7;
    local v11 = v9.UnixTimestamp + (v10 + 7) * 86400 + 28800;
    local v12 = DateTime.fromUniversalTime(l_Year_0, 11, 1);
    local v13 = (7 - tonumber(v12:FormatUniversalTime("d", "en-us"))) % 7;
    local v14 = v12.UnixTimestamp + v13 * 86400 + 25200;
    local v15 = false;
    if v11 <= v7.UnixTimestamp then
        v15 = v7.UnixTimestamp < v14;
    end;
    return v15;
end;
v0.AdjustDateComponents = function(_, v17, v18, v19) --[[ Line: 63 ]] --[[ Name: AdjustDateComponents ]]
    -- upvalues: v4 (copy)
    while v19 <= 0 do
        v18 = v18 - 1;
        if v18 <= 0 then
            v18 = 12;
            v17 = v17 - 1;
        end;
        v19 = v19 + v4(v17, v18);
    end;
    while true do
        local v20 = v4(v17, v18);
        if v19 > v20 then
            v19 = v19 - v20;
            v18 = v18 + 1;
            if v18 > 12 then
                v18 = 1;
                v17 = v17 + 1;
            end;
        else
            break;
        end;
    end;
    while v18 > 12 do
        v18 = v18 - 12;
        v17 = v17 + 1;
    end;
    while v18 < 1 do
        v18 = v18 + 12;
        v17 = v17 - 1;
    end;
    return v17, v18, v19;
end;
v0.GetForCT = function(v21, v22) --[[ Line: 106 ]] --[[ Name: GetForCT ]]
    v22 = v22 or {};
    local v23 = DateTime.now():ToUniversalTime();
    local v24 = v22.Year or v22.year or v23.Year;
    local v25 = v22.Month or v22.month or v23.Month;
    local v26 = v22.Day or v22.day or v23.Day;
    local v27 = v22.Hour or v22.hour or v23.Hour;
    local v28 = v22.Minute or v22.minute or 0;
    local v29 = v22.Second or v22.second or 0;
    local v30, v31, v32 = v21:AdjustDateComponents(v24, v25, v26);
    v30 = DateTime.fromUniversalTime(v30, v31, v32, v27, v28, v29);
    v31 = v21:GetUTCOffset(v30) * -1;
    v32 = v30.UnixTimestamp + v31 * 3600;
    return DateTime.fromUnixTimestamp(v32);
end;
v0.GetForCTUnix = function(v33, v34) --[[ Line: 129 ]] --[[ Name: GetForCTUnix ]]
    return v33:GetForCT(v34).UnixTimestamp;
end;
v0.GetUTCOffset = function(v35, v36) --[[ Line: 134 ]] --[[ Name: GetUTCOffset ]]
    if v35:IsCDT(v36) then
        return -5;
    else
        return -6;
    end;
end;
v0.GetDaysBetween = function(v37, v38, v39) --[[ Line: 138 ]] --[[ Name: GetDaysBetween ]]
    local v40 = v38:ToUniversalTime();
    local v41 = v39:ToUniversalTime();
    local l_v37_ForCT_0 = v37:GetForCT({
        Year = v40.Year, 
        Month = v40.Month, 
        Day = v40.Day, 
        Hour = 0, 
        Minute = 0, 
        Second = 0
    });
    local l_v37_ForCT_1 = v37:GetForCT({
        Year = v41.Year, 
        Month = v41.Month, 
        Day = v41.Day, 
        Hour = 0, 
        Minute = 0, 
        Second = 0
    });
    local v44 = l_v37_ForCT_0.UnixTimestamp // 86400;
    return l_v37_ForCT_1.UnixTimestamp // 86400 - v44;
end;
return v0;