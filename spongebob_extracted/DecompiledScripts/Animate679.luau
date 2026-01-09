local l_Parent_0 = script.Parent;
local l_Humanoid_0 = l_Parent_0:WaitForChild("Humanoid");
local v2 = "Standing";
local l_status_0, l_result_0 = pcall(function() --[[ Line: 5 ]]
    return UserSettings():IsUserFeatureEnabled("UserNoUpdateOnLoop");
end);
local v5 = l_status_0 and l_result_0;
local l_status_1, l_result_1 = pcall(function() --[[ Line: 7 ]]
    return UserSettings():IsUserFeatureEnabled("UserAnimateScaleRun");
end);
local v8 = l_status_1 and l_result_1;
local function v9() --[[ Line: 9 ]] --[[ Name: getRigScale ]]
    -- upvalues: v8 (copy), l_Parent_0 (copy)
    if v8 then
        return l_Parent_0:GetScale();
    else
        return 1;
    end;
end;
local l_ScaleDampeningPercent_0 = script:FindFirstChild("ScaleDampeningPercent");
local v11 = "";
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = 1;
local v16 = nil;
local v17 = nil;
local v18 = {};
local v19 = {};
local v20 = {
    idle = {
        {
            id = "http://www.roblox.com/asset/?id=507766666", 
            weight = 1
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507766951", 
            weight = 1
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507766388", 
            weight = 9
        }
    }, 
    walk = {
        {
            id = "http://www.roblox.com/asset/?id=507777826", 
            weight = 10
        }
    }, 
    run = {
        {
            id = "http://www.roblox.com/asset/?id=507767714", 
            weight = 10
        }
    }, 
    swim = {
        {
            id = "http://www.roblox.com/asset/?id=507784897", 
            weight = 10
        }
    }, 
    swimidle = {
        {
            id = "http://www.roblox.com/asset/?id=507785072", 
            weight = 10
        }
    }, 
    jump = {
        {
            id = "http://www.roblox.com/asset/?id=507765000", 
            weight = 10
        }
    }, 
    fall = {
        {
            id = "http://www.roblox.com/asset/?id=507767968", 
            weight = 10
        }
    }, 
    climb = {
        {
            id = "http://www.roblox.com/asset/?id=507765644", 
            weight = 10
        }
    }, 
    sit = {
        {
            id = "http://www.roblox.com/asset/?id=2506281703", 
            weight = 10
        }
    }, 
    toolnone = {
        {
            id = "http://www.roblox.com/asset/?id=507768375", 
            weight = 10
        }
    }, 
    toolslash = {
        {
            id = "http://www.roblox.com/asset/?id=522635514", 
            weight = 10
        }
    }, 
    toollunge = {
        {
            id = "http://www.roblox.com/asset/?id=522638767", 
            weight = 10
        }
    }, 
    wave = {
        {
            id = "http://www.roblox.com/asset/?id=507770239", 
            weight = 10
        }
    }, 
    point = {
        {
            id = "http://www.roblox.com/asset/?id=507770453", 
            weight = 10
        }
    }, 
    dance = {
        {
            id = "http://www.roblox.com/asset/?id=507771019", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507771955", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507772104", 
            weight = 10
        }
    }, 
    dance2 = {
        {
            id = "http://www.roblox.com/asset/?id=507776043", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507776720", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507776879", 
            weight = 10
        }
    }, 
    dance3 = {
        {
            id = "http://www.roblox.com/asset/?id=507777268", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507777451", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507777623", 
            weight = 10
        }
    }, 
    laugh = {
        {
            id = "http://www.roblox.com/asset/?id=507770818", 
            weight = 10
        }
    }, 
    cheer = {
        {
            id = "http://www.roblox.com/asset/?id=507770677", 
            weight = 10
        }
    }
};
local v21 = {
    wave = false, 
    point = false, 
    dance = true, 
    dance2 = true, 
    dance3 = true, 
    laugh = false, 
    cheer = false
};
math.randomseed(tick());
findExistingAnimationInSet = function(v22, v23) --[[ Line: 98 ]] --[[ Name: findExistingAnimationInSet ]]
    if v22 == nil or v23 == nil then
        return 0;
    else
        for v24 = 1, v22.count do
            if v22[v24].anim.AnimationId == v23.AnimationId then
                return v24;
            end;
        end;
        return 0;
    end;
