local l_Color_0 = BrickColor.new("Toothpaste").Color;
local v1 = require(script.Slerp);
local v2 = {};
v2.__index = function(v3, v4) --[[ Line: 87 ]]
    -- upvalues: v2 (copy)
    if v4 == "Visible" then
        return (rawget(v3, "_visible"));
    elseif v4 == "Parent" then
        return (rawget(v3, "_parent"));
    elseif v4 == "Segments" then
        return (rawget(v3, "_segments"));
    elseif v4 == "ControlPoints" then
        return (rawget(v3, "_controlPoints"));
    else
        return v2[v4];
    end;
end;
v2.__newindex = function(v5, v6, v7) --[[ Line: 100 ]]
    if v6 == "Visible" then
        rawset(v5, "_visible", v7);
        if v7 and not v5._curveDrawn then
            v5:_drawCurve();
        end;
        v5.Curve.Parent = v7 and v5._parent or nil;
        return;
    elseif v6 == "Parent" then
        rawset(v5, "_parent", v7);
        v5.Curve.Parent = v5.Visible and v5._parent or nil;
        return;
    elseif v6 == "Segments" then
        rawset(v5, "_segments", v7);
        v5:_update();
        return;
    elseif v6 == "ControlPoints" then
        rawset(v5, "_controlPoints", v7);
        v5:_update();
        return;
    else
        rawset(v5, v6, v7);
        return;
    end;
end;
local function _(v8, v9, v10, v11) --[[ Line: 123 ]] --[[ Name: CatmullRom ]]
    return v9, 0.5 * (v10 - v8), v8 - 2.5 * v9 + 2 * v10 - 0.5 * v11, 1.5 * (v9 - v10) + 0.5 * (v11 - v8);
end;
v2._drawCurve = function(v13) --[[ Line: 129 ]] --[[ Name: _drawCurve ]]
    -- upvalues: l_Color_0 (copy)
    v13.Curve:ClearAllChildren();
    local v14 = #v13._controlPoints;
    v13._curveDrawn = true;
    local v15 = nil;
    for v16 = 0, v13._segments * v14 do
        local v17 = v16 / (v13._segments * v14);
        local l_v13_CFrameFromAlpha_0 = v13:GetCFrameFromAlpha(v17);
        local v19 = 0;
        for v20 = 1, v14 - 1 do
            if v17 <= v13._normalizedDistancePoints[v20] then
                v19 = v20;
                break;
            end;
        end;
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Name = "Point" .. v19;
        l_Part_0.Anchored = true;
        l_Part_0.CanCollide = false;
        l_Part_0.CanTouch = false;
        l_Part_0.CanQuery = false;
        l_Part_0.Color = l_Color_0;
        l_Part_0.Material = Enum.Material.Neon;
        l_Part_0.Size = Vector3.new(0.1, 0.1, v15 and (v15 - l_v13_CFrameFromAlpha_0.Position).Magnitude or 0.1);
        l_Part_0.CFrame = CFrame.new(l_v13_CFrameFromAlpha_0.Position, v15 or l_v13_CFrameFromAlpha_0.Position) * CFrame.new(0, 0, -l_Part_0.Size.Z / 2);
        l_Part_0:SetAttribute("Alpha", v17);
        l_Part_0.Parent = v13.Curve;
        v15 = l_v13_CFrameFromAlpha_0.Position;
    end;
end;
v2._update = function(v22) --[[ Line: 162 ]] --[[ Name: _update ]]
    local v23 = #v22._controlPoints;
    if v22._controlPoints and v23 >= 3 then
        v22._curveLength = 0;
        v22._distancePoints = {};
        v22._normalizedDistancePoints = {};
        v22._curveDrawn = false;
        (function() --[[ Line: 171 ]] --[[ Name: getLengthsPerSegment ]]
            -- upvalues: v23 (copy), v22 (copy)
            for v24 = 1, v23 - 1 do
                local v25 = 0;
                local v26 = nil;
                local v27 = nil;
                local v28 = nil;
                local v29 = nil;
                local _ = nil;
                local _ = nil;
                local _ = nil;
                local _ = nil;
                local v34 = nil;
                local l_Position_0 = v22._controlPoints[v24].Position;
                for v36 = 0, 0.99, 0.01 do
                    v26 = v22._controlPoints[math.max(v24 - 1, 1)];
                    v27 = v22._controlPoints[v24];
                    v28 = v22._controlPoints[math.min(v24 + 1, v23)];
                    v29 = v22._controlPoints[math.min(v24 + 2, v23)];
                    local l_Position_1 = v26.Position;
                    local l_Position_2 = v27.Position;
                    local l_Position_3 = v28.Position;
                    local l_Position_4 = v29.Position;
                    local l_l_Position_2_0 = l_Position_2;
                    local v42 = 0.5 * (l_Position_3 - l_Position_1);
                    local v43 = l_Position_1 - 2.5 * l_Position_2 + 2 * l_Position_3 - 0.5 * l_Position_4;
                    local v44 = 1.5 * (l_Position_2 - l_Position_3) + 0.5 * (l_Position_4 - l_Position_1);
                    v34 = l_l_Position_2_0 + v42 * v36 + v43 * v36 ^ 2 + v44 * v36 ^ 3;
                    v25 = v25 + (v34 - l_Position_0).Magnitude;
                    l_Position_0 = v34;
                end;
                local l_v22_0 = v22;
                l_v22_0._curveLength = l_v22_0._curveLength + v25;
                v22._distancePoints[v24] = v22._curveLength;
            end;
            for v46 = 1, #v22._controlPoints - 1 do
                v22._normalizedDistancePoints[v46] = v22._distancePoints[v46] / v22._curveLength;
            end;
        end)();
        if rawget(v22, "_visible") then
            v22:_drawCurve();
        end;
    end;
