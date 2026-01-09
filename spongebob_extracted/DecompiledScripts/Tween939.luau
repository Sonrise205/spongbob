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
    -- upvalues: v6 (copy), v9 (copy), v8 (copy), v7 (copy), v15 (copy), v13 (copy), v3 (copy), v5 (copy)
    local v19 = os.clock();
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
    local function v24() --[[ Line: 84 ]]
        -- upvalues: v22 (copy)
        v22.scope = nil;
        for v23 in pairs(v22.dependencySet) do
            v23.dependentSet[v22] = nil;
        end;
    end;
    v22.oldestChore = v24;
    v13[v22.oldestChore] = "Tween";
    table.insert(v16, v24);
    if v20 ~= nil then
        v3.bOutlivesA(v16, v22.oldestChore, v20.scope, v20.oldestChore, v3.formatters.animationGoal);
    end;
    local v25 = v6(v18);
    if v25 ~= nil then
        v3.bOutlivesA(v16, v22.oldestChore, v25.scope, v25.oldestChore, v3.formatters.parameter, "tween info");
    end;
    v5(v22, true);
    return v22;
end;
v14._evaluate = function(v27) --[[ Line: 118 ]] --[[ Name: _evaluate ]]
    -- upvalues: v6 (copy), v4 (copy), v7 (copy), v2 (copy), v12 (copy), v11 (copy), v10 (copy)
    local v28 = v6(v27._goal);
    if v28 == nil then
        v27._EXTREMELY_DANGEROUS_usedAsValue = v27._goal;
        return false;
    else
        v4(v27, v28);
        local v29 = v7(v28);
        if v29 ~= v29 then
            v2.logWarn("tweenNanGoal");
            return false;
        else
            local l__stopwatch_0 = v27._stopwatch;
            local v31 = v7(v27._tweenInfo);
            if v27._activeTo ~= v29 or v27._activeElapsed < v27._activeDuration and v27._activeTweenInfo ~= v31 then
                v27._activeDuration = v12(v31);
                v27._activeFrom = v27._EXTREMELY_DANGEROUS_usedAsValue;
                v27._activeTo = v29;
                v27._activeTweenInfo = v31;
                l__stopwatch_0:zero();
                l__stopwatch_0:unpause();
            end;
            v4(v27, l__stopwatch_0);
            v27._activeElapsed = v7(l__stopwatch_0);
            if v27._activeFrom == v27._activeTo or v27._activeElapsed >= v27._activeDuration or typeof(v27._activeTo) ~= typeof(v27._activeFrom) then
                v27._activeFrom = v27._activeTo;
                v27._activeElapsed = v27._activeDuration;
                l__stopwatch_0:pause();
            end;
            local v32 = v11(v31, v27._activeElapsed);
            local l__EXTREMELY_DANGEROUS_usedAsValue_0 = v27._EXTREMELY_DANGEROUS_usedAsValue;
            local v34 = v10(v27._activeFrom, v27._activeTo, v32);
            if v34 ~= v34 then
                v2.logWarn("tweenNanMotion");
                v34 = v27._activeTo;
            end;
            v27._EXTREMELY_DANGEROUS_usedAsValue = v34;
            return l__EXTREMELY_DANGEROUS_usedAsValue_0 ~= v34;
        end;
    end;
end;
table.freeze(v14);
return v26;