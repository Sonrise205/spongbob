local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_SoundService_0 = game:GetService("SoundService");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_ReplicatedStorage_0.Packages.Knit);
local v5 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v6 = require(l_ReplicatedStorage_0.Packages.Promise);
local v7 = require(l_ReplicatedStorage_0.Packages.Signal);
local v8 = require(l_ReplicatedStorage_0.Shared.Modules.Timer);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v10 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v11 = require(l_ReplicatedStorage_0.Shared.Modules.WWSDebug);
local v12 = require(l_ReplicatedFirst_0.PlaceIds);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.AudioData);
local v14 = nil;
local v15 = {
    "Reverb", 
    "PitchShift", 
    "Equalizer", 
    "Echo", 
    "Distortion", 
    "Chorus"
};
local v16 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v17 = {
    "Cave"
};
local v18 = {
    "Cave"
};
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = v4.CreateController({
    Name = "AudioController", 
    ListenerReady = v7.new(), 
    MusicPlaying = v7.new(), 
    _isMusicPlaying = false, 
    _musicPlaying = {}, 
    _soundsPlaying = {}
});
local function _(v25, v26) --[[ Line: 63 ]] --[[ Name: overrideProperties ]]
    for v27, v28 in v26 do
        v25[v27] = v28;
    end;
end;
local function v36(v30, v31) --[[ Line: 70 ]] --[[ Name: applyEffect ]]
    -- upvalues: v15 (copy), v11 (copy)
    local l_name_0 = v31.name;
    if not table.find(v15, l_name_0) then
        v11:Warn("Could not find effect name:", l_name_0, "\nAllowed Effects Are:", v15);
        return;
    else
        local v33 = Instance.new(l_name_0 .. "SoundEffect");
        if v31.properties then
            for v34, v35 in v31.properties do
                v33[v34] = v35;
            end;
        end;
        v33.Parent = v30;
        return v33;
    end;
