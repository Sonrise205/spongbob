local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = {
    EPSILON = 0.001
};
local l_Spring_0 = require(script:WaitForChild("Spring"));
local l_Spline_0 = require(script:WaitForChild("Spline"));
local v5 = l_RunService_0:IsStudio() and "Error" or "Warn";
local v6 = {
    number = true, 
    Vector2 = true, 
    Vector3 = true, 
    UDim2 = true, 
    UDim = true, 
    CFrame = true, 
    Color3 = true
};
local v7 = {
    number = 0, 
    Vector2 = Vector2.zero, 
    Vector3 = Vector3.new(0, 0, 0, 0), 
    UDim2 = UDim2.new(), 
    UDim = UDim.new(), 
    CFrame = CFrame.identity, 
    Color3 = Color3.new()
};
local l_error_0 = error;
local function _(v9) --[[ Line: 183 ]] --[[ Name: error ]]
    -- upvalues: v5 (copy), l_error_0 (copy)
    if v5 == "Warn" then
        warn(v9 .. "\n" .. debug.traceback());
        return;
    else
        l_error_0(v9);
        return;
    end;
end;
local v11 = {};
v11.__index = v11;
v11.new = function(v12) --[[ Line: 215 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy)
    local v13 = setmetatable({}, v11);
    v13._animators = v12 or {};
    v13._callbackQueue = {};
    v13._processingQueue = false;
    return v13;
end;
v11._addAnimator = function(v14, v15) --[[ Line: 225 ]] --[[ Name: _addAnimator ]]
    table.insert(v14._animators, v15);
end;
v11._processCallbackQueue = function(v16) --[[ Line: 229 ]] --[[ Name: _processCallbackQueue ]]
    if not v16._processingQueue then
        v16._processingQueue = true;
        while v16._callbackQueue[1] do
            table.remove(v16._callbackQueue, 1)();
        end;
        v16._processingQueue = false;
    end;
end;
v11._waitForAnimationsCompleted = function(v17) --[[ Line: 241 ]] --[[ Name: _waitForAnimationsCompleted ]]
    for _, v19 in ipairs(v17._animators) do
        if typeof(v19) == "table" then
            while v19:IsAnimating(0.01) do
                task.wait();
            end;
        elseif typeof(v19) == "Instance" then
            while v19.PlaybackState ~= Enum.PlaybackState.Completed do
                v19.Completed:Wait();
            end;
        end;
    end;
end;
v11.AndThen = function(v20, v21) --[[ Line: 255 ]] --[[ Name: AndThen ]]
    task.spawn(function() --[[ Line: 256 ]]
        -- upvalues: v20 (copy), v21 (copy)
        table.insert(v20._callbackQueue, v21);
        v20:_waitForAnimationsCompleted();
        v20:_processCallbackQueue();
    end);
    return v20;
end;
v11.Await = function(v22) --[[ Line: 267 ]] --[[ Name: Await ]]
    local v23 = true;
    local function v24() --[[ Line: 269 ]]
        -- upvalues: v23 (ref)
        v23 = false;
    end;
    table.insert(v22._callbackQueue, v24);
    v22:_waitForAnimationsCompleted();
    task.spawn(v22._processCallbackQueue, v22);
    while v23 do
        task.wait();
    end;
    return v22;
end;
v11.andThen = v11.AndThen;
v11.await = v11.Await;
local v25 = {};
local v26 = {};
local v27 = {};
local v28 = {};
local v29 = {};
local v30 = {};
local v31 = {};
local v32 = 0;
local v33 = nil;
local function v35(v34) --[[ Line: 328 ]] --[[ Name: murderTweenWhenDone ]]
    -- upvalues: v29 (copy)
    if v34.TweenInfo.Time >= 1.0E-7 then
        v34.Completed:Wait();
    end;
    v34:Destroy();
    if v29[v34.Instance] == v34 then
        v29[v34.Instance] = nil;
    end;
end;
local function v41(v36, v37, v38, v39) --[[ Line: 341 ]] --[[ Name: tweenByPivot ]]
    -- upvalues: v5 (copy), l_error_0 (copy), v11 (copy), v2 (copy)
    if not v36 or not v36:IsA("PVInstance") then
        if v5 == "Warn" then
            warn("Tween by pivot failure - invalid object passed" .. "\n" .. debug.traceback());
        else
            l_error_0("Tween by pivot failure - invalid object passed");
        end;
        if v39 then
            task.wait(v37.Time);
        end;
        return v11.new();
    else
        local l_Part_0 = Instance.new("Part");
        l_Part_0.CFrame = v36:GetPivot();
        l_Part_0:SetAttribute("ANIMNATION_PIVOT", true);
        l_Part_0:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 353 ]]
            -- upvalues: v36 (copy), l_Part_0 (copy)
            v36:PivotTo(l_Part_0.CFrame);
        end);
        task.delay(v37.Time, function() --[[ Line: 357 ]]
            -- upvalues: l_Part_0 (copy)
            l_Part_0:Destroy();
        end);
        return v2.tween(l_Part_0, v37, v38, v39);
    end;
