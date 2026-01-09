local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.Animation.TweenScheduler);
local v4 = require(l_Parent_0.Dependencies.useDependency);
local v5 = require(l_Parent_0.Dependencies.initDependency);
local v6 = require(l_Parent_0.Logging.logError);
local v7 = require(l_Parent_0.Logging.logErrorNonFatal);
local v8 = require(l_Parent_0.Utility.xtypeof);
local v9 = {};
local v10 = {
    __index = v9
};
local v11 = {
    __mode = "k"
};
v9.get = function(v12, v13) --[[ Line: 27 ]] --[[ Name: get ]]
    -- upvalues: v4 (copy)
    if v13 ~= false then
        v4(v12);
    end;
    return v12._currentValue;
end;
v9.update = function(v14) --[[ Line: 38 ]] --[[ Name: update ]]
    -- upvalues: v7 (copy), v3 (copy)
    local v15 = v14._goalState:get(false);
    if v15 == v14._nextValue and not v14._currentlyAnimating then
        return false;
    else
        local l__tweenInfo_0 = v14._tweenInfo;
        if v14._tweenInfoIsState then
            l__tweenInfo_0 = l__tweenInfo_0:get();
        end;
        if typeof(l__tweenInfo_0) ~= "TweenInfo" then
            v7("mistypedTweenInfo", nil, (typeof(l__tweenInfo_0)));
            return false;
        else
            v14._prevValue = v14._currentValue;
            v14._nextValue = v15;
            v14._currentTweenStartTime = os.clock();
            v14._currentTweenInfo = l__tweenInfo_0;
            local v17 = l__tweenInfo_0.DelayTime + l__tweenInfo_0.Time;
            if l__tweenInfo_0.Reverses then
                v17 = v17 + l__tweenInfo_0.Time;
            end;
            v14._currentTweenDuration = v17 * (l__tweenInfo_0.RepeatCount + 1);
            v3.add(v14);
            return false;
        end;
    end;
end;
return function(v18, v19) --[[ Line: 77 ]] --[[ Name: Tween ]]
    -- upvalues: v8 (copy), v6 (copy), v11 (copy), v10 (copy), v5 (copy)
    local v20 = v18:get(false);
    if v19 == nil then
        v19 = TweenInfo.new();
    end;
    local v21 = {
        [v18] = true
    };
    local v22 = v8(v19) == "State";
    if v22 then
        v21[v19] = true;
    end;
    local l_v19_0 = v19;
    if v22 then
        l_v19_0 = l_v19_0:get();
    end;
    if typeof(l_v19_0) ~= "TweenInfo" then
        v6("mistypedTweenInfo", nil, (typeof(l_v19_0)));
    end;
    local v24 = setmetatable({
        type = "State", 
        kind = "Tween", 
        dependencySet = v21, 
        dependentSet = setmetatable({}, v11), 
        _goalState = v18, 
        _tweenInfo = v19, 
        _tweenInfoIsState = v22, 
        _prevValue = v20, 
        _nextValue = v20, 
        _currentValue = v20, 
        _currentTweenInfo = v19, 
        _currentTweenDuration = 0, 
        _currentTweenStartTime = 0, 
        _currentlyAnimating = false
    }, v10);
    v5(v24);
    v18.dependentSet[v24] = true;
    return v24;
end;