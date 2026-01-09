local v0 = {
    __mode = "k"
};
local function _(v1) --[[ Line: 10 ]] --[[ Name: isCallable ]]
    if type(v1) == "function" then
        return true;
    else
        if type(v1) == "table" then
            local v2 = getmetatable(v1);
            if v2 and type((rawget(v2, "__call"))) == "function" then
                return true;
            end;
        end;
        return false;
    end;
end;
local function v11(v4, v5) --[[ Line: 28 ]] --[[ Name: makeEnum ]]
    local v6 = {};
    for _, v8 in ipairs(v5) do
        v6[v8] = v8;
    end;
    return (setmetatable(v6, {
        __index = function(_, v10) --[[ Line: 36 ]] --[[ Name: __index ]]
            -- upvalues: v4 (copy)
            error(string.format("%s is not in %s!", v10, v4), 2);
        end, 
        __newindex = function() --[[ Line: 39 ]] --[[ Name: __newindex ]]
            -- upvalues: v4 (copy)
            error(string.format("Creating new members in %s is not allowed!", v4), 2);
        end
    }));
end;
local v12 = nil;
v12 = {
    Kind = v11("Promise.Error.Kind", {
        "ExecutionError", 
        "AlreadyCancelled", 
        "NotResolvedInTime", 
        "TimedOut"
    })
};
v12.__index = v12;
v12.new = function(v13, v14) --[[ Line: 64 ]] --[[ Name: new ]]
    -- upvalues: v12 (ref)
    v13 = v13 or {};
    return (setmetatable({
        error = tostring(v13.error) or "[This error has no error text.]", 
        trace = v13.trace, 
        context = v13.context, 
        kind = v13.kind, 
        parent = v14, 
        createdTick = os.clock(), 
        createdTrace = debug.traceback()
    }, v12));
end;
v12.is = function(v15) --[[ Line: 77 ]] --[[ Name: is ]]
    if type(v15) == "table" then
        local v16 = getmetatable(v15);
        if type(v16) == "table" then
            local v17 = false;
            if rawget(v15, "error") ~= nil then
                v17 = type((rawget(v16, "extend"))) == "function";
            end;
            return v17;
        end;
    end;
    return false;
end;
v12.isKind = function(v18, v19) --[[ Line: 89 ]] --[[ Name: isKind ]]
    -- upvalues: v12 (ref)
    assert(v19 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil");
    return v12.is(v18) and v18.kind == v19;
end;
v12.extend = function(v20, v21) --[[ Line: 95 ]] --[[ Name: extend ]]
    -- upvalues: v12 (ref)
    v21 = v21 or {};
    v21.kind = v21.kind or v20.kind;
    return v12.new(v21, v20);
end;
v12.getErrorChain = function(v22) --[[ Line: 103 ]] --[[ Name: getErrorChain ]]
    local v23 = {
        v22
    };
    while v23[#v23].parent do
        table.insert(v23, v23[#v23].parent);
    end;
    return v23;
end;
v12.__tostring = function(v24) --[[ Line: 113 ]] --[[ Name: __tostring ]]
    local v25 = {
        string.format("-- Promise.Error(%s) --", v24.kind or "?")
    };
    for _, v27 in ipairs(v24:getErrorChain()) do
        table.insert(v25, table.concat({
            v27.trace or v27.error, 
            v27.context
        }, "\n"));
    end;
    return table.concat(v25, "\n");
end;
local function v28(...) --[[ Line: 137 ]] --[[ Name: pack ]]
    return select("#", ...), {
        ...
    };
end;
local function v30(v29, ...) --[[ Line: 144 ]] --[[ Name: packResult ]]
    return v29, select("#", ...), {
        ...
    };
end;
local function _(v31) --[[ Line: 148 ]] --[[ Name: makeErrorHandler ]]
    -- upvalues: v12 (ref)
    assert(v31 ~= nil, "traceback is nil");
    return function(v32) --[[ Line: 151 ]]
        -- upvalues: v12 (ref), v31 (copy)
        if type(v32) == "table" then
            return v32;
        else
            return v12.new({
                error = v32, 
                kind = v12.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v32), 2), 
                context = "Promise created at:\n\n" .. v31
            });
        end;
    end;
end;
local function v40(v34, v35, ...) --[[ Line: 171 ]] --[[ Name: runExecutor ]]
    -- upvalues: v30 (copy), v12 (ref)
    local l_v30_0 = v30;
    local l_xpcall_0 = xpcall;
    local l_v35_0 = v35;
    assert(v34 ~= nil, "traceback is nil");
    return l_v30_0(l_xpcall_0(l_v35_0, function(v39) --[[ Line: 151 ]]
        -- upvalues: v12 (ref), v34 (copy)
        if type(v39) == "table" then
            return v39;
        else
            return v12.new({
                error = v39, 
                kind = v12.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v39), 2), 
                context = "Promise created at:\n\n" .. v34
            });
        end;
    end, ...));
end;
local function _(v41, v42, v43, v44) --[[ Line: 179 ]] --[[ Name: createAdvancer ]]
    -- upvalues: v40 (copy)
    return function(...) --[[ Line: 180 ]]
        -- upvalues: v40 (ref), v41 (copy), v42 (copy), v43 (copy), v44 (copy)
        local v45, v46, v47 = v40(v41, v42, ...);
        if v45 then
            v43(unpack(v47, 1, v46));
            return;
        else
            v44(v47[1]);
            return;
        end;
    end;
end;
local function _(v49) --[[ Line: 191 ]] --[[ Name: isEmpty ]]
    return next(v49) == nil;
