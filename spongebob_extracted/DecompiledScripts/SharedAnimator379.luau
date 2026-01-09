local l_HttpService_0 = game:GetService("HttpService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Packages_0 = l_ReplicatedStorage_0.Packages;
local v4 = require(l_Packages_0.Dumpster);
local v5 = require(l_Packages_0.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v7 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v8 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local l_Animations_0 = l_ReplicatedStorage_0.Animations;
local v10 = v5.new();
local v11 = {};
local v12 = {};
local function v35(v13, v14, v15, v16, v17) --[[ Line: 35 ]] --[[ Name: processPlayingAnimation ]]
    -- upvalues: v4 (copy), v11 (copy), v12 (copy), l_HttpService_0 (copy), l_RunService_0 (copy), v8 (copy), v10 (copy)
    v16 = v16 or {};
    v17 = v17 or {};
    local v18 = v4.new();
    local v19 = v13:LoadAnimation(v14);
    if v16.looped ~= nil then
        v19.Looped = v16.looped;
    end;
    if not v11[v13] then
        v11[v13] = {};
        local v20 = v4.new();
        v20:AttachTo(v13:FindFirstAncestorOfClass("Model"));
        v20:Add(function() --[[ Line: 60 ]]
            -- upvalues: v11 (ref), v13 (copy)
            for _, v22 in pairs(v11[v13]) do
                v22:Stop();
                v22:Destroy();
                v22 = nil;
            end;
            table.clear(v11[v13]);
            v11[v13] = nil;
        end);
    end;
    v11[v13][v15] = v19;
    v18:Add(function() --[[ Line: 74 ]]
        -- upvalues: v12 (ref), v13 (copy), v15 (copy), v11 (ref), v18 (ref)
        v12:StopAnimation(v13, v15);
        task.defer(function() --[[ Line: 77 ]]
            -- upvalues: v11 (ref), v15 (ref), v18 (ref)
            if v11 and v15 then
                v11[v15] = nil;
            end;
            v18 = nil;
        end);
    end);
    local l_Destroying_0 = v19.Destroying;
    v18:Connect(l_Destroying_0, function() --[[ Line: 86 ]]
        -- upvalues: v19 (copy), v18 (ref)
        v19:Stop();
        if v18 then
            v18:Destroy();
        end;
    end);
    l_Destroying_0 = v19.Stopped;
    v18:Connect(l_Destroying_0, function() --[[ Line: 94 ]]
        -- upvalues: v19 (copy), v18 (ref)
        v19:Stop();
        if v18 then
            v18:Destroy();
        end;
    end);
    if v17.markers then
        for v24, v25 in v17.markers do
            local l_v19_MarkerReachedSignal_0 = v19:GetMarkerReachedSignal(v24);
            v18:Add(l_v19_MarkerReachedSignal_0:Connect(v25));
        end;
    end;
    if v17.finished then
        l_Destroying_0 = v19.Stopped;
        v18:Add(l_Destroying_0:Connect(function() --[[ Line: 109 ]]
            -- upvalues: v17 (ref), v19 (copy)
            v17.finished(v19);
        end));
    end;
    l_Destroying_0 = v19.Destroying;
    v18:Add(l_Destroying_0:Connect(function() --[[ Line: 114 ]]
        -- upvalues: v18 (ref)
        v18:Destroy();
    end));
    local function _() --[[ Line: 118 ]] --[[ Name: play ]]
        -- upvalues: v17 (ref), v19 (copy), v16 (ref)
        if v17.loaded then
            v17.loaded(v19);
        end;
        if v16.manual then
            return;
        else
            if v17.start then
                v17.start(v19);
            end;
            v19:Play(v16.fadeTime, v16.weight, v16.speed);
            return;
        end;
    end;
    if v19.Length == 0 then
        local v28 = 0;
        l_Destroying_0 = l_HttpService_0:GenerateGUID();
        do
            local l_v28_0, l_l_Destroying_0_0 = v28, l_Destroying_0;
            local v32 = l_RunService_0.Heartbeat:Connect(function(v31) --[[ Line: 138 ]]
                -- upvalues: l_v28_0 (ref), v19 (copy), v18 (ref), l_l_Destroying_0_0 (ref), v17 (ref), v16 (ref), v8 (ref)
                l_v28_0 = l_v28_0 + v31;
                if v19.Length ~= 0 then
                    v18:Remove(l_l_Destroying_0_0);
                    l_v28_0 = nil;
                    l_l_Destroying_0_0 = nil;
                    if v17.loaded then
                        v17.loaded(v19);
                    end;
                    if v16.manual then
                        return;
                    else
                        if v17.start then
                            v17.start(v19);
                        end;
                        v19:Play(v16.fadeTime, v16.weight, v16.speed);
                        return;
                    end;
                else
                    if l_v28_0 >= v8.ANIMATIONS.MAX_LOAD_TIME then
                        v18:Destroy();
                        l_v28_0 = nil;
                        l_l_Destroying_0_0 = nil;
                        if v17.failed then
                            v17.failed(v19);
                        end;
                    end;
                    return;
                end;
            end);
            v18:Add(v32, l_l_Destroying_0_0);
        end;
    else
        if v17.loaded then
            v17.loaded(v19);
        end;
        if not v16.manual then
            if v17.start then
                v17.start(v19);
            end;
            v19:Play(v16.fadeTime, v16.weight, v16.speed);
        end;
    end;
    v18:Add(v10:Connect(function(v33, v34) --[[ Line: 165 ]]
        -- upvalues: v13 (copy), v15 (copy), v18 (ref)
        if v33 == v13 and v15 == v34 then
            v18:Destroy();
        end;
    end));
    return v19, v18;
end;
v12.PlayAnimation = function(v36, v37, v38, v39, v40) --[[ Line: 175 ]] --[[ Name: PlayAnimation ]]
    -- upvalues: v7 (copy), v35 (copy)
    local v41 = v37:FindFirstChild("Humanoid") or v37:FindFirstChild("AnimationController");
    local v42 = v41 and v41:FindFirstChild("Animator");
    if not v42 then
        return;
    else
        local l_v36_InstanceFromPath_0 = v36:GetInstanceFromPath(v38);
        if l_v36_InstanceFromPath_0 and l_v36_InstanceFromPath_0:IsA("StringValue") then
            l_v36_InstanceFromPath_0 = v36:GetInstanceFromPath(l_v36_InstanceFromPath_0.Value);
        end;
        if not l_v36_InstanceFromPath_0 then
            v7:Warn("Could not retrieve animation from path:", v38, "- does not exist.");
            return;
        else
            return v35(v42, l_v36_InstanceFromPath_0, v38, v39, v40);
        end;
    end;
end;
v12.StopAnimation = function(_, v45, v46) --[[ Line: 203 ]] --[[ Name: StopAnimation ]]
    -- upvalues: v10 (copy), v11 (copy)
    local v47 = nil;
    if v45:IsA("Animator") then
        v47 = v45;
    else
        local v48 = v45:FindFirstChild("Humanoid") or v45:FindFirstChild("AnimationController");
        v47 = v48 and v48:FindFirstChild("Animator");
    end;
    if not v47 then
        v10:Fire(v47, v46);
        return;
    elseif not v11[v47] then
        v10:Fire(v47, v46);
        return;
    else
        if v11[v47][v46] then
            v11[v47][v46]:Stop();
        end;
        if v11[v47][v46] then
            v11[v47][v46]:Destroy();
            v11[v47][v46] = nil;
        end;
        v10:Fire(v47, v46);
        return;
    end;
end;
v12.GetInstanceFromPath = function(_, v50) --[[ Line: 239 ]] --[[ Name: GetInstanceFromPath ]]
    -- upvalues: l_Animations_0 (copy)
    local v51 = string.split(v50, ".");
    local l_l_Animations_0_0 = l_Animations_0;
    for _, v54 in ipairs(v51) do
        l_l_Animations_0_0 = l_l_Animations_0_0:FindFirstChild(v54);
        if not l_l_Animations_0_0 then
            return nil;
        end;
    end;
    return l_l_Animations_0_0;
end;
return v12;