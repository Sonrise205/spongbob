local v0 = {};
local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
v0.Linear = function(v3, v4, v5, v6) --[[ Line: 21 ]] --[[ Name: Linear ]]
    return v5 * v3 / v6 + v4;
end;
v0.Constant = function(v7, _, _, v10) --[[ Line: 29 ]] --[[ Name: Constant ]]
    if v7 == v10 then
        return 1;
    else
        return 0;
    end;
end;
v0.InSine = function(v11, v12, v13, v14) --[[ Line: 37 ]] --[[ Name: InSine ]]
    return -v13 * math.cos(v11 / v14 * 1.5707963267948966) + v13 + v12;
end;
v0.OutSine = function(v15, v16, v17, v18) --[[ Line: 41 ]] --[[ Name: OutSine ]]
    return v17 * math.sin(v15 / v18 * 1.5707963267948966) + v16;
end;
v0.InOutSine = function(v19, v20, v21, v22) --[[ Line: 45 ]] --[[ Name: InOutSine ]]
    return -v21 / 2 * (math.cos(3.141592653589793 * v19 / v22) - 1) + v20;
end;
v0.OutInSine = function(v23, v24, v25, v26) --[[ Line: 49 ]] --[[ Name: OutInSine ]]
    -- upvalues: v0 (copy)
    if v23 < v26 / 2 then
        return v0.OutSine(v23 * 2, v24, v25 / 2, v26);
    else
        return v0.InSine(v23 * 2 - v26, v24 + v25 / 2, v25 / 2, v26);
    end;
end;
v0.InQuad = function(v27, v28, v29, v30) --[[ Line: 61 ]] --[[ Name: InQuad ]]
    return v29 * math.pow(v27 / v30, 2) + v28;
end;
v0.OutQuad = function(v31, v32, v33, v34) --[[ Line: 66 ]] --[[ Name: OutQuad ]]
    v31 = v31 / v34;
    return -v33 * v31 * (v31 - 2) + v32;
end;
v0.InOutQuad = function(v35, v36, v37, v38) --[[ Line: 71 ]] --[[ Name: InOutQuad ]]
    v35 = v35 / v38 * 2;
    if v35 < 1 then
        return v37 / 2 * math.pow(v35, 2) + v36;
    else
        return -v37 / 2 * ((v35 - 1) * (v35 - 3) - 1) + v36;
    end;
end;
v0.OutInQuad = function(v39, v40, v41, v42) --[[ Line: 81 ]] --[[ Name: OutInQuad ]]
    -- upvalues: v0 (copy)
    if v39 < v42 / 2 then
        return v0.OutQuad(v39 * 2, v40, v41 / 2, v42);
    else
        return v0.InQuad(v39 * 2 - v42, v40 + v41 / 2, v41 / 2, v42);
    end;
end;
v0.InCubic = function(v43, v44, v45, v46) --[[ Line: 93 ]] --[[ Name: InCubic ]]
    return v45 * math.pow(v43 / v46, 3) + v44;
end;
v0.OutCubic = function(v47, v48, v49, v50) --[[ Line: 98 ]] --[[ Name: OutCubic ]]
    return v49 * (math.pow(v47 / v50 - 1, 3) + 1) + v48;
end;
v0.InOutCubic = function(v51, v52, v53, v54) --[[ Line: 103 ]] --[[ Name: InOutCubic ]]
    v51 = v51 / v54 * 2;
    if v51 < 1 then
        return v53 / 2 * v51 * v51 * v51 + v52;
    else
        v51 = v51 - 2;
        return v53 / 2 * (v51 * v51 * v51 + 2) + v52;
    end;
end;
v0.OutInCubic = function(v55, v56, v57, v58) --[[ Line: 114 ]] --[[ Name: OutInCubic ]]
    -- upvalues: v0 (copy)
    if v55 < v58 / 2 then
        return v0.OutCubic(v55 * 2, v56, v57 / 2, v58);
    else
        return v0.InCubic(v55 * 2 - v58, v56 + v57 / 2, v57 / 2, v58);
    end;