end;
local function v47(v42, v43, v44, v45) --[[ Line: 364 ]] --[[ Name: tweenByScale ]]
    -- upvalues: v5 (copy), l_error_0 (copy), v11 (copy), v2 (copy)
    if not v42 or not v42:IsA("PVInstance") then
        if v5 == "Warn" then
            warn("Tween by scale failure - invalid object passed" .. "\n" .. debug.traceback());
        else
            l_error_0("Tween by scale failure - invalid object passed");
        end;
        if v45 then
            task.wait(v43.Time);
        end;
        return v11.new();
    else
        local l_NumberValue_0 = Instance.new("NumberValue");
        l_NumberValue_0.Value = v42:GetScale();
        l_NumberValue_0:SetAttribute("ANIMNATION_SCALE", true);
        l_NumberValue_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 376 ]]
            -- upvalues: v42 (copy), l_NumberValue_0 (copy)
            v42:ScaleTo(l_NumberValue_0.Value);
        end);
        task.delay(v43.Time, function() --[[ Line: 380 ]]
            -- upvalues: l_NumberValue_0 (copy)
            l_NumberValue_0:Destroy();
        end);
        v44.Value = v44.Scale;
        v44.Scale = nil;
        return v2.tween(l_NumberValue_0, v43, v44, v45);
    end;
end;
local function v74(v48, v49, v50, v51, v52) --[[ Line: 390 ]] --[[ Name: tweenSequence ]]
    -- upvalues: v5 (copy), l_error_0 (copy), v11 (copy), v30 (copy), v2 (copy)
    local v53 = v48[v49];
    local v54 = typeof(v53);
    local v55 = #v53.Keypoints;
    if v55 ~= #v51.Keypoints then
        if v5 == "Warn" then
            warn("Tween sequence failure - keypoint count mismatch" .. "\n" .. debug.traceback());
        else
            l_error_0("Tween sequence failure - keypoint count mismatch");
        end;
        if v52 then
            task.wait(v50.Time);
        end;
        return v11.new();
    else
        local function v59() --[[ Line: 408 ]] --[[ Name: updateSequence ]]
            -- upvalues: v55 (copy), v30 (ref), v48 (copy), v49 (copy), v54 (copy)
            local v56 = table.create(v55);
            for v57, v58 in pairs(v30[v48][v49]) do
                if v54 == "NumberSequence" then
                    v56[v57] = NumberSequenceKeypoint.new(v58.Time.Value, v58.Value.Value, v58.Envelope.Value);
                else
                    v56[v57] = ColorSequenceKeypoint.new(v58.Time.Value, v58.Value.Value);
                end;
            end;
            if v54 == "NumberSequence" then
                v48[v49] = NumberSequence.new(v56);
                return;
            else
                v48[v49] = ColorSequence.new(v56);
                return;
            end;
        end;
        if not v30[v48] then
            v30[v48] = {};
        end;
        if not v30[v48][v49] then
            v30[v48][v49] = table.create(v55);
            for v60, v61 in pairs(v53.Keypoints) do
                local v62 = nil;
                if v54 == "NumberSequence" then
                    v62 = {
                        Time = Instance.new("NumberValue"), 
                        Value = Instance.new("NumberValue"), 
                        Envelope = Instance.new("NumberValue")
                    };
                    v62.Envelope.Value = v61.Envelope;
                    v62.Envelope:GetPropertyChangedSignal("Value"):Connect(v59);
                elseif v54 == "ColorSequence" then
                    v62 = {
                        Time = Instance.new("NumberValue"), 
                        Value = Instance.new("Color3Value")
                    };
                end;
                v62.Value.Value = v61.Value;
                v62.Time.Value = v61.Time;
                v62.Value:GetPropertyChangedSignal("Value"):Connect(v59);
                v62.Time:GetPropertyChangedSignal("Value"):Connect(v59);
                v30[v48][v49][v60] = v62;
            end;
        end;
        for v63, _ in pairs(v53.Keypoints) do
            local v65 = v30[v48][v49][v63];
            local v66 = v63 == v55;
            local v67 = v66 and v52;
            if v54 == "NumberSequence" then
                v2.tween(v65.Envelope, v50, {
                    Value = v51.Keypoints[v63].Envelope
                });
            end;
            v2.tween(v65.Value, v50, {
                Value = v51.Keypoints[v63].Value
            });
            local v73 = v2.tween(v65.Time, v50, {
                Value = v51.Keypoints[v63].Time
            }, v67):AndThen(function() --[[ Line: 473 ]]
                -- upvalues: v63 (copy), v55 (copy), v30 (ref), v48 (copy), v49 (copy), v54 (copy), v51 (copy)
                if v63 == v55 then
                    for _, v69 in pairs(v30[v48][v49]) do
                        v69.Value:Destroy();
                        v69.Time:Destroy();
                        if v54 == "NumberSequence" then
                            v69.Envelope:Destroy();
                        end;
                    end;
                    v30[v48][v49] = nil;
                    local v70 = 0;
                    for _, _ in pairs(v30[v48]) do
                        v70 = v70 + 1;
                        break;
                    end;
                    if v70 == 0 then
                        v30[v48] = nil;
                    end;
                    v48[v49] = v51;
                end;
            end);
            if v66 then
                return v73;
            end;
        end;
        return;
    end;
