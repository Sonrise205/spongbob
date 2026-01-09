local l_RunService_0 = game:GetService("RunService");
local function v10(v1, v2) --[[ Line: 58 ]] --[[ Name: evalColorSequence ]]
    local v3 = {};
    v2 = v2 + 1;
    for v4 = 0, 2 do
        for v5 = 1, #v1 do
            table.insert(v3, {
                Time = v1[v5].Time + v4, 
                Value = v1[v5].Value
            });
        end;
    end;
    for v6 = 1, #v3 - 1 do
        local v7 = v3[v6];
        local v8 = v3[v6 + 1];
        if v7.Time <= v2 and v2 < v8.Time then
            local v9 = (v2 - v7.Time) / (v8.Time - v7.Time);
            return Color3.new((v8.Value.R - v7.Value.R) * v9 + v7.Value.R, (v8.Value.G - v7.Value.G) * v9 + v7.Value.G, (v8.Value.B - v7.Value.B) * v9 + v7.Value.B);
        end;
    end;
end;
local function v20(v11, v12) --[[ Line: 86 ]] --[[ Name: evalNumberSequence ]]
    local v13 = {};
    v12 = v12 + 1;
    for v14 = 0, 2 do
        for v15 = 1, #v11 do
            table.insert(v13, {
                Time = v11[v15].Time + v14, 
                Value = v11[v15].Value
            });
        end;
    end;
    for v16 = 1, #v13 - 1 do
        local v17 = v13[v16];
        local v18 = v13[v16 + 1];
        if v17.Time <= v12 and v12 < v18.Time then
            local v19 = (v12 - v17.Time) / (v18.Time - v17.Time);
            return v17.Value + (v18.Value - v17.Value) * v19;
        end;
    end;
