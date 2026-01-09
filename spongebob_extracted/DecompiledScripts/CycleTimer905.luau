local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, v3) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        numCycles = v1 or 3, 
        cycleDuration = v2 or 900, 
        referenceTimestamp = v3 or 1704067200, 
        callbacks = {}
    }, v0));
end;
v0.AddCallback = function(v4, v5) --[[ Line: 19 ]] --[[ Name: AddCallback ]]
    table.insert(v4.callbacks, v5);
    return function() --[[ Line: 22 ]]
        -- upvalues: v4 (copy), v5 (copy)
        local v6 = table.find(v4.callbacks, v5);
        if v6 then
            table.remove(v4.callbacks, v6);
        end;
    end;
end;
v0.GetBaseTime = function(v7) --[[ Line: 31 ]] --[[ Name: GetBaseTime ]]
    local v8 = math.floor((DateTime.now().UnixTimestamp - v7.referenceTimestamp) / 86400);
    local v9 = v7.referenceTimestamp + v8 * 86400;
    return DateTime.fromUnixTimestamp(v9);
end;
v0.GetCycleIndex = function(v10) --[[ Line: 46 ]] --[[ Name: GetCycleIndex ]]
    local v11 = DateTime.now();
    local l_v10_BaseTime_0 = v10:GetBaseTime();
    return math.floor((v11.UnixTimestamp - l_v10_BaseTime_0.UnixTimestamp) / v10.cycleDuration) % v10.numCycles + 1;
end;
v0.GetCurrentCycleStartTime = function(v13) --[[ Line: 56 ]] --[[ Name: GetCurrentCycleStartTime ]]
    local v14 = DateTime.now();
    local l_v13_BaseTime_0 = v13:GetBaseTime();
    local v16 = math.floor((v14.UnixTimestamp - l_v13_BaseTime_0.UnixTimestamp) / v13.cycleDuration);
    local v17 = l_v13_BaseTime_0.UnixTimestamp + v16 * v13.cycleDuration;
    return DateTime.fromUnixTimestamp(v17);
end;
v0.GetCurrentCycleTime = function(v18) --[[ Line: 67 ]] --[[ Name: GetCurrentCycleTime ]]
    local v19 = DateTime.now();
    local l_v18_CurrentCycleStartTime_0 = v18:GetCurrentCycleStartTime();
    return v19.UnixTimestamp - l_v18_CurrentCycleStartTime_0.UnixTimestamp;
end;
v0.GetNextCycleTime = function(v21, v22) --[[ Line: 75 ]] --[[ Name: GetNextCycleTime ]]
    local v23 = v22 or DateTime.now();
    local l_v21_BaseTime_0 = v21:GetBaseTime();
    local v25 = math.floor((v23.UnixTimestamp - l_v21_BaseTime_0.UnixTimestamp) / v21.cycleDuration);
    local v26 = l_v21_BaseTime_0.UnixTimestamp + (v25 + 1) * v21.cycleDuration;
    return DateTime.fromUnixTimestamp(v26);
end;
v0.Start = function(v27) --[[ Line: 86 ]] --[[ Name: Start ]]
    local l_v27_NextCycleTime_0 = v27:GetNextCycleTime();
    local l_v27_CycleIndex_0 = v27:GetCycleIndex();
    local l_v27_CurrentCycleStartTime_0 = v27:GetCurrentCycleStartTime();
    for _, v32 in v27.callbacks do
        v32(l_v27_CycleIndex_0, l_v27_NextCycleTime_0, l_v27_CurrentCycleStartTime_0);
    end;
    v27.thread = task.spawn(function() --[[ Line: 95 ]]
        -- upvalues: l_v27_NextCycleTime_0 (ref), v27 (copy), l_v27_CycleIndex_0 (ref)
        while true do
            l_v27_NextCycleTime_0 = v27:GetNextCycleTime();
            local v33 = l_v27_NextCycleTime_0.UnixTimestamp - DateTime.now().UnixTimestamp;
            task.wait(v33);
            l_v27_CycleIndex_0 = v27:GetCycleIndex();
            for _, v35 in v27.callbacks do
                v35(l_v27_CycleIndex_0, v27:GetNextCycleTime(), v27:GetCurrentCycleStartTime());
            end;
        end;
    end);
end;
v0.Destroy = function(v36) --[[ Line: 110 ]] --[[ Name: Destroy ]]
    v36.callbacks = nil;
    task.cancel(v36.thread);
end;
return v0;