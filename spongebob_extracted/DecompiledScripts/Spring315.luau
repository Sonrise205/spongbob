local v0 = {};
local v1 = {
    number = 0, 
    Vector2 = Vector2.zero, 
    Vector3 = Vector3.new(0, 0, 0, 0), 
    UDim2 = UDim2.new(), 
    UDim = UDim.new(), 
    CFrame = CFrame.new(), 
    Color3 = Color3.new()
};
local l_clamp_0 = math.clamp;
local l_cos_0 = math.cos;
local l_sin_0 = math.sin;
local l_abs_0 = math.abs;
local l_new_0 = UDim2.new;
local l_new_1 = UDim.new;
local l_new_2 = Color3.new;
local l_new_3 = CFrame.new;
local l_fromOrientation_0 = CFrame.fromOrientation;
local l_ToOrientation_0 = CFrame.identity.ToOrientation;
local l_new_4 = Vector3.new;
local function v22(v13, v14, v15, v16, v17, v18, v19, v20, v21) --[[ Line: 101 ]] --[[ Name: directConversion ]]
    return v13 * v19 + (1 - v13) * v21 + v15 / v18 * v20, -v14 * v19 + v14 * v21 + (v16 - v17) * v20;
end;
local v78 = {
    number = v22, 
    Vector2 = v22, 
    Vector3 = v22, 
    UDim2 = function(v23, v24, v25, v26, v27, v28, v29, v30, v31) --[[ Line: 110 ]]
        -- upvalues: l_new_0 (copy)
        local v32 = 1 - v23;
        local v33 = v25 / v28;
        local v34 = v26 - v27;
        return l_new_0(v23 * v29.X.Scale + v32 * v31.X.Scale + v33 * v30.X.Scale, v23 * v29.X.Offset + v32 * v31.X.Offset + v33 * v30.X.Offset, v23 * v29.Y.Scale + v32 * v31.Y.Scale + v33 * v30.Y.Scale, v23 * v29.Y.Offset + v32 * v31.Y.Offset + v33 * v30.Y.Offset), l_new_0(-v24 * v29.X.Scale + v24 * v31.X.Scale + v34 * v30.X.Scale, -v24 * v29.X.Offset + v24 * v31.X.Offset + v34 * v30.X.Offset, -v24 * v29.Y.Scale + v24 * v31.Y.Scale + v34 * v30.Y.Scale, -v24 * v29.X.Offset + v24 * v31.X.Offset + v34 * v30.X.Offset);
    end, 
    UDim = function(v35, v36, v37, v38, v39, v40, v41, v42, v43) --[[ Line: 126 ]]
        -- upvalues: l_new_1 (copy)
        local v44 = 1 - v35;
        local v45 = v37 / v40;
        local v46 = v38 - v39;
        return l_new_1(v35 * v41.Scale + v44 * v43.Scale + v45 * v42.Scale, v35 * v41.Offset + v44 * v43.Offset + v45 * v42.Offset), l_new_1(-v36 * v41.Scale + v36 * v43.Scale + v46 * v42.Scale, -v36 * v41.Offset + v36 * v43.Offset + v46 * v42.Offset);
    end, 
    CFrame = function(v47, v48, v49, v50, v51, v52, v53, v54, v55) --[[ Line: 138 ]]
        -- upvalues: l_ToOrientation_0 (copy), l_new_4 (copy), l_new_3 (copy), l_fromOrientation_0 (copy)
        local v56 = 1 - v47;
        local v57 = v49 / v52;
        local v58 = v50 - v51;
        local v59 = l_new_4(l_ToOrientation_0(v53));
        local v60 = l_new_4(l_ToOrientation_0(v55));
        local v61 = l_new_4(l_ToOrientation_0(v54));
        local v62 = l_new_3(v47 * v53.Position + v56 * v55.Position + v57 * v54.Position);
        local v63 = v47 * v59 + v56 * v60 + v57 * v61;
        v62 = v62 * l_fromOrientation_0(v63.X, v63.Y, v63.Z);
        local v64 = l_new_3(-v48 * v53.Position + v48 * v55.Position + v58 * v54.Position);
        local v65 = -v48 * v59 + v48 * v60 + v58 * v61;
        return v62, v64 * l_fromOrientation_0(v65.X, v65.Y, v65.Z);
    end, 
    Color3 = function(v66, v67, v68, v69, v70, v71, v72, v73, v74) --[[ Line: 157 ]]
        -- upvalues: l_new_2 (copy), l_clamp_0 (copy)
        local v75 = 1 - v66;
        local v76 = v68 / v71;
        local v77 = v69 - v70;
        return l_new_2(l_clamp_0(v66 * v72.R + v75 * v74.R + v76 * v73.R, 0, 1), l_clamp_0(v66 * v72.G + v75 * v74.G + v76 * v73.G, 0, 1), (l_clamp_0(v66 * v72.B + v75 * v74.B + v76 * v73.B, 0, 1))), l_new_2(l_clamp_0(-v67 * v72.R + v67 * v74.R + v77 * v73.R, 0, 1), l_clamp_0(-v67 * v72.G + v67 * v74.G + v77 * v73.G, 0, 1), (l_clamp_0(-v67 * v72.B + v67 * v74.B + v77 * v73.B, 0, 1)));
    end
};
local function v81(v79, v80) --[[ Line: 173 ]] --[[ Name: directVelocity ]]
    v79.Velocity = v79.Velocity + v80;
