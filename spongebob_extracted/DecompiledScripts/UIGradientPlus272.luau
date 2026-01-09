local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = {
    UIGradientPlus = {
        colorKeypoints = {
            {
                0, 
                Color3.new(1, 1, 1)
            }, 
            {
                1, 
                Color3.new(1, 1, 1)
            }
        }, 
        transparencyKeypoints = {
            {
                0, 
                0
            }, 
            {
                1, 
                0
            }
        }, 
        scaleValue = 1, 
        offsetValue = 0, 
        looped = false, 
        Rotation = 0, 
        Enabled = true, 
        Name = "UIGradient"
    }, 
    UIGradientPlusAnimation = {
        animationType = "Loop", 
        duration = -1, 
        speed = 1, 
        easingSpeed = 1, 
        easingStyle = Enum.EasingStyle.Linear, 
        easingDirection = Enum.EasingDirection.In
    }, 
    Colors = {
        White = Color3.new(1, 1, 1), 
        Gray = Color3.new(0.5, 0.5, 0.5), 
        Black = Color3.new(0, 0, 0), 
        Red = Color3.new(1, 0, 0), 
        Orange = Color3.new(1, 0.5, 0), 
        Yellow = Color3.new(1, 1, 0), 
        Green = Color3.new(0, 1, 0), 
        Cyan = Color3.new(0, 1, 1), 
        Blue = Color3.new(0, 0, 1), 
        Purple = Color3.new(0.5, 0, 1), 
        Pink = Color3.new(1, 0, 1)
    }
};
local v3 = {};
local v4 = {};
local function _(v5) --[[ Line: 179 ]] --[[ Name: stringToColor ]]
    -- upvalues: v2 (copy)
    return v2.Colors[v5];
end;
local function v10(v7, v8, v9) --[[ Line: 183 ]] --[[ Name: lerpColor ]]
    return v7:Lerp(v8, v9);
end;
local function v14(v11, v12, v13) --[[ Line: 187 ]] --[[ Name: lerpNumber ]]
    return v11 + (v12 - v11) * v13;
