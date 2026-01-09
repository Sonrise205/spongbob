local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.MathUtil);
local v3 = require(l_Parent_0.Parent.Fusion_v0_3_0);
local v4 = require(l_Parent_0.Parent.Promise);
local _ = require(l_Parent_0.RailUtilTypes);
local l_peek_0 = v3.peek;
local l_Value_0 = v3.Value;
local l_Observer_0 = v3.Observer;
local l_Computed_0 = v3.Computed;
local l_doCleanup_0 = v3.doCleanup;
local l_innerScope_0 = v3.innerScope;
local v16 = {
    isState = function(v12) --[[ Line: 55 ]] --[[ Name: isState ]]
        local v13 = false;
        if typeof(v12) == "table" then
            v13 = v12.type == "State";
        end;
        return v13;
    end, 
    isValue = function(v14) --[[ Line: 59 ]] --[[ Name: isValue ]]
        local v15 = false;
        if typeof(v14) == "table" then
            v15 = v14.type == "State";
        end;
        if v15 then
            v15 = v14.set;
        end;
        return v15;
    end, 
    scope = nil
};
v16.scopeless = table.freeze({
    Value = function(v17) --[[ Line: 109 ]] --[[ Name: Value ]]
        -- upvalues: v16 (copy)
        return v16.scope:Value(v17);
    end, 
    Computed = function(v18) --[[ Line: 112 ]] --[[ Name: Computed ]]
        -- upvalues: v16 (copy)
        return v16.scope:Computed(v18);
    end, 
    Observer = function(v19) --[[ Line: 115 ]] --[[ Name: Observer ]]
        -- upvalues: v16 (copy)
        return v16.scope:Observer(v19);
    end, 
    Spring = function(v20, _, _) --[[ Line: 118 ]] --[[ Name: Spring ]]
        -- upvalues: v16 (copy)
        return v16.scope:Spring(v20);
    end, 
    Tween = function(v23, v24) --[[ Line: 121 ]] --[[ Name: Tween ]]
        -- upvalues: v16 (copy)
        return v16.scope:Tween(v23, v24);
    end, 
    New = function(v25) --[[ Line: 124 ]] --[[ Name: New ]]
        -- upvalues: v16 (copy)
        return v16.scope:New(v25);
    end, 
    Hydrate = function(v26) --[[ Line: 127 ]] --[[ Name: Hydrate ]]
        -- upvalues: v16 (copy)
        return v16.scope:Hydrate(v26);
    end, 
    ForKeys = function(v27, _, _) --[[ Line: 139 ]] --[[ Name: ForKeys ]]
        -- upvalues: v16 (copy)
        return v16.scope:ForKeys(v27);
    end, 
    ForValues = function(v30, _, _) --[[ Line: 150 ]] --[[ Name: ForValues ]]
        -- upvalues: v16 (copy)
        return v16.scope:ForValues(v30);
    end, 
    ForPairs = function(v33, _, _) --[[ Line: 161 ]] --[[ Name: ForPairs ]]
        -- upvalues: v16 (copy)
        return v16.scope:ForPairs(v33);
    end
});
local v36 = newproxy(false);
v16.removeTask = function(v37, v38, v39) --[[ Line: 200 ]] --[[ Name: removeTask ]]
    -- upvalues: v36 (copy)
    for v40 = 1, #v37 do
        local v41 = v37[v40];
        if typeof(v41) == "table" and v41[v36] and v41.Id == v38 then
            table.remove(v37, v40);
            if not v39 then
                v41.Destroy();
            end;
            return v41.Task;
        end;
    end;
    return nil;
end;
v16.RemoveTask = v16.removeTask;
v16.addTask = function(v42, v43, v44, v45) --[[ Line: 235 ]] --[[ Name: addTask ]]
    -- upvalues: v16 (copy), v36 (copy), v3 (copy)
    if v45 then
        v16.removeTask(v42, v45);
    end;
    if v44 and typeof(v43) ~= "table" and typeof(v43) ~= "Instance" then
        warn("FusionUtil.addTask: methodName not supported for tasks of type:", (typeof(v43)));
    end;
    table.insert(v42, {
        [v36] = true, 
        Id = v45, 
        Task = v43, 
        Destroy = function() --[[ Line: 248 ]] --[[ Name: Destroy ]]
            -- upvalues: v44 (copy), v43 (copy), v3 (ref)
            if typeof(v44) == "string" then
                v43[v44](v43);
                return;
            elseif typeof(v43) == "thread" then
                task.cancel(v43);
                return;
            else
                v3.doCleanup(v43);
                return;
            end;
        end
    });
    return v43;
