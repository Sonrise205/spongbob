local _ = game:GetService("Lighting");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v5 = require(l_ReplicatedStorage_0.Packages.Knit);
local v6 = require(l_ReplicatedStorage_0.Packages.BaseObject);
local _ = require(l_ReplicatedStorage_0.Packages.RailUtil);
local v8 = require(l_ReplicatedFirst_0.PlaceIds);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(script.Parent.IceSpiceEvent_Config);
local l_Animation_0 = Instance.new("Animation");
l_Animation_0.AnimationId = "rbxassetid://115743511786527";
local v12 = setmetatable({}, v6);
v12.ClassName = "IceSpiceEvent_Client";
v12.__index = v12;
v12.TimedEvents = {
    {
        Time = 420, 
        Retroactive = true, 
        Run = function(v13) --[[ Line: 50 ]] --[[ Name: Run ]]
            v13:_ProcessMusicEvent(420);
        end
    }, 
    {
        Time = 990, 
        Retroactive = true, 
        Run = function(v14) --[[ Line: 57 ]] --[[ Name: Run ]]
            v14:_ProcessMusicEvent(990);
        end
    }, 
    {
        Time = 1725, 
        Retroactive = true, 
        Run = function(v15) --[[ Line: 64 ]] --[[ Name: Run ]]
            v15:_ProcessMusicEvent(1725);
        end
    }
};
v12.new = function(v16) --[[ Line: 70 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v12 (copy)
    local v17 = setmetatable(v6.new(), v12);
    v17.Name = v16.Name;
    v17.StartTime = v16.StartTime;
    v17.Duration = v16.Duration;
    v17.Scope = v16.Scope;
    v17.WorldAssets = v16.WorldAssets;
    v17.WorldContainer = v16.WorldContainer;
    v17.TimedEventsCache = {};
    v17.MusicInstance = nil;
    return v17;
end;
v12.Init = function(_) --[[ Line: 86 ]] --[[ Name: Init ]]

end;
v12.Start = function(_) --[[ Line: 89 ]] --[[ Name: Start ]]

end;
v12.Stop = function(v20) --[[ Line: 94 ]] --[[ Name: Stop ]]
    v20:ToggleIceSpiceMusic(false);
end;
v12.Destroy = function(v21) --[[ Line: 98 ]] --[[ Name: Destroy ]]
    -- upvalues: v6 (copy)
    v6.Destroy(v21);
end;
v12.ToggleIceSpiceMusic = function(v22, v23, v24) --[[ Line: 103 ]] --[[ Name: ToggleIceSpiceMusic ]]
    -- upvalues: v5 (copy), v8 (copy), l_RunService_0 (copy)
    v24 = math.clamp(v24 or 0, 0, 150.805);
    local v25 = v5.GetController("AudioController");
    local v26 = nil;
    if v23 == true then
        v26 = "Music.IceSpice";
        if not v8:IsTrading() then
            v22:LoadLighting("Lobby.Night");
        end;
    else
        v24 = nil;
        v5.Player:RemoveTag("DiscoLighting");
        v22:RemoveTask("MusicListener");
        v22:RemoveTask("MusicLoudnessListener");
        v22:RemoveTask("Dancing");
        v22:RemoveTask("DanceTrack");
        v22:LoadLighting();
        workspace.CurrentCamera.FieldOfView = 70;
    end;
    if v23 == true then
        v22:AddTask(v25.MusicPlaying:Once(function(v27) --[[ Line: 132 ]]
            -- upvalues: v5 (ref), v22 (copy), l_RunService_0 (ref)
            local v28 = 0;
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            v5.Player:AddTag("DiscoLighting");
            v22:AddTask(l_RunService_0.RenderStepped:Connect(function() --[[ Line: 143 ]]
                -- upvalues: v27 (copy), v28 (ref), l_CurrentCamera_0 (copy)
                local l_PlaybackLoudness_0 = v27.PlaybackLoudness;
                if l_PlaybackLoudness_0 > 400 then
                    local v31 = math.clamp((l_PlaybackLoudness_0 - 400) / 300, 0, 1);
                    v28 = v28 * 0.95 + v31 * 20 * 0.050000000000000044;
                else
                    v28 = v28 * 0.9;
                end;
                l_CurrentCamera_0.FieldOfView = v28 + 70;
            end), nil, "MusicLoudnessListener");
        end), nil, "MusicListener");
    end;
    v25:SetMusicOverride(v26, v24);
end;
v12._ProcessMusicEvent = function(v32, v33) --[[ Line: 163 ]] --[[ Name: _ProcessMusicEvent ]]
    -- upvalues: l_Animation_0 (copy), v5 (copy)
    local v34 = math.clamp((v32:GetTimePassed() or 0) - v33, 0, 1e999);
    v32:RemoveTask("Dancing");
    v32:RemoveTask("DanceTrack");
    warn("Music timestamp:", v33);
    warn("Time passed since timestamp:", v34);
    if v34 >= 150.805 then
        return;
    else
        warn("Playing Ice Spice music for timestamp:", v33);
        warn("Music time left:", 150.805 - v34);
        v32:ToggleIceSpiceMusic(false);
        task.wait();
        v32:ToggleIceSpiceMusic(true, v34);
        local function v37(v35) --[[ Line: 184 ]] --[[ Name: characterAdded ]]
            -- upvalues: v32 (copy), l_Animation_0 (ref)
            if v32:GetTask("DanceTrack") then
                v32:RemoveTask("DanceTrack");
            end;
            local v36 = v35:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(l_Animation_0);
            v36.Priority = Enum.AnimationPriority.Action4;
            v36.Looped = true;
            repeat
                task.wait();
            until v36.Length > 0;
            warn("Playing dance track");
            v36:Play();
            v32:AddTask(function() --[[ Line: 203 ]]
                -- upvalues: v36 (copy)
                v36:Stop();
                v36:Destroy();
            end, nil, "DanceTrack");
        end;
        if v5.Player.Character then
            v37(v5.Player.Character);
        end;
        v32:AddTask(v5.Player.CharacterAdded:Connect(v37), nil, "Dancing");
        v32:AddTask(task.delay(150.805 - v34, function() --[[ Line: 215 ]]
            -- upvalues: v32 (copy)
            v32:ToggleIceSpiceMusic(false);
        end));
        return;
    end;
end;
v12.LoadLighting = function(_, v39) --[[ Line: 220 ]] --[[ Name: LoadLighting ]]
    -- upvalues: v5 (copy)
    v5.GetController("LightingController"):LoadLighting(v39, false);
end;
v12.TweenCamera = function(v40) --[[ Line: 225 ]] --[[ Name: TweenCamera ]]
    -- upvalues: l_TweenService_0 (copy)
    if v40._tweeningCamera then
        return;
    else
        v40._tweeningCamera = true;
        local v41 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
        local v42 = l_TweenService_0:Create(workspace.CurrentCamera, v41, {
            FieldOfView = workspace.CurrentCamera.FieldOfView + 10
        });
        v42.Completed:Once(function() --[[ Line: 238 ]]
            -- upvalues: v42 (ref), v40 (copy)
            v42:Destroy();
            v42 = nil;
            v40._tweeningCamera = false;
        end);
        v42:Play();
        return;
    end;
end;
return v12;