end;
local v51 = {
    Error = v12, 
    Status = v11("Promise.Status", {
        "Started", 
        "Resolved", 
        "Rejected", 
        "Cancelled"
    }), 
    _getTime = os.clock, 
    _timeEvent = game:GetService("RunService").Heartbeat, 
    _unhandledRejectionCallbacks = {}, 
    prototype = {}
};
v51.__index = v51.prototype;
v51._new = function(v52, v53, v54) --[[ Line: 230 ]] --[[ Name: _new ]]
    -- upvalues: v51 (copy), v0 (copy), v40 (copy)
    if v54 ~= nil and not v51.is(v54) then
        error("Argument #2 to Promise.new must be a promise or nil", 2);
    end;
    local v55 = {
        _thread = nil, 
        _source = v52, 
        _status = v51.Status.Started, 
        _values = nil, 
        _valuesLength = -1, 
        _unhandledRejection = true, 
        _queuedResolve = {}, 
        _queuedReject = {}, 
        _queuedFinally = {}, 
        _cancellationHook = nil, 
        _parent = v54, 
        _consumers = setmetatable({}, v0)
    };
    if v54 and v54._status == v51.Status.Started then
        v54._consumers[v55] = true;
    end;
    setmetatable(v55, v51);
    local function v56(...) --[[ Line: 278 ]] --[[ Name: resolve ]]
        -- upvalues: v55 (copy)
        v55:_resolve(...);
    end;
    local function v57(...) --[[ Line: 282 ]] --[[ Name: reject ]]
        -- upvalues: v55 (copy)
        v55:_reject(...);
    end;
    local function v59(v58) --[[ Line: 286 ]] --[[ Name: onCancel ]]
        -- upvalues: v55 (copy), v51 (ref)
        if v58 then
            if v55._status == v51.Status.Cancelled then
                v58();
            else
                v55._cancellationHook = v58;
            end;
        end;
        return v55._status == v51.Status.Cancelled;
    end;
    v55._thread = coroutine.create(function() --[[ Line: 298 ]]
        -- upvalues: v40 (ref), v55 (copy), v53 (copy), v56 (copy), v57 (copy), v59 (copy)
        local v60, _, v62 = v40(v55._source, v53, v56, v57, v59);
        if not v60 then
            v57(v62[1]);
        end;
    end);
    task.spawn(v55._thread);
    return v55;
end;
v51.new = function(v63) --[[ Line: 349 ]] --[[ Name: new ]]
    -- upvalues: v51 (copy)
    return v51._new(debug.traceback(nil, 2), v63);
end;
v51.__tostring = function(v64) --[[ Line: 353 ]] --[[ Name: __tostring ]]
    return string.format("Promise(%s)", v64._status);
end;
v51.defer = function(v65) --[[ Line: 375 ]] --[[ Name: defer ]]
    -- upvalues: v51 (copy), v40 (copy)
    local v66 = debug.traceback(nil, 2);
    local _ = nil;
    return (v51._new(v66, function(v68, v69, v70) --[[ Line: 378 ]]
        -- upvalues: v51 (ref), v40 (ref), v66 (copy), v65 (copy)
        local v71 = nil;
        v71 = v51._timeEvent:Connect(function() --[[ Line: 380 ]]
            -- upvalues: v71 (ref), v40 (ref), v66 (ref), v65 (ref), v68 (copy), v69 (copy), v70 (copy)
            v71:Disconnect();
            local v72, _, v74 = v40(v66, v65, v68, v69, v70);
            if not v72 then
                v69(v74[1]);
            end;
        end);
    end));
end;
v51.async = v51.defer;
v51.resolve = function(...) --[[ Line: 418 ]] --[[ Name: resolve ]]
    -- upvalues: v28 (copy), v51 (copy)
    local v75, v76 = v28(...);
    return v51._new(debug.traceback(nil, 2), function(v77) --[[ Line: 420 ]]
        -- upvalues: v76 (copy), v75 (copy)
        v77(unpack(v76, 1, v75));
    end);
end;
v51.reject = function(...) --[[ Line: 435 ]] --[[ Name: reject ]]
    -- upvalues: v28 (copy), v51 (copy)
    local v78, v79 = v28(...);
    return v51._new(debug.traceback(nil, 2), function(_, v81) --[[ Line: 437 ]]
        -- upvalues: v79 (copy), v78 (copy)
        v81(unpack(v79, 1, v78));
    end);
end;
v51._try = function(v82, v83, ...) --[[ Line: 446 ]] --[[ Name: _try ]]
    -- upvalues: v28 (copy), v51 (copy)
    local v84, v85 = v28(...);
    return v51._new(v82, function(v86) --[[ Line: 449 ]]
        -- upvalues: v83 (copy), v85 (copy), v84 (copy)
        v86(v83(unpack(v85, 1, v84)));
    end);
end;
v51.try = function(v87, ...) --[[ Line: 477 ]] --[[ Name: try ]]
    -- upvalues: v51 (copy)
    return v51._try(debug.traceback(nil, 2), v87, ...);