end;
v16.AddTask = v16.addTask;
v16.getTask = function(v46, v47) --[[ Line: 282 ]] --[[ Name: getTask ]]
    -- upvalues: v36 (copy)
    for v48 = 1, #v46 do
        local v49 = v46[v48];
        if typeof(v49) == "table" and v49[v36] and v49.Id == v47 then
            return v49.Task;
        end;
    end;
    return nil;
end;
v16.GetTask = v16.getTask;
v16.promiseState = function(v50, v51, v52, v53) --[[ Line: 314 ]] --[[ Name: promiseState ]]
    -- upvalues: v4 (copy), l_peek_0 (copy), l_Observer_0 (copy)
    local v61 = v4.new(function(v54, _, v56) --[[ Line: 315 ]]
        -- upvalues: l_peek_0 (ref), v51 (copy), v52 (copy), l_Observer_0 (ref), v50 (copy), v53 (copy)
        local v57 = nil;
        local function v59() --[[ Line: 317 ]] --[[ Name: Check ]]
            -- upvalues: l_peek_0 (ref), v51 (ref), v52 (ref), v57 (ref), v54 (copy)
            local v58 = l_peek_0(v51);
            if not v52 or v52(v58) then
                v57();
                v54(v58);
            end;
        end;
        v57 = l_Observer_0(v50, v51):onChange(v59);
        if v53 then
            local v60 = l_peek_0(v51);
            if not v52 or v52(v60) then
                v57();
                v54(v60);
            end;
        end;
        v56(v57);
    end);
    if v50 then
        table.insert(v50, function() --[[ Line: 333 ]]
            -- upvalues: v61 (copy)
            v61:cancel();
        end);
    end;
    return v61;
end;
v16.bindTo = function(v62, v63) --[[ Line: 355 ]] --[[ Name: bindTo ]]
    -- upvalues: v3 (copy), v16 (copy)
    local v64 = false;
    local function v65() --[[ Line: 357 ]] --[[ Name: TryCleanup ]]
        -- upvalues: v64 (ref), v3 (ref), v62 (copy)
        if not v64 then
            v64 = true;
            v3.doCleanup(v62);
        end;
    end;
    v16.addTask(v62, function() --[[ Line: 364 ]]
        -- upvalues: v64 (ref)
        v64 = true;
    end);
    table.insert(v62, v63.Destroying:Connect(v65));
    return v63;
end;
v16.ensureIsState = function(v66, v67, v68, v69) --[[ Line: 384 ]] --[[ Name: ensureIsState ]]
    -- upvalues: l_Value_0 (copy), l_peek_0 (copy)
    if v67 == nil then
        return (l_Value_0(v66, v68));
    else
        if v69 then
            if typeof(v69) == "string" then
                v69 = {
                    v69
                };
            end;
            local v70 = typeof(l_peek_0(v67));
            if not table.find(v69, v70) then
                warn("FusionUtil.ensureIsState: Expected data to be of type", table.concat(v69, ", "), ", got " .. v70 .. ". Defaulting to", v68);
                return (l_Value_0(v66, v68));
            end;
        end;
        local v71 = false;
        if typeof(v67) == "table" then
            v71 = v67.type == "State";
        end;
        if v71 then
            return v67;
        else
            return (l_Value_0(v66, v67));
        end;
    end;
end;
v16.ensureIsValue = function(v72, v73, v74, v75) --[[ Line: 431 ]] --[[ Name: ensureIsValue ]]
    -- upvalues: l_Value_0 (copy), l_peek_0 (copy)
    if v73 == nil then
        return l_Value_0(v72, v74);
    else
        if v75 then
            if typeof(v75) == "string" then
                v75 = {
                    v75
                };
            end;
            local v76 = typeof(l_peek_0(v73));
            if not table.find(v75, v76) then
                warn("FusionUtil.ensureIsState: Expected data to be of type", table.concat(v75, ", "), ", got " .. v76 .. ". Defaulting to", v74);
                return (l_Value_0(v72, v74));
            end;
        end;
        local v77 = false;
        if typeof(v73) == "table" then
            v77 = v73.type == "State";
        end;
        if v77 then
            v77 = v73.set;
        end;
        if v77 then
            return v73;
        else
            v77 = false;
            if typeof(v73) == "table" then
                v77 = v73.type == "State";
            end;
            if v77 then
                warn("FusionUtil.ensureIsValue: Expected a Value, got a State. ", v73, "\n", debug.traceback());
            end;
            return l_Value_0(v72, l_peek_0(v73));
        end;
    end;