end;
configureAnimationSet = function(v25, v26) --[[ Line: 111 ]] --[[ Name: configureAnimationSet ]]
    -- upvalues: v19 (copy), v18 (copy), l_Humanoid_0 (copy)
    if v19[v25] ~= nil then
        for _, v28 in pairs(v19[v25].connections) do
            v28:disconnect();
        end;
    end;
    v19[v25] = {};
    v19[v25].count = 0;
    v19[v25].totalWeight = 0;
    v19[v25].connections = {};
    local v29 = true;
    local l_status_2, _ = pcall(function() --[[ Line: 122 ]]
        -- upvalues: v29 (ref)
        v29 = game:GetService("StarterPlayer").AllowCustomAnimations;
    end);
    if not l_status_2 then
        v29 = true;
    end;
    local l_script_FirstChild_0 = script:FindFirstChild(v25);
    if v29 and l_script_FirstChild_0 ~= nil then
        table.insert(v19[v25].connections, l_script_FirstChild_0.ChildAdded:connect(function(_) --[[ Line: 129 ]]
            -- upvalues: v25 (copy), v26 (copy)
            configureAnimationSet(v25, v26);
        end));
        table.insert(v19[v25].connections, l_script_FirstChild_0.ChildRemoved:connect(function(_) --[[ Line: 130 ]]
            -- upvalues: v25 (copy), v26 (copy)
            configureAnimationSet(v25, v26);
        end));
        local v35 = 0;
        for _, v37 in pairs(l_script_FirstChild_0:GetChildren()) do
            if v37:IsA("Animation") then
                local v38 = 1;
                local l_Weight_0 = v37:FindFirstChild("Weight");
                if l_Weight_0 ~= nil then
                    v38 = l_Weight_0.Value;
                end;
                v19[v25].count = v19[v25].count + 1;
                v35 = v19[v25].count;
                v19[v25][v35] = {};
                v19[v25][v35].anim = v37;
                v19[v25][v35].weight = v38;
                v19[v25].totalWeight = v19[v25].totalWeight + v19[v25][v35].weight;
                table.insert(v19[v25].connections, v37.Changed:connect(function(_) --[[ Line: 146 ]]
                    -- upvalues: v25 (copy), v26 (copy)
                    configureAnimationSet(v25, v26);
                end));
                table.insert(v19[v25].connections, v37.ChildAdded:connect(function(_) --[[ Line: 147 ]]
                    -- upvalues: v25 (copy), v26 (copy)
                    configureAnimationSet(v25, v26);
                end));
                table.insert(v19[v25].connections, v37.ChildRemoved:connect(function(_) --[[ Line: 148 ]]
                    -- upvalues: v25 (copy), v26 (copy)
                    configureAnimationSet(v25, v26);
                end));
            end;
        end;
    end;
    if v19[v25].count <= 0 then
        for v43, v44 in pairs(v26) do
            v19[v25][v43] = {};
            v19[v25][v43].anim = Instance.new("Animation");
            v19[v25][v43].anim.Name = v25;
            v19[v25][v43].anim.AnimationId = v44.id;
            v19[v25][v43].weight = v44.weight;
            v19[v25].count = v19[v25].count + 1;
            v19[v25].totalWeight = v19[v25].totalWeight + v44.weight;
        end;
    end;
    for _, v46 in pairs(v19) do
        for v47 = 1, v46.count do
            if v18[v46[v47].anim.AnimationId] == nil then
                l_Humanoid_0:LoadAnimation(v46[v47].anim);
                v18[v46[v47].anim.AnimationId] = true;
            end;
        end;
    end;