end;
v51._all = function(v88, v89, v90) --[[ Line: 486 ]] --[[ Name: _all ]]
    -- upvalues: v51 (copy)
    if type(v89) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.all"), 3);
    end;
    for v91, v92 in pairs(v89) do
        if not v51.is(v92) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(v91))), 3);
        end;
    end;
    if #v89 == 0 or v90 == 0 then
        return v51.resolve({});
    else
        return v51._new(v88, function(v93, v94, v95) --[[ Line: 504 ]]
            -- upvalues: v90 (copy), v89 (copy)
            local v96 = {};
            local v97 = {};
            local v98 = 0;
            local v99 = 0;
            local v100 = false;
            local function v103() --[[ Line: 515 ]] --[[ Name: cancel ]]
                -- upvalues: v97 (copy)
                for _, v102 in ipairs(v97) do
                    v102:cancel();
                end;
            end;
            local function v107(v104, ...) --[[ Line: 522 ]] --[[ Name: resolveOne ]]
                -- upvalues: v100 (ref), v98 (ref), v90 (ref), v96 (copy), v89 (ref), v93 (copy), v97 (copy)
                if v100 then
                    return;
                else
                    v98 = v98 + 1;
                    if v90 == nil then
                        v96[v104] = ...;
                    else
                        v96[v98] = ...;
                    end;
                    if v98 >= (v90 or #v89) then
                        v100 = true;
                        v93(v96);
                        for _, v106 in ipairs(v97) do
                            v106:cancel();
                        end;
                    end;
                    return;
                end;
            end;
            v95(v103);
            for v108, v109 in ipairs(v89) do
                v97[v108] = v109:andThen(function(...) --[[ Line: 547 ]]
                    -- upvalues: v107 (copy), v108 (copy)
                    v107(v108, ...);
                end, function(...) --[[ Line: 549 ]]
                    -- upvalues: v99 (ref), v90 (ref), v89 (ref), v97 (copy), v100 (ref), v94 (copy)
                    v99 = v99 + 1;
                    if v90 == nil or #v89 - v99 < v90 then
                        for _, v111 in ipairs(v97) do
                            v111:cancel();
                        end;
                        v100 = true;
                        v94(...);
                    end;
                end);
            end;
            if v100 then
                for _, v113 in ipairs(v97) do
                    v113:cancel();
                end;
            end;
        end);
    end;
end;
v51.all = function(v114) --[[ Line: 591 ]] --[[ Name: all ]]
    -- upvalues: v51 (copy)
    return v51._all(debug.traceback(nil, 2), v114);
end;
v51.fold = function(v115, v116, v117) --[[ Line: 620 ]] --[[ Name: fold ]]
    -- upvalues: v51 (copy)
    local v118 = false;
    assert(type(v115) == "table", "Bad argument #1 to Promise.fold: must be a table");
    local v119;
    if type(v116) == "function" then
        v119 = true;
    else
        if type(v116) == "table" then
            local v120 = getmetatable(v116);
            if v120 and type((rawget(v120, "__call"))) == "function" then
                v119 = true;
                v118 = true;
            end;
        end;
        if not v118 then
            v119 = false;
        end;
    end;
    v118 = false;
    assert(v119, "Bad argument #2 to Promise.fold: must be a function");
    local v121 = v51.resolve(v117);
    return v51.each(v115, function(v122, v123) --[[ Line: 625 ]]
        -- upvalues: v121 (ref), v116 (copy)
        v121 = v121:andThen(function(v124) --[[ Line: 626 ]]
            -- upvalues: v116 (ref), v122 (copy), v123 (copy)
            return v116(v124, v122, v123);
        end);
    end):andThen(function() --[[ Line: 629 ]]
        -- upvalues: v121 (ref)
        return v121;
    end);
end;
v51.some = function(v125, v126) --[[ Line: 653 ]] --[[ Name: some ]]
    -- upvalues: v51 (copy)
    assert(type(v126) == "number", "Bad argument #2 to Promise.some: must be a number");
    return v51._all(debug.traceback(nil, 2), v125, v126);
end;
v51.any = function(v127) --[[ Line: 677 ]] --[[ Name: any ]]
    -- upvalues: v51 (copy)
    return v51._all(debug.traceback(nil, 2), v127, 1):andThen(function(v128) --[[ Line: 678 ]]
        return v128[1];
    end);
end;
v51.allSettled = function(v129) --[[ Line: 699 ]] --[[ Name: allSettled ]]
    -- upvalues: v51 (copy)
    if type(v129) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2);
    end;
    for v130, v131 in pairs(v129) do
        if not v51.is(v131) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(v130))), 2);
        end;
    end;
    if #v129 == 0 then
        return v51.resolve({});
    else
        return v51._new(debug.traceback(nil, 2), function(v132, _, v134) --[[ Line: 717 ]]
            -- upvalues: v129 (copy)
            local v135 = {};
            local v136 = {};
            local v137 = 0;
            local function v139(v138, ...) --[[ Line: 727 ]] --[[ Name: resolveOne ]]
                -- upvalues: v137 (ref), v135 (copy), v129 (ref), v132 (copy)
                v137 = v137 + 1;
                v135[v138] = ...;
                if v137 >= #v129 then
                    v132(v135);
                end;
            end;
            v134(function() --[[ Line: 737 ]]
                -- upvalues: v136 (copy)
                for _, v141 in ipairs(v136) do
                    v141:cancel();
                end;
            end);
            for v142, v143 in ipairs(v129) do
                v136[v142] = v143:finally(function(...) --[[ Line: 746 ]]
                    -- upvalues: v139 (copy), v142 (copy)
                    v139(v142, ...);
                end);
            end;
        end);
    end;
end;
v51.race = function(v144) --[[ Line: 777 ]] --[[ Name: race ]]
    -- upvalues: v51 (copy)
    assert(type(v144) == "table", string.format("Please pass a list of promises to %s", "Promise.race"));
    for v145, v146 in pairs(v144) do
        assert(v51.is(v146), string.format("Non-promise value passed into %s at index %s", "Promise.race", (tostring(v145))));
    end;
    return v51._new(debug.traceback(nil, 2), function(v147, v148, v149) --[[ Line: 784 ]]
        -- upvalues: v144 (copy)
        local v150 = {};
        local v151 = false;
        local _ = function() --[[ Line: 788 ]] --[[ Name: cancel ]]
            -- upvalues: v150 (copy)
            for _, v153 in ipairs(v150) do
                v153:cancel();
            end;
        end;
        local _ = function(v155) --[[ Line: 794 ]] --[[ Name: finalize ]]
            -- upvalues: v150 (copy), v151 (ref)
            return function(...) --[[ Line: 795 ]]
                -- upvalues: v150 (ref), v151 (ref), v155 (copy)
                for _, v157 in ipairs(v150) do
                    v157:cancel();
                end;
                v151 = true;
                return v155(...);
            end;
        end;
        if v149(function(...) --[[ Line: 795 ]]
            -- upvalues: v150 (copy), v151 (ref), v148 (copy)
            for _, v160 in ipairs(v150) do
                v160:cancel();
            end;
            v151 = true;
            return v148(...);
        end) then
            return;
        else
            for v161, v162 in ipairs(v144) do
                v150[v161] = v162:andThen(function(...) --[[ Line: 795 ]]
                    -- upvalues: v150 (copy), v151 (ref), v147 (copy)
                    for _, v164 in ipairs(v150) do
                        v164:cancel();
                    end;
                    v151 = true;
                    return v147(...);
                end, function(...) --[[ Line: 795 ]]
                    -- upvalues: v150 (copy), v151 (ref), v148 (copy)
                    for _, v166 in ipairs(v150) do
                        v166:cancel();
                    end;
                    v151 = true;
                    return v148(...);
                end);
            end;
            if v151 then
                for _, v168 in ipairs(v150) do
                    v168:cancel();
                end;
            end;
            return;
        end;
    end);