end;
v16.formatAssetId = function(v78, v79, v80) --[[ Line: 489 ]] --[[ Name: formatAssetId ]]
    -- upvalues: l_Computed_0 (copy), l_peek_0 (copy)
    local v81 = false;
    local function v86(v82) --[[ Line: 490 ]] --[[ Name: transform ]]
        -- upvalues: v79 (copy), v80 (copy)
        local v83 = v82(v79) or v80;
        if v83 then
            local v84 = typeof(v83);
            local v85 = true;
            if v84 ~= "string" then
                v85 = v84 == "number";
            end;
            assert(v85, "Expected a string or number, got " .. v84);
            return "rbxassetid://" .. string.match(tostring(v83), "%d+");
        else
            return "";
        end;
    end;
    local v87 = false;
    if typeof(v79) == "table" then
        v87 = v79.type == "State";
    end;
    local v88, v89;
    if v87 then
        v88 = l_Computed_0(v78, v86);
        v81 = v88;
    end;
    if not v81 then
        v89 = l_peek_0(v79) or v80;
        if v89 then
            local v90 = typeof(v89);
            local v91 = true;
            if v90 ~= "string" then
                v91 = v90 == "number";
            end;
            assert(v91, "Expected a string or number, got " .. v90);
            return "rbxassetid://" .. string.match(tostring(v89), "%d+");
        else
            v88 = "";
        end;
    end;
    v81 = false;
    return v88;
end;
v16.ratio = function(v92, v93, v94, v95) --[[ Line: 524 ]] --[[ Name: ratio ]]
    -- upvalues: l_Computed_0 (copy)
    return l_Computed_0(v92, function(v96) --[[ Line: 530 ]]
        -- upvalues: v93 (copy), v94 (copy), v95 (ref)
        local v97 = v96(v93) / (v96(v94) or 1);
        v95 = v96(v95);
        if v95 then
            if typeof(v95) == "function" then
                return v95(v97, v96);
            else
                return v95 * v97;
            end;
        else
            return v97;
        end;
    end);
end;
v16.ratioUDim2 = function(v98, v99, v100, v101) --[[ Line: 565 ]] --[[ Name: ratioUDim2 ]]
    -- upvalues: v16 (copy)
    return (v16.ratio(v98, v99, v100, function(v102, v103) --[[ Line: 571 ]]
        -- upvalues: v101 (ref)
        v101 = v103(v101);
        return UDim2.new(v101.X.Scale * v102, v101.X.Offset * v102, v101.Y.Scale * v102, v101.Y.Offset * v102);
    end));
end;
v16.screenRatio = function(v104, v105, v106) --[[ Line: 605 ]] --[[ Name: screenRatio ]]
    -- upvalues: v16 (copy), l_Parent_0 (copy)
    return (v106 or v16.ratio)(v104, require(l_Parent_0.CameraUtil).ViewportSizeY, 1080, v105);
end;
v16.lerpNumber = function(v107, v108, v109, v110, v111) --[[ Line: 631 ]] --[[ Name: lerpNumber ]]
    -- upvalues: v2 (copy), l_Computed_0 (copy)
    if v111 then
        return v2.lerp(v111(v108), v111(v109), v111(v110));
    else
        return l_Computed_0(v107, function(v112) --[[ Line: 635 ]]
            -- upvalues: v2 (ref), v108 (copy), v109 (copy), v110 (copy)
            return (v2.lerp(v112(v108), v112(v109), v112(v110)));
        end);
    end;
end;
v16.UDim = function(v113, v114, v115) --[[ Line: 651 ]] --[[ Name: UDim ]]
    -- upvalues: l_Computed_0 (copy)
    local v116 = false;
    if typeof(v114) == "table" then
        v116 = v114.type == "State";
    end;
    if not v116 then
        v116 = false;
        if typeof(v115) == "table" then
            v116 = v115.type == "State";
        end;
        if not v116 then
            return UDim.new(v114, v115);
        end;
    end;
    return l_Computed_0(v113, function(v117) --[[ Line: 655 ]]
        -- upvalues: v114 (copy), v115 (copy)
        return UDim.new(v117(v114), v117(v115));
    end);
