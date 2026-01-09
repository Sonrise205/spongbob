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
local v18 = TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
local v19 = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut);
local _ = v7.GetController("CamShakeController");
local v21 = v7.GetController("CharacterController");
local v22 = v7.GetController("UIController");
local v23 = v7.GetController("AudioController");
local v24 = v7.GetController("TowerController");
local v25 = v7.GetController("DeviceTypeController");
local v26 = nil;
local v27 = nil;
local v28 = {};
v28.__index = v28;
local _ = function(v29, v30) --[[ Line: 65 ]] --[[ Name: toggleEmitters ]]
    for _, v32 in v29 do
        v32.Enabled = v30;
    end;
end;
v28.new = function(v34, v35) --[[ Line: 72 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v28 (copy)
    if not v35 then
        return;
    else
        local v36 = setmetatable({
            timestamp = v34, 
            pathId = v35, 
            dumpster = v8.new()
        }, v28);
        local l_Map_0 = workspace:FindFirstChild("Map");
        if not l_Map_0 then
            return;
        else
            v36.map = l_Map_0;
            local l_BuildOffLimits_0 = l_Map_0.Zones.BuildOffLimits;
            l_BuildOffLimits_0 = l_BuildOffLimits_0 and l_BuildOffLimits_0:FindFirstChild(v35);
            if not l_BuildOffLimits_0 then
                return;
            else
                v36.pathBeams = {};
                for _, v40 in l_BuildOffLimits_0:GetDescendants() do
                    if v40:IsA("Beam") then
                        table.insert(v36.pathBeams, v40);
                    end;
                end;
                local l_PathCutscenes_0 = l_Map_0:FindFirstChild("PathCutscenes");
                if not l_PathCutscenes_0 then
                    return;
                else
                    local l_l_PathCutscenes_0_FirstChild_0 = l_PathCutscenes_0:FindFirstChild(v35);
                    if not l_l_PathCutscenes_0_FirstChild_0 then
                        return;
                    else
                        v36.dependencies = l_l_PathCutscenes_0_FirstChild_0;
                        v36.povs = {};
                        for _, v44 in l_l_PathCutscenes_0_FirstChild_0.POV:GetChildren() do
                            v36.povs[tonumber(v44.Name)] = v44.CFrame;
                        end;
                        v36.obstacles = l_l_PathCutscenes_0_FirstChild_0.Obstacles;
                        v36.obstacles:SetAttribute("OriginalPivot", v36.obstacles:GetPivot());
                        v36.groundParticles = {};
                        for _, v46 in l_l_PathCutscenes_0_FirstChild_0.GroundParticles:GetChildren() do
                            table.insert(v36.groundParticles, v46);
                            v46.Enabled = false;
                        end;
                        return v36;
                    end;
                end;
            end;
        end;
    end;
end;
v28.Play = function(v47) --[[ Line: 137 ]] --[[ Name: Play ]]
    -- upvalues: v22 (copy), v23 (copy), v24 (copy), v25 (copy), v21 (copy), v27 (ref), l_TweenService_0 (copy), v14 (copy), v18 (copy), v19 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v49 = v22:ToggleAll({
        "SkipCutscene"
    }, false);
    v23:FadeMusicVolume(0.5, 1);
    v24:StopTowerPlacement();
    v25:TogglePlayerControls(false);
    local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
    v47.dumpster:Add(function() --[[ Line: 148 ]]
        -- upvalues: v25 (ref), v22 (ref), v49 (copy), v23 (ref), l_CurrentCamera_0 (copy), l_FieldOfView_0 (copy)
        v25:TogglePlayerControls(true);
        v22:RevertFromToggleAll(v49);
        v23:FadeMusicVolume(1, 0.5);
        v22:Toggle("SkipCutscene", false);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
        l_CurrentCamera_0.FieldOfView = l_FieldOfView_0;
    end);
    local v51 = v47.timestamp - workspace:GetServerTimeNow();
    local v52 = nil;
    local v53 = nil;
    if v51 > 0 then
        local v54, v55 = v47:_sting({
            holdTime = math.max(0, v51 - 0.2)
        });
        v52 = v54;
        v53 = v55;
        if not v52:await() then
            return false;
        end;
    end;
    v21:ToggleHideAll(true);
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    l_CurrentCamera_0.CFrame = v47.povs[1] * CFrame.new(0, 0, 5);
    l_CurrentCamera_0.FieldOfView = 60;
    if v53 and not v53:await() then
        return false;
    else
        local v57 = v23:PlaySound({
            name = "Cutscenes.Ship", 
            soundGroup = "Master.SFX.VFX"
        });
        v47.dumpster:Add(v57);
        v27:Open(script.Name, v47.timestamp);
        local v58 = v47.povs[1] * CFrame.new(0, 0, -5);
        local v59 = TweenInfo.new(8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        local v60 = l_TweenService_0:Create(l_CurrentCamera_0, v59, {
            CFrame = v58
        });
        v47:_addTweenToDumpster(v60);
        v60:Play();
        for _, v62 in v47.groundParticles do
            v62.Enabled = true;
        end;
        if not v47:_delay(0.5) then
            return false;
        else
            for _, v64 in v47.pathBeams do
                v64.Enabled = true;
            end;
            v58 = v47.obstacles:GetAttribute("OriginalPivot");
            v60 = v58 - Vector3.new(0, v47.obstacles:GetExtentsSize().Y + 2, 0);
            v47.dumpster:Add(v14("CFrameValue", v58, v18, {
                Value = v60
            }, function(v65) --[[ Line: 218 ]]
                -- upvalues: v47 (copy)
                v47.obstacles:PivotTo(v65);
            end));
            if not v47:_delay(1) then
                return false;
            else
                for _, v67 in v47.groundParticles do
                    v67.Enabled = false;
                end;
                if not v47:_delay(2.5) then
                    return false;
                else
                    v22:Toggle("SkipCutscene", false);
                    if not v47:_delay(1) then
                        return false;
                    else
                        local v68 = l_TweenService_0:Create(l_CurrentCamera_0, v19, {
                            CFrame = l_CFrame_0, 
                            FieldOfView = l_FieldOfView_0
                        });
                        v47:_addTweenToDumpster(v68);
                        v68:Play();
                        v21:ToggleHideAll(false);
                        if not v47:_delay(v19.Time) then
                            return false;
                        else
                            v47:_cleanup(true);
                            return true;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v28.Skip = function(v69) --[[ Line: 264 ]] --[[ Name: Skip ]]
    v69.dumpster:Destroy();
    local l_Attribute_0 = v69.obstacles:GetAttribute("OriginalPivot");
    local v71 = v69.obstacles:GetExtentsSize().Y + 2;
    v69.obstacles:PivotTo(l_Attribute_0 - Vector3.new(0, v71, 0));
    for _, v73 in v69.groundParticles do
        v73.Enabled = false;
        v73:Clear();
    end;
    for _, v75 in v69.pathBeams do
        v75.Enabled = true;
    end;
    v69:_cleanup();
end;
v28._cleanup = function(v76, v77) --[[ Line: 285 ]] --[[ Name: _cleanup ]]
    -- upvalues: v21 (copy)
    if not v77 then
        v21:ToggleHideAll(false);
    end;
    v76.dumpster:Destroy();
    table.clear(v76);
    setmetatable(v76, nil);
end;
v28._sting = function(v78, v79) --[[ Line: 295 ]] --[[ Name: _sting ]]
    -- upvalues: v9 (copy), v26 (ref)
    v79 = v79 or {};
    local v80 = nil;
    local v83 = v9.new(function(v81) --[[ Line: 299 ]]
        -- upvalues: v80 (ref), v9 (ref), v26 (ref), v79 (ref)
        v80 = v9.new(function(v82) --[[ Line: 300 ]]
            -- upvalues: v26 (ref), v79 (ref), v81 (copy)
            v26:Transition({
                config = {
                    holdTime = v79.holdTime
                }, 
                callbacks = {
                    hold = v82, 
                    tweenOut = not v79.startWhenFinished and v81, 
                    finished = v79.startWhenFinished and v81
                }
            });
        end);
    end);
    v78.dumpster:Add(v80);
    v78.dumpster:Add(v83);
    return v80, v83;
end;
v28._delay = function(v84, v85) --[[ Line: 318 ]] --[[ Name: _delay ]]
    -- upvalues: v9 (copy)
    local v86 = v9.delay(v85);
    v84.dumpster:Add(v86);
    return v86:await();
end;
v28._addTweenToDumpster = function(v87, v88) --[[ Line: 325 ]] --[[ Name: _addTweenToDumpster ]]
    v87.dumpster:Add(function() --[[ Line: 326 ]]
        -- upvalues: v88 (copy)
        v88:Cancel();
        v88:Destroy();
    end);
end;
v7.OnStart():andThen(function() --[[ Line: 332 ]]
    -- upvalues: v12 (copy), v26 (ref), v22 (copy), v27 (ref)
    if not v12:IsGame() then
        return;
    else
        v26 = v22:GetModuleAsync("Sting"):expect();
        v27 = v27 or v22:GetModuleAsync("SkipCutscene"):expect();
        return;
    end;
end);
return v28;