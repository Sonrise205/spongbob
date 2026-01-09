local v0 = {};
v0.__index = v0;
v0.Waypoints = require(script.Waypoints);
local v1 = require(script.Parent.Signal);
local v2 = require(script.Parent.Promise);
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local function v5(v6) --[[ Line: 32 ]] --[[ Name: factorial ]]
    -- upvalues: v5 (copy)
    if v6 == 0 then
        return 1;
    else
        return v6 * v5(v6 - 1);
    end;
end;
local _ = function(v7, v8) --[[ Line: 39 ]] --[[ Name: binomial ]]
    -- upvalues: v5 (copy)
    local _ = nil;
    local v10 = v7 == 0 and 1 or v7 * v5(v7 - 1);
    local v11 = v7 - v8;
    return v10 / ((v11 == 0 and 1 or v11 * v5(v11 - 1)) * (v8 == 0 and 1 or v8 * v5(v8 - 1)));
end;
local function v22(v13, ...) --[[ Line: 47 ]] --[[ Name: graphPointVector3 ]]
    -- upvalues: v5 (copy)
    local v14 = false;
    if v13 >= 0 then
        v14 = v13 <= 1;
    end;
    assert(v14, v13 .. "t is not between 0 and 1.");
    local v15 = {
        ...
    };
    v14 = #v15 - 1;
    local v16 = nil;
    for v17 = 0, v14 do
        local _ = nil;
        local v19 = v14 == 0 and 1 or v14 * v5(v14 - 1);
        local v20 = v14 - v17;
        local v21 = v19 / ((v20 == 0 and 1 or v20 * v5(v20 - 1)) * (v17 == 0 and 1 or v17 * v5(v17 - 1))) * (1 - v13) ^ (v14 - v17) * v13 ^ v17 * v15[v17 + 1];
        v16 = v16 and v16 + v21 or v21;
    end;
    return v16;
end;
local function v36(v23, ...) --[[ Line: 59 ]] --[[ Name: graphPointUDim2 ]]
    -- upvalues: v5 (copy)
    local v24 = false;
    if v23 >= 0 then
        v24 = v23 <= 1;
    end;
    assert(v24, v23 .. "t is not between 0 and 1.");
    local v25 = {
        ...
    };
    v24 = #v25 - 1;
    local v26 = nil;
    for v27 = 0, v24 do
        local _ = nil;
        local v29 = v24 == 0 and 1 or v24 * v5(v24 - 1);
        local v30 = v24 - v27;
        local v31 = v29 / ((v30 == 0 and 1 or v30 * v5(v30 - 1)) * (v27 == 0 and 1 or v27 * v5(v27 - 1))) * (1 - v23) ^ (v24 - v27) * v23 ^ v27 * v25[v27 + 1].X.Scale;
        v29 = nil;
        local v32 = v24 == 0 and 1 or v24 * v5(v24 - 1);
        local v33 = v24 - v27;
        local v34 = v32 / ((v33 == 0 and 1 or v33 * v5(v33 - 1)) * (v27 == 0 and 1 or v27 * v5(v27 - 1))) * (1 - v23) ^ (v24 - v27) * v23 ^ v27 * v25[v27 + 1].Y.Scale;
        local v35 = UDim2.fromScale(v31, v34);
        v26 = v26 and v26 + v35 or v35;
    end;
    return v26;
end;
local function v38(v37, ...) --[[ Line: 73 ]] --[[ Name: graphPoint ]]
    -- upvalues: v36 (copy), v22 (copy)
    if typeof(({
        ...
    })[1]) == "UDim2" then
        return v36(v37, ...);
    else
        return v22(v37, ...);
    end;
end;
v0.Create = function(v39, v40) --[[ Line: 84 ]] --[[ Name: Create ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v41 = setmetatable({}, v0);
    assert(#v40.Waypoints > 1, "Bezier curve must have atleast 2 waypoints.");
    assert(v40.EasingStyle ~= Enum.EasingStyle.Elastic, "Elastic easing style not supported.");
    assert(v40.EasingStyle ~= Enum.EasingStyle.Back, "Back easing style not supported.");
    v41.Instance = v39;
    v41.PlaybackState = Enum.PlaybackState.Begin;
    v41.TweenInfo = v40;
    v41.Played = v1.new();
    v41.Completed = v1.new();
    v41.Cancelled = v1.new();
    v41.Ended = v1.new();
    v41.Paused = v1.new();
    v41.Resumed = v1.new();
    v41._time = 0;
    v41._style = v40.EasingStyle or Enum.EasingStyle.Linear;
    v41._direction = v40.EasingDirection or Enum.EasingDirection.In;
    return v41;
end;
v0.Play = function(v42) --[[ Line: 112 ]] --[[ Name: Play ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), v38 (copy)
    assert(not (v42.PlaybackState == Enum.PlaybackState.Playing), "Tween is already playing.");
    assert(not (v42.PlaybackState == Enum.PlaybackState.Cancelled), "Tween is cancelled.");
    v42.Played:Fire();
    v42.PlaybackState = Enum.PlaybackState.Playing;
    v42.TweenPromise = v2.new(function(v43, _, v45) --[[ Line: 120 ]]
        -- upvalues: l_RunService_0 (ref), v42 (copy), l_TweenService_0 (ref), v38 (ref)
        local v46 = nil;
        v46 = l_RunService_0.RenderStepped:Connect(function(v47) --[[ Line: 123 ]]
            -- upvalues: v42 (ref), v43 (copy), v46 (ref), l_TweenService_0 (ref), v38 (ref)
            if v42.PlaybackState ~= Enum.PlaybackState.Playing then
                return;
            elseif v42._time >= v42.TweenInfo.Time then
                return v43(v46);
            else
                local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v42._time / v42.TweenInfo.Time, v42._style, v42._direction);
                v42.Instance.Position = v38(l_l_TweenService_0_Value_0, unpack(v42.TweenInfo.Waypoints));
                local l_v42_0 = v42;
                l_v42_0._time = l_v42_0._time + v47;
                return;
            end;
        end);
        if v45(function() --[[ Line: 137 ]]
            -- upvalues: v46 (ref)
            v46:Disconnect();
        end) then
            return;
        else
            return;
        end;
    end);
    v42.TweenPromise:andThen(function(v50) --[[ Line: 146 ]]
        -- upvalues: v42 (copy)
        v50:Disconnect();
        v42.PlaybackState = Enum.PlaybackState.Completed;
        v42.Completed:Fire();
        v42.Ended:Fire();
        v42.TweenPromise = nil;
        return "Completed";
    end);
end;
v0.Pause = function(v51) --[[ Line: 158 ]] --[[ Name: Pause ]]
    if v51.PlaybackState ~= Enum.PlaybackState.Paused then
        v51.PlaybackState = Enum.PlaybackState.Paused;
        v51.Paused:Fire();
    end;
end;
v0.Resume = function(v52) --[[ Line: 165 ]] --[[ Name: Resume ]]
    if v52.PlaybackState == Enum.PlaybackState.Paused then
        v52.PlaybackState = Enum.PlaybackState.Paused;
        v52.Resumed:Fire();
    end;
end;
v0.Cancel = function(v53) --[[ Line: 172 ]] --[[ Name: Cancel ]]
    if v53.PlaybackState ~= Enum.PlaybackState.Cancelled then
        v53.PlaybackState = Enum.PlaybackState.Cancelled;
        v53.Cancelled:Fire();
        if v53.TweenPromise then
            v53.TweenPromise:cancel();
        end;
        v53.Ended:Fire();
    end;
end;
return v0;