end;
v51.each = function(v169, v170) --[[ Line: 872 ]] --[[ Name: each ]]
    -- upvalues: v51 (copy), v12 (ref)
    local v171 = false;
    assert(type(v169) == "table", string.format("Please pass a list of promises to %s", "Promise.each"));
    local v172;
    if type(v170) == "function" then
        v172 = true;
    else
        if type(v170) == "table" then
            local v173 = getmetatable(v170);
            if v173 and type((rawget(v173, "__call"))) == "function" then
                v172 = true;
                v171 = true;
            end;
        end;
        if not v171 then
            v172 = false;
        end;
    end;
    v171 = false;
    assert(v172, string.format("Please pass a handler function to %s!", "Promise.each"));
    return v51._new(debug.traceback(nil, 2), function(v174, v175, v176) --[[ Line: 876 ]]
        -- upvalues: v169 (copy), v51 (ref), v12 (ref), v170 (copy)
        local v177 = {};
        local v178 = {};
        local v179 = false;
        local _ = function() --[[ Line: 882 ]] --[[ Name: cancel ]]
            -- upvalues: v178 (copy)
            for _, v181 in ipairs(v178) do
                v181:cancel();
            end;
        end;
        v176(function() --[[ Line: 888 ]]
            -- upvalues: v179 (ref), v178 (copy)
            v179 = true;
            for _, v184 in ipairs(v178) do
                v184:cancel();
            end;
        end);
        local v185 = {};
        for v186, v187 in ipairs(v169) do
            if v51.is(v187) then
                if v187:getStatus() == v51.Status.Cancelled then
                    for _, v189 in ipairs(v178) do
                        v189:cancel();
                    end;
                    return v175(v12.new({
                        error = "Promise is cancelled", 
                        kind = v12.Kind.AlreadyCancelled, 
                        context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v186, v187._source)
                    }));
                elseif v187:getStatus() == v51.Status.Rejected then
                    for _, v191 in ipairs(v178) do
                        v191:cancel();
                    end;
                    return v175(select(2, v187:await()));
                else
                    local v192 = v187:andThen(function(...) --[[ Line: 921 ]]
                        return ...;
                    end);
                    table.insert(v178, v192);
                    v185[v186] = v192;
                end;
            else
                v185[v186] = v187;
            end;
        end;
        for v193, v194 in ipairs(v185) do
            if v51.is(v194) then
                local v195 = nil;
                local v196, v197 = v194:await();
                v195 = v196;
                v194 = v197;
                if not v195 then
                    for _, v199 in ipairs(v178) do
                        v199:cancel();
                    end;
                    return v175(v194);
                end;
            end;
            if v179 then
                return;
            else
                local v200 = v51.resolve(v170(v194, v193));
                table.insert(v178, v200);
                local v201, v202 = v200:await();
                if not v201 then
                    for _, v204 in ipairs(v178) do
                        v204:cancel();
                    end;
                    return v175(v202);
                else
                    v177[v193] = v202;
                end;
            end;
        end;
        v174(v177);
    end);
end;
v51.is = function(v205) --[[ Line: 971 ]] --[[ Name: is ]]
    -- upvalues: v51 (copy)
    local v206 = false;
    if type(v205) ~= "table" then
        return false;
    else
        local v207 = getmetatable(v205);
        if v207 == v51 then
            return true;
        elseif v207 == nil then
            local l_andThen_0 = v205.andThen;
            if type(l_andThen_0) == "function" then
                return true;
            else
                if type(l_andThen_0) == "table" then
                    local v209 = getmetatable(l_andThen_0);
                    if v209 and type((rawget(v209, "__call"))) == "function" then
                        return true;
                    end;
                end;
                return false;
            end;
        else
            if type(v207) == "table" and type((rawget(v207, "__index"))) == "table" then
                local v210 = rawget(rawget(v207, "__index"), "andThen");
                local v211;
                if type(v210) == "function" then
                    v211 = true;
                else
                    if type(v210) == "table" then
                        local v212 = getmetatable(v210);
                        if v212 and type((rawget(v212, "__call"))) == "function" then
                            v211 = true;
                            v206 = true;
                        end;
                    end;
                    if not v206 then
                        v211 = false;
                    end;
                end;
                v206 = false;
                if v211 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v51.promisify = function(v213) --[[ Line: 1020 ]] --[[ Name: promisify ]]
    -- upvalues: v51 (copy)
    return function(...) --[[ Line: 1021 ]]
        -- upvalues: v51 (ref), v213 (copy)
        return v51._try(debug.traceback(nil, 2), v213, ...);
    end;
end;
local v214 = nil;
local v215 = nil;
do
    local l_v214_0, l_v215_0 = v214, v215;
    v51.delay = function(v218) --[[ Line: 1051 ]] --[[ Name: delay ]]
        -- upvalues: v51 (copy), l_v215_0 (ref), l_v214_0 (ref)
        assert(type(v218) == "number", "Bad argument #1 to Promise.delay, must be a number.");
        if v218 < 0.016666666666666666 or v218 == 1e999 then
            v218 = 0.016666666666666666;
        end;
        return v51._new(debug.traceback(nil, 2), function(v219, _, v221) --[[ Line: 1059 ]]
            -- upvalues: v51 (ref), v218 (ref), l_v215_0 (ref), l_v214_0 (ref)
            local v222 = v51._getTime();
            local v223 = v222 + v218;
            local v224 = {
                resolve = v219, 
                startTime = v222, 
                endTime = v223
            };
            if l_v215_0 == nil then
                l_v214_0 = v224;
                l_v215_0 = v51._timeEvent:Connect(function() --[[ Line: 1071 ]]
                    -- upvalues: v51 (ref), l_v214_0 (ref), l_v215_0 (ref)
                    local v225 = v51._getTime();
                    while l_v214_0 ~= nil and l_v214_0.endTime < v225 do
                        local l_l_v214_0_0 = l_v214_0;
                        l_v214_0 = l_l_v214_0_0.next;
                        if l_v214_0 == nil then
                            l_v215_0:Disconnect();
                            l_v215_0 = nil;
                        else
                            l_v214_0.previous = nil;
                        end;
                        l_l_v214_0_0.resolve(v51._getTime() - l_l_v214_0_0.startTime);
                    end;
                end);
            elseif l_v214_0.endTime < v223 then
                local l_l_v214_0_1 = l_v214_0;
                local l_next_0 = l_l_v214_0_1.next;
                while l_next_0 ~= nil and l_next_0.endTime < v223 do
                    l_l_v214_0_1 = l_next_0;
                    l_next_0 = l_l_v214_0_1.next;
                end;
                l_l_v214_0_1.next = v224;
                v224.previous = l_l_v214_0_1;
                if l_next_0 ~= nil then
                    v224.next = l_next_0;
                    l_next_0.previous = v224;
                end;
            else
                v224.next = l_v214_0;
                l_v214_0.previous = v224;
                l_v214_0 = v224;
            end;
            v221(function() --[[ Line: 1116 ]]
                -- upvalues: v224 (copy), l_v214_0 (ref), l_v215_0 (ref)
                local l_next_1 = v224.next;
                if l_v214_0 == v224 then
                    if l_next_1 == nil then
                        l_v215_0:Disconnect();
                        l_v215_0 = nil;
                    else
                        l_next_1.previous = nil;
                    end;
                    l_v214_0 = l_next_1;
                    return;
                else
                    local l_previous_0 = v224.previous;
                    l_previous_0.next = l_next_1;
                    if l_next_1 ~= nil then
                        l_next_1.previous = l_previous_0;
                    end;
                    return;
                end;
            end);
        end);
    end;
