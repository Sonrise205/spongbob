--!native
local v0 = Random.new(os.clock());
local v1 = require(script.Parent.MathUtil);
local function _(v2, v3, v4) --[[ Line: 24 ]] --[[ Name: orientation ]]
    local v5 = (v3.Y - v2.Y) * (v4.X - v3.X) - (v3.X - v2.X) * (v4.Y - v3.Y);
    if v5 == 0 then
        return 0;
    elseif v5 > 0 then
        return 1;
    else
        return 2;
    end;
end;
local v10 = {
    unpack = function(v7) --[[ Line: 44 ]] --[[ Name: unpack ]]
        if typeof(v7) == "Vector3" then
            return v7.X, v7.Y, v7.Z;
        else
            return v7.X, v7.Y;
        end;
    end, 
    snap = function(v8, v9) --[[ Line: 54 ]] --[[ Name: snap ]]
        -- upvalues: v1 (copy)
        if typeof(v8) == "Vector3" then
            return (Vector3.new(v1.round(v8.X, v9), v1.round(v8.Y, v9), v1.round(v8.Z, v9)));
        else
            return Vector2.new(v1.round(v8.X, v9), v1.round(v8.Y, v9));
        end;
    end
};
v10.roundLength = function(v11, v12) --[[ Line: 73 ]] --[[ Name: roundLength ]]
    -- upvalues: v10 (copy), v1 (copy)
    return v10.normalize(v11) * v1.round(v11.Magnitude, v12);
end;
v10.randomUnitVector = function() --[[ Line: 81 ]] --[[ Name: randomUnitVector ]]
    -- upvalues: v0 (copy)
    return v0:NextUnitVector();
end;
v10.truncate = function(v13, v14) --[[ Line: 91 ]] --[[ Name: truncate ]]
    local l_Magnitude_0 = v13.Magnitude;
    if v14 < l_Magnitude_0 then
        return v13 * (v14 / l_Magnitude_0);
    else
        return v13;
    end;
end;
v10.getAngle = function(v16) --[[ Line: 102 ]] --[[ Name: getAngle ]]
    return (math.atan2(v16.Y, v16.X));
end;
v10.getAngleBetween = function(v17, v18) --[[ Line: 109 ]] --[[ Name: getAngleBetween ]]
    return (math.acos((v17.Unit:Dot(v18.Unit))));
end;
v10.getSignedAngleBetweenVector3s = function(v19, v20, v21) --[[ Line: 121 ]] --[[ Name: getSignedAngleBetweenVector3s ]]
    -- upvalues: v10 (copy)
    local v22 = v10.getAngleBetween(v19, v20);
    if v19:Cross(v20):Dot(v21) < 0 then
        v22 = -v22;
    end;
    return v22;
end;
v10.getSignedAngleBetweenVector2s = function(v23, v24) --[[ Line: 145 ]] --[[ Name: getSignedAngleBetweenVector2s ]]
    -- upvalues: v10 (copy)
    return v10.getAngle(v24) - v10.getAngle(v23);
end;
v10.isNaN = function(v25) --[[ Line: 164 ]] --[[ Name: isNaN ]]
    return v25 ~= v25;
end;
v10.abs = function(v26) --[[ Line: 171 ]] --[[ Name: abs ]]
    if typeof(v26) == "Vector3" then
        return (Vector3.new(math.abs(v26.X), math.abs(v26.Y), (math.abs(v26.Z))));
    else
        return (Vector2.new(math.abs(v26.X), (math.abs(v26.Y))));
    end;
end;
v10.sign = function(v27) --[[ Line: 181 ]] --[[ Name: sign ]]
    if typeof(v27) == "Vector3" then
        return (Vector3.new(math.sign(v27.X), math.sign(v27.Y), (math.sign(v27.Z))));
    else
        return (Vector2.new(math.sign(v27.X), (math.sign(v27.Y))));
    end;
end;
v10.normalize = function(v28) --[[ Line: 191 ]] --[[ Name: normalize ]]
    if v28.Magnitude == 0 then
        return v28;
    else
        return v28.Unit;
    end;
