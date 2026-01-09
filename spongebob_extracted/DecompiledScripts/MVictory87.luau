local _ = game:GetService("ContentProvider");
local _ = game:GetService("HttpService");
local _ = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v7 = require(l_ReplicatedStorage_0.Packages.Knit);
local v8 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local v9 = require(l_ReplicatedStorage_0.Packages.Promise);
local _ = require(l_ReplicatedStorage_0.Packages.TableUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local _ = require(l_ReplicatedFirst_0.PlaceIds);
local _ = require(l_ReplicatedStorage_0.Shared.Util.UsefulFunctions);
local _ = require(l_ReplicatedStorage_0.Shared.Modules.Tweener);
local _ = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Util.CharacterUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Variables);
local v18 = require(l_ReplicatedStorage_0.Shared.Modules.SharedAnimator);
local v19 = TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut);
local _ = v7.GetController("CamShakeController");
local _ = v7.GetController("CharacterController");
local v22 = v7.GetController("UIController");
local v23 = v7.GetController("AudioController");
local _ = v7.GetController("TowerController");
local v25 = v7.GetController("DeviceTypeController");
local v26 = v7.GetController("BlurController");
local v27 = nil;
local v28 = {};
v28.__index = v28;
v28.new = function() --[[ Line: 56 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), v8 (copy), v28 (copy), v27 (ref), v22 (copy)
    local v29 = setmetatable({
        character = v7.Player.Character, 
        dumpster = v8.new()
    }, v28);
    if not v29.character then
        return;
    else
        v29.humanoid = v29.character:FindFirstChildOfClass("Humanoid");
        if not v29.humanoid then
            return;
        else
            v27 = v22:GetModuleAsync("BarnacleReward"):expect();
            return v29;
        end;
    end;
end;
v28.Play = function(v30) --[[ Line: 77 ]] --[[ Name: Play ]]
    -- upvalues: v23 (copy), v25 (copy), l_ReplicatedStorage_0 (copy), v18 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), v26 (copy), v22 (copy), v9 (copy), v27 (ref), v19 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    v23:FadeMusicVolume(0, 1);
    v25:TogglePlayerControls(false);
    local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
    v30.dumpster:Add(function() --[[ Line: 85 ]]
        -- upvalues: v30 (copy), v25 (ref), l_CurrentCamera_0 (copy), l_FieldOfView_0 (copy)
        if v30.character and v30.character.PrimaryPart then
            v30.character.PrimaryPart.Anchored = false;
        end;
        if v30.humanoid then
            v30.humanoid.PlatformStand = false;
        end;
        v25:TogglePlayerControls(true);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
        l_CurrentCamera_0.FieldOfView = l_FieldOfView_0;
    end);
    local l_HuntEvent_0 = l_ReplicatedStorage_0.HuntEvent;
    local v34 = l_HuntEvent_0.Barnacle:Clone();
    v34.Parent = v30.character;
    v30.humanoid:EquipTool(v34);
    local l_RightHand_0 = v30.character:FindFirstChild("RightHand");
    local l_RightGrip_0 = l_RightHand_0:WaitForChild("RightGrip");
    local l_Motor6D_0 = Instance.new("Motor6D");
    l_Motor6D_0.C0 = l_RightGrip_0.C0;
    l_Motor6D_0.C1 = l_RightGrip_0.C1;
    l_Motor6D_0.Part0 = l_RightGrip_0.Part0;
    l_Motor6D_0.Part1 = l_RightGrip_0.Part1;
    l_Motor6D_0.Parent = l_RightHand_0;
    l_RightGrip_0:Destroy();
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    v30.character.PrimaryPart.Anchored = true;
    v30.humanoid.PlatformStand = true;
    local l_CFrame_1 = workspace.CurrentCamera.CFrame;
    local l_Pivot_0 = v30.character:GetPivot();
    local l_Unit_0 = (Vector3.new(l_CFrame_1.X, l_Pivot_0.Y, l_CFrame_1.Z) - l_Pivot_0.Position).Unit;
    local v42 = nil;
    local v43 = nil;
    v42 = v18:PlayAnimation(v30.character, "Player.MVictory", nil, {
        markers = {
            ReleaseToken = function() --[[ Line: 137 ]] --[[ Name: ReleaseToken ]]
                -- upvalues: l_Motor6D_0 (copy), v34 (copy), v30 (copy), l_Unit_0 (copy), v43 (ref), l_TweenService_0 (ref)
                l_Motor6D_0:Destroy();
                v34.PrimaryPart.Anchored = true;
                local l_Position_0 = v30.character.PrimaryPart.Position;
                local v45 = CFrame.lookAlong(l_Position_0, l_Unit_0) * CFrame.new(0, 9, -2) * CFrame.Angles(1.5707963267948966, 3.141592653589793, 3.141592653589793);
                v43 = l_TweenService_0:Create(v34.PrimaryPart, TweenInfo.new(1.5), {
                    CFrame = v45
                });
                v30:_addTweenToDumpster(v43);
                v43:Play();
            end, 
            CatchToken = function() --[[ Line: 157 ]] --[[ Name: CatchToken ]]
                -- upvalues: v43 (ref), v30 (copy), l_RunService_0 (ref), l_RightHand_0 (copy), v34 (copy)
                v43:Cancel();
                v43 = nil;
                v30.dumpster:Add(l_RunService_0.RenderStepped:Connect(function(v46) --[[ Line: 161 ]]
                    -- upvalues: l_RightHand_0 (ref), v34 (ref)
                    local l_WorldCFrame_0 = l_RightHand_0.RightGripAttachment.WorldCFrame;
                    local v48 = v34.Grip:ToObjectSpace(l_RightHand_0.RightGripAttachment.CFrame);
                    local v49 = v34:GetPivot():Lerp(l_WorldCFrame_0 * v48, v46 * 8);
                    v34:PivotTo(v49);
                end), "Catch");
            end
        }, 
        finished = function() --[[ Line: 173 ]] --[[ Name: finished ]]
            -- upvalues: l_RunService_0 (ref), v42 (ref)
            l_RunService_0.RenderStepped:Wait();
            v42:Play(0, 1, 0);
            v42.TimePosition = v42.Length - 0.001;
        end
    });
    local v50 = v23:PlaySound({
        name = "Cutscenes.MVictory", 
        soundGroup = "Master.SFX.VFX"
    }, true);
    v30.dumpster:Add(v50);
    local v51 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
    local v52 = CFrame.lookAlong(l_Pivot_0.Position, l_Unit_0);
    local v53 = l_TweenService_0:Create(v30.character.PrimaryPart, v51, {
        CFrame = v52
    });
    v30:_addTweenToDumpster(v53);
    v53:Play();
    local v54 = l_Pivot_0.Position + l_Unit_0 * 15 + Vector3.new(0, 6, 0, 0);
    local v55 = CFrame.lookAlong(v54, -l_Unit_0) * CFrame.fromAxisAngle(Vector3.new(1, 0, 0, 0), -0.13962634015954636);
    local v56 = l_TweenService_0:Create(l_CurrentCamera_0, v51, {
        CFrame = v55, 
        FieldOfView = 60
    });
    v30:_addTweenToDumpster(v56);
    v56:Play();
    if not v30:_delay(1.5) then
        return false;
    else
        v56 = nil;
        v26:SetMVictoryDepthMode(true);
        v56 = l_HuntEvent_0.TokenGlow.Attachment:Clone();
        v56.Parent = v30.character.PrimaryPart;
        v56.Glow.Enabled = true;
        local v57 = l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
            CFrame = v55 * CFrame.new(0, 0, -5) - Vector3.new(0, 2, 0, 0)
        });
        v30:_addTweenToDumpster(v57);
        v57:Play();
        if not v30:_delay(0.5) then
            return false;
        else
            for _, v59 in v34.glow.Attachment:GetChildren() do
                if v59:IsA("ParticleEmitter") then
                    v59.Enabled = true;
                    v59:Emit(10);
                end;
            end;
            v22:Toggle("BarnacleReward", true);
            task.delay(4, function() --[[ Line: 258 ]]
                -- upvalues: v23 (ref)
                v23:FadeMusicVolume(1, 1);
            end);
            v57 = v9.new(function(v60) --[[ Line: 262 ]]
                -- upvalues: v27 (ref)
                v27.ClosingMenu:Once(v60);
            end);
            v30.dumpster:Add(v57);
            if not v57:await() then
                return false;
            else
                if v30.dumpster:Get("Catch") then
                    v30.dumpster:Remove("Catch");
                end;
                v42:Stop(0.3);
                v34:Destroy();
                v56:Destroy();
                v26:SetMVictoryDepthMode(false);
                local v61 = l_TweenService_0:Create(l_CurrentCamera_0, v19, {
                    CFrame = l_CFrame_0, 
                    FieldOfView = l_FieldOfView_0
                });
                v30:_addTweenToDumpster(v61);
                v61:Play();
                if not v30:_delay(v19.Time) then
                    return false;
                else
                    local l_Exit_0 = workspace.Cave.Interactables.Exit;
                    l_Exit_0.ExitBlocked:Destroy();
                    l_Exit_0.ExitGlow.Transparency = 0;
                    l_Exit_0.ExitGlow.SurfaceLight.Enabled = true;
                    local l_Gui_0 = l_Exit_0.Gui;
                    l_Gui_0.Position = l_Gui_0.Position + Vector3.new(0, 50, 0, 0);
                    l_Exit_0.ExitReveal.Particles:Emit(60);
                    l_Exit_0.ExitReveal.Poof:Play();
                    v30:_cleanup(true);
                    return true;
                end;
            end;
        end;
    end;
end;
v28.Skip = function(v64) --[[ Line: 315 ]] --[[ Name: Skip ]]
    v64:_cleanup();
end;
v28._cleanup = function(v65, _) --[[ Line: 321 ]] --[[ Name: _cleanup ]]
    v65.dumpster:Destroy();
    table.clear(v65);
    setmetatable(v65, nil);
end;
v28._delay = function(v67, v68) --[[ Line: 327 ]] --[[ Name: _delay ]]
    -- upvalues: v9 (copy)
    local v69 = v9.delay(v68);
    v67.dumpster:Add(v69);
    return v69:await();
end;
v28._addTweenToDumpster = function(v70, v71) --[[ Line: 334 ]] --[[ Name: _addTweenToDumpster ]]
    v70.dumpster:Add(function() --[[ Line: 335 ]]
        -- upvalues: v71 (copy)
        v71:Cancel();
        v71:Destroy();
    end);
end;
return v28;