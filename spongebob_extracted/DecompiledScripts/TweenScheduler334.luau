local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.Animation.lerpType);
local v4 = require(l_Parent_0.Animation.getTweenRatio);
local v5 = require(l_Parent_0.Dependencies.updateAll);
local v6 = {};
local v7 = {
    __mode = "k"
};
local v8 = {};
setmetatable(v8, v7);
v6.add = function(v9) --[[ Line: 29 ]] --[[ Name: add ]]
    -- upvalues: v8 (copy)
    v8[v9] = true;
end;
v6.remove = function(v10) --[[ Line: 36 ]] --[[ Name: remove ]]
    -- upvalues: v8 (copy)
    v8[v10] = nil;
end;
l_RunService_0:BindToRenderStep("__FusionTweenScheduler", Enum.RenderPriority.First.Value, function() --[[ Line: 43 ]] --[[ Name: updateAllTweens ]]
    -- upvalues: v8 (copy), v5 (copy), v6 (copy), v4 (copy), v3 (copy)
    local v11 = os.clock();
    for v12 in pairs(v8) do
        local v13 = v11 - v12._currentTweenStartTime;
        if v12._currentTweenDuration < v13 then
            if v12._currentTweenInfo.Reverses then
                v12._currentValue = v12._prevValue;
            else
                v12._currentValue = v12._nextValue;
            end;
            v12._currentlyAnimating = false;
            v5(v12);
            v6.remove(v12);
        else
            local v14 = v4(v12._currentTweenInfo, v13);
            v12._currentValue = v3(v12._prevValue, v12._nextValue, v14);
            v12._currentlyAnimating = true;
            v5(v12);
        end;
    end;
end);
return v6;