end;
v16.eq = function(v118, v119, v120) --[[ Line: 680 ]] --[[ Name: eq ]]
    -- upvalues: l_Computed_0 (copy)
    return l_Computed_0(v118, function(v121) --[[ Line: 681 ]]
        -- upvalues: v119 (copy), v120 (copy)
        return v121(v119) == v121(v120);
    end);
end;
v16.Eq = v16.eq;
v16.Equal = v16.eq;
v16.Equals = v16.eq;
v16.If = function(v122, v123, v124, v125) --[[ Line: 712 ]] --[[ Name: If ]]
    -- upvalues: l_Computed_0 (copy)
    return l_Computed_0(v122, function(v126) --[[ Line: 713 ]]
        -- upvalues: v123 (copy), v124 (copy), v125 (copy)
        if v126(v123) then
            return (v126(v124));
        else
            return (v126(v125));
        end;
    end);
end;
v16.Not = function(v127, v128) --[[ Line: 733 ]] --[[ Name: Not ]]
    -- upvalues: l_Computed_0 (copy)
    return l_Computed_0(v127, function(v129) --[[ Line: 734 ]]
        -- upvalues: v128 (copy)
        return not v129(v128);
    end);
end;
v16.Or = function(v130, v131, v132) --[[ Line: 744 ]] --[[ Name: Or ]]
    -- upvalues: l_Computed_0 (copy)
    return l_Computed_0(v130, function(v133) --[[ Line: 745 ]]
        -- upvalues: v131 (copy), v132 (copy)
        return v133(v131) or v133(v132);
    end);
end;
v16.And = function(v134, v135, v136) --[[ Line: 755 ]] --[[ Name: And ]]
    -- upvalues: l_Computed_0 (copy)
    return l_Computed_0(v134, function(v137) --[[ Line: 756 ]]
        -- upvalues: v135 (copy), v136 (copy)
        return v137(v135) and v137(v136);
    end);
end;
v16.observeState = function(v138, v139, v140) --[[ Line: 771 ]] --[[ Name: observeState ]]
    -- upvalues: l_peek_0 (copy), l_Observer_0 (copy)
    local function v141() --[[ Line: 772 ]] --[[ Name: onStateChange ]]
        -- upvalues: v140 (copy), l_peek_0 (ref), v139 (copy)
        v140(l_peek_0(v139));
    end;
    v140(l_peek_0(v139));
    local v142 = false;
    if typeof(v139) == "table" then
        v142 = v139.type == "State";
    end;
    if v142 then
        return l_Observer_0(v138, v139):onChange(v141);
    else
        warn("FusionUtil.observeState: Expected a State object, got " .. typeof(v139));
        return function() --[[ Line: 780 ]]

        end;
    end;
end;
v16.copyState = function(v143, v144) --[[ Line: 804 ]] --[[ Name: copyState ]]
    -- upvalues: v3 (copy), l_peek_0 (copy)
    local v145 = v3.Value(v143, l_peek_0(v144));
    local v146 = false;
    if typeof(v144) == "table" then
        v146 = v144.type == "State";
    end;
    if not v146 then
        return v145, function() --[[ Line: 807 ]]

        end;
    else
        return v145, (v3.Observer(v143, v144):onChange(function() --[[ Line: 809 ]]
            -- upvalues: v145 (copy), l_peek_0 (ref), v144 (copy)
            v145:set(l_peek_0(v144));
        end));
    end;
end;
v16.syncValues = function(v147, v148, v149) --[[ Line: 838 ]] --[[ Name: syncValues ]]
    -- upvalues: l_peek_0 (copy), l_Observer_0 (copy)
    v149:set(l_peek_0(v148));
    return l_Observer_0(v147, v148):onChange(function() --[[ Line: 840 ]]
        -- upvalues: v149 (copy), l_peek_0 (ref), v148 (copy)
        v149:set(l_peek_0(v148));
    end);
end;
v16.clock = function(v150, v151) --[[ Line: 868 ]] --[[ Name: clock ]]
    -- upvalues: v3 (copy), l_RunService_0 (copy), l_peek_0 (copy)
    local v152 = v3.Value(v150, 0);
    table.insert(v150, (l_RunService_0.RenderStepped:Connect(function(v153) --[[ Line: 871 ]]
        -- upvalues: l_peek_0 (ref), v151 (copy), v152 (copy)
        if not l_peek_0(v151) then
            v152:set(l_peek_0(v152) + v153);
        end;
    end)));
    return v152;