end;
v214 = function(v231, v232, v233) --[[ Line: 1180 ]] --[[ Name: timeout ]]
    -- upvalues: v51 (copy), v12 (ref)
    local v234 = debug.traceback(nil, 2);
    return v51.race({
        v51.delay(v232):andThen(function() --[[ Line: 1184 ]]
            -- upvalues: v51 (ref), v233 (copy), v12 (ref), v232 (copy), v234 (copy)
            return v51.reject(v233 == nil and v12.new({
                kind = v12.Kind.TimedOut, 
                error = "Timed out", 
                context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", v232, v234)
            }) or v233);
        end), 
        v231
    });
end;
v51.prototype.timeout = v214;
v51.prototype.getStatus = function(v235) --[[ Line: 1204 ]] --[[ Name: getStatus ]]
    return v235._status;
end;
v51.prototype._andThen = function(v236, v237, v238, v239) --[[ Line: 1213 ]] --[[ Name: _andThen ]]
    -- upvalues: v51 (copy), v40 (copy)
    v236._unhandledRejection = false;
    if v236._status == v51.Status.Cancelled then
        local v240 = v51.new(function() --[[ Line: 1218 ]]

        end);
        v240:cancel();
        return v240;
    else
        return v51._new(v237, function(v241, v242, v243) --[[ Line: 1225 ]]
            -- upvalues: v238 (copy), v237 (copy), v40 (ref), v239 (copy), v236 (copy), v51 (ref)
            local l_v241_0 = v241;
            if v238 then
                local l_v237_0 = v237;
                local l_v238_0 = v238;
                local l_l_v237_0_0 = l_v237_0 --[[ copy: 4 -> 7 ]];
                local l_l_v238_0_0 = l_v238_0 --[[ copy: 5 -> 8 ]];
                l_v241_0 = function(...) --[[ Line: 180 ]]
                    -- upvalues: v40 (ref), l_l_v237_0_0 (copy), l_l_v238_0_0 (copy), v241 (copy), v242 (copy)
                    local v249, v250, v251 = v40(l_l_v237_0_0, l_l_v238_0_0, ...);
                    if v249 then
                        v241(unpack(v251, 1, v250));
                        return;
                    else
                        v242(v251[1]);
                        return;
                    end;
                end;
            end;
            local l_v242_0 = v242;
            if v239 then
                local l_v237_1 = v237;
                local l_v239_0 = v239;
                l_v242_0 = function(...) --[[ Line: 180 ]]
                    -- upvalues: v40 (ref), l_v237_1 (copy), l_v239_0 (copy), v241 (copy), v242 (copy)
                    local v255, v256, v257 = v40(l_v237_1, l_v239_0, ...);
                    if v255 then
                        v241(unpack(v257, 1, v256));
                        return;
                    else
                        v242(v257[1]);
                        return;
                    end;
                end;
            end;
            if v236._status == v51.Status.Started then
                table.insert(v236._queuedResolve, l_v241_0);
                table.insert(v236._queuedReject, l_v242_0);
                v243(function() --[[ Line: 1244 ]]
                    -- upvalues: v236 (ref), v51 (ref), l_v241_0 (ref), l_v242_0 (ref)
                    if v236._status == v51.Status.Started then
                        table.remove(v236._queuedResolve, table.find(v236._queuedResolve, l_v241_0));
                        table.remove(v236._queuedReject, table.find(v236._queuedReject, l_v242_0));
                    end;
                end);
            elseif v236._status == v51.Status.Resolved then
                l_v241_0(unpack(v236._values, 1, v236._valuesLength));
            elseif v236._status == v51.Status.Rejected then
                l_v242_0(unpack(v236._values, 1, v236._valuesLength));
            end;
        end, v236);
    end;
end;
v51.prototype.andThen = function(v258, v259, v260) --[[ Line: 1283 ]] --[[ Name: andThen ]]
    local v261 = false;
    local v262 = false;
    local v263 = true;
    if v259 ~= nil then
        if type(v259) == "function" then
            v263 = true;
        else
            if type(v259) == "table" then
                local v264 = getmetatable(v259);
                if v264 and type((rawget(v264, "__call"))) == "function" then
                    v263 = true;
                    v261 = true;
                end;
            end;
            if not v261 then
                v263 = false;
            end;
        end;
    end;
    v261 = false;
    assert(v263, string.format("Please pass a handler function to %s!", "Promise:andThen"));
    v263 = true;
    if v260 ~= nil then
        if type(v260) == "function" then
            v263 = true;
        else
            if type(v260) == "table" then
                local v265 = getmetatable(v260);
                if v265 and type((rawget(v265, "__call"))) == "function" then
                    v263 = true;
                    v262 = true;
                end;
            end;
            if not v262 then
                v263 = false;
            end;
        end;
    end;
    v262 = false;
    assert(v263, string.format("Please pass a handler function to %s!", "Promise:andThen"));
    return v258:_andThen(debug.traceback(nil, 2), v259, v260);