end;
local function v59(v37) --[[ Line: 92 ]] --[[ Name: playSound ]]
    -- upvalues: v24 (copy), v11 (copy), v5 (copy), v36 (copy), v16 (copy), l_TweenService_0 (copy), v8 (copy), l_SoundService_0 (copy), v14 (ref)
    local l_v24_InstanceFromPath_0 = v24:GetInstanceFromPath(v37.name);
    if not l_v24_InstanceFromPath_0 then
        v11:Warn("Controller: Could not find sound asset", v37.name);
        return;
    else
        local v39 = v37.extraData or {};
        local l_isMusic_0 = v39.isMusic;
        if not v39.bypassSoundGroup and not v37.soundGroup then
            l_v24_InstanceFromPath_0.SoundGroup = v24:GetSoundGroup((("Master.%*"):format(l_isMusic_0 and "MusicMaster.MusicSubmaster" or "SFX")));
        elseif v37.soundGroup then
            l_v24_InstanceFromPath_0.SoundGroup = v24:GetSoundGroup(v37.soundGroup);
        end;
        local v41 = v5.new();
        v41:Connect(l_v24_InstanceFromPath_0.Ended, function() --[[ Line: 112 ]]
            -- upvalues: v37 (copy), v41 (ref)
            if v37.finishedCallback then
                v37.finishedCallback();
            end;
            v41:Destroy();
        end);
        v41:Add(function() --[[ Line: 120 ]]
            -- upvalues: v41 (ref), v24 (ref), v37 (copy), l_v24_InstanceFromPath_0 (ref)
            v41 = nil;
            if v24._soundsPlaying[v37.name] then
                v24._soundsPlaying[v37.name] = nil;
            end;
            if l_v24_InstanceFromPath_0 and l_v24_InstanceFromPath_0.Parent then
                l_v24_InstanceFromPath_0:Destroy();
            end;
            l_v24_InstanceFromPath_0 = nil;
        end);
        v24[l_isMusic_0 and "_musicPlaying" or "_soundsPlaying"][v37.name] = l_v24_InstanceFromPath_0;
        if v37.properties then
            local l_l_v24_InstanceFromPath_0_0 = l_v24_InstanceFromPath_0;
            for v43, v44 in v37.properties do
                l_l_v24_InstanceFromPath_0_0[v43] = v44;
            end;
        end;
        if v37.effects then
            for _, v46 in v37.effects do
                v36(l_v24_InstanceFromPath_0, v46);
            end;
        end;
        local function v53() --[[ Line: 146 ]] --[[ Name: play ]]
            -- upvalues: l_v24_InstanceFromPath_0 (ref), v37 (copy), v39 (copy), v16 (ref), v24 (ref), v41 (ref), l_TweenService_0 (ref)
            local l_Volume_0 = l_v24_InstanceFromPath_0.Volume;
            if v37.duckMusic then
                local v48 = if v39.fadeIn then v39.fadeTime or v16.Time else 0.5;
                v24:FadeMusicVolume(0.35, v48);
                local l_v48_0 = v48 --[[ copy: 1 -> 3 ]];
                v41:Add(function() --[[ Line: 155 ]]
                    -- upvalues: v24 (ref), l_v48_0 (copy)
                    v24:FadeMusicVolume(1, l_v48_0);
                end);
            end;
            if v39.fadeIn then
                l_v24_InstanceFromPath_0.Volume = 0;
                local v50 = if v39.fadeTime then TweenInfo.new(v39.fadeTime, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut) else v16;
                local v51 = l_TweenService_0:Create(l_v24_InstanceFromPath_0, v50, {
                    Volume = l_Volume_0
                });
                do
                    local l_v51_0 = v51;
                    v41:Add(l_v51_0.Completed:Once(function() --[[ Line: 173 ]]
                        -- upvalues: l_v51_0 (ref)
                        l_v51_0:Destroy();
                        l_v51_0 = nil;
                    end));
                    l_v51_0:Play();
                end;
            end;
            if v39.isVoiceOver then
                v24._isPlayingVoiceLine = true;
            end;
            l_v24_InstanceFromPath_0:Play();
            if v37.startCallback then
                v37.startCallback();
            end;
        end;
        local function v55(v54) --[[ Line: 192 ]] --[[ Name: tryToPlay ]]
            -- upvalues: v39 (copy), v41 (ref), v53 (copy), l_v24_InstanceFromPath_0 (ref), v8 (ref)
            if not v54 and v39.delay then
                v41:Add(task.delay(v39.delay, function() --[[ Line: 194 ]]
                    -- upvalues: v53 (ref)
                    v53();
                end));
                return;
            elseif l_v24_InstanceFromPath_0.TimeLength ~= 0 then
                v53();
                return;
            else
                v41:Add(l_v24_InstanceFromPath_0:GetPropertyChangedSignal("TimeLength"):Connect(function() --[[ Line: 207 ]]
                    -- upvalues: l_v24_InstanceFromPath_0 (ref), v53 (ref)
                    if l_v24_InstanceFromPath_0.TimeLength ~= 0 then
                        v53();
                    end;
                end));
                v41:Add(v8.Simple(1, function() --[[ Line: 213 ]]
                    -- upvalues: l_v24_InstanceFromPath_0 (ref)
                    if l_v24_InstanceFromPath_0.TimeLength == 0 then
                        l_v24_InstanceFromPath_0:Destroy();
                    end;
                end));
                return;
            end;
        end;
        if not v37.position and not v37.adornee then
            l_v24_InstanceFromPath_0.Parent = l_SoundService_0;
        elseif v37.adornee then
            l_v24_InstanceFromPath_0.Parent = v37.adornee;
        elseif v37.position then
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Anchored = true;
            l_Part_0.Transparency = 1;
            l_Part_0.CanCollide = false;
            l_Part_0.CanTouch = false;
            l_Part_0.CanQuery = false;
            l_Part_0.Size = Vector3.new(1, 1, 1, 0);
            l_Part_0.Parent = v14;
            l_Part_0.CFrame = CFrame.new(v37.position);
            l_v24_InstanceFromPath_0.Parent = l_Part_0;
            do
                local l_l_Part_0_0 = l_Part_0;
                v41:Add(function() --[[ Line: 237 ]]
                    -- upvalues: l_l_Part_0_0 (ref)
                    if l_l_Part_0_0 and l_l_Part_0_0.Parent then
                        l_l_Part_0_0:Destroy();
                    end;
                    l_l_Part_0_0 = nil;
                end);
            end;
        end;
        local l_Destroying_0 = l_v24_InstanceFromPath_0.Destroying;
        v41:Add(l_Destroying_0:Once(function() --[[ Line: 246 ]]
            -- upvalues: v41 (ref)
            v41:Destroy();
        end));
        if not l_v24_InstanceFromPath_0.Looped then
            l_v24_InstanceFromPath_0.Ended:Once(function() --[[ Line: 251 ]]
                -- upvalues: v41 (ref)
                v41:Destroy();
            end);
        end;
        v55();
        return l_v24_InstanceFromPath_0;
    end;