end;
v16.mapValuesToStates = function(v154, v155, v156) --[[ Line: 910 ]] --[[ Name: mapValuesToStates ]]
    -- upvalues: v3 (copy), l_peek_0 (copy), l_innerScope_0 (copy), l_doCleanup_0 (copy)
    warn("FusionUtil.mapValuesToStates is not yet released");
    local v157 = v3.Value(v154, {});
    local v158 = {};
    v3.Observer(v154, v155):onBind(function() --[[ Line: 927 ]]
        -- upvalues: l_peek_0 (ref), v155 (copy), v157 (copy), v158 (copy), l_innerScope_0 (ref), v154 (copy), v3 (ref), v156 (copy), l_doCleanup_0 (ref)
        if typeof(l_peek_0(v155)) ~= "table" then
            warn("FusionUtil.mapValuesToStates: Expected a table, got " .. typeof(l_peek_0(v155)));
            return;
        else
            local v159 = l_peek_0(v155);
            local v160 = l_peek_0(v157);
            local v161 = false;
            for v162, v163 in v159 do
                if v158[v162] == nil then
                    local v164 = l_innerScope_0(v154);
                    local v165 = v3.Value(v164, v163);
                    v158[v162] = {
                        Scope = v164, 
                        Value = v165
                    };
                    v160[v162] = v3.Computed(v164, function(v166, v167) --[[ Line: 947 ]]
                        -- upvalues: v156 (ref), v162 (copy), v165 (copy)
                        if v166(v156) then
                            return v166(v156)(v166, v167, v162, v166(v165));
                        else
                            return v166(v165);
                        end;
                    end);
                    v161 = true;
                else
                    v158[v162].Value:set(v163);
                end;
            end;
            for v168 in v160 do
                if v159[v168] == nil then
                    l_doCleanup_0(v158[v168].Scope);
                    v158[v168] = nil;
                    v160[v168] = nil;
                    v161 = true;
                end;
            end;
            if v161 then
                v157:set(v160);
            end;
            return;
        end;
    end);
    return v157;
end;
v16.arrayInsert = function(v169, ...) --[[ Line: 1000 ]] --[[ Name: arrayInsert ]]
    -- upvalues: l_peek_0 (copy)
    local v170 = l_peek_0(v169);
    table.insert(v170, ...);
    local v171 = false;
    if typeof(v169) == "table" then
        v171 = v169.type == "State";
    end;
    if v171 then
        v171 = v169.set;
    end;
    if v171 then
        v169:set(v170);
        return;
    else
        local v172 = false;
        if typeof(v169) == "table" then
            v172 = v169.type == "State";
        end;
        assert(not v172, "Expected a Value, got a State");
        return;
    end;
end;
v16.arrayRemove = function(v173, v174, v175) --[[ Line: 1029 ]] --[[ Name: arrayRemove ]]
    -- upvalues: v16 (copy), l_peek_0 (copy)
    if v175 then
        assert(v174, "Expected an index to swap remove");
        return v16.arraySwapRemove(v173, v174);
    else
        local v176 = l_peek_0(v173);
        local v177 = table.remove(v176, v174);
        local v178 = false;
        if typeof(v173) == "table" then
            v178 = v173.type == "State";
        end;
        if v178 then
            v178 = v173.set;
        end;
        if v178 then
            v173:set(v176);
            return v177;
        else
            local v179 = false;
            if typeof(v173) == "table" then
                v179 = v173.type == "State";
            end;
            assert(not v179, "Expected a Value, got a State");
            return v177;
        end;
    end;