end;
v51.prototype.catch = function(v266, v267) --[[ Line: 1310 ]] --[[ Name: catch ]]
    local v268 = false;
    local v269 = true;
    if v267 ~= nil then
        if type(v267) == "function" then
            v269 = true;
        else
            if type(v267) == "table" then
                local v270 = getmetatable(v267);
                if v270 and type((rawget(v270, "__call"))) == "function" then
                    v269 = true;
                    v268 = true;
                end;
            end;
            if not v268 then
                v269 = false;
            end;
        end;
    end;
    v268 = false;
    assert(v269, string.format("Please pass a handler function to %s!", "Promise:catch"));
    return v266:_andThen(debug.traceback(nil, 2), nil, v267);
end;
v51.prototype.tap = function(v271, v272) --[[ Line: 1331 ]] --[[ Name: tap ]]
    -- upvalues: v51 (copy), v28 (copy)
    local v273 = false;
    local v274;
    if type(v272) == "function" then
        v274 = true;
    else
        if type(v272) == "table" then
            local v275 = getmetatable(v272);
            if v275 and type((rawget(v275, "__call"))) == "function" then
                v274 = true;
                v273 = true;
            end;
        end;
        if not v273 then
            v274 = false;
        end;
    end;
    v273 = false;
    assert(v274, string.format("Please pass a handler function to %s!", "Promise:tap"));
    return v271:_andThen(debug.traceback(nil, 2), function(...) --[[ Line: 1333 ]]
        -- upvalues: v272 (copy), v51 (ref), v28 (ref)
        local v276 = v272(...);
        if v51.is(v276) then
            local v277, v278 = v28(...);
            return v276:andThen(function() --[[ Line: 1338 ]]
                -- upvalues: v278 (copy), v277 (copy)
                return unpack(v278, 1, v277);
            end);
        else
            return ...;
        end;
    end);
end;
v51.prototype.andThenCall = function(v279, v280, ...) --[[ Line: 1366 ]] --[[ Name: andThenCall ]]
    -- upvalues: v28 (copy)
    local v281 = false;
    local v282;
    if type(v280) == "function" then
        v282 = true;
    else
        if type(v280) == "table" then
            local v283 = getmetatable(v280);
            if v283 and type((rawget(v283, "__call"))) == "function" then
                v282 = true;
                v281 = true;
            end;
        end;
        if not v281 then
            v282 = false;
        end;
    end;
    v281 = false;
    assert(v282, string.format("Please pass a handler function to %s!", "Promise:andThenCall"));
    local v284;
    v284, v282 = v28(...);
    return v279:_andThen(debug.traceback(nil, 2), function() --[[ Line: 1369 ]]
        -- upvalues: v280 (copy), v282 (copy), v284 (copy)
        return v280(unpack(v282, 1, v284));
    end);
end;
v51.prototype.andThenReturn = function(v285, ...) --[[ Line: 1396 ]] --[[ Name: andThenReturn ]]
    -- upvalues: v28 (copy)
    local v286, v287 = v28(...);
    return v285:_andThen(debug.traceback(nil, 2), function() --[[ Line: 1398 ]]
        -- upvalues: v287 (copy), v286 (copy)
        return unpack(v287, 1, v286);
    end);
end;
v51.prototype.cancel = function(v288) --[[ Line: 1414 ]] --[[ Name: cancel ]]
    -- upvalues: v51 (copy)
    if v288._status ~= v51.Status.Started then
        return;
    else
        v288._status = v51.Status.Cancelled;
        if v288._cancellationHook then
            v288._cancellationHook();
        end;
        coroutine.close(v288._thread);
        if v288._parent then
            v288._parent:_consumerCancelled(v288);
        end;
        for v289 in pairs(v288._consumers) do
            v289:cancel();
        end;
        v288:_finalize();
        return;
    end;
end;
v51.prototype._consumerCancelled = function(v290, v291) --[[ Line: 1442 ]] --[[ Name: _consumerCancelled ]]
    -- upvalues: v51 (copy)
    if v290._status ~= v51.Status.Started then
        return;
    else
        v290._consumers[v291] = nil;
        if next(v290._consumers) == nil then
            v290:cancel();
        end;
        return;
    end;
end;
v51.prototype._finally = function(v292, v293, v294) --[[ Line: 1458 ]] --[[ Name: _finally ]]
    -- upvalues: v51 (copy)
    v292._unhandledRejection = false;
    return (v51._new(v293, function(v295, v296, v297) --[[ Line: 1461 ]]
        -- upvalues: v292 (copy), v294 (copy), v51 (ref)
        local v298 = nil;
        v297(function() --[[ Line: 1464 ]]
            -- upvalues: v292 (ref), v298 (ref)
            v292:_consumerCancelled(v292);
            if v298 then
                v298:cancel();
            end;
        end);
        local l_v295_0 = v295;
        if v294 then
            l_v295_0 = function(...) --[[ Line: 1477 ]]
                -- upvalues: v294 (ref), v51 (ref), v298 (ref), v295 (copy), v292 (ref), v296 (copy)
                local v300 = v294(...);
                if v51.is(v300) then
                    v298 = v300;
                    v300:finally(function(v301) --[[ Line: 1484 ]]
                        -- upvalues: v51 (ref), v295 (ref), v292 (ref)
                        if v301 ~= v51.Status.Rejected then
                            v295(v292);
                        end;
                    end):catch(function(...) --[[ Line: 1489 ]]
                        -- upvalues: v296 (ref)
                        v296(...);
                    end);
                    return;
                else
                    v295(v292);
                    return;
                end;
            end;
        end;
        if v292._status == v51.Status.Started then
            table.insert(v292._queuedFinally, l_v295_0);
        else
            l_v295_0(v292._status);
        end;
    end));