end;
v10.flattenY = function(v29, v30) --[[ Line: 201 ]] --[[ Name: flattenY ]]
    return (Vector3.new(v29.X, v30 or 0, v29.Z));
end;
v10.flatten = function(v31, v32, v33) --[[ Line: 212 ]] --[[ Name: flatten ]]
    if v32 then
        if v32 == Enum.Axis.X then
            return (Vector3.new(v33 or 0, v31.Y, v31.Z));
        elseif v32 == Enum.Axis.Y then
            return (Vector3.new(v31.X, v33 or 0, v31.Z));
        elseif v32 == Enum.Axis.Z then
            return (Vector3.new(v31.X, v31.Y, v33 or 0));
        end;
    end;
    return (Vector3.new(v31.X, v33 or 0, v31.Z));
end;
v10.getAxis = function(v34, v35) --[[ Line: 231 ]] --[[ Name: getAxis ]]
    return v34 * Vector3.FromAxis(v35);
end;
v10.setAxis = function(v36, v37, v38) --[[ Line: 242 ]] --[[ Name: setAxis ]]
    local l_X_0 = v36.X;
    local l_Y_0 = v36.Y;
    local l_Z_0 = v36.Z;
    if v37 == Enum.Axis.X then
        return (Vector3.new(v38, l_Y_0, l_Z_0));
    elseif v37 == Enum.Axis.Y then
        return (Vector3.new(l_X_0, v38, l_Z_0));
    elseif v37 == Enum.Axis.Z then
        return (Vector3.new(l_X_0, l_Y_0, v38));
    else
        error("Invalid Axis");
        return;
    end;
end;
v10.rotateVector3 = function(v42, v43) --[[ Line: 263 ]] --[[ Name: rotateVector3 ]]
    if typeof(v43) == "table" then
        v43 = CFrame.Angles(table.unpack(v43));
    elseif typeof(v43) == "Vector3" then
        v43 = CFrame.Angles(v43.X, v43.Y, v43.Z);
    end;
    return v43:VectorToWorldSpace(v42);
end;
v10.rotateVector2 = function(v44, v45) --[[ Line: 281 ]] --[[ Name: rotateVector2 ]]
    local v46 = math.sin(v45);
    local v47 = math.cos(v45);
    local v48 = v44.X * v47 - v44.Y * v46;
    local v49 = v44.X * v46 + v44.Y * v47;
    return Vector2.new(v48, v49);
end;
v10.rotateVector = function(v50, ...) --[[ Line: 296 ]] --[[ Name: rotateVector ]]
    -- upvalues: v10 (copy)
    if typeof(v50) == "Vector3" then
        return v10.rotateVector3(v50, ...);
    elseif typeof(v50) == "Vector2" then
        return v10.rotateVector2(v50, ...);
    else
        error("VectorUtil.rotateVector: Invalid Vector Type");
        return;
    end;
end;
v10.closestPointOnLine = function(v51, v52, v53) --[[ Line: 312 ]] --[[ Name: closestPointOnLine ]]
    return v52 + v53 * (v53:Dot(v51 - v52) / v53:Dot(v53));
end;
v10.closestPointsBetweenLines = function(v54, v55, v56, v57) --[[ Line: 327 ]] --[[ Name: closestPointsBetweenLines ]]
    local v58 = v55:Dot(v55);
    local v59 = v55:Dot(v57);
    local v60 = v57:Dot(v57);
    local v61 = (v54 - v56):Dot(v55);
    local v62 = (v54 - v56):Dot(v57);
    local v63 = (v59 * v62 - v60 * v61) / (v58 * v60 - v59 * v59);
    local v64 = (v58 * v62 - v59 * v61) / (v58 * v60 - v59 * v59);
    return v54 + v55 * v63, v56 + v57 * v64;
end;
v10.planeIntersectionPoint = function(v65, v66, v67, v68) --[[ Line: 351 ]] --[[ Name: planeIntersectionPoint ]]
    local v69 = (v68:Dot(v67) - v68:Dot(v65)) / v68:Dot(v66);
    if v69 < 0 then
        return nil;
    else
        return v65 + v66 * v69;
    end;