end;
configureAnimationSetOld = function(v48, v49) --[[ Line: 177 ]] --[[ Name: configureAnimationSetOld ]]
    -- upvalues: v19 (copy), l_Humanoid_0 (copy)
    if v19[v48] ~= nil then
        for _, v51 in pairs(v19[v48].connections) do
            v51:disconnect();
        end;
    end;
    v19[v48] = {};
    v19[v48].count = 0;
    v19[v48].totalWeight = 0;
    v19[v48].connections = {};
    local v52 = true;
    local l_status_3, _ = pcall(function() --[[ Line: 188 ]]
        -- upvalues: v52 (ref)
        v52 = game:GetService("StarterPlayer").AllowCustomAnimations;
    end);
    if not l_status_3 then
        v52 = true;
    end;
    local l_script_FirstChild_1 = script:FindFirstChild(v48);
    if v52 and l_script_FirstChild_1 ~= nil then
        table.insert(v19[v48].connections, l_script_FirstChild_1.ChildAdded:connect(function(_) --[[ Line: 195 ]]
            -- upvalues: v48 (copy), v49 (copy)
            configureAnimationSet(v48, v49);
        end));
        table.insert(v19[v48].connections, l_script_FirstChild_1.ChildRemoved:connect(function(_) --[[ Line: 196 ]]
            -- upvalues: v48 (copy), v49 (copy)
            configureAnimationSet(v48, v49);
        end));
        local v58 = 1;
        for _, v60 in pairs(l_script_FirstChild_1:GetChildren()) do
            if v60:IsA("Animation") then
                table.insert(v19[v48].connections, v60.Changed:connect(function(_) --[[ Line: 200 ]]
                    -- upvalues: v48 (copy), v49 (copy)
                    configureAnimationSet(v48, v49);
                end));
                v19[v48][v58] = {};
                v19[v48][v58].anim = v60;
                local l_Weight_1 = v60:FindFirstChild("Weight");
                if l_Weight_1 == nil then
                    v19[v48][v58].weight = 1;
                else
                    v19[v48][v58].weight = l_Weight_1.Value;
                end;
                v19[v48].count = v19[v48].count + 1;
                v19[v48].totalWeight = v19[v48].totalWeight + v19[v48][v58].weight;
                v58 = v58 + 1;
            end;
        end;
    end;
    if v19[v48].count <= 0 then
        for v63, v64 in pairs(v49) do
            v19[v48][v63] = {};
            v19[v48][v63].anim = Instance.new("Animation");
            v19[v48][v63].anim.Name = v48;
            v19[v48][v63].anim.AnimationId = v64.id;
            v19[v48][v63].weight = v64.weight;
            v19[v48].count = v19[v48].count + 1;
            v19[v48].totalWeight = v19[v48].totalWeight + v64.weight;
        end;
    end;
    for _, v66 in pairs(v19) do
        for v67 = 1, v66.count do
            l_Humanoid_0:LoadAnimation(v66[v67].anim);
        end;
    end;
end;
scriptChildModified = function(v68) --[[ Line: 237 ]] --[[ Name: scriptChildModified ]]
    -- upvalues: v20 (copy)
    local v69 = v20[v68.Name];
    if v69 ~= nil then
        configureAnimationSet(v68.Name, v69);
    end;
end;
script.ChildAdded:connect(scriptChildModified);
script.ChildRemoved:connect(scriptChildModified);
local v70 = if l_Humanoid_0 then l_Humanoid_0:FindFirstChildOfClass("Animator") else nil;
if v70 then
    local l_v70_PlayingAnimationTracks_0 = v70:GetPlayingAnimationTracks();
    for _, v73 in ipairs(l_v70_PlayingAnimationTracks_0) do
        v73:Stop(0);
        v73:Destroy();
    end;
end;
for v74, v75 in pairs(v20) do
    configureAnimationSet(v74, v75);