end;
local function v76(v75) --[[ Line: 504 ]] --[[ Name: createTweenInfoFromTable ]]
    return TweenInfo.new(v75.Time or v75.t or 1, v75.EasingStyle or v75.Style or v75.s or Enum.EasingStyle.Quad, v75.EasingDirection or v75.Direction or v75.d or Enum.EasingDirection.Out, v75.RepeatCount or v75.Repeat or v75.rc or 0, v75.Reverses or v75.Reverse or v75.r or false, v75.DelayTime or v75.Delay or v75.dt or 0);
end;
local function v81(v77) --[[ Line: 515 ]] --[[ Name: createSpringFromInfo ]]
    -- upvalues: l_Spring_0 (copy)
    local v78 = l_Spring_0.new(v77.Initial or v77.i, v77.Clock);
    for v79, v80 in pairs(v77) do
        if v79 ~= "Initial" and v79 ~= "i" and v79 ~= "Clock" then
            v78[v79] = v80;
        end;
    end;
    return v78;
end;
local function v86(v82, v83) --[[ Line: 525 ]] --[[ Name: updateSpringFromInfo ]]
    for v84, v85 in pairs(v83) do
        if v84 ~= "Initial" and v84 ~= "i" and v84 ~= "Clock" and v84 ~= "Position" then
            v82[v84] = v85;
        end;
    end;
end;
local function v101(v87, v88, v89) --[[ Line: 533 ]] --[[ Name: animate ]]
    -- upvalues: v27 (copy)
    local v90, v91 = v87:IsAnimating();
    if v88:IsA("PVInstance") and v89 == "CFrame" then
        while v90 do
            v88:PivotTo(v91);
            task.wait();
            local v92, v93 = v87:IsAnimating();
            v90 = v92;
            v91 = v93;
        end;
        v88:PivotTo(v87.Target);
    elseif v88:IsA("Model") and v89 == "Scale" then
        while v90 do
            v88:ScaleTo(v91);
            task.wait();
            local v94, v95 = v87:IsAnimating();
            v90 = v94;
            v91 = v95;
        end;
        v88:ScaleTo(v87.Target);
    else
        while v90 do
            v88[v89] = v91;
            task.wait();
            local v96, v97 = v87:IsAnimating();
            v90 = v96;
            v91 = v97;
        end;
        v88[v89] = v87.Target;
    end;
    if v27[v88] then
        v27[v88][v89] = nil;
        local v98 = false;
        for _, _ in pairs(v27[v88]) do
            v98 = true;
            break;
        end;
        if not v98 then
            v27[v88] = nil;
        end;
    end;