end;
v10.lineIntersectsSphere = function(v70, v71, v72, v73) --[[ Line: 371 ]] --[[ Name: lineIntersectsSphere ]]
    -- upvalues: v10 (copy)
    return (v10.closestPointOnLine(v72, v70, v71) - v72).Magnitude <= v73;
end;
v10.lineSegmentIntersectsSphere = function(v74, v75, v76, v77) --[[ Line: 387 ]] --[[ Name: lineSegmentIntersectsSphere ]]
    local v78 = v75 - v74;
    local v79 = (v76 - v74):Dot(v78) / v78.Magnitude ^ 2;
    if v79 < 0 then
        v79 = 0;
    elseif v79 > 1 then
        v79 = 1;
    end;
    return (v76 - (v74 + v78 * v79)).Magnitude ^ 2 <= v77 ^ 2;
end;
v10.calculatePlaneFromPoints = function(v80, v81, v82) --[[ Line: 413 ]] --[[ Name: calculatePlaneFromPoints ]]
    -- upvalues: v10 (copy)
    local l_Unit_0 = (v81 - v80):Cross(v82 - v80).Unit;
    return v10.calculatePlaneFromPointAndNormal(v80, l_Unit_0);
end;
v10.calculatePlaneFromPointAndNormal = function(v84, v85) --[[ Line: 425 ]] --[[ Name: calculatePlaneFromPointAndNormal ]]
    local v86 = v84.X * v85.X + v84.Y * v85.Y + v84.Z * v85.Z;
    return {
        v85.X, 
        v85.Y, 
        v85.Z, 
        v86
    };
end;
v10.pointLiesOnPlane = function(v87, v88) --[[ Line: 443 ]] --[[ Name: pointLiesOnPlane ]]
    local v89 = v88[1];
    local v90 = v88[2];
    local v91 = v88[3];
    return v89 * v87.X + v90 * v87.Y + v91 * v87.Z == v88[4];
end;
v10.projectVectorToPlane = function(v92, v93) --[[ Line: 461 ]] --[[ Name: projectVectorToPlane ]]
    local l_Unit_1 = (v93 or Vector3.new(0, 1, 0, 0)).Unit;
    return v92 - v92:Dot(l_Unit_1) * l_Unit_1;
end;
v10.pointInPolygon2D = function(v95, v96) --[[ Line: 492 ]] --[[ Name: pointInPolygon2D ]]
    local v97 = 0;
    local v98 = #v96;
    for v99 = 1, v98 do
        local v100 = v96[v99];
        local v101 = v96[v99 % v98 + 1];
        if v100.Y > v95.Y ~= (v101.Y > v95.Y) and (v101.X - v100.X) * (v95.Y - v100.Y) / (v101.Y - v100.Y) + v100.X > v95.X then
            v97 = v97 + 1;
        end;
    end;
    return v97 % 2 == 1;
end;
v10.pointInPolygon3D = function(v102, v103, v104, v105) --[[ Line: 538 ]] --[[ Name: pointInPolygon3D ]]
    -- upvalues: v10 (copy)
    if #v103 < 3 then
        return false;
    else
        local v106 = v104 or Vector3.new(0, 1, 0, 0);
        local v107 = v103[1];
        local function _(v108, v109) --[[ Line: 548 ]] --[[ Name: projectPointOntoPlane ]]
            -- upvalues: v107 (copy)
            return v108 - v109 * (v108 - v107):Dot(v109);
        end;
        local v111 = {};
        for _, v113 in pairs(v103) do
            table.insert(v111, v113 - v106 * (v113 - v107):Dot(v106));
        end;
        local v114 = v102 - v106 * (v102 - v107):Dot(v106);
        local l_Unit_2 = (v111[2] - v111[1]).Unit;
        local v116 = v106:Cross(l_Unit_2);
        local v117 = {};
        for _, v119 in pairs(v111) do
            local v120 = v119 - v107;
            table.insert(v117, Vector2.new(v120:Dot(l_Unit_2), v120:Dot(v116)));
        end;
        local v121 = v114 - v107;
        local v122 = Vector2.new(v121:Dot(l_Unit_2), v121:Dot(v116));
        if v105 then
            v117 = v10.calculateConvexHullGiftWrap(v117);
        end;
        return v10.pointInPolygon2D(v122, v117);
    end;