end;
v0.InQuart = function(v59, v60, v61, v62) --[[ Line: 126 ]] --[[ Name: InQuart ]]
    return v61 * math.pow(v59 / v62, 4) + v60;
end;
v0.OutQuart = function(v63, v64, v65, v66) --[[ Line: 131 ]] --[[ Name: OutQuart ]]
    v63 = v63 / v66 - 1;
    return -v65 * (math.pow(v63, 4) - 1) + v64;
end;
v0.InOutQuart = function(v67, v68, v69, v70) --[[ Line: 136 ]] --[[ Name: InOutQuart ]]
    v67 = v67 / v70 * 2;
    if v67 < 1 then
        return v69 / 2 * math.pow(v67, 4) + v68;
    else
        v67 = v67 - 2;
        return -v69 / 2 * (math.pow(v67, 4) - 2) + v68;
    end;
end;
v0.OutInQuart = function(v71, v72, v73, v74) --[[ Line: 147 ]] --[[ Name: OutInQuart ]]
    -- upvalues: v0 (copy)
    if v71 < v74 / 2 then
        return v0.OutQuart(v71 * 2, v72, v73 / 2, v74);
    else
        return v0.InQuart(v71 * 2 - v74, v72 + v73 / 2, v73 / 2, v74);
    end;
end;
v0.InQuint = function(v75, v76, v77, v78) --[[ Line: 159 ]] --[[ Name: InQuint ]]
    return v77 * math.pow(v75 / v78, 5) + v76;
end;
v0.OutQuint = function(v79, v80, v81, v82) --[[ Line: 164 ]] --[[ Name: OutQuint ]]
    return v81 * (math.pow(v79 / v82 - 1, 5) + 1) + v80;
end;
v0.InOutQuint = function(v83, v84, v85, v86) --[[ Line: 169 ]] --[[ Name: InOutQuint ]]
    v83 = v83 / v86 * 2;
    if v83 < 1 then
        return v85 / 2 * math.pow(v83, 5) + v84;
    else
        v83 = v83 - 2;
        return v85 / 2 * (math.pow(v83, 5) + 2) + v84;
    end;
end;
v0.OutInQuint = function(v87, v88, v89, v90) --[[ Line: 180 ]] --[[ Name: OutInQuint ]]
    -- upvalues: v0 (copy)
    if v87 < v90 / 2 then
        return v0.OutQuint(v87 * 2, v88, v89 / 2, v90);
    else
        return v0.InQuint(v87 * 2 - v90, v88 + v89 / 2, v89 / 2, v90);
    end;
end;
v0.InSextic = function(v91, v92, v93, v94) --[[ Line: 192 ]] --[[ Name: InSextic ]]
    return v93 * math.pow(v91 / v94, 6) + v92;
end;
v0.OutSextic = function(v95, v96, v97, v98) --[[ Line: 197 ]] --[[ Name: OutSextic ]]
    v95 = v95 / v98 - 1;
    return -v97 * (math.pow(v95, 6) - 1) + v96;
end;
v0.InOutSextic = function(v99, v100, v101, v102) --[[ Line: 202 ]] --[[ Name: InOutSextic ]]
    v99 = v99 / v102 * 2;
    if v99 < 1 then
        return v101 / 2 * math.pow(v99, 6) + v100;
    else
        v99 = v99 - 2;
        return -v101 / 2 * (math.pow(v99, 6) - 2) + v100;
    end;
end;
v0.OutInSextic = function(v103, v104, v105, v106) --[[ Line: 213 ]] --[[ Name: OutInSextic ]]
    -- upvalues: v0 (copy)
    if v103 < v106 / 2 then
        return v0.OutSextic(v103 * 2, v104, v105 / 2, v106);
    else
        return v0.InSextic(v103 * 2 - v106, v104 + v105 / 2, v105 / 2, v106);
    end;
end;
v0.InExpo = function(v107, v108, v109, v110) --[[ Line: 225 ]] --[[ Name: InExpo ]]
    if v107 == 0 then
        return v108;
    else
        return v109 * math.pow(2, 10 * (v107 / v110 - 1)) + v108 - v109 * 0.001;
    end;