end;
local v86 = {
    number = v81, 
    Vector2 = v81, 
    Vector3 = v81, 
    UDim2 = v81, 
    UDim = v81, 
    CFrame = function(v82, v83) --[[ Line: 183 ]]
        v82.Velocity = v82.Velocity * v83;
    end, 
    Color3 = function(v84, v85) --[[ Line: 186 ]]
        -- upvalues: l_new_2 (copy)
        v84.Velocity = l_new_2(v84.Velocity.R + v85.R, v84.Velocity.G + v85.G, v84.Velocity.B + v85.B);
    end
};
v0.new = function(v87, v88) --[[ Line: 197 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v89 = v87 or 0;
    v88 = v88 or os.clock;
    return (setmetatable({
        _clock = v88, 
        _time0 = v88(), 
        _position0 = v89, 
        _velocity0 = v1[typeof(v89)], 
        _target = v89, 
        _damper = 1, 
        _speed = 1, 
        _type = typeof(v89), 
        _updating = false, 
        _callbacks = {}, 
        _isBound = false
    }, v0));
end;
v0.Impulse = function(v90, v91) --[[ Line: 217 ]] --[[ Name: Impulse ]]
    -- upvalues: v86 (copy)
    v86[v90.Type](v90, v91);
    v90:_updateCallbacks();
end;
v0.TimeSkip = function(v92, v93) --[[ Line: 224 ]] --[[ Name: TimeSkip ]]
    local v94 = v92._clock();
    local v95, v96 = v92:_positionVelocity(v94 + v93);
    v92._position0 = v95;
    v92._velocity0 = v96;
    v92._time0 = v94;
end;
v0.Bind = function(v97, v98, v99) --[[ Line: 235 ]] --[[ Name: Bind ]]
    if v97._callbacks[v98] then
        warn("Spring already had a bound callback for label '" .. v98 .. "', overwriting...\n" .. debug.traceback());
    end;
    v97._isBound = true;
    v97._callbacks[v98] = v99;
    v97:_updateCallbacks();
end;
v0.Unbind = function(v100, v101) --[[ Line: 245 ]] --[[ Name: Unbind ]]
    v100._callbacks[v101] = nil;
    for _ in pairs(v100._callbacks) do
        return;
    end;
    v100._isBound = false;
end;
v0.IsAnimating = function(v103, v104) --[[ Line: 258 ]] --[[ Name: IsAnimating ]]
    -- upvalues: l_abs_0 (copy), l_ToOrientation_0 (copy), l_new_4 (copy)
    v104 = v104 or 1.0E-4;
    local l_Position_0 = v103.Position;
    local l_Velocity_0 = v103.Velocity;
    local l_Target_0 = v103.Target;
    local v108 = nil;
    if v103.Type == "number" then
        local v109 = true;
        if v104 >= l_abs_0(l_Position_0 - l_Target_0) then
            v109 = v104 < l_abs_0(l_Velocity_0);
        end;
        v108 = v109;
    elseif v103.Type == "Vector3" or v103.Type == "Vector2" then
        local v110 = true;
        if v104 >= (l_Position_0 - l_Target_0).Magnitude then
            v110 = v104 < l_Velocity_0.Magnitude;
        end;
        v108 = v110;
    elseif v103.Type == "UDim2" then
        local v111 = true;
        if v104 >= l_abs_0(l_Position_0.X.Scale - l_Target_0.X.Scale) then
            v111 = true;
            if v104 >= l_abs_0(l_Velocity_0.X.Scale) then
                v111 = true;
                if v104 >= l_abs_0(l_Position_0.X.Offset - l_Target_0.X.Offset) then
                    v111 = true;
                    if v104 >= l_abs_0(l_Velocity_0.X.Offset) then
                        v111 = true;
                        if v104 >= l_abs_0(l_Position_0.Y.Scale - l_Target_0.Y.Scale) then
                            v111 = true;
                            if v104 >= l_abs_0(l_Velocity_0.Y.Scale) then
                                v111 = true;
                                if v104 >= l_abs_0(l_Position_0.Y.Offset - l_Target_0.Y.Offset) then
                                    v111 = v104 < l_abs_0(l_Velocity_0.Y.Offset);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        v108 = v111;
    elseif v103.Type == "UDim" then
        local v112 = true;
        if v104 >= l_abs_0(l_Position_0.Scale - l_Target_0.Scale) then
            v112 = true;
            if v104 >= l_abs_0(l_Velocity_0.Scale) then
                v112 = true;
                if v104 >= l_abs_0(l_Position_0.Offset - l_Target_0.Offset) then
                    v112 = v104 < l_abs_0(l_Velocity_0.Offset);
                end;
            end;
        end;
        v108 = v112;
    elseif v103.Type == "CFrame" then
        local v113 = l_new_4(l_ToOrientation_0(l_Position_0));
        local v114 = l_new_4(l_ToOrientation_0(l_Target_0));
        local v115 = l_new_4(l_ToOrientation_0(l_Velocity_0));
        local v116 = true;
        if v104 >= (l_Position_0.Position - l_Target_0.Position).Magnitude then
            v116 = true;
            if v104 >= l_Velocity_0.Position.Magnitude then
                v116 = true;
                if v104 >= (v113 - v114).Magnitude then
                    v116 = v104 < v115.Magnitude;
                end;
            end;
        end;
        v108 = v116;
    elseif v103.Type == "Color3" then
        local v117 = l_new_4(l_Position_0.R, l_Position_0.G, l_Position_0.B);
        local v118 = l_new_4(l_Velocity_0.R, l_Velocity_0.G, l_Velocity_0.B);
        local v119 = l_new_4(l_Target_0.R, l_Target_0.G, l_Target_0.B);
        local v120 = true;
        if v104 >= (v117 - v119).Magnitude then
            v120 = v104 < v118.Magnitude;
        end;
        v108 = v120;
    else
        error("Unknown type");
    end;
    if v108 then
        return true, l_Position_0;
    else
        return false, l_Target_0;
    end;
end;
v0.__index = function(v121, v122) --[[ Line: 309 ]] --[[ Name: __index ]]
    -- upvalues: v0 (copy)
    if v0[v122] then
        return v0[v122];
    elseif v122 == "Value" or v122 == "Position" or v122 == "p" then
        local v123, _ = v121:_positionVelocity(v121._clock());
        return v123;
    elseif v122 == "Velocity" or v122 == "v" then
        local _, v126 = v121:_positionVelocity(v121._clock());
        return v126;
    elseif v122 == "Target" or v122 == "t" then
        return v121._target;
    elseif v122 == "Damper" or v122 == "d" then
        return v121._damper;
    elseif v122 == "Speed" or v122 == "s" then
        return v121._speed;
    elseif v122 == "Clock" then
        return v121._clock;
    elseif v122 == "Type" then
        return v121._type;
    else
        error(("%q is not a valid member of Spring"):format((tostring(v122))), 2);
        return;
    end;
end;
v0.__newindex = function(v127, v128, v129) --[[ Line: 333 ]] --[[ Name: __newindex ]]
    local v130 = v127._clock();
    if v128 == "Value" or v128 == "Position" or v128 == "p" then
        local _, v132 = v127:_positionVelocity(v130);
        v127._position0 = v129;
        v127._velocity0 = v132;
        v127._time0 = v130;
    elseif v128 == "Velocity" or v128 == "v" then
        local v133, _ = v127:_positionVelocity(v130);
        v127._position0 = v133;
        v127._velocity0 = v129;
        v127._time0 = v130;
    elseif v128 == "Target" or v128 == "t" then
        local v135, v136 = v127:_positionVelocity(v130);
        v127._position0 = v135;
        v127._velocity0 = v136;
        v127._target = v129;
        v127._time0 = v130;
    elseif v128 == "Damper" or v128 == "d" then
        local v137, v138 = v127:_positionVelocity(v130);
        v127._position0 = v137;
        v127._velocity0 = v138;
        v127._damper = v129;
        v127._time0 = v130;
    elseif v128 == "Speed" or v128 == "s" then
        local v139, v140 = v127:_positionVelocity(v130);
        v127._position0 = v139;
        v127._velocity0 = v140;
        v127._speed = v129 < 0 and 0 or v129;
        v127._time0 = v130;
    elseif v128 == "Clock" then
        local v141, v142 = v127:_positionVelocity(v130);
        v127._position0 = v141;
        v127._velocity0 = v142;
        v127._clock = v129;
        v127._time0 = v129();
    else
        error(("%q is not a valid member of Spring"):format((tostring(v128))), 2);
    end;
    v127:_updateCallbacks();
end;
v0._positionVelocity = function(v143, v144) --[[ Line: 377 ]] --[[ Name: _positionVelocity ]]
    -- upvalues: l_cos_0 (copy), l_sin_0 (copy), v78 (copy)
    local l__damper_0 = v143._damper;
    local l__speed_0 = v143._speed;
    local v147 = l__speed_0 * (v144 - v143._time0);
    local v148 = l__damper_0 * l__damper_0;
    local v149 = nil;
    local v150 = nil;
    local v151 = nil;
    if v148 < 1 then
        v149 = (1 - v148) ^ 0.5;
        local v152 = 2.718281828459045 ^ (-l__damper_0 * v147) / v149;
        v151 = v152 * l_cos_0(v149 * v147);
        v150 = v152 * l_sin_0(v149 * v147);
    elseif v148 == 1 then
        v149 = 1;
        local v153 = 2.718281828459045 ^ (-l__damper_0 * v147) / v149;
        v151 = v153;
        v150 = v153 * v147;
    else
        v149 = (v148 - 1) ^ 0.5;
        local v154 = 2.718281828459045 ^ ((-l__damper_0 + v149) * v147) / (2 * v149);
        local v155 = 2.718281828459045 ^ ((-l__damper_0 - v149) * v147) / (2 * v149);
        v151 = v154 + v155;
        v150 = v154 - v155;
    end;
    local v156 = v149 * v151;
    local v157 = l__damper_0 * v150;
    local v158 = v156 + v157;
    local v159 = l__speed_0 * v150;
    return v78[v143._type](v158, v159, v150, v156, v157, l__speed_0, v143._position0, v143._velocity0, v143._target);
end;
v0._updateCallbacks = function(v160) --[[ Line: 410 ]] --[[ Name: _updateCallbacks ]]
    if v160._isBound and not v160._updating then
        task.spawn(function() --[[ Line: 412 ]]
            -- upvalues: v160 (copy)
            v160._updating = true;
            while v160:IsAnimating() do
                for _, v162 in pairs(v160._callbacks) do
                    v162(v160.Position, v160.Velocity);
                end;
                task.wait();
            end;
            v160._updating = false;
        end);
    end;
end;
return v0;