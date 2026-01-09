local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Knit);
local v3 = require(l_ReplicatedStorage_0.Packages.Dumpster);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v5 = require(l_ReplicatedStorage_0.Shared.Util.PathUtil);
local v6 = require(l_ReplicatedStorage_0.Shared.Modules.SharedAnimator);
local l_Gravity_0 = workspace.Gravity;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local l_Animations_0 = l_ReplicatedStorage_0.Animations;
local v12 = {};
v12.__index = v12;
v12.new = function(v13) --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v12 (copy), l_ReplicatedStorage_0 (copy), v2 (copy), v9 (ref), v10 (ref), l_Gravity_0 (copy)
    local v14 = setmetatable({
        mount = v13, 
        mountName = v13:GetAttribute("MountName"), 
        dumpster = v3.new()
    }, v12);
    if not v13.PrimaryPart then
        return;
    else
        v14.animationReference = v14.mount:GetAttribute("AnimationReference") or v14.mountName;
        v14.animationsPath = ("Mounts.%*"):format(v14.animationReference);
        if not l_ReplicatedStorage_0.Animations.Mounts:FindFirstChild(v14.animationReference) then
            v14.animationsPath = "Mounts.Boatmobile";
        end;
        v14:_playAnimation("Idle");
        local l_Character_0 = v2.Player.Character;
        local l_v9_Humanoid_0 = v9:GetHumanoid();
        if l_v9_Humanoid_0 then
            l_v9_Humanoid_0:SetStateEnabled(Enum.HumanoidStateType.Seated, false);
            v14.dumpster:Add(function() --[[ Line: 66 ]]
                -- upvalues: l_v9_Humanoid_0 (copy)
                if not l_v9_Humanoid_0 or not l_v9_Humanoid_0.Parent then
                    return;
                else
                    l_v9_Humanoid_0:SetStateEnabled(Enum.HumanoidStateType.Seated, true);
                    return;
                end;
            end);
        end;
        local l_v13_Attribute_0 = v13:GetAttribute("CameraOffset");
        if l_v9_Humanoid_0 and l_v13_Attribute_0 then
            l_v9_Humanoid_0.CameraOffset = l_v13_Attribute_0;
            local l_l_v13_Attribute_0_0 = l_v13_Attribute_0 --[[ copy: 5 -> 8 ]];
            v14.dumpster:Add(v10.StoppedPlacing:Connect(function() --[[ Line: 80 ]]
                -- upvalues: l_v9_Humanoid_0 (copy), l_l_v13_Attribute_0_0 (copy)
                l_v9_Humanoid_0.CameraOffset = l_l_v13_Attribute_0_0;
            end));
            v14.dumpster:Add(function() --[[ Line: 84 ]]
                -- upvalues: l_v9_Humanoid_0 (copy), v10 (ref)
                if not l_v9_Humanoid_0 or not l_v9_Humanoid_0.Parent then
                    return;
                else
                    if not v10:IsPlacingTower() then
                        l_v9_Humanoid_0.CameraOffset = Vector3.new(0, 0, 0, 0);
                    end;
                    return;
                end;
            end);
        end;
        l_v13_Attribute_0 = l_Character_0.PrimaryPart:FindFirstChild("Running");
        if l_v13_Attribute_0 and l_v13_Attribute_0:IsA("Sound") then
            local l_Volume_0 = l_v13_Attribute_0.Volume;
            l_v13_Attribute_0.Volume = 0;
            local l_l_Volume_0_0 = l_Volume_0 --[[ copy: 6 -> 7 ]];
            v14.dumpster:Add(function() --[[ Line: 101 ]]
                -- upvalues: l_v13_Attribute_0 (copy), l_l_Volume_0_0 (copy)
                if l_v13_Attribute_0 and l_v13_Attribute_0.Parent then
                    l_v13_Attribute_0.Volume = l_l_Volume_0_0;
                end;
            end);
        end;
        local l_v13_Attribute_1 = v13:GetAttribute("GravityMultiplier");
        if l_v13_Attribute_1 then
            workspace.Gravity = l_Gravity_0 * l_v13_Attribute_1;
            v14.dumpster:Add(function() --[[ Line: 111 ]]
                -- upvalues: l_Gravity_0 (ref)
                workspace.Gravity = l_Gravity_0;
            end);
        end;
        return v14;
    end;
end;
v12.Destroy = function(v22) --[[ Line: 121 ]] --[[ Name: Destroy ]]
    v22.mount = nil;
    v22:_stopAnimation();
    v22.dumpster:Destroy();
end;
v12._stopAnimation = function(v23) --[[ Line: 129 ]] --[[ Name: _stopAnimation ]]
    if v23.animationDumpster then
        v23.animationDumpster:Destroy();
        v23.animationDumpster = nil;
    end;
end;
v12._playAnimation = function(v24, v25, v26, v27) --[[ Line: 136 ]] --[[ Name: _playAnimation ]]
    -- upvalues: v5 (copy), l_Animations_0 (copy), v6 (copy), v2 (copy)
    local v28 = ("%*.%*"):format(v24.animationsPath, v25);
    if not v5(l_Animations_0, v28) then
        return;
    else
        v26 = v26 or {};
        v26.looped = true;
        v24.animationDumpster = select(2, v6:PlayAnimation(v2.Player.Character, v28, v26, v27));
        return;
    end;
end;
v2.OnStart():andThen(function() --[[ Line: 157 ]]
    -- upvalues: v8 (ref), v2 (copy), v9 (ref), v10 (ref)
    v8 = v2.GetService("MountService");
    v9 = v2.GetController("CharacterController");
    v10 = v2.GetController("TowerController");
end);
return v12;