end;
v0.OutExpo = function(v111, v112, v113, v114) --[[ Line: 233 ]] --[[ Name: OutExpo ]]
    if v111 == v114 then
        return v112 + v113;
    else
        return v113 * 1.001 * (-math.pow(2, -10 * v111 / v114) + 1) + v112;
    end;
end;
v0.InOutExpo = function(v115, v116, v117, v118) --[[ Line: 241 ]] --[[ Name: InOutExpo ]]
    if v115 == 0 then
        return v116;
    elseif v115 == v118 then
        return v116 + v117;
    else
        v115 = v115 / v118 * 2;
        if v115 < 1 then
            return v117 / 2 * math.pow(2, 10 * (v115 - 1)) + v116 - v117 * 5.0E-4;
        else
            v115 = v115 - 1;
            return v117 / 2 * 1.0005 * (-math.pow(2, -10 * v115) + 2) + v116;
        end;
    end;
end;
v0.OutInExpo = function(v119, v120, v121, v122) --[[ Line: 260 ]] --[[ Name: OutInExpo ]]
    -- upvalues: v0 (copy)
    if v119 < v122 / 2 then
        return v0.OutExpo(v119 * 2, v120, v121 / 2, v122);
    else
        return v0.InExpo(v119 * 2 - v122, v120 + v121 / 2, v121 / 2, v122);
    end;
end;
v0.InCirc = function(v123, v124, v125, v126) --[[ Line: 272 ]] --[[ Name: InCirc ]]
    v123 = v123 / v126;
    return -v125 * (math.sqrt(1 - math.pow(v123, 2)) - 1) + v124;
end;
v0.OutCirc = function(v127, v128, v129, v130) --[[ Line: 277 ]] --[[ Name: OutCirc ]]
    return v129 * math.sqrt(1 - math.pow(v127 / v130 - 1, 2)) + v128;
end;
v0.InOutCirc = function(v131, v132, v133, v134) --[[ Line: 282 ]] --[[ Name: InOutCirc ]]
    v131 = v131 / v134 * 2;
    if v131 < 1 then
        return -v133 / 2 * (math.sqrt(1 - v131 * v131) - 1) + v132;
    else
        v131 = v131 - 2;
        return v133 / 2 * (math.sqrt(1 - v131 * v131) + 1) + v132;
    end;
end;
v0.OutInCirc = function(v135, v136, v137, v138) --[[ Line: 293 ]] --[[ Name: OutInCirc ]]
    -- upvalues: v0 (copy)
    if v135 < v138 / 2 then
        return v0.OutCirc(v135 * 2, v136, v137 / 2, v138);
    else
        return v0.InCirc(v135 * 2 - v138, v136 + v137 / 2, v137 / 2, v138);
    end;
end;
v0.InBack = function(v139, v140, v141, v142, v143) --[[ Line: 305 ]] --[[ Name: InBack ]]
    if not v143 then
        v143 = 1.70158;
    end;
    v139 = v139 / v142;
    return v141 * v139 * v139 * ((v143 + 1) * v139 - v143) + v140;
end;
v0.OutBack = function(v144, v145, v146, v147, v148) --[[ Line: 314 ]] --[[ Name: OutBack ]]
    if not v148 then
        v148 = 1.70158;
    end;
    v144 = v144 / v147 - 1;
    return v146 * (v144 * v144 * ((v148 + 1) * v144 + v148) + 1) + v145;
end;
v0.InOutBack = function(v149, v150, v151, v152, v153) --[[ Line: 323 ]] --[[ Name: InOutBack ]]
    if not v153 then
        v153 = 1.70158;
    end;
    v153 = v153 * 1.525;
    v149 = v149 / v152 * 2;
    if v149 < 1 then
        return v151 / 2 * (v149 * v149 * ((v153 + 1) * v149 - v153)) + v150;
    else
        v149 = v149 - 2;
        return v151 / 2 * (v149 * v149 * ((v153 + 1) * v149 + v153) + 2) + v150;
    end;
