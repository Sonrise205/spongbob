local v0 = {
    __type = "Quaternion"
};
v0.new = function(v1, v2) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v11 = setmetatable({}, {
        __index = v0, 
        __mul = function(v3, v4) --[[ Line: 10 ]] --[[ Name: __mul ]]
            if v4.__type and v4.__type == "Quaternion" then
                local v5 = v3.w * v4.w - v3.v:Dot(v4.v);
                local v6 = v3.v * v4.w + v4.v * v3.w + v3.v:Cross(v4.v);
                return v3.new(v5, v6);
            else
                return;
            end;
        end, 
        __pow = function(v7, v8) --[[ Line: 17 ]] --[[ Name: __pow ]]
            local v9, v10 = v7:AxisAngle();
            v10 = v8 * v10;
            return v7.new(math.cos(v10 / 2), math.sin(v10 / 2) * v9);
        end
    });
    v11.w = v1;
    v11.v = v2;
    return v11;
end;
v0.Inverse = function(v12) --[[ Line: 30 ]] --[[ Name: Inverse ]]
    -- upvalues: v0 (copy)
    local v13 = v12.w ^ 2 + v12.v.magnitude ^ 2;
    local v14 = v12.w / v13;
    local v15 = -v12.v / v13;
    return v0.new(v14, v15);
end;
v0.AxisAngle = function(v16) --[[ Line: 39 ]] --[[ Name: AxisAngle ]]
    return v16.v.unit, math.acos(v16.w) * 2;
end;
v0.Slerp = function(v17, v18, v19) --[[ Line: 46 ]] --[[ Name: Slerp ]]
    return (v18 * v17:Inverse()) ^ v19 * v17;
end;
local function v43(v20) --[[ Line: 55 ]] --[[ Name: QuaternionFromCFrame ]]
    local _, _, _, v24, v25, v26, v27, v28, v29, v30, v31, v32 = v20:components();
    local v33 = v24 + v28 + v32;
    if v33 > 0 then
        local v34 = math.sqrt(1 + v33);
        local v35 = 0.5 / v34;
        return v34 * 0.5, (Vector3.new((v31 - v29) * v35, (v26 - v30) * v35, (v27 - v25) * v35));
    else
        local v36 = math.max(v24, v28, v32);
        if v36 == v24 then
            local v37 = math.sqrt(1 + v24 - v28 - v32);
            local v38 = 0.5 / v37;
            return (v31 - v29) * v38, (Vector3.new(v37 * 0.5, (v27 + v25) * v38, (v26 + v30) * v38));
        elseif v36 == v28 then
            local v39 = math.sqrt(1 - v24 + v28 - v32);
            local v40 = 0.5 / v39;
            return (v26 - v30) * v40, (Vector3.new((v27 + v25) * v40, v39 * 0.5, (v31 + v29) * v40));
        elseif v36 == v32 then
            local v41 = math.sqrt(1 - v24 - v28 + v32);
            local v42 = 0.5 / v41;
            return (v27 - v25) * v42, (Vector3.new((v26 + v30) * v42, (v31 + v29) * v42, v41 * 0.5));
        else
            return;
        end;
    end;
end;
return function(v44, v45, v46) --[[ Line: 80 ]]
    -- upvalues: v0 (copy), v43 (copy)
    local v47 = v44.p:Lerp(v45.p, v46);
    local v48 = v0.new(v43(v44)):Slerp(v0.new(v43(v45)), v46);
    return CFrame.new(v47.x, v47.y, v47.z, v48.v.x, v48.v.y, v48.v.z, v48.w);
end;