end;
local v21 = {};
v21.__index = v21;
v21.new = function(v22, v23, v24) --[[ Line: 115 ]] --[[ Name: new ]]
    -- upvalues: l_RunService_0 (copy), v21 (copy)
    assert(v22, "UIInstance not provided");
    assert(v22:IsA("GuiObject") or v22:IsA("UIStroke"), "UIInstance is not a GuiObject or UIStroke");
    assert(v23, "ColorSequence not provided");
    assert(v24, "TransparencySequence not provided");
    assert(typeof(v23) == "ColorSequence", "ColorSequence is not a ColorSequence");
    local v25 = true;
    if typeof(v24) ~= "number" then
        v25 = typeof(v24) == "NumberSequence";
    end;
    assert(v25, "TransparencySequence is not a number or NumberSequence");
    assert(#v23.Keypoints <= 19, "ColorSequence has too many keypoints");
    if typeof(v24) == "NumberSequence" then
        assert(#v24.Keypoints <= 19, "TransparencySequence has too many keypoints");
    end;
    local v26 = {
        UIInstance = v22, 
        Instance = v22:FindFirstChildWhichIsA("UIGradient") or Instance.new("UIGradient"), 
        IsPaused = false, 
        ColorSequenceTarget = v23, 
        ColorSequence = v23, 
        TrueColorSequence = nil, 
        ColorSequenceBlendRate = 1, 
        TransparencySequenceTarget = nil, 
        TransparencySequence = nil, 
        TrueTransparencySequence = nil, 
        TransparencySequenceBlendRate = 1, 
        Offset = 0, 
        OffsetTarget = nil, 
        OffsetSpeed = 0, 
        OffsetSpeedTarget = 0, 
        OffsetAcceleration = 1, 
        TransparencyOffset = 0, 
        TransparencyOffsetTarget = nil, 
        TransparencyOffsetSpeed = 0, 
        TransparencyOffsetSpeedTarget = 0, 
        TransparencyOffsetAcceleration = 1, 
        Rotation = 0, 
        RotationSpeed = 0, 
        RotationSpeedTarget = 0, 
        RotationAcceleration = 0, 
        RotationTarget = nil, 
        Connection = nil, 
        IsText = false
    };
    if typeof(v24) == "number" then
        v26.TransparencySequenceTarget = NumberSequence.new({
            NumberSequenceKeypoint.new(0, v24), 
            NumberSequenceKeypoint.new(1, v24)
        });
    elseif typeof(v24) == "NumberSequence" then
        v26.TransparencySequenceTarget = v24;
    else
        warn("Weird type of data?");
    end;
    v26.TransparencySequence = v26.TransparencySequenceTarget;
    if v22:IsA("TextLabel") or v22:IsA("TextBox") or v22:IsA("TextButton") then
        v26.IsText = true;
    end;
    v26.Connection = l_RunService_0.Heartbeat:Connect(function(v27) --[[ Line: 178 ]]
        -- upvalues: v26 (copy)
        if v26.IsPaused then
            return;
        elseif not v26.UIInstance or v26.UIInstance.Parent == nil then
            v26:Destroy();
            return;
        else
            if v26.ColorSequenceBlendRate == 1 then
                v26.ColorSequence = v26.ColorSequenceTarget;
            else
                v26:EqualizeColorSequenceKeypoints();
            end;
            if v26.TransparencySequenceBlendRate == 1 then
                v26.TransparencySequence = v26.TransparencySequenceTarget;
            end;
            if v26.OffsetTarget then
                v26.Offset = v26.Offset + (v26.OffsetTarget - v26.Offset) * v26.OffsetAcceleration;
            else
                v26.OffsetSpeed = v26.OffsetSpeed + (v26.OffsetSpeedTarget - v26.OffsetSpeed) * v26.OffsetAcceleration * v27;
                local l_v26_0 = v26;
                l_v26_0.Offset = l_v26_0.Offset + v26.OffsetSpeed * v27;
            end;
            if v26.TransparencyOffsetTarget then
                v26.TransparencyOffset = v26.TransparencyOffset + (v26.TransparencyOffsetTarget - v26.TransparencyOffset) * v26.TransparencyOffsetAcceleration;
            else
                v26.TransparencyOffsetSpeed = v26.TransparencyOffsetSpeed + (v26.TransparencyOffsetSpeedTarget - v26.TransparencyOffsetSpeed) * v26.TransparencyOffsetAcceleration * v27;
                local l_v26_1 = v26;
                l_v26_1.TransparencyOffset = l_v26_1.TransparencyOffset + v26.TransparencyOffsetSpeed * v27;
            end;
            if v26.RotationTarget then
                v26.Rotation = v26.Rotation + (v26.RotationTarget - v26.Rotation) * v26.RotationAcceleration;
            else
                v26.RotationSpeed = v26.RotationSpeed + (v26.RotationSpeedTarget - v26.RotationSpeed) * v26.RotationAcceleration * v27;
                local l_v26_2 = v26;
                l_v26_2.Rotation = l_v26_2.Rotation + v26.RotationSpeed * v27;
            end;
            v26.Instance.Rotation = v26.Rotation;
            v26.Instance.Color = v26:CalculateTrueColorSequence();
            v26.Instance.Transparency = v26:CalculateTrueTransparencySequence();
            return;
        end;
    end);
    v26.Instance.Parent = v26.UIInstance;
    return (setmetatable(v26, v21));
end;
v21.SetColorSequence = function(v31, v32, v33) --[[ Line: 228 ]] --[[ Name: SetColorSequence ]]
    assert(typeof(v32) == "ColorSequence", "Sequence argument is nil or not a ColorSequence");
    v31.ColorSequenceBlendRate = v33 or 1;
    v31.ColorSequenceTarget = v32;
    return v31.ColorSequenceTarget;
end;
v21.SetOffset = function(v34, v35, v36) --[[ Line: 237 ]] --[[ Name: SetOffset ]]
    assert(typeof(v35) == "number", "Offset isn't a number");
    assert(typeof(v36) == "number", "Acceleration isn't a number");
    v34.OffsetTarget = v35;
    v34.OffsetSpeed = 0;
    v34.OffsetSpeedTarget = 0;
    v34.OffsetAcceleration = math.clamp(v36, 0, 1);
end;
v21.SetOffsetSpeed = function(v37, v38, v39) --[[ Line: 249 ]] --[[ Name: SetOffsetSpeed ]]
    assert(typeof(v38) == "number", "Offset isn't a number");
    assert(typeof(v39) == "number", "Acceleration isn't a number");
    v37.OffsetSpeedTarget = v38;
    v37.OffsetTarget = nil;
    v37.OffsetAcceleration = math.clamp(v39, 0, 1);
end;
v21.SetRotation = function(v40, v41, v42) --[[ Line: 260 ]] --[[ Name: SetRotation ]]
    assert(typeof(v41) == "number", "Offset isn't a number");
    assert(typeof(v42) == "number", "Acceleration isn't a number");
    v40.RotationTarget = v41;
    v40.RotationSpeed = 0;
    v40.RotationSpeedTarget = 0;
    v40.RotationAcceleration = math.clamp(v42, 0, 1);
end;
v21.SetRotationSpeed = function(v43, v44, v45) --[[ Line: 272 ]] --[[ Name: SetRotationSpeed ]]
    assert(typeof(v44) == "number", "Offset isn't a number");
    assert(typeof(v45) == "number", "Acceleration isn't a number");
    v43.RotationSpeedTarget = v44;
    v43.RotationTarget = nil;
    v43.RotationAcceleration = math.clamp(v45, 0, 1);
end;
v21.SetTransparencyOffset = function(v46, v47, v48) --[[ Line: 283 ]] --[[ Name: SetTransparencyOffset ]]
    assert(typeof(v47) == "number", "Offset isn't a number");
    assert(typeof(v48) == "number", "Acceleration isn't a number");
    v46.TransparencyOffsetTarget = v47;
    v46.TransparencyOffsetSpeed = 0;
    v46.TransparencyOffsetSpeedTarget = 0;
    v46.TransparencyOffsetAcceleration = math.clamp(v48, 0, 1);
end;
v21.SetTransparencyOffsetSpeed = function(v49, v50, v51) --[[ Line: 295 ]] --[[ Name: SetTransparencyOffsetSpeed ]]
    assert(typeof(v50) == "number", "Offset isn't a number");
    assert(typeof(v51) == "number", "Acceleration isn't a number");
    v49.TransparencyOffsetSpeedTarget = v50;
    v49.TransparencyOffsetTarget = nil;
    v49.TransparencyOffsetAcceleration = math.clamp(v51, 0, 1);
end;
v21.SetTransparencySequence = function(v52, v53, v54) --[[ Line: 306 ]] --[[ Name: SetTransparencySequence ]]
    assert(v53, "Transparency is nil");
    assert(typeof(v54) == "number", "Acceleration isn't a number");
    if typeof(v53) == "number" then
        v52.TransparencyTarget = NumberSequence.new({
            NumberSequenceKeypoint.new(0, v53), 
            NumberSequenceKeypoint.new(1, v53)
        });
    elseif typeof(v53) == "NumberSequence" then
        v52.TransparencyTarget = v53;
    else
        warn("Weird type of data?");
    end;
    v52.TransparencyAcceleration = math.clamp(v54, 0, 1);
end;
v21.EqualizeColorSequenceKeypoints = function(v55) --[[ Line: 323 ]] --[[ Name: EqualizeColorSequenceKeypoints ]]
    -- upvalues: v10 (copy)
    local l_Keypoints_0 = v55.ColorSequenceTarget.Keypoints;
    local l_Keypoints_1 = v55.ColorSequence.Keypoints;
    local v58 = {};
    if #l_Keypoints_0 ~= #l_Keypoints_1 then
        for _, v60 in l_Keypoints_0 do
            table.insert(v58, (ColorSequenceKeypoint.new(v60.Time, v10(l_Keypoints_1, v60.Time))));
        end;
    else
        for _, v62 in l_Keypoints_0 do
            local v63 = v10(l_Keypoints_1, v62.Time):Lerp(v62.Value, v55.ColorSequenceBlendRate);
            table.insert(v58, (ColorSequenceKeypoint.new(v62.Time, v63)));
        end;
    end;
    v55.ColorSequence = ColorSequence.new(v58);
end;
v21.EqualizeTransparencySequenceKeypoints = function(v64) --[[ Line: 345 ]] --[[ Name: EqualizeTransparencySequenceKeypoints ]]
    -- upvalues: v20 (copy)
    local l_Keypoints_2 = v64.TransparencySequenceTarget.Keypoints;
    local l_Keypoints_3 = v64.TransparencySequence.Keypoints;
    local v67 = {};
    if #l_Keypoints_2 ~= #l_Keypoints_3 then
        for _, v69 in l_Keypoints_2 do
            table.insert(v67, (NumberSequenceKeypoint.new(v69.Time, v20(l_Keypoints_3, v69.Time))));
        end;
    else
        for _, v71 in l_Keypoints_2 do
            local v72 = v20(l_Keypoints_3, v71.Time):Lerp(v71.Value, v64.TransparencySequenceBlendRate);
            table.insert(v67, (NumberSequenceKeypoint.new(v71.Time, v72)));
        end;
    end;
    print(v67[1].Value, v67[2].Value, v67[3].Value, v67[4].Value, v67[5].Value);
    v64.TransparencySequence = NumberSequence.new(v67);
end;
v21.CalculateTrueColorSequence = function(v73) --[[ Line: 368 ]] --[[ Name: CalculateTrueColorSequence ]]
    -- upvalues: v10 (copy)
    local v74 = {};
    local v75 = 5;
    local v76 = 100;
    for _, v78 in v73.ColorSequence.Keypoints do
        local v79 = ColorSequenceKeypoint.new((v78.Time + v73.Offset) % 1, v78.Value);
        if v79.Time <= v76 then
            v74[v75 - 1] = v79;
            v75 = v75 - 1;
            v76 = v79.Time;
        else
            v74[#v74 + 1] = v79;
        end;
    end;
    local v80 = {};
    for _, v82 in v74 do
        table.insert(v80, v82);
    end;
    table.sort(v80, function(v83, v84) --[[ Line: 389 ]]
        return v83.Time < v84.Time;
    end);
    if v80[1].Time ~= 0 then
        table.insert(v80, 1, (ColorSequenceKeypoint.new(0, v10(v80, 0))));
    end;
    if v80[#v80].Time ~= 1 then
        table.insert(v80, (ColorSequenceKeypoint.new(1, v10(v80, 1))));
    end;
    v73.TrueColorSequence = ColorSequence.new(v80);
    return v73.TrueColorSequence;
end;
v21.CalculateTrueTransparencySequence = function(v85) --[[ Line: 407 ]] --[[ Name: CalculateTrueTransparencySequence ]]
    -- upvalues: v20 (copy)
    if #v85.TransparencySequenceTarget.Keypoints == 2 and v85.TransparencySequenceTarget.Keypoints[1].Value == v85.TransparencySequenceTarget.Keypoints[2].Value then
        v85.TrueTransparencySequence = v85.TransparencySequenceTarget;
        return v85.TrueTransparencySequence;
    else
        local v86 = {};
        local v87 = #v85.TransparencySequence.Keypoints + 1;
        local v88 = 1e999;
        for _, v90 in v85.TransparencySequence.Keypoints do
            local v91 = v90.Time + v85.TransparencyOffset;
            if v91 > 1 or v91 < 0 then
                v91 = v91 % 1;
            end;
            local v92 = NumberSequenceKeypoint.new(v91, v90.Value);
            if v92.Time <= v88 then
                v86[v87 - 1] = v92;
                v87 = v87 - 1;
                v88 = v92.Time;
            else
                v86[#v86 + 1] = v92;
            end;
        end;
        local v93 = {};
        for _, v95 in v86 do
            table.insert(v93, v95);
        end;
        table.sort(v93, function(v96, v97) --[[ Line: 439 ]]
            return v96.Time < v97.Time;
        end);
        if v93[1].Time ~= 0 then
            table.insert(v93, 1, (NumberSequenceKeypoint.new(0, v20(v93, 0))));
        end;
        if v93[#v93].Time ~= 1 then
            local v98 = v20(v93, 1);
            table.insert(v93, (NumberSequenceKeypoint.new(1, v98)));
        end;
        v85.TrueTransparencySequence = NumberSequence.new(v93);
        return v85.TrueTransparencySequence;
    end;
end;
v21.Pause = function(v99) --[[ Line: 458 ]] --[[ Name: Pause ]]
    v99.IsPaused = true;
end;
v21.Resume = function(v100) --[[ Line: 462 ]] --[[ Name: Resume ]]
    v100.IsPaused = false;
end;
v21.Destroy = function(v101) --[[ Line: 466 ]] --[[ Name: Destroy ]]
    v101.Connection:Disconnect();
    if v101.Instance then
        v101.Instance:Destroy();
        v101.Instance = nil;
    end;
end;
return table.freeze(v21);