end;
v51.prototype.finally = function(v302, v303) --[[ Line: 1559 ]] --[[ Name: finally ]]
    local v304 = false;
    local v305 = true;
    if v303 ~= nil then
        if type(v303) == "function" then
            v305 = true;
        else
            if type(v303) == "table" then
                local v306 = getmetatable(v303);
                if v306 and type((rawget(v306, "__call"))) == "function" then
                    v305 = true;
                    v304 = true;
                end;
            end;
            if not v304 then
                v305 = false;
            end;
        end;
    end;
    v304 = false;
    assert(v305, string.format("Please pass a handler function to %s!", "Promise:finally"));
    return v302:_finally(debug.traceback(nil, 2), v303);
end;
v51.prototype.finallyCall = function(v307, v308, ...) --[[ Line: 1573 ]] --[[ Name: finallyCall ]]
    -- upvalues: v28 (copy)
    local v309 = false;
    local v310;
    if type(v308) == "function" then
        v310 = true;
    else
        if type(v308) == "table" then
            local v311 = getmetatable(v308);
            if v311 and type((rawget(v311, "__call"))) == "function" then
                v310 = true;
                v309 = true;
            end;
        end;
        if not v309 then
            v310 = false;
        end;
    end;
    v309 = false;
    assert(v310, string.format("Please pass a handler function to %s!", "Promise:finallyCall"));
    local v312;
    v312, v310 = v28(...);
    return v307:_finally(debug.traceback(nil, 2), function() --[[ Line: 1576 ]]
        -- upvalues: v308 (copy), v310 (copy), v312 (copy)
        return v308(unpack(v310, 1, v312));
    end);
end;
v51.prototype.finallyReturn = function(v313, ...) --[[ Line: 1599 ]] --[[ Name: finallyReturn ]]
    -- upvalues: v28 (copy)
    local v314, v315 = v28(...);
    return v313:_finally(debug.traceback(nil, 2), function() --[[ Line: 1601 ]]
        -- upvalues: v315 (copy), v314 (copy)
        return unpack(v315, 1, v314);
    end);
end;
v51.prototype.awaitStatus = function(v316) --[[ Line: 1613 ]] --[[ Name: awaitStatus ]]
    -- upvalues: v51 (copy)
    v316._unhandledRejection = false;
    if v316._status == v51.Status.Started then
        local v317 = coroutine.running();
        v316:finally(function() --[[ Line: 1620 ]]
            -- upvalues: v317 (copy)
            task.spawn(v317);
        end):catch(function() --[[ Line: 1626 ]]

        end);
        coroutine.yield();
    end;
    if v316._status == v51.Status.Resolved then
        return v316._status, unpack(v316._values, 1, v316._valuesLength);
    elseif v316._status == v51.Status.Rejected then
        return v316._status, unpack(v316._values, 1, v316._valuesLength);
    else
        return v316._status;
    end;
end;
v214 = function(v318, ...) --[[ Line: 1641 ]] --[[ Name: awaitHelper ]]
    -- upvalues: v51 (copy)
    return v318 == v51.Status.Resolved, ...;
end;
v51.prototype.await = function(v319) --[[ Line: 1666 ]] --[[ Name: await ]]
    -- upvalues: v214 (copy)
    return v214(v319:awaitStatus());
end;
v215 = function(v320, ...) --[[ Line: 1670 ]] --[[ Name: expectHelper ]]
    -- upvalues: v51 (copy)
    if v320 ~= v51.Status.Resolved then
        error(... == nil and "Expected Promise rejected with no value." or ..., 3);
    end;
    return ...;
end;
v51.prototype.expect = function(v321) --[[ Line: 1703 ]] --[[ Name: expect ]]
    -- upvalues: v215 (copy)
    return v215(v321:awaitStatus());
end;
v51.prototype.awaitValue = v51.prototype.expect;
v51.prototype._unwrap = function(v322) --[[ Line: 1717 ]] --[[ Name: _unwrap ]]
    -- upvalues: v51 (copy)
    if v322._status == v51.Status.Started then
        error("Promise has not resolved or rejected.", 2);
    end;
    return v322._status == v51.Status.Resolved, unpack(v322._values, 1, v322._valuesLength);
end;
local function v332(v323, ...) --[[ Line: 1727 ]] --[[ Name: _resolve ]]
    -- upvalues: v51 (copy), v12 (ref), v28 (copy)
    if v323._status ~= v51.Status.Started then
        if v51.is((...)) then
            (...):_consumerCancelled(v323);
        end;
        return;
    elseif v51.is((...)) then
        if select("#", ...) > 1 then
            local v324 = string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", v323._source);
            warn(v324);
        end;
        local v325 = ...;
        local v327 = v325:andThen(function(...) --[[ Line: 1748 ]]
            -- upvalues: v323 (copy)
            v323:_resolve(...);
        end, function(...) --[[ Line: 1750 ]]
            -- upvalues: v325 (copy), v12 (ref), v323 (copy)
            local v326 = v325._values[1];
            if v325._error then
                v326 = v12.new({
                    error = v325._error, 
                    kind = v12.Kind.ExecutionError, 
                    context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
                });
            end;
            if v12.isKind(v326, v12.Kind.ExecutionError) then
                return v323:_reject(v326:extend({
                    error = "This Promise was chained to a Promise that errored.", 
                    trace = "", 
                    context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", v323._source)
                }));
            else
                v323:_reject(...);
                return;
            end;
        end);
        if v327._status == v51.Status.Cancelled then
            v323:cancel();
            return;
        else
            if v327._status == v51.Status.Started then
                v323._parent = v327;
                v327._consumers[v323] = true;
            end;
            return;
        end;
    else
        v323._status = v51.Status.Resolved;
        local v328, v329 = v28(...);
        v323._valuesLength = v328;
        v323._values = v329;
        for _, v331 in ipairs(v323._queuedResolve) do
            coroutine.wrap(v331)(...);
        end;
        v323:_finalize();
        return;
    end;