end;
local _ = function() --[[ Line: 572 ]] --[[ Name: springBindLoop ]]
    -- upvalues: v33 (ref), l_RunService_0 (copy), v28 (copy), v7 (copy)
    if not v33 then
        v33 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 574 ]]
            -- upvalues: v28 (ref), v7 (ref), v33 (ref)
            local v102 = false;
            for _, v104 in pairs(v28) do
                v102 = true;
                local v105 = v104[1];
                local v106 = v104[2];
                local v107 = v104[3];
                local v108 = #v105;
                local v109 = table.create(v108);
                local v110 = table.create(v108);
                local v111 = true;
                for v112, v113 in pairs(v105) do
                    local v114, v115 = v113:IsAnimating();
                    if v114 then
                        v109[v112] = v115;
                        v110[v112] = v113.Velocity;
                        v111 = false;
                    else
                        v109[v112] = v113.Target;
                        v110[v112] = v7[v113.Type];
                    end;
                end;
                if not v111 or not v107 then
                    v106(v109, v110);
                end;
                v104[3] = v111;
            end;
            if not v102 then
                v33:Disconnect();
                v33 = nil;
            end;
        end);
    end;
end;
local function v121(v117, v118, v119) --[[ Line: 609 ]] --[[ Name: lerp ]]
    local v120 = typeof(v118);
    if v120 == "Color3" or v120 == "UDim2" or v120 == "CFrame" then
        return v117:Lerp(v118, v119);
    elseif v120 == "UDim" then
        return UDim.new(v117.Scale + (v118.Scale - v117.Scale) * v119, v117.Offset + (v118.Offset - v117.Offset) * v119);
    else
        return v117 + (v118 - v117) * v119;
    end;
end;
v2.tween = function(v122, v123, v124, v125) --[[ Line: 631 ]] --[[ Name: tween ]]
    -- upvalues: v5 (copy), l_error_0 (copy), v11 (copy), v76 (copy), v41 (copy), v47 (copy), v74 (copy), l_TweenService_0 (copy), v29 (copy), v31 (copy), v35 (copy)
    if not v122 then
        if v5 == "Warn" then
            warn("Tween failure - invalid object passed" .. "\n" .. debug.traceback());
        else
            l_error_0("Tween failure - invalid object passed");
        end;
        if v125 then
            task.wait(v123.Time);
        end;
        return v11.new();
    else
        local v126 = nil;
        if typeof(v123) == "table" then
            v126 = v123._skipControlReset;
            v123 = v76(v123);
        end;
        local v127 = nil;
        local v128 = 0;
        local v129 = v122:IsA("PVInstance");
        local v130 = v122:IsA("Model");
        local l_v122_Attribute_0 = v122:GetAttribute("ANIMNATION_PIVOT");
        local l_v122_Attribute_1 = v122:GetAttribute("ANIMNATION_SCALE");
        for v133, v134 in pairs(v124) do
            if v129 and not l_v122_Attribute_0 and v133 == "CFrame" then
                v127 = v41(v122, v123, {
                    CFrame = v134
                });
                v124[v133] = nil;
            elseif v130 and not l_v122_Attribute_1 and v133 == "Scale" then
                v127 = v47(v122, v123, {
                    Scale = v134
                });
                v124[v133] = nil;
            else
                local v135 = typeof(v122[v133]);
                if v135 == "ColorSequence" or v135 == "NumberSequence" then
                    v127 = v74(v122, v133, v123, v134);
                    v124[v133] = nil;
                else
                    v128 = v128 + 1;
                end;
            end;
        end;
        if v128 == 0 then
            if v125 then
                task.wait(v123.Time);
            end;
            return v127 or v11.new();
        else
            local v136 = l_TweenService_0:Create(v122, v123, v124);
            local v137 = v11.new({
                v136
            });
            v136:Play();
            v29[v122] = v136;
            if not v126 then
                v31[v122] = nil;
            end;
            if v125 then
                if v136.TweenInfo.Time >= 1.0E-7 then
                    v136.Completed:Wait();
                end;
                v136:Destroy();
                if v29[v136.Instance] == v136 then
                    v29[v136.Instance] = nil;
                    return v137;
                end;
            else
                task.spawn(v35, v136);
            end;
            return v137;
        end;
    end;