end;
local v76 = "None";
local v77 = 0;
local v78 = 0;
local v79 = false;
stopAllAnimations = function() --[[ Line: 268 ]] --[[ Name: stopAllAnimations ]]
    -- upvalues: v11 (ref), v21 (copy), v79 (ref), v12 (ref), v14 (ref), v13 (ref), v17 (ref), v16 (ref)
    local l_v11_0 = v11;
    if v21[l_v11_0] ~= nil and v21[l_v11_0] == false then
        l_v11_0 = "idle";
    end;
    if v79 then
        l_v11_0 = "idle";
        v79 = false;
    end;
    v11 = "";
    v12 = nil;
    if v14 ~= nil then
        v14:disconnect();
    end;
    if v13 ~= nil then
        v13:Stop();
        v13:Destroy();
        v13 = nil;
    end;
    if v17 ~= nil then
        v17:disconnect();
    end;
    if v16 ~= nil then
        v16:Stop();
        v16:Destroy();
        v16 = nil;
    end;
    return l_v11_0;
end;
getHeightScale = function() --[[ Line: 302 ]] --[[ Name: getHeightScale ]]
    -- upvalues: l_Humanoid_0 (copy), v9 (copy), l_ScaleDampeningPercent_0 (ref)
    if l_Humanoid_0 then
        if not l_Humanoid_0.AutomaticScalingEnabled then
            return v9();
        else
            local v81 = l_Humanoid_0.HipHeight / 2;
            if l_ScaleDampeningPercent_0 == nil then
                l_ScaleDampeningPercent_0 = script:FindFirstChild("ScaleDampeningPercent");
            end;
            if l_ScaleDampeningPercent_0 ~= nil then
                v81 = 1 + (l_Humanoid_0.HipHeight - 2) * l_ScaleDampeningPercent_0.Value / 2;
            end;
            return v81;
        end;
    else
        return v9();
    end;
end;
local function _(v82) --[[ Line: 321 ]] --[[ Name: rootMotionCompensation ]]
    return v82 * 1.25 / getHeightScale();
end;
local function v90(v84) --[[ Line: 328 ]] --[[ Name: setRunSpeed ]]
    -- upvalues: v13 (ref), v16 (ref)
    local v85 = v84 * 1.25 / getHeightScale();
    local v86 = 1.0E-4;
    local v87 = 1.0E-4;
    local v88 = 1;
    if v85 <= 0.5 then
        v86 = 1;
        v88 = v85 / 0.5;
    elseif v85 < 1 then
        local v89 = (v85 - 0.5) / 0.5;
        v86 = 1 - v89;
        v87 = v89;
    else
        v88 = v85 / 1;
        v87 = 1;
    end;
    v13:AdjustWeight(v86);
    v16:AdjustWeight(v87);
    v13:AdjustSpeed(v88);
    v16:AdjustSpeed(v88);
end;
setAnimationSpeed = function(v91) --[[ Line: 351 ]] --[[ Name: setAnimationSpeed ]]
    -- upvalues: v11 (ref), v90 (copy), v15 (ref), v13 (ref)
    if v11 == "walk" then
        v90(v91);
        return;
    else
        if v91 ~= v15 then
            v15 = v91;
            v13:AdjustSpeed(v15);
        end;
        return;
    end;
end;
keyFrameReachedFunc = function(v92) --[[ Line: 361 ]] --[[ Name: keyFrameReachedFunc ]]
    -- upvalues: v11 (ref), v5 (copy), v16 (ref), v13 (ref), v21 (copy), v79 (ref), v15 (ref), l_Humanoid_0 (copy)
    if v92 == "End" then
        if v11 == "walk" then
            if v5 == true then
                if v16.Looped ~= true then
                    v16.TimePosition = 0;
                end;
                if v13.Looped ~= true then
                    v13.TimePosition = 0;
                    return;
                end;
            else
                v16.TimePosition = 0;
                v13.TimePosition = 0;
                return;
            end;
        else
            local l_v11_1 = v11;
            if v21[l_v11_1] ~= nil and v21[l_v11_1] == false then
                l_v11_1 = "idle";
            end;
            if v79 then
                if v13.Looped then
                    return;
                else
                    l_v11_1 = "idle";
                    v79 = false;
                end;
            end;
            local l_v15_0 = v15;
            playAnimation(l_v11_1, 0.15, l_Humanoid_0);
            setAnimationSpeed(l_v15_0);
        end;
    end;
