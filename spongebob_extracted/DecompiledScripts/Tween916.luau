local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Memory.checkLifetime);
local v4 = require(l_Parent_0.Graph.depend);
local v5 = require(l_Parent_0.Graph.evaluate);
local v6 = require(l_Parent_0.State.castToState);
local v7 = require(l_Parent_0.State.peek);
local v8 = require(l_Parent_0.Animation.ExternalTime);
local v9 = require(l_Parent_0.Animation.Stopwatch);
local v10 = require(l_Parent_0.Animation.lerpType);
local v11 = require(l_Parent_0.Animation.getTweenRatio);
local v12 = require(l_Parent_0.Animation.getTweenDuration);
local v13 = require(l_Parent_0.Utility.nicknames);
local v14 = {
    type = "State", 
    kind = "Tween", 
    timeliness = "eager"
};
local v15 = table.freeze({
    __index = v14
});
local function v26(v16, v17, v18) --[[ Line: 51 ]] --[[ Name: Tween ]]
    -- upvalues: v6 (copy), v2 (copy), v9 (copy), v8 (copy), v7 (copy), v15 (copy), v13 (copy), v3 (copy), v5 (copy)
    local v19 = os.clock();
    if v6(v16) then
        v2.logError("scopeMissing", nil, "Tweens", "myScope:Tween(goalState, tweenInfo)");
    end;
    local v20 = v6(v17);
    local v21 = nil;
    if v20 ~= nil then
        v21 = v9(v16, v8(v16));
    end;
    local v22 = setmetatable({
        createdAt = v19, 
        dependencySet = {}, 
        dependentSet = {}, 
        lastChange = nil, 
        scope = v16, 
        validity = "invalid", 
        _activeDuration = nil, 
        _activeElapsed = nil, 
        _activeFrom = nil, 
        _activeTo = nil, 
        _activeTweenInfo = nil, 
        _EXTREMELY_DANGEROUS_usedAsValue = v7(v17), 
        _goal = v17, 
        _stopwatch = v21, 
        _tweenInfo = v18 or TweenInfo.new()
    }, v15);
    local function v24() --[[ Line: 87 ]]
        -- upvalues: v22 (copy)
        v22.scope = nil;
        for v23 in pairs(v22.dependencySet) do
            v23.dependentSet[v22] = nil;
        end;
    end;
    v22.oldestTask = v24;
    v13[v22.oldestTask] = "Tween";
    table.insert(v16, v24);
    if v20 ~= nil then
        v3.bOutlivesA(v16, v22.oldestTask, v20.scope, v20.oldestTask, v3.formatters.animationGoal);
    end;
    local v25 = v6(v18);
    if v25 ~= nil then
        v3.bOutlivesA(v16, v22.oldestTask, v25.scope, v25.oldestTask, v3.formatters.parameter, "tween info");
    end;
    v5(v22, true);
    return v22;
end;
v14.get = function(_) --[[ Line: 121 ]] --[[ Name: get ]]
    -- upvalues: v2 (copy)
    return v2.logError("stateGetWasRemoved");
end;
v14._evaluate = function(v28) --[[ Line: 127 ]] --[[ Name: _evaluate ]]
    -- upvalues: v6 (copy), v4 (copy), v7 (copy), v2 (copy), v12 (copy), v11 (copy), v10 (copy)
    local v29 = v6(v28._goal);
    if v29 == nil then
        v28._EXTREMELY_DANGEROUS_usedAsValue = v28._goal;
        return false;
    else
        v4(v28, v29);
        local v30 = v7(v29);
        if v30 ~= v30 then
            v2.logWarn("tweenNanGoal");
            return false;
        else
            local l__stopwatch_0 = v28._stopwatch;
            local v32 = v7(v28._tweenInfo);
            if v28._activeTo ~= v30 or v28._activeElapsed < v28._activeDuration and v28._activeTweenInfo ~= v32 then
                v28._activeDuration = v12(v32);
                v28._activeFrom = v28._EXTREMELY_DANGEROUS_usedAsValue;
                v28._activeTo = v30;
                v28._activeTweenInfo = v32;
                l__stopwatch_0:zero();
                l__stopwatch_0:unpause();
            end;
            v4(v28, l__stopwatch_0);
            v28._activeElapsed = v7(l__stopwatch_0);
            if v28._activeFrom == v28._activeTo or v28._activeElapsed >= v28._activeDuration or typeof(v28._activeTo) ~= typeof(v28._activeFrom) then
                v28._activeFrom = v28._activeTo;
                v28._activeElapsed = v28._activeDuration;
                l__stopwatch_0:pause();
            end;
            local v33 = v11(v32, v28._activeElapsed);
            local l__EXTREMELY_DANGEROUS_usedAsValue_0 = v28._EXTREMELY_DANGEROUS_usedAsValue;
            local v35 = v10(v28._activeFrom, v28._activeTo, v33);
            if v35 ~= v35 then
                v2.logWarn("tweenNanMotion");
                v35 = v28._activeTo;
            end;
            v28._EXTREMELY_DANGEROUS_usedAsValue = v35;
            return l__EXTREMELY_DANGEROUS_usedAsValue_0 ~= v35;
        end;
    end;
end;
table.freeze(v14);
return v26;