end;
v24.PlaySound = function(v60, v61, v62) --[[ Line: 264 ]] --[[ Name: PlaySound ]]
    -- upvalues: v4 (copy), v59 (copy)
    if v61.name == "" then
        return;
    else
        local v63 = v61.extraData or {};
        local l_isMusic_1 = v63.isMusic;
        local l_Attribute_0 = v4.Player:GetAttribute("Setting_Music");
        if not v62 and l_isMusic_1 and l_Attribute_0 == false then
            return;
        elseif v63.isVoiceOver and v60._isPlayingVoiceLine then
            return;
        else
            return v59(v61);
        end;
    end;
end;
v24.SetMusicOverride = function(v66, v67, v68) --[[ Line: 284 ]] --[[ Name: SetMusicOverride ]]
    -- upvalues: v4 (copy)
    v66.musicOverride = v67;
    v66:StopAllMusic(true, 0.5);
    if v4.Player:GetAttribute("Setting_Music") then
        v66:_playMusic(v68);
    end;
end;
v24.StopSound = function(v69, v70, v71) --[[ Line: 293 ]] --[[ Name: StopSound ]]
    -- upvalues: v11 (copy), v16 (copy), l_TweenService_0 (copy), v6 (copy)
    if not v70 then
        v11:Warn("Sound is nil");
        return;
    else
        v71 = v71 or {};
        local l__soundsPlaying_0 = v69._soundsPlaying;
        local v73 = nil;
        if typeof(v70) == "string" then
            if v71 and v71.isMusic then
                l__soundsPlaying_0 = v69._musicPlaying;
            end;
            v73 = v70;
            v70 = l__soundsPlaying_0[v70];
        end;
        if not v70 then
            return;
        elseif not v71.fadeOut then
            if v73 then
                l__soundsPlaying_0[v73] = nil;
            end;
            v70:Destroy();
            v70 = nil;
            return;
        else
            local v74 = if v71.fadeTime then TweenInfo.new(v71.fadeTime, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut) else v16;
            local v75 = l_TweenService_0:Create(v70, v74, {
                Volume = 0
            });
            local v78 = v6.new(function(v76) --[[ Line: 338 ]]
                -- upvalues: v75 (copy), v70 (ref), v73 (ref), l__soundsPlaying_0 (ref)
                v75.Completed:Once(function(v77) --[[ Line: 339 ]]
                    -- upvalues: v76 (copy), v70 (ref), v73 (ref), l__soundsPlaying_0 (ref)
                    v76();
                    if v77 ~= Enum.PlaybackState.Completed or not v70 then
                        return;
                    else
                        if v73 then
                            l__soundsPlaying_0[v73] = nil;
                        end;
                        v70:Destroy();
                        v70 = nil;
                        return;
                    end;
                end);
            end);
            v75:Play();
            return v78;
        end;
    end;
end;
v24.StopAllSounds = function(v79) --[[ Line: 360 ]] --[[ Name: StopAllSounds ]]
    for v80, v81 in v79._soundsPlaying do
        v81:Destroy();
        v79._soundsPlaying[v80] = nil;
    end;
end;
v24.FadeMusicVolume = function(v82, v83, v84) --[[ Line: 367 ]] --[[ Name: FadeMusicVolume ]]
    -- upvalues: v16 (copy), l_TweenService_0 (copy), v6 (copy)
    local l_v82_SoundGroup_0 = v82:GetSoundGroup("Master.MusicMaster");
    local v86 = if v84 then TweenInfo.new(v84, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut) else v16;
    local v87 = l_TweenService_0:Create(l_v82_SoundGroup_0, v86, {
        Volume = v83
    });
    return v6.new(function(v88) --[[ Line: 379 ]]
        -- upvalues: v87 (copy)
        v87.Completed:Once(function() --[[ Line: 380 ]]
            -- upvalues: v88 (copy), v87 (ref)
            v88();
            v87:Destroy();
        end);
        v87:Play();
    end);