end;
v2.GetCFrameFromAlpha = function(v47, v48, v49) --[[ Line: 209 ]] --[[ Name: GetCFrameFromAlpha ]]
    -- upvalues: v1 (copy)
    v49 = v49 or "Track";
    if v48 == 1 then
        return v47._controlPoints[#v47._controlPoints];
    else
        local v50 = #v47._controlPoints - 1;
        local v51, v52 = math.modf(v50 * v48 + 1);
        local v53 = v51 + 1;
        local v54 = v47._controlPoints[math.max(v51 - 1, 1)];
        local v55 = v47._controlPoints[v51];
        local v56 = v47._controlPoints[v53];
        local v57 = v47._controlPoints[math.min(v53 + 1, v50 + 1)];
        local l_Position_5 = v54.Position;
        local l_Position_6 = v55.Position;
        local l_Position_7 = v56.Position;
        local l_Position_8 = v57.Position;
        local l_l_Position_6_0 = l_Position_6;
        local v63 = 0.5 * (l_Position_7 - l_Position_5);
        local v64 = l_Position_5 - 2.5 * l_Position_6 + 2 * l_Position_7 - 0.5 * l_Position_8;
        local v65 = 1.5 * (l_Position_6 - l_Position_7) + 0.5 * (l_Position_8 - l_Position_5);
        l_Position_5 = l_l_Position_6_0 + v63 * v52 + v64 * v52 ^ 2 + v65 * v52 ^ 3;
        if v49 == "Track" then
            l_Position_6 = v63 + 2 * v64 * v52 + 3 * v65 * v52 ^ 2;
            return CFrame.lookAt(l_Position_5, l_Position_5 + l_Position_6);
        else
            l_Position_6 = CFrame.new(l_Position_5);
            l_Position_7 = v52 * v52 * (3 - 2 * v52);
            return l_Position_6 * v1(v55, v56, l_Position_7).Rotation;
        end;
    end;
end;
v2.GetLinearCFrameFromAlpha = function(v66, v67, v68) --[[ Line: 238 ]] --[[ Name: GetLinearCFrameFromAlpha ]]
    -- upvalues: v1 (copy)
    v68 = v68 or "Track";
    local v69 = #v66._controlPoints;
    local v70 = 1;
    for v71 = 1, v69 do
        if v67 <= v66._normalizedDistancePoints[v71] then
            v70 = v71;
            break;
        end;
    end;
    local v72 = v70 - 1;
    local v73 = v66._normalizedDistancePoints[v72] or 0;
    local v74 = v66._normalizedDistancePoints[v70];
    local v75 = (v67 - v73) / (v74 - v73);
    v72 = math.max(v72, 1);
    local v76 = v66._controlPoints[v72];
    local v77 = v66._controlPoints[v70];
    local v78 = v66._controlPoints[math.min(v70 + 1, v69)];
    local v79 = v66._controlPoints[math.min(v70 + 2, v69)];
    local l_Position_9 = v76.Position;
    local l_Position_10 = v77.Position;
    local l_Position_11 = v78.Position;
    local l_Position_12 = v79.Position;
    local l_l_Position_10_0 = l_Position_10;
    local v85 = 0.5 * (l_Position_11 - l_Position_9);
    local v86 = l_Position_9 - 2.5 * l_Position_10 + 2 * l_Position_11 - 0.5 * l_Position_12;
    local v87 = 1.5 * (l_Position_10 - l_Position_11) + 0.5 * (l_Position_12 - l_Position_9);
    l_Position_9 = l_l_Position_10_0 + v85 * v75 + v86 * v75 ^ 2 + v87 * v75 ^ 3;
    if v68 == "Track" then
        l_Position_10 = v85 + 2 * v86 * v75 + 3 * v87 * v75 ^ 2;
        return CFrame.lookAt(l_Position_9, l_Position_9 + l_Position_10);
    else
        l_Position_10 = CFrame.new(l_Position_9);
        l_Position_11 = v75 * v75 * (3 - 2 * v75);
        return l_Position_10 * v1(v77, v78, l_Position_11).Rotation;
    end;
end;
v2.Destroy = function(v88) --[[ Line: 270 ]] --[[ Name: Destroy ]]
    v88._destroying:Fire();
    v88._destroying:Destroy();
    v88.Curve:Destroy();
    for _, v90 in v88._listeners do
        v90:Disconnect();
    end;
    v88._listeners = {};
end;
v2.new = function(v91) --[[ Line: 285 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v92 = setmetatable({}, v2);
    v92._listeners = {};
    v92._visible = false;
    v92._parent = workspace;
    v92._segments = 10;
    v92._controlPoints = v91;
    v92.Curve = Instance.new("Model");
    v92.Curve.Name = "Curve";
    v92._destroying = Instance.new("BindableEvent");
    v92.Destroying = v92._destroying.Event;
    v92:_update();
    return v92;
end;
return v2;