end;
v16.arraySwapRemove = function(v180, v181) --[[ Line: 1062 ]] --[[ Name: arraySwapRemove ]]
    -- upvalues: l_peek_0 (copy)
    local v182 = l_peek_0(v180);
    local v183 = v182[v181];
    v182[v181] = v182[#v182];
    table.remove(v182);
    local v184 = false;
    if typeof(v180) == "table" then
        v184 = v180.type == "State";
    end;
    if v184 then
        v184 = v180.set;
    end;
    if v184 then
        v180:set(v182);
        return v183;
    else
        local v185 = false;
        if typeof(v180) == "table" then
            v185 = v180.type == "State";
        end;
        assert(not v185, "Expected a Value, got a State");
        return v183;
    end;
end;
v16.arrayRemoveFirstValue = function(v186, v187, v188) --[[ Line: 1094 ]] --[[ Name: arrayRemoveFirstValue ]]
    -- upvalues: l_peek_0 (copy), v16 (copy)
    local v189 = l_peek_0(v186);
    local v190 = table.find(v189, v187);
    if v190 then
        v16.arrayRemove(v186, v190, v188);
    end;
    return v190;
end;
v16.arraySwapRemoveFirstValue = function(v191, v192) --[[ Line: 1121 ]] --[[ Name: arraySwapRemoveFirstValue ]]
    -- upvalues: v16 (copy)
    return v16.arrayRemoveFirstValue(v191, v192, true);
end;
v16.tableSet = function(v193, v194, v195, v196) --[[ Line: 1143 ]] --[[ Name: tableSet ]]
    -- upvalues: l_peek_0 (copy)
    local v197 = l_peek_0(v193);
    local v198 = v197[v194];
    if v196 then
        local v199 = false;
        if typeof(v198) == "table" then
            v199 = v198.type == "State";
        end;
        if v199 then
            v199 = v198.set;
        end;
        if v199 then
            v198:set(v195);
            return v198;
        else
            error("FusionUtil.tableSet: Expected a Fusion.Value, got a " .. typeof(v198));
        end;
    end;
    v197[v194] = v195;
    local v200 = false;
    if typeof(v193) == "table" then
        v200 = v193.type == "State";
    end;
    if v200 then
        v200 = v193.set;
    end;
    if v200 then
        v193:set(v197);
        return v198;
    else
        local v201 = false;
        if typeof(v193) == "table" then
            v201 = v193.type == "State";
        end;
        assert(not v201, "Expected a Value, got a State");
        return v198;
    end;
end;
v16.arraySet = function(v202, v203, v204, v205) --[[ Line: 1183 ]] --[[ Name: arraySet ]]
    -- upvalues: l_peek_0 (copy)
    if typeof(v203) ~= "number" then
        error("[FusionUtil.arraySet] Expected typeof 'number' for the index, got " .. typeof(v203) .. ". Did you mean to use [FusionUtil.tableSet]?");
    end;
    local v206 = l_peek_0(v202);
    local v207 = v206[v203];
    if v205 then
        local v208 = false;
        if typeof(v207) == "table" then
            v208 = v207.type == "State";
        end;
        if v208 then
            v208 = v207.set;
        end;
        if v208 then
            v207:set(v204);
            return v207;
        else
            error("FusionUtil.arraySet: Expected a Fusion.Value, got a " .. typeof(v207));
        end;
    end;
    v206[v203] = v204;
    local v209 = false;
    if typeof(v202) == "table" then
        v209 = v202.type == "State";
    end;
    if v209 then
        v209 = v202.set;
    end;
    if v209 then
        v202:set(v206);
        return v207;
    else
        local v210 = false;
        if typeof(v202) == "table" then
            v210 = v202.type == "State";
        end;
        assert(not v210, "Expected a Value, got a State");
        return v207;
    end;
end;
v16.arraySetFirstValue = function(v211, v212, v213, v214) --[[ Line: 1225 ]] --[[ Name: arraySetFirstValue ]]
    -- upvalues: l_peek_0 (copy), v16 (copy)
    local v215 = l_peek_0(v211);
    local v216 = table.find(v215, v212);
    if v216 then
        return v16.arraySet(v211, v216, v213, v214);
    else
        return nil;
    end;
end;
v16.scope = v3:scoped(v16);
local v217 = nil;
local function _() --[[ Line: 1243 ]] --[[ Name: getComboTbl ]]
    -- upvalues: v217 (ref), v3 (copy), v16 (copy)
    if v217 then
        return v217;
    else
        v217 = table.clone(v3);
        for v218, v219 in pairs(v16) do
            v217[v218] = v219;
        end;
        return v217;
    end;
end;
v16.Scoped = function(...) --[[ Line: 1254 ]]
    -- upvalues: v3 (copy), v217 (ref), v16 (copy)
    local l_scoped_0 = v3.scoped;
    local v222;
    if v217 then
        v222 = v217;
    else
        v217 = table.clone(v3);
        for v223, v224 in pairs(v16) do
            v217[v223] = v224;
        end;
        v222 = v217;
    end;
    return l_scoped_0(v222, ...);
end;
setmetatable(v16, {
    __index = function(_, v226) --[[ Line: 1259 ]] --[[ Name: __index ]]
        -- upvalues: v16 (copy), v3 (copy)
        if v226 == "scoped" then
            return v16.Scoped;
        else
            return v3[v226];
        end;
    end
});
return table.freeze(v16);