end;
v2.tweenFromAlpha = function(v138, v139, v140, v141, v142) --[[ Line: 711 ]] --[[ Name: tweenFromAlpha ]]
    -- upvalues: v5 (copy), l_error_0 (copy), v11 (copy), v76 (copy), v32 (ref), v31 (copy), l_TweenService_0 (copy), v121 (copy), v2 (copy)
    if typeof(v141) ~= "number" then
        if v5 == "Warn" then
            warn("Tween failure - alpha must be a number" .. "\n" .. debug.traceback());
        else
            l_error_0("Tween failure - alpha must be a number");
        end;
        return v11.new();
    elseif not v138 then
        if v5 == "Warn" then
            warn("Tween failure - invalid object passed" .. "\n" .. debug.traceback());
        else
            l_error_0("Tween failure - invalid object passed");
        end;
        if v142 then
            task.wait(v139.Time * (1 - v141));
        end;
        return v11.new();
    else
        v141 = math.clamp(v141, 0, 1);
        if typeof(v139) == "table" then
            v139 = v76(v139);
        end;
        local v143 = v32 + 1;
        v32 = v143;
        if not v31[v138] then
            v31[v138] = {};
        end;
        local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v141, v139.EasingStyle, v139.EasingDirection);
        local v145 = {};
        local v146 = {};
        local v147 = v138:IsA("PVInstance");
        local v148 = v138:IsA("Model");
        for v149, v150 in pairs(v140) do
            v146[v149] = if v147 and v149 == "CFrame" then v138:GetPivot() else v138[v149];
            v145[v149] = v121(v146[v149], v150, l_l_TweenService_0_Value_0);
            v31[v138][v149] = v143;
        end;
        v2.tween(v138, {
            t = 0, 
            _skipControlReset = true
        }, v145, true);
        local function v166() --[[ Line: 760 ]] --[[ Name: performTween ]]
            -- upvalues: v141 (ref), v139 (ref), v31 (ref), v138 (copy), l_TweenService_0 (ref), v143 (copy), v121 (ref), v146 (copy), v140 (copy), v147 (copy), v148 (copy)
            local v151 = 1 - v141;
            local v152 = v139.Time * v151;
            local v153 = os.clock() + v152;
            while os.clock() < v153 do
                local v154 = false;
                if v31[v138] then
                    local v155 = 1 - (v153 - os.clock()) / v152;
                    local l_l_TweenService_0_Value_1 = l_TweenService_0:GetValue(v141 + v151 * v155, v139.EasingStyle, v139.EasingDirection);
                    for v157, v158 in pairs(v31[v138]) do
                        if v158 == v143 then
                            local v159 = v121(v146[v157], v140[v157], l_l_TweenService_0_Value_1);
                            if v147 and v157 == "CFrame" then
                                v138:PivotTo(v159);
                            elseif v148 and v157 == "Scale" then
                                v138:ScaleTo(v159);
                            else
                                v138[v157] = v159;
                            end;
                            v154 = true;
                        end;
                    end;
                end;
                task.wait();
                if not v154 then
                    break;
                end;
            end;
            if v31[v138] then
                for v160, v161 in pairs(v31[v138]) do
                    if v161 == v143 then
                        if v147 and v160 == "CFrame" then
                            v138:PivotTo(v140[v160]);
                        elseif v148 and v160 == "Scale" then
                            v138:ScaleTo(v140[v160]);
                        else
                            v138[v160] = v140[v160];
                        end;
                    end;
                end;
            end;
            if v31[v138] then
                for v162, v163 in pairs(v31[v138]) do
                    if v163 == v143 then
                        v31[v138][v162] = nil;
                    end;
                end;
                for _, _ in v31[v138] do
                    return;
                end;
                v31[v138] = nil;
            end;
        end;
        if v142 then
            v166();
        else
            task.spawn(v166);
        end;
        return;
    end;
end;
v2.getTweenFromInstance = function(v167) --[[ Line: 837 ]] --[[ Name: getTweenFromInstance ]]
    -- upvalues: v29 (copy)
    return v29[v167];