end;
v51.prototype._resolve = v332;
v51.prototype._reject = function(v333, ...) --[[ Line: 1798 ]] --[[ Name: _reject ]]
    -- upvalues: v51 (copy), v28 (copy)
    if v333._status ~= v51.Status.Started then
        return;
    else
        v333._status = v51.Status.Rejected;
        local v334, v335 = v28(...);
        v333._valuesLength = v334;
        v333._values = v335;
        v335 = v333._queuedReject;
        if not (next(v335) == nil) then
            for _, v337 in ipairs(v333._queuedReject) do
                coroutine.wrap(v337)(...);
            end;
        else
            v334 = tostring((...));
            coroutine.wrap(function() --[[ Line: 1820 ]]
                -- upvalues: v51 (ref), v333 (copy), v334 (copy)
                v51._timeEvent:Wait();
                if not v333._unhandledRejection then
                    return;
                else
                    local v338 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", v334, v333._source);
                    for _, v340 in ipairs(v51._unhandledRejectionCallbacks) do
                        task.spawn(v340, v333, unpack(v333._values, 1, v333._valuesLength));
                    end;
                    if v51.TEST then
                        return;
                    else
                        warn(v338);
                        return;
                    end;
                end;
            end)();
        end;
        v333:_finalize();
        return;
    end;
end;
v51.prototype._finalize = function(v341) --[[ Line: 1852 ]] --[[ Name: _finalize ]]
    -- upvalues: v51 (copy)
    for _, v343 in ipairs(v341._queuedFinally) do
        coroutine.wrap(v343)(v341._status);
    end;
    v341._queuedFinally = nil;
    v341._queuedReject = nil;
    v341._queuedResolve = nil;
    if not v51.TEST then
        v341._parent = nil;
        v341._consumers = nil;
    end;
    task.defer(coroutine.close, v341._thread);
end;
v332 = function(v344, v345) --[[ Line: 1889 ]] --[[ Name: now ]]
    -- upvalues: v51 (copy), v12 (ref)
    local v346 = debug.traceback(nil, 2);
    if v344._status == v51.Status.Resolved then
        return v344:_andThen(v346, function(...) --[[ Line: 1892 ]]
            return ...;
        end);
    else
        return v51.reject(v345 == nil and v12.new({
            kind = v12.Kind.NotResolvedInTime, 
            error = "This Promise was not resolved in time for :now()", 
            context = ":now() was called at:\n\n" .. v346
        }) or v345);
    end;
end;
v51.prototype.now = v332;
v51.retry = function(v347, v348, ...) --[[ Line: 1934 ]] --[[ Name: retry ]]
    -- upvalues: v51 (copy)
    local v349 = false;
    local v350;
    if type(v347) == "function" then
        v350 = true;
    else
        if type(v347) == "table" then
            local v351 = getmetatable(v347);
            if v351 and type((rawget(v351, "__call"))) == "function" then
                v350 = true;
                v349 = true;
            end;
        end;
        if not v349 then
            v350 = false;
        end;
    end;
    v349 = false;
    assert(v350, "Parameter #1 to Promise.retry must be a function");
    assert(type(v348) == "number", "Parameter #2 to Promise.retry must be a number");
    local v352 = {
        ...
    };
    v350 = select("#", ...);
    return v51.resolve(v347(...)):catch(function(...) --[[ Line: 1940 ]]
        -- upvalues: v348 (copy), v51 (ref), v347 (copy), v352 (copy), v350 (copy)
        if v348 > 0 then
            return v51.retry(v347, v348 - 1, unpack(v352, 1, v350));
        else
            return v51.reject(...);
        end;
    end);
end;
v51.retryWithDelay = function(v353, v354, v355, ...) --[[ Line: 1962 ]] --[[ Name: retryWithDelay ]]
    -- upvalues: v51 (copy)
    local v356 = false;
    local v357;
    if type(v353) == "function" then
        v357 = true;
    else
        if type(v353) == "table" then
            local v358 = getmetatable(v353);
            if v358 and type((rawget(v358, "__call"))) == "function" then
                v357 = true;
                v356 = true;
            end;
        end;
        if not v356 then
            v357 = false;
        end;
    end;
    v356 = false;
    assert(v357, "Parameter #1 to Promise.retry must be a function");
    assert(type(v354) == "number", "Parameter #2 (times) to Promise.retry must be a number");
    assert(type(v355) == "number", "Parameter #3 (seconds) to Promise.retry must be a number");
    local v359 = {
        ...
    };
    v357 = select("#", ...);
    return v51.resolve(v353(...)):catch(function(...) --[[ Line: 1969 ]]
        -- upvalues: v354 (copy), v51 (ref), v355 (copy), v353 (copy), v359 (copy), v357 (copy)
        if v354 > 0 then
            v51.delay(v355):await();
            return v51.retryWithDelay(v353, v354 - 1, v355, unpack(v359, 1, v357));
        else
            return v51.reject(...);
        end;
    end);
end;
v51.fromEvent = function(v360, v361) --[[ Line: 2004 ]] --[[ Name: fromEvent ]]
    -- upvalues: v51 (copy)
    v361 = v361 or function() --[[ Line: 2005 ]]
        return true;
    end;
    return v51._new(debug.traceback(nil, 2), function(v362, _, v364) --[[ Line: 2009 ]]
        -- upvalues: v360 (copy), v361 (ref)
        local v365 = nil;
        local v366 = false;
        local function v367() --[[ Line: 2013 ]] --[[ Name: disconnect ]]
            -- upvalues: v365 (ref)
            v365:Disconnect();
            v365 = nil;
        end;
        v365 = v360:Connect(function(...) --[[ Line: 2022 ]]
            -- upvalues: v361 (ref), v362 (copy), v365 (ref), v366 (ref)
            local v368 = v361(...);
            if v368 == true then
                v362(...);
                if v365 then
                    v365:Disconnect();
                    v365 = nil;
                    return;
                else
                    v366 = true;
                    return;
                end;
            else
                if type(v368) ~= "boolean" then
                    error("Promise.fromEvent predicate should always return a boolean");
                end;
                return;
            end;
        end);
        if v366 and v365 then
            return v367();
        else
            v364(v367);
            return;
        end;
    end);
end;
v51.onUnhandledRejection = function(v369) --[[ Line: 2056 ]] --[[ Name: onUnhandledRejection ]]
    -- upvalues: v51 (copy)
    table.insert(v51._unhandledRejectionCallbacks, v369);
    return function() --[[ Line: 2059 ]]
        -- upvalues: v51 (ref), v369 (copy)
        local v370 = table.find(v51._unhandledRejectionCallbacks, v369);
        if v370 then
            table.remove(v51._unhandledRejectionCallbacks, v370);
        end;
    end;
end;
return v51;