end;
v10.calculateConvexHullGrahamScan = function(v123) --[[ Line: 604 ]] --[[ Name: calculateConvexHullGrahamScan ]]
    local v124 = #v123;
    if v124 < 3 then
        warn("Cannot calculate convex hull with less than 3 points.");
        return v123;
    else
        local v125 = 1;
        for v126 = 2, v124 do
            if v123[v126].Y < v123[v125].Y or v123[v126].Y == v123[v125].Y and v123[v126].X < v123[v125].X then
                v125 = v126;
            end;
        end;
        local v127 = v123[v125];
        local v128 = v123[1];
        v123[1] = v127;
        v123[v125] = v128;
        v127 = v123[1];
        table.sort(v123, function(v129, v130) --[[ Line: 624 ]]
            -- upvalues: v127 (copy)
            local l_v127_0 = v127;
            local v132 = (v129.Y - l_v127_0.Y) * (v130.X - v129.X) - (v129.X - l_v127_0.X) * (v130.Y - v129.Y);
            local v133 = v132 == 0 and 0 or v132 > 0 and 1 or 2;
            if v133 == 0 then
                return (v127 - v129).Magnitude < (v127 - v130).Magnitude;
            else
                return v133 == 2;
            end;
        end);
        v128 = 2;
        local v134 = {
            v123[1], 
            v123[2]
        };
        for v135 = 3, v124 do
            while v128 >= 2 do
                local v136 = v134[v128 - 1];
                local v137 = v134[v128];
                local v138 = v123[v135];
                local v139 = (v137.Y - v136.Y) * (v138.X - v137.X) - (v137.X - v136.X) * (v138.Y - v137.Y);
                if (v139 == 0 and 0 or v139 > 0 and 1 or 2) ~= 2 then
                    table.remove(v134, v128);
                    v128 = v128 - 1;
                else
                    break;
                end;
            end;
            v128 = v128 + 1;
            table.insert(v134, v128, v123[v135]);
        end;
        return v134;
    end;
end;
v10.calculateConvexHullGiftWrap = function(v140) --[[ Line: 668 ]] --[[ Name: calculateConvexHullGiftWrap ]]
    local v141 = #v140;
    if v141 < 3 then
        warn("Cannot calculate convex hull with less than 3 points.");
        return v140;
    else
        local v142 = 1;
        for v143 = 2, v141 do
            if v140[v143].X < v140[v142].X or v140[v143].X == v140[v142].X and v140[v143].Y < v140[v142].Y then
                v142 = v143;
            end;
        end;
        local v144 = table.create((math.floor(v141 / 2)));
        local l_v142_0 = v142;
        local v146 = 0;
        repeat
            table.insert(v144, v140[l_v142_0]);
            v146 = (l_v142_0 + 1) % v141 + 1;
            for v147 = 1, v141 do
                local v148 = v140[l_v142_0];
                local v149 = v140[v147];
                local v150 = v140[v146];
                local v151 = (v149.Y - v148.Y) * (v150.X - v149.X) - (v149.X - v148.X) * (v150.Y - v149.Y);
                if (v151 == 0 and 0 or v151 > 0 and 1 or 2) == 2 then
                    v146 = v147;
                end;
            end;
            l_v142_0 = v146;
        until l_v142_0 == v142;
        return v144;
    end;
end;
v10.reflect = function(v152, v153) --[[ Line: 723 ]] --[[ Name: reflect ]]
    return v152 - 2 * v152:Dot(v153) * v153;
end;
v10.reflectIgnoringY = function(v154, v155) --[[ Line: 734 ]] --[[ Name: reflectIgnoringY ]]
    local v156 = Vector3.new(v155.X, 0, v155.Z);
    local v157 = v156.Magnitude > 0 and v156.Unit or Vector3.new(0, 0, 0, 0);
    return v154 - 2 * v154:Dot(v157) * v157;
end;
return table.freeze(v10);