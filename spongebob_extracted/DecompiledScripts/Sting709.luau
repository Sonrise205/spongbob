local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v4 = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = {
    tweenInInfo = TweenInfo.new(0.2), 
    tweenOutInfo = TweenInfo.new(0.3), 
    sinkInput = true, 
    loadIcon = false
};
local v7 = Color3.new(0, 0, 0);
local v8 = v3.new();
local v9 = {
    primaryMenu = false
};
local function v16(v10, v11, v12, v13) --[[ Line: 46 ]] --[[ Name: tweenWithCallback ]]
    -- upvalues: l_TweenService_0 (copy), v8 (copy)
    local v14 = l_TweenService_0:Create(v10, v11, v12);
    v14.Completed:Once(function(v15) --[[ Line: 49 ]]
        -- upvalues: v14 (copy), v13 (copy)
        if v14 then
            v14:Destroy();
        end;
        if v15 ~= Enum.PlaybackState.Completed then
            return;
        else
            if v13 then
                v13();
            end;
            return;
        end;
    end);
    v14:Play();
    v8:Add(v14);
end;
v9.Init = function(_, _) --[[ Line: 71 ]] --[[ Name: Init ]]

end;
v9.Start = function(v19, v20) --[[ Line: 76 ]] --[[ Name: Start ]]
    v19.ui = v20;
    v19.sink = v20.Sink;
    v19.circle = v20.Circle;
    v19.circle.Size = UDim2.fromScale(0, 0);
    v19.default = v20.Default;
    v19.default.BackgroundTransparency = 1;
end;
v9.Opened = function(_, _) --[[ Line: 90 ]] --[[ Name: Opened ]]

end;
v9.Closed = function(_, _) --[[ Line: 95 ]] --[[ Name: Closed ]]

end;
v9.Transition = function(v25, v26) --[[ Line: 101 ]] --[[ Name: Transition ]]
    -- upvalues: v4 (copy), v6 (copy), v8 (copy), v7 (copy), v16 (copy)
    v26 = v26 or {};
    local v27 = v4.Reconcile(v26.config or v6, v6);
    local v28 = v26.callbacks or {};
    local v29 = v27.style or "Default";
    v8:Destroy();
    v25.ui.Enabled = true;
    v25.sink.Visible = v27.sinkInput;
    local v30 = if v29 == "Circle" then v25.circle else v25.default;
    local v31 = nil;
    v31 = if v29 == "Circle" then {
        inProps = {
            Size = UDim2.fromScale(2.5, 2.5)
        }, 
        outProps = {
            Size = UDim2.fromScale(0, 0)
        }
    } else {
        inProps = {
            BackgroundTransparency = 0
        }, 
        outProps = {
            BackgroundTransparency = 1
        }
    };
    local l_inProps_0 = v31.inProps;
    local l_outProps_0 = v31.outProps;
    v30.BackgroundColor3 = v27.color or v7;
    local function v34() --[[ Line: 139 ]] --[[ Name: tweenOut ]]
        -- upvalues: v25 (copy), v28 (copy), v16 (ref), v30 (copy), v27 (copy), l_outProps_0 (copy)
        v25.sink.Visible = false;
        if v28.tweenOut then
            v28.tweenOut();
        end;
        v16(v30, v27.tweenOutInfo, l_outProps_0, function() --[[ Line: 146 ]]
            -- upvalues: v25 (ref), v28 (ref)
            v25.ui.Enabled = false;
            if v28.finished then
                v28.finished();
            end;
        end);
    end;
    local function v35() --[[ Line: 155 ]] --[[ Name: tweenedIn ]]
        -- upvalues: v28 (copy), v27 (copy), v8 (ref), v34 (copy)
        if v28.hold then
            v28.hold();
        end;
        if v27.holdTime then
            v8:Add(task.delay(v27.holdTime, v34));
        end;
    end;
    if v27.snapIn then
        if v28.hold then
            v28.hold();
        end;
        if v27.holdTime then
            v8:Add(task.delay(v27.holdTime, v34));
        end;
        return v34;
    else
        v16(v30, v27.tweenInInfo, l_inProps_0, v35);
        return v34;
    end;
end;
return v9;