end;
rollAnimation = function(v95) --[[ Line: 398 ]] --[[ Name: rollAnimation ]]
    -- upvalues: v19 (copy)
    local v96 = math.random(1, v19[v95].totalWeight);
    local _ = v96;
    local v98 = 1;
    while v19[v95][v98].weight < v96 do
        v96 = v96 - v19[v95][v98].weight;
        v98 = v98 + 1;
    end;
    return v98;
end;
local function v104(v99, v100, v101, v102) --[[ Line: 408 ]] --[[ Name: switchToAnim ]]
    -- upvalues: v12 (ref), v13 (ref), v16 (ref), v5 (copy), v15 (ref), v11 (ref), v14 (ref), v19 (copy), v17 (ref)
    if v99 ~= v12 then
        if v13 ~= nil then
            v13:Stop(v101);
            v13:Destroy();
        end;
        if v16 ~= nil then
            v16:Stop(v101);
            v16:Destroy();
            if v5 == true then
                v16 = nil;
            end;
        end;
        v15 = 1;
        v13 = v102:LoadAnimation(v99);
        v13.Priority = Enum.AnimationPriority.Core;
        v13:Play(v101);
        v11 = v100;
        v12 = v99;
        if v14 ~= nil then
            v14:disconnect();
        end;
        v14 = v13.KeyframeReached:connect(keyFrameReachedFunc);
        if v100 == "walk" then
            local v103 = rollAnimation("run");
            v16 = v102:LoadAnimation(v19.run[v103].anim);
            v16.Priority = Enum.AnimationPriority.Core;
            v16:Play(v101);
            if v17 ~= nil then
                v17:disconnect();
            end;
            v17 = v16.KeyframeReached:connect(keyFrameReachedFunc);
        end;
    end;
end;
playAnimation = function(v105, v106, v107) --[[ Line: 454 ]] --[[ Name: playAnimation ]]
    -- upvalues: v19 (copy), v104 (copy), v79 (ref)
    local v108 = rollAnimation(v105);
    local l_anim_0 = v19[v105][v108].anim;
    v104(l_anim_0, v105, v106, v107);
    v79 = false;
end;
playEmote = function(v110, v111, v112) --[[ Line: 460 ]] --[[ Name: playEmote ]]
    -- upvalues: v104 (copy), v79 (ref)
    v104(v110, v110.Name, v111, v112);
    v79 = true;
end;
local v113 = "";
local v114 = nil;
local v115 = nil;
local v116 = nil;
toolKeyFrameReachedFunc = function(v117) --[[ Line: 470 ]] --[[ Name: toolKeyFrameReachedFunc ]]
    -- upvalues: v113 (ref), l_Humanoid_0 (copy)
    if v117 == "End" then
        playToolAnimation(v113, 0, l_Humanoid_0);
    end;
end;
playToolAnimation = function(v118, v119, v120, v121) --[[ Line: 475 ]] --[[ Name: playToolAnimation ]]
    -- upvalues: v19 (copy), v115 (ref), v114 (ref), v113 (ref), v116 (ref)
    local v122 = rollAnimation(v118);
    local l_anim_1 = v19[v118][v122].anim;
    if v115 ~= l_anim_1 then
        if v114 ~= nil then
            v114:Stop();
            v114:Destroy();
            v119 = 0;
        end;
        v114 = v120:LoadAnimation(l_anim_1);
        if v121 then
            v114.Priority = v121;
        end;
        v114:Play(v119);
        v113 = v118;
        v115 = l_anim_1;
        v116 = v114.KeyframeReached:connect(toolKeyFrameReachedFunc);
    end;
end;
stopToolAnimations = function() --[[ Line: 499 ]] --[[ Name: stopToolAnimations ]]
    -- upvalues: v113 (ref), v116 (ref), v115 (ref), v114 (ref)
    local l_v113_0 = v113;
    if v116 ~= nil then
        v116:disconnect();
    end;
    v113 = "";
    v115 = nil;
    if v114 ~= nil then
        v114:Stop();
        v114:Destroy();
        v114 = nil;
    end;
    return l_v113_0;