end;
v2.lerp = function(v168, v169, v170, v171) --[[ Line: 848 ]] --[[ Name: lerp ]]
    -- upvalues: v5 (copy), l_error_0 (copy), v76 (copy), l_TweenService_0 (copy), v121 (copy), v2 (copy)
    if typeof(v171) ~= "number" then
        if v5 == "Warn" then
            warn("Lerp failure - alpha must be a number" .. "\n" .. debug.traceback());
            return;
        else
            l_error_0("Lerp failure - alpha must be a number");
            return;
        end;
    elseif not v168 then
        if v5 == "Warn" then
            warn("Lerp failure - invalid object passed" .. "\n" .. debug.traceback());
            return;
        else
            l_error_0("Lerp failure - invalid object passed");
            return;
        end;
    else
        v171 = math.clamp(v171, 0, 1);
        if typeof(v169) == "table" then
            v169 = v76(v169);
        end;
        local l_l_TweenService_0_Value_2 = l_TweenService_0:GetValue(v171, v169.EasingStyle, v169.EasingDirection);
        local v173 = {};
        for v174, v175 in pairs(v170) do
            local v176 = if v168:IsA("PVInstance") and typeof(v175) == "CFrame" then v168:GetPivot() else v168[v174];
            v173[v174] = v121(v176, v175, l_l_TweenService_0_Value_2);
        end;
        v2.tween(v168, TweenInfo.new(0), v173, true);
        return;
    end;
end;
v2.impulse = function(v177, v178, v179, v180) --[[ Line: 886 ]] --[[ Name: impulse ]]
    -- upvalues: v5 (copy), l_error_0 (copy), v11 (copy), v6 (copy), v27 (copy), v81 (copy), v86 (copy), v101 (copy)
    if not v177 then
        if v5 == "Warn" then
            warn("Spring failure - invalid object passed" .. "\n" .. debug.traceback());
        else
            l_error_0("Spring failure - invalid object passed");
        end;
        return v11.new();
    else
        local v181 = nil;
        local v182 = 0;
        local v183 = v177:IsA("PVInstance");
        local v184 = v177:IsA("Model");
        for v185, v186 in pairs(v179) do
            local v187 = typeof(v186);
            if v6[v187] then
                local v188 = true;
                if v183 and v185 == "CFrame" then
                    v178.Initial = v177:GetPivot();
                elseif v184 and v185 == "Scale" then
                    v178.Initial = v177:GetScale();
                else
                    v178.Initial = v177[v185];
                end;
                if not v27[v177] then
                    v27[v177] = {};
                end;
                if not v27[v177][v185] then
                    v27[v177][v185] = v81(v178);
                else
                    v86(v27[v177][v185], v178);
                    v188 = false;
                end;
                v178.Initial = nil;
                local v189 = v27[v177][v185];
                if not v181 then
                    v181 = v11.new({
                        v189
                    });
                else
                    v181:_addAnimator(v189);
                end;
                v189:Impulse(v186);
                if v188 then
                    if v180 and v181 then
                        v182 = v182 + 1;
                        task.spawn(function() --[[ Line: 941 ]]
                            -- upvalues: v101 (ref), v189 (copy), v177 (copy), v185 (copy), v182 (ref)
                            v101(v189, v177, v185);
                            v182 = v182 - 1;
                        end);
                    else
                        task.spawn(v101, v189, v177, v185);
                    end;
                end;
            else
                local v190 = string.format("Spring failure - invalid impulse type '%s' for property '%s'", v187, v185);
                if v5 == "Warn" then
                    warn(v190 .. "\n" .. debug.traceback());
                else
                    l_error_0(v190);
                end;
            end;
        end;
        while v182 > 0 do
            task.wait();
        end;
        return v181;
    end;
end;
v2.target = function(v191, v192, v193, v194) --[[ Line: 968 ]] --[[ Name: target ]]
    -- upvalues: v11 (copy), v7 (copy), v5 (copy), l_error_0 (copy), v2 (copy)
    local v195 = 0;
    local v196 = v11.new();
    for v197, v198 in pairs(v193) do
        local v199 = v7[typeof(v198)];
        if not v199 then
            local v200 = "Spring failure - unsupported target type '" .. typeof(v198) .. "' passed";
            if v5 == "Warn" then
                warn(v200 .. "\n" .. debug.traceback());
            else
                l_error_0(v200);
            end;
        else
            v192.Target = v198;
            v195 = v195 + 1;
            v196:_addAnimator(v2.impulse(v191, v192, {
                [v197] = v199
            }):AndThen(function() --[[ Line: 987 ]]
                -- upvalues: v195 (ref)
                v195 = v195 - 1;
            end)._animators[1]);
            v192.Target = nil;
        end;
    end;
    if v194 then
        while v195 > 0 do
            task.wait();
        end;
    end;
    return v196;