end;
v0.OutInBack = function(v154, v155, v156, v157, v158) --[[ Line: 339 ]] --[[ Name: OutInBack ]]
    -- upvalues: v0 (copy)
    if v154 < v157 / 2 then
        return v0.OutBack(v154 * 2, v155, v156 / 2, v157, v158);
    else
        return v0.InBack(v154 * 2 - v157, v155 + v156 / 2, v156 / 2, v157, v158);
    end;
end;
v0.OutBounce = function(v159, v160, v161, v162) --[[ Line: 351 ]] --[[ Name: OutBounce ]]
    v159 = v159 / v162;
    if v159 < 0.36363636363636365 then
        return v161 * (7.5625 * v159 * v159) + v160;
    elseif v159 < 0.7272727272727273 then
        v159 = v159 - 0.5454545454545454;
        return v161 * (7.5625 * v159 * v159 + 0.75) + v160;
    elseif v159 < 0.9090909090909091 then
        v159 = v159 - 0.8181818181818182;
        return v161 * (7.5625 * v159 * v159 + 0.9375) + v160;
    else
        v159 = v159 - 0.9545454545454546;
        return v161 * (7.5625 * v159 * v159 + 0.984375) + v160;
    end;
end;
v0.InBounce = function(v163, v164, v165, v166) --[[ Line: 368 ]] --[[ Name: InBounce ]]
    -- upvalues: v0 (copy)
    return v165 - v0.OutBounce(v166 - v163, 0, v165, v166) + v164;
end;
v0.InOutBounce = function(v167, v168, v169, v170) --[[ Line: 372 ]] --[[ Name: InOutBounce ]]
    -- upvalues: v0 (copy)
    if v167 < v170 / 2 then
        return v0.InBounce(v167 * 2, 0, v169, v170) * 0.5 + v168;
    else
        return v0.OutBounce(v167 * 2 - v170, 0, v169, v170) * 0.5 + v169 * 0.5 + v168;
    end;
end;
v0.OutInBounce = function(v171, v172, v173, v174) --[[ Line: 380 ]] --[[ Name: OutInBounce ]]
    -- upvalues: v0 (copy)
    if v171 < v174 / 2 then
        return v0.OutBounce(v171 * 2, v172, v173 / 2, v174);
    else
        return v0.InBounce(v171 * 2 - v174, v172 + v173 / 2, v173 / 2, v174);
    end;
end;
v0.ElasticBlend = function(v175, v176, v177, v178, v179, v180) --[[ Line: 392 ]] --[[ Name: ElasticBlend ]]
    if v176 ~= 0 then
        local v181 = math.abs(v179);
        v180 = if v178 ~= 0 then v180 * (v178 / math.abs(v176)) else 0;
        if math.abs(v175 * v177) < v181 then
            local v182 = math.abs(v175 * v177) / v181;
            v180 = v180 * v182 + (1 - v182);
        end;
    end;
    return v180;
end;
v0.InElastic = function(v183, v184, v185, v186, v187, v188) --[[ Line: 411 ]] --[[ Name: InElastic ]]
    -- upvalues: v0 (copy)
    local v189 = nil;
    local v190 = 1;
    if v183 == 0 then
        return v184;
    else
        v183 = v183 / v186;
        if v183 == 1 then
            return v184 + v185;
        else
            v183 = v183 - 1;
            if not v188 or v188 == 0 then
                v188 = v186 * 0.3;
            end;
            if v187 == nil or v187 < math.abs(v185) then
                v189 = v188 / 4;
                v190 = v0.ElasticBend(v183, v185, v186, v187, v189, v190);
                v187 = v185;
            else
                v189 = v188 / 6.283185307179586 * math.asin(v185 / v187);
            end;
            return -v190 * (v187 * math.pow(2, 10 * v183) * math.sin((v183 * v186 - v189) * 6.283185307179586 / v188)) + v184;
        end;
    end;
