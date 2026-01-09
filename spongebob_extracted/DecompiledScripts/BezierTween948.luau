local l_HttpService_0 = game:GetService("HttpService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("TweenService");
local _ = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local function _(v7, v8, v9) --[[ Line: 17 ]] --[[ Name: lerp ]]
    return v7 + (v8 - v7) * v9;
end;
local function v19(v11, v12, v13, v14) --[[ Line: 21 ]] --[[ Name: quadraticBezier ]]
    local v15 = nil;
    local v16 = nil;
    local _ = nil;
    if typeof(v12) == "CFrame" or typeof(v12) == "UDim2" then
        return (v12:Lerp(v13, v11):Lerp(v13:Lerp(v14, v11), v11));
    else
        v15 = v12 + (v13 - v12) * v11;
        v16 = v13 + (v14 - v13) * v11;
        local l_v15_0 = v15;
        return l_v15_0 + (v16 - l_v15_0) * v11;
    end;
end;
local v20 = {};
v20.__index = v20;
v20.new = function(v21, v22, v23, v24, v25, v26, v27, v28) --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v20 (copy)
    return (setmetatable({
        dumpster = v5.new(), 
        instanceName = v21, 
        time = v22, 
        p0 = v23, 
        p1 = v24, 
        p2 = v25, 
        tweenInfo = v28, 
        callback = v26, 
        renderPriority = v27
    }, v20));
end;
v20.ChangeMid = function(v29, v30) --[[ Line: 57 ]] --[[ Name: ChangeMid ]]
    v29.p1 = v30;
end;
v20.ChangeTarget = function(v31, v32) --[[ Line: 62 ]] --[[ Name: ChangeTarget ]]
    v31.p2 = v32;
end;
v20.Play = function(v33) --[[ Line: 66 ]] --[[ Name: Play ]]
    -- upvalues: v19 (copy), v6 (copy), l_HttpService_0 (copy), l_RunService_0 (copy)
    local v34 = v33.dumpster:Construct(v33.instanceName);
    v34.Value = v33.p0;
    local v35 = 0;
    local function v36() --[[ Line: 73 ]] --[[ Name: progress ]]
        -- upvalues: v34 (copy), v19 (ref), v35 (ref), v33 (copy)
        v34.Value = v19(v35, v33.p0, v33.p1, v33.p2);
        v33.callback(v34.Value);
        if v35 >= 1 then
            v33:Destroy();
        end;
    end;
    v33.dumpster:Add(v6("NumberValue", 0, v33.tweenInfo or TweenInfo.new(v33.time), {
        Value = 1
    }, function(v37) --[[ Line: 85 ]]
        -- upvalues: v35 (ref)
        v35 = v37;
    end));
    if v33.renderPriority then
        v33.dumpster:BindToRenderStep(l_HttpService_0:GenerateGUID(), v33.renderPriority, v36);
    else
        v33.dumpster:Connect(l_RunService_0.RenderStepped, v36);
    end;
end;
v20.AddToDumpster = function(v38, v39) --[[ Line: 96 ]] --[[ Name: AddToDumpster ]]
    v38.dumpster:Add(v39);
end;
v20.Destroy = function(v40) --[[ Line: 100 ]] --[[ Name: Destroy ]]
    v40.dumpster:Destroy();
    if v40.OnDestroyed and typeof(v40.OnDestroyed) then
        v40:OnDestroyed();
    end;
    v40.dumpster = nil;
    v40.instanceName = nil;
    v40.time = nil;
    v40.p0 = nil;
    v40.p1 = nil;
    v40.p2 = nil;
    v40.tweenInfo = nil;
    v40.callback = nil;
    v40.renderPriority = nil;
end;
return v20;