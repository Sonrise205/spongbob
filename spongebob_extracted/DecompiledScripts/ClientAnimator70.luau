local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v7 = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v8 = {
    "Enemies", 
    "Friendlies", 
    "Pets"
};
local v9 = {};
local l_Animations_0 = l_ReplicatedStorage_0.Animations;
for _, v12 in v8 do
    v9[v12] = l_Animations_0:FindFirstChild(v12);
end;
l_Animations_0 = {};
l_Animations_0.__index = l_Animations_0;
l_Animations_0.new = function(v13, v14, v15) --[[ Line: 45 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v6 (copy), v3 (copy), l_Animations_0 (copy), v9 (copy)
    if not table.find(v8, v15) then
        v6:Warn("Invalid directory:", v15, "Expected \"Enemies\" or \"Friendlies\" or \"Pets\"");
        return;
    else
        local v16 = v14:FindFirstChildOfClass("AnimationController") or v14:FindFirstChildOfClass("Humanoid");
        if not v16 then
            v16 = Instance.new("AnimationController");
            v16.Parent = v14;
        end;
        local l_Animator_0 = v16:FindFirstChildOfClass("Animator");
        if not l_Animator_0 then
            l_Animator_0 = Instance.new("Animator");
            l_Animator_0.Parent = v16;
        end;
        local v18 = setmetatable({
            unitName = v13, 
            animator = l_Animator_0, 
            animations = {}, 
            playing = {}, 
            dumpster = v3.new()
        }, l_Animations_0);
        local v19 = v9[v15];
        local l_v19_FirstChild_0 = v19:FindFirstChild(v13);
        if not l_v19_FirstChild_0 then
            warn("No animations folder for Unit name ", v13);
            warn("No animations found for ", v14.Name, v19, l_v19_FirstChild_0, v13);
            return;
        else
            for _, v22 in l_v19_FirstChild_0:GetChildren() do
                v18.animations[v22.Name] = v22;
            end;
            return v18;
        end;
    end;
end;
l_Animations_0.Play = function(v23, v24, v25) --[[ Line: 104 ]] --[[ Name: Play ]]
    -- upvalues: v6 (copy), l_RunService_0 (copy), v7 (copy)
    v25 = v25 or {};
    local v26 = v25.props or {};
    local v27 = v25.callbacks or {};
    local v28 = v23.animations[v24];
    if not v28 then
        v6:Warn("Animation not found:", v24);
        return;
    else
        if v23:GetTrack(v24) and not v25.stack then
            v23:Stop(v24);
        end;
        if v25.stopPlayingTracks then
            for _, v30 in v23.playing do
                v30:Stop();
            end;
            table.clear(v23.playing);
        end;
        local v31 = v23.animator:LoadAnimation(v28);
        v23.playing[v24] = v31;
        local v32 = v23.dumpster:Extend();
        if v26.looped ~= nil then
            v31.Looped = v26.looped;
        end;
        if v27.markers then
            for v33, v34 in v27.markers do
                v32:Add(v31:GetMarkerReachedSignal(v33):Connect(v34));
            end;
        end;
        v32:Add(v31.Stopped:Connect(function() --[[ Line: 152 ]]
            -- upvalues: v32 (copy), v27 (copy)
            v32:Destroy();
            if v27.finished then
                v27.finished();
            end;
        end));
        if v26.priority then
            v31.Priority = v26.priority;
        end;
        local function _() --[[ Line: 164 ]] --[[ Name: play ]]
            -- upvalues: v31 (ref), v26 (copy), v27 (copy)
            v31:Play(v26.fadeTime, v26.weight, v26.speed);
            if v27.start then
                v27.start(v31);
            end;
        end;
        if v31.Length == 0 then
            local v36 = 0;
            do
                local l_v36_0 = v36;
                v32:Add(l_RunService_0.Heartbeat:Connect(function(v38) --[[ Line: 175 ]]
                    -- upvalues: l_v36_0 (ref), v31 (ref), v32 (copy), v26 (copy), v27 (copy), v7 (ref)
                    l_v36_0 = l_v36_0 + v38;
                    if v31.Length ~= 0 then
                        v32:Remove("Polling");
                        v31:Play(v26.fadeTime, v26.weight, v26.speed);
                        if v27.start then
                            v27.start(v31);
                        end;
                        return;
                    else
                        if l_v36_0 >= v7.ANIMATIONS.MAX_LOAD_TIME then
                            v32:Destroy();
                            if v27.failed then
                                v27.failed();
                            end;
                        end;
                        return;
                    end;
                end), "Polling");
            end;
        else
            local l_fadeTime_0 = v26.fadeTime;
            local l_weight_0 = v26.weight;
            local l_speed_0 = v26.speed;
            v31:Play(l_fadeTime_0, l_weight_0, l_speed_0);
            if v27.start then
                v27.start(v31);
            end;
        end;
        return v31, v32;
    end;
end;
l_Animations_0.OnlyPlay = function(v42, v43, v44) --[[ Line: 201 ]] --[[ Name: OnlyPlay ]]
    v42:StopAll();
    return v42:Play(v43, v44);
end;
l_Animations_0.GetTrack = function(v45, v46) --[[ Line: 213 ]] --[[ Name: GetTrack ]]
    return v45.playing[v46];
end;
l_Animations_0.Stop = function(v47, v48) --[[ Line: 217 ]] --[[ Name: Stop ]]
    -- upvalues: v6 (copy)
    local v49 = v47.playing[v48];
    if not v49 then
        v6:Warn("No track found for animation:", v48);
        return;
    else
        v49:Stop();
        v49:Destroy();
        v47.playing[v48] = nil;
        return;
    end;
end;
l_Animations_0.StopAll = function(v50) --[[ Line: 230 ]] --[[ Name: StopAll ]]
    for v51, v52 in v50.playing do
        v52:Stop();
        v52:Destroy();
        v50.playing[v51] = nil;
    end;
end;
l_Animations_0.Destroy = function(v53) --[[ Line: 238 ]] --[[ Name: Destroy ]]
    v53.dumpster:Destroy();
    v53:StopAll();
    table.clear(v53);
end;
return l_Animations_0;