end;
v0.OutElastic = function(v191, v192, v193, v194, v195, v196) --[[ Line: 442 ]] --[[ Name: OutElastic ]]
    -- upvalues: v0 (copy)
    local v197 = nil;
    local v198 = 1;
    if v191 == 0 then
        return v192;
    else
        v191 = v191 / v194;
        if v191 == 1 then
            return v192 + v193;
        else
            v191 = -v191;
            if not v196 or v196 == 0 then
                v196 = v194 * 0.3;
            end;
            if v195 == nil or v195 < math.abs(v193) then
                v197 = v196 / 4;
                v198 = v0.ElasticBlend(v191, v193, v194, v195, v197, v198);
                v195 = v193;
            else
                v197 = v196 / 6.283185307179586 * math.asin(v193 / v195);
            end;
            return v198 * (v195 * math.pow(2, 10 * v191) * math.sin((v191 * v194 - v197) * 6.283185307179586 / v196)) + v193 + v192;
        end;
    end;
end;
v0.InOutElastic = function(v199, v200, v201, v202, v203, v204) --[[ Line: 473 ]] --[[ Name: InOutElastic ]]
    -- upvalues: v0 (copy)
    local v205 = nil;
    local v206 = 1;
    if v199 == 0 then
        return v200;
    else
        v199 = v199 / (v202 / 2);
        if v199 == 2 then
            return v200 + v201;
        else
            v199 = v199 - 1;
            if not v204 or v204 == 0 then
                v204 = v202 * 0.44999999999999996;
            end;
            if v203 == nil or v203 < math.abs(v201) then
                v205 = v204 / 4;
                v206 = v0.ElasticBlend(v199, v201, v202, v203, v205, v206);
                v203 = v201;
            else
                v205 = v204 / 6.283185307179586 * math.asin(v201 / v203);
            end;
            if v199 < 0 then
                return v206 * -0.5 * (v203 * math.pow(2, 10 * v199) * math.sin((v199 * v202 - v205) * 6.283185307179586 / v204)) + v200;
            else
                v199 = -v199;
                return v206 * 0.5 * (v203 * math.pow(2, 10 * v199) * math.sin((v199 * v202 - v205) * 6.283185307179586 / v204)) + v201 + v200;
            end;
        end;
    end;
end;
v0.OutInElastic = function(v207, v208, v209, v210, v211, v212) --[[ Line: 511 ]] --[[ Name: OutInElastic ]]
    -- upvalues: v0 (copy)
    if v207 < v210 / 2 then
        return v0.OutElastic(v207 * 2, v208, v209 / 2, v210, v211, v212);
    else
        return v0.InElastic(v207 * 2 - v210, v208 + v209 / 2, v209 / 2, v210, v211, v212);
    end;
end;
local l_HttpService_0 = game:GetService("HttpService");
local v214 = {
    Type = "Linear", 
    Params = {}
};
local v215 = {};
local function v216(v217) --[[ Line: 534 ]] --[[ Name: get ]]
    -- upvalues: v214 (copy), l_HttpService_0 (copy), v215 (copy), v0 (copy), v216 (copy)
    local v218 = v217 or v214;
    local v219 = l_HttpService_0:JSONEncode(v218);
    if v215[v219] == nil then
        local l_Params_0 = v218.Params;
        local v221 = v218.Type or "Linear";
        local v222 = v0[("%*%*"):format(l_Params_0.Direction or "In", v221)] or v0[v221];
        if v222 then
            local v223 = nil;
            local v224 = nil;
            if v221 == "Elastic" then
                v223 = l_Params_0.Amplitude or 1;
                v224 = l_Params_0.Period or 0.3;
            elseif v221 == "Back" then
                v223 = l_Params_0.Overshoot or 1.70158;
            end;
            do
                local l_v223_0, l_v224_0 = v223, v224;
                v215[v219] = function(v227) --[[ Line: 558 ]]
                    -- upvalues: v222 (copy), l_v223_0 (ref), l_v224_0 (ref)
                    return v222(v227, 0, 1, 1, l_v223_0, l_v224_0);
                end;
            end;
        else
            return v216(v214);
        end;
    end;
    return v215[v219];
end;
return {
    Get = v216
};