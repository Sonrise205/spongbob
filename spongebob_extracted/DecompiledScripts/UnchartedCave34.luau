local _ = game:GetService("ContentProvider");
local _ = game:GetService("HttpService");
local _ = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v7 = require(l_ReplicatedStorage_0.Packages.Knit);
local v8 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v9 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v12 = require(l_ReplicatedFirst_0.PlaceIds);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local v14 = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local _ = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Util.CharacterUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v18 = TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v19 = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut);
local v20 = TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
local v21 = v7.GetController("CamShakeController");
local _ = v7.GetController("CharacterController");
local v23 = v7.GetController("UIController");
local v24 = v7.GetController("AudioController");
local _ = v7.GetController("TowerController");
local v26 = v7.GetController("DeviceTypeController");
local v27 = nil;
local v28 = {};
v28.__index = v28;
local _ = function(v29, v30) --[[ Line: 57 ]] --[[ Name: toggleEmitters ]]
    for _, v32 in v29 do
        v32.Enabled = v30;
    end;
end;
v28.new = function() --[[ Line: 64 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v28 (copy)
    local v34 = setmetatable({
        dumpster = v8.new()
    }, v28);
    local l_Cave_0 = workspace:FindFirstChild("Cave");
    if not l_Cave_0 then
        return;
    else
        v34.cave = l_Cave_0;
        v34.giantDoor = l_Cave_0.GiantDoor;
        v34.povs = {};
        for _, v37 in l_Cave_0.POV:GetChildren() do
            local v38 = tonumber(v37.Name);
            if v38 then
                v34.povs[v38] = v37.CFrame;
            end;
        end;
        v34.particles = {
            falling = {}, 
            ground = {}
        };
        local l_CutsceneParticles_0 = l_Cave_0.CutsceneParticles;
        for _, v41 in l_CutsceneParticles_0.Impact:GetDescendants() do
            if v41:IsA("ParticleEmitter") then
                table.insert(v34.particles.ground, v41);
                v41.Enabled = false;
            end;
        end;
        for _, v43 in l_CutsceneParticles_0.FallingRocks:GetDescendants() do
            if v43:IsA("ParticleEmitter") then
                table.insert(v34.particles.falling, v43);
                v43.Enabled = false;
            end;
        end;
        return v34;
    end;
end;
v28.Play = function(v44) --[[ Line: 115 ]] --[[ Name: Play ]]
    -- upvalues: v24 (copy), v26 (copy), l_TweenService_0 (copy), v18 (copy), v21 (copy), v14 (copy), v20 (copy), v9 (copy), v19 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    v24:FadeMusicVolume(0, 1);
    v26:TogglePlayerControls(false);
    local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
    v44.dumpster:Add(function() --[[ Line: 123 ]]
        -- upvalues: v26 (ref), v24 (ref), l_CurrentCamera_0 (copy), l_FieldOfView_0 (copy)
        v26:TogglePlayerControls(true);
        v24:FadeMusicVolume(1, 0.5);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
        l_CurrentCamera_0.FieldOfView = l_FieldOfView_0;
    end);
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    local v48 = l_TweenService_0:Create(l_CurrentCamera_0, v18, {
        CFrame = v44.povs[1], 
        FieldOfView = 60
    });
    v44:_addTweenToDumpster(v48);
    v48:Play();
    if not v44:_delay(v18.Time * 0.9) then
        return false;
    else
        v48 = v24:PlaySound({
            name = "Cutscenes.Rumble", 
            soundGroup = "Master.SFX.VFX", 
            extraData = {
                fadeIn = true, 
                fadeTime = 0.65
            }
        }, true);
        v44.dumpster:Add(v48);
        local l_v21_Preset_0 = v21:GetPreset("CaveSustain");
        v21:Shake("CaveSustain", {
            originalPivot = v44.povs[1]
        });
        for _, v51 in v44.particles.falling do
            v51.Enabled = true;
        end;
        if not v44:_delay(1) then
            return false;
        else
            for _, v53 in v44.particles.ground do
                v53.Enabled = true;
            end;
            v24:PlaySound({
                name = "Cutscenes.GiantDoor", 
                soundGroup = "Master.SFX.VFX"
            }, true);
            local l_GiantDoor_0 = v44.cave.GiantDoor;
            for _, v56 in l_GiantDoor_0:GetChildren() do
                local l_v56_Pivot_0 = v56:GetPivot();
                if not v56:GetAttribute("Origin") then
                    v56:SetAttribute("Origin", l_v56_Pivot_0);
                end;
            end;
            for _, v59 in l_GiantDoor_0:GetChildren() do
                local v60 = v59.Name == "LeftDoor";
                local l_X_0 = v59:GetExtentsSize().X;
                local l_v59_Attribute_0 = v59:GetAttribute("Origin");
                if not v60 then
                    l_X_0 = l_X_0 * -1;
                end;
                local v63 = l_v59_Attribute_0 + l_v59_Attribute_0.RightVector * l_X_0;
                v44.dumpster:Add(v14("CFrameValue", v59:GetPivot(), v20, {
                    Value = v63
                }, function(v64) --[[ Line: 209 ]]
                    -- upvalues: v59 (copy)
                    v59:PivotTo(v64);
                end));
            end;
            if not v44:_delay(v20.Time - l_v21_Preset_0.FadeOutTime) then
                return false;
            else
                l_GiantDoor_0 = v9.new(function(v65) --[[ Line: 220 ]]
                    -- upvalues: v21 (ref)
                    v21:BindToEnd(v65);
                end);
                v44.dumpster:Add(l_GiantDoor_0);
                v21:Stop();
                v24:StopSound(v48, {
                    fadeOut = true, 
                    fadeTime = 1
                });
                for _, v67 in v44.particles.falling do
                    v67.Enabled = false;
                end;
                if not v44:_delay(1) then
                    return false;
                else
                    for _, v69 in v44.particles.ground do
                        v69.Enabled = false;
                    end;
                    if not l_GiantDoor_0:await() then
                        return false;
                    else
                        local v70 = l_TweenService_0:Create(l_CurrentCamera_0, v19, {
                            CFrame = l_CFrame_0, 
                            FieldOfView = l_FieldOfView_0
                        });
                        v44:_addTweenToDumpster(v70);
                        v70:Play();
                        if not v44:_delay(v19.Time) then
                            return false;
                        else
                            v44:_cleanup(true);
                            return true;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v28.Skip = function(v71) --[[ Line: 268 ]] --[[ Name: Skip ]]
    v71.dumpster:Destroy();
    for _, v73 in v71.particles do
        for _, v75 in v73 do
            v75.Enabled = false;
        end;
    end;
    v71:_cleanup();
end;
v28._cleanup = function(v76, _) --[[ Line: 282 ]] --[[ Name: _cleanup ]]
    v76.dumpster:Destroy();
    table.clear(v76);
    setmetatable(v76, nil);
end;
v28._delay = function(v78, v79) --[[ Line: 288 ]] --[[ Name: _delay ]]
    -- upvalues: v9 (copy)
    local v80 = v9.delay(v79);
    v78.dumpster:Add(v80);
    return v80:await();
end;
v28._addTweenToDumpster = function(v81, v82) --[[ Line: 295 ]] --[[ Name: _addTweenToDumpster ]]
    v81.dumpster:Add(function() --[[ Line: 296 ]]
        -- upvalues: v82 (copy)
        v82:Cancel();
        v82:Destroy();
    end);
end;
v7.OnStart():andThen(function() --[[ Line: 302 ]]
    -- upvalues: v12 (copy), v27 (ref), v23 (copy)
    if not v12:IsGame() then
        return;
    else
        v27 = v23:GetModuleAsync("Sting"):expect();
        return;
    end;
end);
return v28;