end;
v24.StopAllMusic = function(v89, v90, v91) --[[ Line: 389 ]] --[[ Name: StopAllMusic ]]
    for _, v93 in v89._musicPlaying do
        v89:StopSound(v93, {
            fadeOut = v90, 
            fadeTime = v91, 
            isMusic = true
        });
    end;
    v89._isMusicPlaying = false;
end;
v24.KnitInit = function(_) --[[ Line: 400 ]] --[[ Name: KnitInit ]]
    -- upvalues: v19 (ref), v4 (copy), v20 (ref), v21 (ref), v22 (ref), v23 (ref), v14 (ref)
    v19 = v4.GetService("AudioService");
    v20 = v4.GetController("NPEController");
    v21 = v4.GetController("DataController");
    v22 = v4.GetController("EncryptedAudioController");
    v23 = v4.GetService("GameService");
    v14 = workspace:FindFirstChild("ClientWorldSounds");
    if not v14 then
        v14 = Instance.new("Folder");
        v14.Name = "ClientWorldSounds";
        v14.Parent = workspace;
    end;
end;
v24.KnitStart = function(v95) --[[ Line: 416 ]] --[[ Name: KnitStart ]]
    -- upvalues: v19 (ref), v4 (copy), v12 (copy), v17 (copy), v18 (copy)
    v19.PlaySound:Connect(function(v96) --[[ Line: 417 ]]
        -- upvalues: v95 (copy)
        v95:PlaySound(v96);
    end);
    if v4.Player:GetAttribute("Loading") then
        v4.Player:GetAttributeChangedSignal("Loading"):Wait();
    end;
    local l_v12_Destination_0 = v12:GetDestination();
    local function v99() --[[ Line: 428 ]] --[[ Name: musicSettingChanged ]]
        -- upvalues: v4 (ref), v17 (ref), l_v12_Destination_0 (copy), v95 (copy)
        local l_Attribute_1 = v4.Player:GetAttribute("Setting_Music");
        if l_Attribute_1 or table.find(v17, l_v12_Destination_0) then
            v95:_playMusic();
            return;
        else
            if not l_Attribute_1 then
                v95:StopAllMusic(true, 0.4);
            end;
            return;
        end;
    end;
    v4.Player:GetAttributeChangedSignal("Setting_Music"):Connect(v99);
    local l_Attribute_2 = v4.Player:GetAttribute("Setting_Music");
    if l_Attribute_2 or table.find(v17, l_v12_Destination_0) then
        v95:_playMusic();
    elseif not l_Attribute_2 then
        v95:StopAllMusic(true, 0.4);
    end;
    l_Attribute_2 = function() --[[ Line: 440 ]] --[[ Name: sfxSettingChanged ]]
        -- upvalues: v18 (ref), l_v12_Destination_0 (copy), v4 (ref), v95 (copy)
        local v101 = table.find(v18, l_v12_Destination_0) ~= nil or v4.Player:GetAttribute("Setting_SFX");
        local l_v95_SoundGroup_0 = v95:GetSoundGroup("Master.SFX");
        if not l_v95_SoundGroup_0 then
            return;
        else
            local l_l_v95_SoundGroup_0_Attribute_0 = l_v95_SoundGroup_0:GetAttribute("OriginalVolume");
            if not l_l_v95_SoundGroup_0_Attribute_0 then
                l_l_v95_SoundGroup_0_Attribute_0 = l_v95_SoundGroup_0.Volume;
                l_v95_SoundGroup_0:SetAttribute("OriginalVolume", l_l_v95_SoundGroup_0_Attribute_0);
            end;
            l_v95_SoundGroup_0.Volume = if v101 then l_l_v95_SoundGroup_0_Attribute_0 else 0;
            return;
        end;
    end;
    v4.Player:GetAttributeChangedSignal("Setting_SFX"):Connect(l_Attribute_2);
    l_Attribute_2();
    local function v107() --[[ Line: 461 ]] --[[ Name: mountSfxSettingChanged ]]
        -- upvalues: v18 (ref), l_v12_Destination_0 (copy), v4 (ref), v95 (copy)
        local v104 = table.find(v18, l_v12_Destination_0) ~= nil or v4.Player:GetAttribute("Setting_MountSFX");
        local l_v95_SoundGroup_1 = v95:GetSoundGroup("Master.SFX.Mount");
        if not l_v95_SoundGroup_1 then
            return;
        else
            local l_l_v95_SoundGroup_1_Attribute_0 = l_v95_SoundGroup_1:GetAttribute("OriginalVolume");
            if not l_l_v95_SoundGroup_1_Attribute_0 then
                l_l_v95_SoundGroup_1_Attribute_0 = l_v95_SoundGroup_1.Volume;
                l_v95_SoundGroup_1:SetAttribute("OriginalVolume", l_l_v95_SoundGroup_1_Attribute_0);
            end;
            l_v95_SoundGroup_1.Volume = if v104 then l_l_v95_SoundGroup_1_Attribute_0 else 0;
            return;
        end;
    end;
    v4.Player:GetAttributeChangedSignal("Setting_MountSFX"):Connect(v107);
    v107();