end;
onRunning = function(v125) --[[ Line: 516 ]] --[[ Name: onRunning ]]
    -- upvalues: v8 (copy), v79 (ref), l_Humanoid_0 (copy), v2 (ref), v21 (copy), v11 (ref)
    local v126 = if v8 then getHeightScale() else 1;
    if (v79 and l_Humanoid_0.MoveDirection == Vector3.new(0, 0, 0, 0) and l_Humanoid_0.WalkSpeed / v126 or 0.75) * v126 < v125 then
        playAnimation("walk", 0.2, l_Humanoid_0);
        setAnimationSpeed(v125 / 16);
        v2 = "Running";
        return;
    else
        if v21[v11] == nil and not v79 then
            playAnimation("idle", 0.2, l_Humanoid_0);
            v2 = "Standing";
        end;
        return;
    end;
end;
onDied = function() --[[ Line: 533 ]] --[[ Name: onDied ]]
    -- upvalues: v2 (ref)
    v2 = "Dead";
end;
onJumping = function() --[[ Line: 536 ]] --[[ Name: onJumping ]]
    -- upvalues: l_Humanoid_0 (copy), v78 (ref), v2 (ref)
    playAnimation("jump", 0.1, l_Humanoid_0);
    v78 = 0.31;
    v2 = "Jumping";
end;
onClimbing = function(v127) --[[ Line: 541 ]] --[[ Name: onClimbing ]]
    -- upvalues: v8 (copy), l_Humanoid_0 (copy), v2 (ref)
    if v8 then
        v127 = v127 / getHeightScale();
    end;
    playAnimation("climb", 0.1, l_Humanoid_0);
    setAnimationSpeed(v127 / 5);
    v2 = "Climbing";
end;
onGettingUp = function() --[[ Line: 550 ]] --[[ Name: onGettingUp ]]
    -- upvalues: v2 (ref)
    v2 = "GettingUp";
end;
onFreeFall = function() --[[ Line: 553 ]] --[[ Name: onFreeFall ]]
    -- upvalues: v78 (ref), l_Humanoid_0 (copy), v2 (ref)
    if v78 <= 0 then
        playAnimation("fall", 0.2, l_Humanoid_0);
    end;
    v2 = "FreeFall";
end;
onFallingDown = function() --[[ Line: 559 ]] --[[ Name: onFallingDown ]]
    -- upvalues: v2 (ref)
    v2 = "FallingDown";
end;
onSeated = function() --[[ Line: 562 ]] --[[ Name: onSeated ]]
    -- upvalues: v2 (ref)
    v2 = "Seated";
end;
onPlatformStanding = function() --[[ Line: 565 ]] --[[ Name: onPlatformStanding ]]
    -- upvalues: v2 (ref)
    v2 = "PlatformStanding";
end;
onSwimming = function(v128) --[[ Line: 570 ]] --[[ Name: onSwimming ]]
    -- upvalues: v8 (copy), l_Humanoid_0 (copy), v2 (ref)
    if v8 then
        v128 = v128 / getHeightScale();
    end;
    if v128 > 1 then
        playAnimation("swim", 0.4, l_Humanoid_0);
        setAnimationSpeed(v128 / 10);
        v2 = "Swimming";
        return;
    else
        playAnimation("swimidle", 0.4, l_Humanoid_0);
        v2 = "Standing";
        return;
    end;
end;
animateTool = function() --[[ Line: 584 ]] --[[ Name: animateTool ]]
    -- upvalues: v76 (ref), l_Humanoid_0 (copy)
    if v76 == "None" then
        playToolAnimation("toolnone", 0.1, l_Humanoid_0, Enum.AnimationPriority.Idle);
        return;
    elseif v76 == "Slash" then
        playToolAnimation("toolslash", 0, l_Humanoid_0, Enum.AnimationPriority.Action);
        return;
    elseif v76 == "Lunge" then
        playToolAnimation("toollunge", 0, l_Humanoid_0, Enum.AnimationPriority.Action);
        return;
    else
        return;
    end;