end;
local function v28(v15, v16, v17) --[[ Line: 191 ]] --[[ Name: readKeypoints ]]
    -- upvalues: v2 (copy)
    local v18 = {};
    for _, v20 in v15 do
        if type(v20[2]) == "string" then
            local v21 = v20[2];
            v20[2] = v2.Colors[v21];
        end;
        table.insert(v18, {
            Time = v20[1] * v16, 
            Value = v20[2]
        });
    end;
    table.sort(v18, function(v22, v23) --[[ Line: 200 ]]
        return v22.Time < v23.Time;
    end);
    if v17 then
        local v24 = v18[1];
        local v25 = v18[#v18];
        if v24.Time ~= 0 then
            table.insert(v18, 1, {
                Time = v25.Time - v16, 
                Value = v25.Value
            });
        elseif v25.Time == v16 then
            v25.Value = v24.Value;
        end;
        for _, v27 in ipairs(v18) do
            if v27.Time < 1 then
                if v27.Time + v16 > v25.Time then
                    table.insert(v18, {
                        Time = v27.Time + v16, 
                        Value = v27.Value
                    });
                end;
            else
                table.insert(v18, {
                    Time = v27.Time + v16, 
                    Value = v27.Value
                });
                return v18;
            end;
        end;
    end;
    return v18;
end;
local function v40(v29, v30, v31, v32) --[[ Line: 229 ]] --[[ Name: processKeypoints ]]
    local v33 = {};
    local v34 = v30 + 1;
    for v35, v36 in ipairs(v29) do
        local l_Time_0 = v36.Time;
        local l_Value_0 = v36.Value;
        local v39 = v29[v35 - 1];
        if v39 and v39.Time < v30 and v30 < l_Time_0 then
            table.insert(v33, v32(0, v31(v39.Value, l_Value_0, (v30 - v39.Time) / (l_Time_0 - v39.Time))));
        end;
        if v30 <= l_Time_0 and l_Time_0 <= v34 then
            table.insert(v33, v32(l_Time_0 - v30, l_Value_0));
        end;
        if v39 and v39.Time < v34 and v34 < l_Time_0 then
            table.insert(v33, v32(1, v31(v39.Value, l_Value_0, (v34 - v39.Time) / (l_Time_0 - v39.Time))));
            return v33;
        end;
    end;
    return v33;
end;
v4.new = function(v41, v42) --[[ Line: 256 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v28 (copy), v4 (copy), v3 (copy)
    for v43, v44 in v2.UIGradientPlus do
        v41[v43] = v41[v43] or v44;
    end;
    local v45 = {
        UIGradient = Instance.new("UIGradient"), 
        offsetValue = v41.offsetValue, 
        scaleValue = v41.scaleValue, 
        _lastOffsetValue = v41.offsetValue - 1, 
        looped = v41.looped, 
        colorKeypoints = v28(v41.colorKeypoints, v41.scaleValue, v41.looped), 
        transparencyKeypoints = v28(v41.transparencyKeypoints, v41.scaleValue, v41.looped), 
        activeAnimations = {}, 
        removingAnimations = {}
    };
    for v46, v47 in v41 do
        if pcall(function() --[[ Line: 279 ]]
            -- upvalues: v45 (copy), v46 (copy)
            local _ = v45.UIGradient[v46];
        end) then
            v45.UIGradient[v46] = v47;
        end;
    end;
    v45.UIGradient.Parent = v42;
    local v54 = setmetatable({}, {
        __index = function(_, v50) --[[ Line: 286 ]] --[[ Name: __index ]]
            -- upvalues: v4 (ref), v45 (copy)
            return v4[v50] or v45[v50] or v45.UIGradient[v50];
        end, 
        __newindex = function(_, v52, v53) --[[ Line: 289 ]] --[[ Name: __newindex ]]
            -- upvalues: v45 (copy), v2 (ref)
            if v45[v52] ~= nil then
                v45[v52] = v53;
                return;
            else
                if v2.UIGradientPlus[v52] then
                    v45.UIGradient[v52] = v53;
                    if v52 == "offsetValue" then
                        v45._lastOffsetValue = v53 - 1;
                        return;
                    end;
                else
                    rawset(v45, v52, v53);
                end;
                return;
            end;
        end, 
        __type = "UIGradientPlus"
    });
    v3[v54] = true;
    return v54;
end;
v4.UpdateGradient = function(v55, v56) --[[ Line: 308 ]] --[[ Name: UpdateGradient ]]
    -- upvalues: v4 (copy), l_TweenService_0 (copy), v40 (copy), v10 (copy), v14 (copy)
    for v57, v58 in v55.activeAnimations do
        if v58 then
            if v57.progress >= 1 then
                if v55.removingAnimations[v57] then
                    v55.activeAnimations[v57] = nil;
                    v55.removingAnimations[v57] = nil;
                    continue;
                else
                    v57.progress = v57.progress % 1;
                end;
            end;
            v4[v57.animationType](v55, v57);
            v57.progress = v57.progress + v57.speed * v56;
            v57.alpha = (math.floor(v57.progress * v57.easingTimes) + l_TweenService_0:GetValue(v57.progress * v57.easingTimes % 1, v57.easingStyle, v57.easingDirection)) * v57.easingSpeed;
        end;
    end;
    if v55._lastOffsetValue ~= v55.offsetValue then
        local v59 = v40(v55.colorKeypoints, v55.offsetValue, v10, ColorSequenceKeypoint.new);
        local v60 = v40(v55.transparencyKeypoints, v55.offsetValue, v14, NumberSequenceKeypoint.new);
        v55.UIGradient.Color = ColorSequence.new(v59);
        v55.UIGradient.Transparency = NumberSequence.new(v60);
        v55._lastOffsetValue = v55.offsetValue;
    end;
end;
v4.SetColorKeypoints = function(v61, v62) --[[ Line: 338 ]] --[[ Name: SetColorKeypoints ]]
    -- upvalues: v28 (copy)
    v61.colorKeypoints = v28(v62, v61.scaleValue, v61.looped);
    v61._lastOffsetValue = v61.offsetValue - 1;
    return v61;
end;
v4.SetTransparencyKeypoints = function(v63, v64) --[[ Line: 345 ]] --[[ Name: SetTransparencyKeypoints ]]
    -- upvalues: v28 (copy)
    v63.transparencyKeypoints = v28(v64, v63.scaleValue, v63.looped);
    v63._lastOffsetValue = v63.offsetValue - 1;
    return v63;
end;
v4.Loop = function(v65, v66) --[[ Line: 352 ]] --[[ Name: Loop ]]
    v65.offsetValue = (v66.startOffset + v66.alpha * v65.scaleValue) % v65.scaleValue;
end;
v4.Rotate = function(v67, v68) --[[ Line: 356 ]] --[[ Name: Rotate ]]
    v67.Rotation = (v68.startRotation + v68.alpha * 360) % 360;
end;
v4.ApplyAnimation = function(v69, v70, v71) --[[ Line: 360 ]] --[[ Name: ApplyAnimation ]]
    -- upvalues: v2 (copy)
    if not v71 then
        for v72, v73 in v2.UIGradientPlusAnimation do
            v70[v72] = v70[v72] or v73;
        end;
        v71 = {
            animationType = v70.animationType, 
            speed = v70.speed, 
            duration = v70.duration, 
            easingSpeed = v70.easingSpeed, 
            easingTimes = 1 / v70.easingSpeed, 
            easingStyle = v70.easingStyle, 
            easingDirection = v70.easingDirection, 
            startOffset = v69.offsetValue, 
            startRotation = v69.Rotation, 
            progress = 0, 
            alpha = 0
        };
    end;
    v69.activeAnimations[v71] = true;
    if v71.duration > 0 then
        task.delay(v71.duration, function() --[[ Line: 388 ]]
            -- upvalues: v69 (copy), v71 (ref)
            v69.activeAnimations[v71] = nil;
        end);
    end;
    return table.clone(v71);
end;
v4.PauseAnimation = function(v74, v75) --[[ Line: 396 ]] --[[ Name: PauseAnimation ]]
    v74.activeAnimations[v75] = false;
    return v74;
end;
v4.ResumeAnimation = function(v76, v77) --[[ Line: 402 ]] --[[ Name: ResumeAnimation ]]
    v76.activeAnimations[v77] = true;
    return v76;
end;
v4.RemoveAnimation = function(v78, v79, v80) --[[ Line: 408 ]] --[[ Name: RemoveAnimation ]]
    if v80 then
        v78.removingAnimations[v79] = true;
        return v78;
    else
        v78.activeAnimations[v79] = nil;
        v78.removingAnimation[v79] = nil;
        return v78;
    end;
end;
v4.Destroy = function(v81) --[[ Line: 419 ]] --[[ Name: Destroy ]]
    -- upvalues: v3 (copy)
    v3[v81] = nil;
    v81.UIGradient:Destroy();
    table.clear(v81);
    setmetatable(v81, nil);
end;
l_RunService_0.PostSimulation:Connect(function(v82) --[[ Line: 435 ]]
    -- upvalues: v3 (copy)
    for v83, _ in v3 do
        v83:UpdateGradient(v82);
    end;
end);
return v4;