end;
v24.GetInstanceFromPath = function(_, v109) --[[ Line: 483 ]] --[[ Name: GetInstanceFromPath ]]
    -- upvalues: v10 (copy), v13 (copy)
    local v110 = v10(v13, v109);
    if not v110 then
        return nil;
    else
        local l_Sound_0 = Instance.new("Sound");
        for v112, v113 in v110 do
            l_Sound_0[v112] = v113;
        end;
        return l_Sound_0;
    end;
end;
v24.GetSoundGroup = function(_, v115) --[[ Line: 497 ]] --[[ Name: GetSoundGroup ]]
    -- upvalues: v10 (copy), l_SoundService_0 (copy)
    return v10(l_SoundService_0, v115);
end;
v24._playMusic = function(v116, v117) --[[ Line: 502 ]] --[[ Name: _playMusic ]]
    -- upvalues: v22 (ref), v12 (copy), v23 (ref), v13 (copy), v17 (copy)
    if v116._isMusicPlaying then
        return;
    else
        v116:StopAllMusic(true, 0.5);
        v116._isMusicPlaying = true;
        if v116.musicOverride and not v22:IsLoaded() then
            warn("Yielding for EncrypyedAudioController to load before playing music!");
            v22.Loaded:Wait();
        end;
        local l_v12_Destination_1 = v12:GetDestination();
        if l_v12_Destination_1 == "Game" then
            local l_Map_0 = workspace:WaitForChild("Map");
            local v120 = v23.LevelInfo:OnReady():expect();
            if v120 and v120.Mode == "Event" and v120.WorldName2 == "NewKelpCity" then
                v116:PlaySound({
                    name = ("Music.Game.NewKelpCity.%*"):format(v120.Act), 
                    extraData = {
                        isMusic = true
                    }
                });
                return;
            else
                local l_l_Map_0_Attribute_0 = l_Map_0:GetAttribute("MapName");
                local l_l_Map_0_Attribute_1 = l_Map_0:GetAttribute("Act");
                local v123 = ("Music.Game.%*"):format(l_l_Map_0_Attribute_0);
                if l_l_Map_0_Attribute_1 and v13.Music.Game[("%*_Act%*"):format(l_l_Map_0_Attribute_0, l_l_Map_0_Attribute_1)] then
                    v123 = ("Music.Game.%*_Act%*"):format(l_l_Map_0_Attribute_0, l_l_Map_0_Attribute_1);
                end;
                local v124 = v116:PlaySound({
                    name = v116.musicOverride or v123, 
                    extraData = {
                        isMusic = true
                    }, 
                    properties = {
                        TimePosition = v117
                    }
                });
                v116.MusicPlaying:Fire(v124);
                return;
            end;
        else
            local v125 = table.find(v17, l_v12_Destination_1) ~= nil;
            local v126 = v116:PlaySound({
                name = v116.musicOverride or ("Music.%*"):format(l_v12_Destination_1), 
                extraData = {
                    isMusic = true
                }, 
                properties = {
                    TimePosition = v117
                }
            }, v125);
            v116.MusicPlaying:Fire(v126);
            return;
        end;
    end;
end;
return v24;