end;
getToolAnim = function(v129) --[[ Line: 598 ]] --[[ Name: getToolAnim ]]
    for _, v131 in ipairs(v129:GetChildren()) do
        if v131.Name == "toolanim" and v131.className == "StringValue" then
            return v131;
        end;
    end;
    return nil;
end;
local v132 = 0;
stepAnimate = function(v133) --[[ Line: 607 ]] --[[ Name: stepAnimate ]]
    -- upvalues: v132 (ref), v78 (ref), v2 (ref), l_Humanoid_0 (copy), l_Parent_0 (copy), v76 (ref), v77 (ref), v115 (ref)
    local v134 = 1;
    local v135 = 1;
    local v136 = v133 - v132;
    v132 = v133;
    local v137 = false;
    if v78 > 0 then
        v78 = v78 - v136;
    end;
    if v2 == "FreeFall" and v78 <= 0 then
        playAnimation("fall", 0.2, l_Humanoid_0);
    elseif v2 == "Seated" then
        playAnimation("sit", 0.5, l_Humanoid_0);
        return;
    elseif v2 == "Running" then
        playAnimation("walk", 0.2, l_Humanoid_0);
    elseif v2 == "Dead" or v2 == "GettingUp" or v2 == "FallingDown" or v2 == "Seated" or v2 == "PlatformStanding" then
        stopAllAnimations();
        v134 = 0.1;
        v135 = 1;
        v137 = true;
    end;
    local l_Tool_0 = l_Parent_0:FindFirstChildOfClass("Tool");
    if l_Tool_0 and l_Tool_0:FindFirstChild("Handle") then
        local v139 = getToolAnim(l_Tool_0);
        if v139 then
            v76 = v139.Value;
            v139.Parent = nil;
            v77 = v133 + 0.3;
        end;
        if v77 < v133 then
            v77 = 0;
            v76 = "None";
        end;
        animateTool();
        return;
    else
        stopToolAnimations();
        v76 = "None";
        v115 = nil;
        v77 = 0;
        return;
    end;
end;
l_Humanoid_0.Died:connect(onDied);
l_Humanoid_0.Running:connect(onRunning);
l_Humanoid_0.Jumping:connect(onJumping);
l_Humanoid_0.Climbing:connect(onClimbing);
l_Humanoid_0.GettingUp:connect(onGettingUp);
l_Humanoid_0.FreeFalling:connect(onFreeFall);
l_Humanoid_0.FallingDown:connect(onFallingDown);
l_Humanoid_0.Seated:connect(onSeated);
l_Humanoid_0.PlatformStanding:connect(onPlatformStanding);
l_Humanoid_0.Swimming:connect(onSwimming);
game:GetService("Players").LocalPlayer.Chatted:connect(function(v140) --[[ Line: 664 ]]
    -- upvalues: v2 (ref), v21 (copy), l_Humanoid_0 (copy)
    local v141 = "";
    if string.sub(v140, 1, 3) == "/e " then
        v141 = string.sub(v140, 4);
    elseif string.sub(v140, 1, 7) == "/emote " then
        v141 = string.sub(v140, 8);
    end;
    if v2 == "Standing" and v21[v141] ~= nil then
        playAnimation(v141, 0.1, l_Humanoid_0);
    end;
end);
script:WaitForChild("PlayEmote").OnInvoke = function(v142) --[[ Line: 677 ]]
    -- upvalues: v2 (ref), v21 (copy), l_Humanoid_0 (copy), v13 (ref)
    if v2 ~= "Standing" then
        return;
    elseif v21[v142] ~= nil then
        playAnimation(v142, 0.1, l_Humanoid_0);
        return true, v13;
    elseif typeof(v142) == "Instance" and v142:IsA("Animation") then
        playEmote(v142, 0.1, l_Humanoid_0);
        return true, v13;
    else
        return false;
    end;
end;
if l_Parent_0.Parent ~= nil then
    playAnimation("idle", 0.1, l_Humanoid_0);
    v2 = "Standing";
end;
while l_Parent_0.Parent ~= nil do
    local _, v144 = wait(0.1);
    stepAnimate(v144);
end;