end;
v2.bind = function(v201, v202, v203) --[[ Line: 1008 ]] --[[ Name: bind ]]
    -- upvalues: v28 (copy), v33 (ref), l_RunService_0 (copy), v7 (copy)
    v28[v202] = {
        v201, 
        v203, 
        false
    };
    if not v33 then
        v33 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 574 ]]
            -- upvalues: v28 (ref), v7 (ref), v33 (ref)
            local v204 = false;
            for _, v206 in pairs(v28) do
                v204 = true;
                local v207 = v206[1];
                local v208 = v206[2];
                local v209 = v206[3];
                local v210 = #v207;
                local v211 = table.create(v210);
                local v212 = table.create(v210);
                local v213 = true;
                for v214, v215 in pairs(v207) do
                    local v216, v217 = v215:IsAnimating();
                    if v216 then
                        v211[v214] = v217;
                        v212[v214] = v215.Velocity;
                        v213 = false;
                    else
                        v211[v214] = v215.Target;
                        v212[v214] = v7[v215.Type];
                    end;
                end;
                if not v213 or not v209 then
                    v208(v211, v212);
                end;
                v206[3] = v213;
            end;
            if not v204 then
                v33:Disconnect();
                v33 = nil;
            end;
        end);
    end;
end;
v2.unbind = function(v218) --[[ Line: 1018 ]] --[[ Name: unbind ]]
    -- upvalues: v28 (copy)
    v28[v218] = nil;
end;
v2.createSpring = function(v219, v220) --[[ Line: 1025 ]] --[[ Name: createSpring ]]
    -- upvalues: v81 (copy), v26 (copy)
    local v221 = v81(v219);
    if v220 then
        v26[v220] = v221;
    end;
    return v221;
end;
v2.getSpring = function(v222) --[[ Line: 1035 ]] --[[ Name: getSpring ]]
    -- upvalues: v26 (copy), v5 (copy), l_error_0 (copy)
    if v26[v222] then
        return v26[v222];
    else
        local v223 = string.format("Spring '%s' does not exist", v222);
        if v5 == "Warn" then
            warn(v223 .. "\n" .. debug.traceback());
            return;
        else
            l_error_0(v223);
            return;
        end;
    end;
end;
v2.createSpline = function(v224, v225) --[[ Line: 1046 ]] --[[ Name: createSpline ]]
    -- upvalues: l_Spline_0 (copy), v25 (copy)
    local v226 = l_Spline_0.new(v224);
    if v225 then
        v25[v225] = v226;
    end;
    return v226;
end;
v2.getSpline = function(v227) --[[ Line: 1056 ]] --[[ Name: getSpline ]]
    -- upvalues: v25 (copy), v5 (copy), l_error_0 (copy)
    if v25[v227] then
        return v25[v227];
    else
        local v228 = string.format("Spline '%s' does not exist", v227);
        if v5 == "Warn" then
            warn(v228 .. "\n" .. debug.traceback());
            return;
        else
            l_error_0(v228);
            return;
        end;
    end;
end;
v2.slerpTweenFromAlpha = function(v229, v230, v231, v232, v233, v234) --[[ Line: 1075 ]] --[[ Name: slerpTweenFromAlpha ]]
    -- upvalues: v5 (copy), l_error_0 (copy), v11 (copy), l_Spline_0 (copy), v76 (copy), v32 (ref), v31 (copy), l_TweenService_0 (copy), v121 (copy), v2 (copy)
    v233 = v233 or 0;
    v232 = v232 or "Nodes";
    if typeof(v233) ~= "number" then
        if v5 == "Warn" then
            warn("Slerp tween failure - alpha must be a number" .. "\n" .. debug.traceback());
        else
            l_error_0("Slerp tween failure - alpha must be a number");
        end;
        return v11.new();
    elseif typeof(v231) ~= "table" then
        if v5 == "Warn" then
            warn("Slerp tween failure - spline must be a table" .. "\n" .. debug.traceback());
        else
            l_error_0("Slerp tween failure - spline must be a table");
        end;
        return v11.new();
    elseif v232 ~= "Track" and v232 ~= "Nodes" then
        if v5 == "Warn" then
            warn("Slerp tween failure - alignment must be 'Track' or 'Nodes'" .. "\n" .. debug.traceback());
        else
            l_error_0("Slerp tween failure - alignment must be 'Track' or 'Nodes'");
        end;
        return v11.new();
    elseif not v229 then
        if v5 == "Warn" then
            warn("Slerp tween failure - invalid object passed" .. "\n" .. debug.traceback());
        else
            l_error_0("Slerp tween failure - invalid object passed");
        end;
        if v234 then
            task.wait(v230.Time * (1 - v233));
        end;
        return v11.new();
    else
        if v231[1] then
            v231 = l_Spline_0.new(v231);
        end;
        v233 = math.clamp(v233, 0, 1);
        if typeof(v230) == "table" then
            v230 = v76(v230);
        end;
        local v235 = v32 + 1;
        v32 = v235;
        if not v31[v229] then
            v31[v229] = {};
        end;
        local l_l_TweenService_0_Value_3 = l_TweenService_0:GetValue(v233, v230.EasingStyle, v230.EasingDirection);
        local v237 = {};
        local v238 = {
            CFrame = v231:GetLinearCFrameFromAlpha(0, v232)
        };
        local v239 = {
            CFrame = v231:GetLinearCFrameAtAlpha(1, v232)
        };
        local v240 = v229:IsA("PVInstance");
        local v241 = v229:IsA("Model");
        for v242, v243 in pairs(v239) do
            v238[v242] = if v229:IsA("PVInstance") and typeof(v243) == "CFrame" then v229:GetPivot() else v229[v242];
            v237[v242] = v121(v238[v242], v243, l_l_TweenService_0_Value_3);
            v31[v229][v242] = v235;
        end;
        v2.tween(v229, {
            t = 0, 
            _skipControlReset = true
        }, v237, true);
        local function v259() --[[ Line: 1139 ]] --[[ Name: performTween ]]
            -- upvalues: v233 (ref), v230 (ref), v31 (ref), v229 (copy), l_TweenService_0 (ref), v235 (copy), v231 (ref), v232 (ref), v240 (copy), v241 (copy), v239 (copy)
            local v244 = 1 - v233;
            local v245 = v230.Time * v244;
            local v246 = os.clock() + v245;
            while os.clock() < v246 do
                local v247 = false;
                if v31[v229] then
                    local v248 = 1 - (v246 - os.clock()) / v245;
                    local l_l_TweenService_0_Value_4 = l_TweenService_0:GetValue(v233 + v244 * v248, v230.EasingStyle, v230.EasingDirection);
                    for v250, v251 in pairs(v31[v229]) do
                        if v251 == v235 then
                            local l_v231_CFrameFromAlpha_0 = v231:GetCFrameFromAlpha(l_l_TweenService_0_Value_4, v232);
                            if v240 and v250 == "CFrame" then
                                v229:PivotTo(l_v231_CFrameFromAlpha_0);
                            elseif v241 and v250 == "Scale" then
                                v229:ScaleTo(l_v231_CFrameFromAlpha_0);
                            else
                                v229[v250] = l_v231_CFrameFromAlpha_0;
                            end;
                            v247 = true;
                        end;
                    end;
                end;
                task.wait();
                if not v247 then
                    break;
                end;
            end;
            if v31[v229] then
                for v253, v254 in pairs(v31[v229]) do
                    if v254 == v235 then
                        if v240 and v253 == "CFrame" then
                            v229:PivotTo(v239[v253]);
                        elseif v241 and v253 == "Scale" then
                            v229:ScaleTo(v239[v253]);
                        else
                            v229[v253] = v239[v253];
                        end;
                    end;
                end;
            end;
            if v31[v229] then
                for v255, v256 in pairs(v31[v229]) do
                    if v256 == v235 then
                        v31[v229][v255] = nil;
                    end;
                end;
                for _, _ in v31[v229] do
                    return;
                end;
                v31[v229] = nil;
            end;
        end;
        if v234 then
            v259();
        else
            task.spawn(v259);
        end;
        return;
    end;
end;
v2.inquire = v2.getSpring;
v2.register = v2.createSpring;
return v2;