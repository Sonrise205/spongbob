local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.TblUtil);
local v3 = require(l_Parent_0.Parent.Promise);
local _ = require(l_Parent_0.RailUtilTypes);
local v5 = {};
local v6 = v3.promisify(workspace.WaitForChild);
v5.promiseChild = function(v7, v8, v9) --[[ Line: 56 ]] --[[ Name: promiseChild ]]
    -- upvalues: v6 (copy)
    local v10 = debug.traceback();
    local v11 = v6(v7, v8, 1e999);
    if v9 then
        v11 = v11:timeout(v9, ("Timed out after %s seconds waiting for child %s in parent %s\n%s"):format(v9, v8, v7:GetFullName(), v10));
    end;
    return v11;
end;
v5.findFirstChildFromPredicate = function(v12, v13, v14) --[[ Line: 85 ]] --[[ Name: findFirstChildFromPredicate ]]
    local v15 = if v14 then v12:GetDescendants() else v12:GetChildren();
    for v16 = 1, #v15 do
        local v17 = v15[v16];
        if v13(v17) then
            return v17;
        end;
    end;
    return nil;
end;
v5.findFirstChildThatMatches = function(v18, v19, v20) --[[ Line: 110 ]] --[[ Name: findFirstChildThatMatches ]]
    -- upvalues: v5 (copy)
    assert(v18 and typeof(v18) == "Instance", "Parent argument of findFirstChildThatMatches must be an Instance.");
    return v5.findFirstChildFromPredicate(v18, function(v21) --[[ Line: 113 ]]
        -- upvalues: v19 (copy)
        return v21.Name:match(v19) ~= nil;
    end, v20);
end;
v5.findFirstChildOfAncestor = function(v22, v23) --[[ Line: 133 ]] --[[ Name: findFirstChildOfAncestor ]]
    assert(v22 and typeof(v22) == "Instance", "Descendant argument of getFirstChildOfAncestor must be an Instance.");
    assert(v23 and typeof(v23) == "Instance", "Ancestor argument of getFirstChildOfAncestor must be an Instance.");
    if not v22:IsDescendantOf(v23) then
        return nil;
    else
        local l_v22_0 = v22;
        while l_v22_0.Parent ~= v23 do
            l_v22_0 = l_v22_0.Parent;
        end;
        return l_v22_0;
    end;
end;
v5.getDescendantsWhichAre = function(v25, v26) --[[ Line: 165 ]] --[[ Name: getDescendantsWhichAre ]]
    local v27 = if typeof(v26) == "table" then v26 else {
        v26
    };
    local v28 = {};
    for _, v30 in v25:GetDescendants() do
        for _, v32 in v27 do
            if v30:IsA(v32) then
                table.insert(v28, v30);
                break;
            end;
        end;
    end;
    return v28;
end;
v5.waitForChildFromPredicate = function(v33, v34, v35, v36) --[[ Line: 194 ]] --[[ Name: waitForChildFromPredicate ]]
    -- upvalues: v5 (copy), v3 (copy)
    assert(v33 and typeof(v33) == "Instance", "Parent argument of waitForChildFromPredicate must be an Instance.");
    assert(v34 and typeof(v34) == "function", "Predicate argument of waitForChildFromPredicate must be a function.");
    local v37 = v5.findFirstChildFromPredicate(v33, v34, v36);
    if v37 then
        return v3.resolve(v37);
    else
        local v38 = if v36 then v33.DescendantAdded else v33.ChildAdded;
        local v39 = v35 or 10;
        return v3.fromEvent(v38, v34):timeout(v39, (("[waitForChildFromPredicate] %* second timeout reached while waiting for child!"):format(v39)));
    end;
end;
v5.promiseChildFromPredicate = v5.waitForChildFromPredicate;
v5.waitForChildWhichIsA = function(v40, v41, v42) --[[ Line: 232 ]] --[[ Name: waitForChildWhichIsA ]]
    -- upvalues: v3 (copy)
    assert(v40 and typeof(v40) == "Instance", "Ancestor argument of waitForChildWhichIsA must be an Instance.");
    local l_v40_FirstChildWhichIsA_0 = v40:FindFirstChildWhichIsA(v41);
    if l_v40_FirstChildWhichIsA_0 then
        return v3.resolve(l_v40_FirstChildWhichIsA_0);
    else
        local v44 = v42 or 10;
        return v3.fromEvent(v40.ChildAdded, function(v45) --[[ Line: 244 ]]
            -- upvalues: v41 (copy)
            return v45:IsA(v41);
        end):timeout(v44, (("[waitForChildWhichIsA] %* second timeout reached while waiting for: \"%*\""):format(v44, v41)));
    end;
end;
v5.promiseChildWhichIsA = v5.waitForChildWhichIsA;
v5.waitForChildThatMatches = function(v46, v47, v48, v49) --[[ Line: 266 ]] --[[ Name: waitForChildThatMatches ]]
    -- upvalues: v5 (copy)
    assert(v46 and typeof(v46) == "Instance", "Ancestor argument of waitForChildThatMatches must be an Instance.");
    return v5.waitForChildFromPredicate(v46, function(v50) --[[ Line: 277 ]]
        -- upvalues: v47 (copy)
        return v50.Name:match(v47) ~= nil;
    end, v48, v49);
end;
v5.promiseChildThatMatches = v5.waitForChildThatMatches;
v5.ensureInstance = function(v51, v52, v53) --[[ Line: 297 ]] --[[ Name: ensureInstance ]]
    local l_v51_FirstChild_0 = v51:FindFirstChild(v53 or v52.Name);
    if not l_v51_FirstChild_0 then
        local v55 = v52:Clone();
        v55.Name = v53 or v52.Name;
        v55.Parent = v51;
        l_v51_FirstChild_0 = v55;
    end;
    return l_v51_FirstChild_0;
end;
v5.destroyFirstChild = function(v56, v57, v58) --[[ Line: 317 ]] --[[ Name: destroyFirstChild ]]
    local l_v56_FirstChild_0 = v56:FindFirstChild(v57, v58);
    if l_v56_FirstChild_0 then
        l_v56_FirstChild_0:Destroy();
    end;
end;
v5.safeDestroy = function(v60) --[[ Line: 333 ]] --[[ Name: safeDestroy ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 334 ]]
        -- upvalues: v60 (copy)
        v60:Destroy();
    end);
    return l_status_0, l_result_0;
end;
v5.weld = function(v63, v64) --[[ Line: 349 ]] --[[ Name: weld ]]
    local l_WeldConstraint_0 = Instance.new("WeldConstraint");
    l_WeldConstraint_0.Part0 = v63;
    l_WeldConstraint_0.Part1 = v64;
    l_WeldConstraint_0.Parent = v63;
    return l_WeldConstraint_0;
end;
v5.weldAssembly = function(v66, v67) --[[ Line: 366 ]] --[[ Name: weldAssembly ]]
    -- upvalues: v5 (copy)
    local v68 = {};
    local v69 = v67 or v66.PrimaryPart;
    assert(v69, "Model must have a PrimaryPart to weld to.");
    for _, v71 in pairs(v66:GetDescendants()) do
        if v71:IsA("BasePart") and v71 ~= v69 then
            table.insert(v68, v5.weld(v69, v71));
        end;
    end;
    return v68;
end;
v5.getAttachmentsAlignedCFrame = function(v72, v73) --[[ Line: 391 ]] --[[ Name: getAttachmentsAlignedCFrame ]]
    assert(v72:IsA("Attachment") or not v73:IsA("Attachment"), "Both inputs must be attachments");
    return v73.WorldCFrame * v72.CFrame:Inverse();
end;
v5.getModelFitDistance = function(v74, v75, v76) --[[ Line: 407 ]] --[[ Name: getModelFitDistance ]]
    local v77 = nil;
    local v78 = nil;
    if v74:IsA("Model") then
        local l_v74_BoundingBox_0, v80 = v74:GetBoundingBox();
        v77 = l_v74_BoundingBox_0;
        v78 = v80;
    else
        v78 = v74.Size;
    end;
    local l_AbsoluteSize_0 = v75.AbsoluteSize;
    v76 = v76 or v75.CurrentCamera;
    assert(v76, "ViewportFrame must have a CurrentCamera to get the fit distance.");
    local v82 = math.min(1, l_AbsoluteSize_0.X / l_AbsoluteSize_0.Y);
    local v83 = math.atan(math.tan((math.rad(v76.FieldOfView / 2))) * v82);
    return v78.Magnitude / 2 / math.sin(v83);
end;
v5.cloneChildren = function(v84, v85, v86) --[[ Line: 444 ]] --[[ Name: cloneChildren ]]
    local v87 = {};
    for _, v89 in pairs(v84:GetChildren()) do
        if not v86 or v86(v89) then
            local v90 = v89:Clone();
            table.insert(v87, v90);
            v90.Parent = v85;
        end;
    end;
    return v87;
end;
v5.isClass = function(v91, v92) --[[ Line: 474 ]] --[[ Name: isClass ]]
    local v93 = if typeof(v92) == "table" then v92 else {
        v92
    };
    for _, v95 in v93 do
        if v91:IsA(v95) then
            return true;
        end;
    end;
    return false;
end;
v5.fetchModule = function(v96, v97, v98) --[[ Line: 497 ]] --[[ Name: fetchModule ]]
    local v99 = nil;
    if v96.Name == v97 and v96:IsA("ModuleScript") then
        v99 = v96;
    else
        local l_v96_FirstChild_0 = v96:FindFirstChild(v97, true);
        if l_v96_FirstChild_0 then
            if l_v96_FirstChild_0:IsA("ModuleScript") then
                v99 = l_v96_FirstChild_0;
            elseif l_v96_FirstChild_0:IsA("ObjectValue") then
                local l_Value_0 = l_v96_FirstChild_0.Value;
                assert(l_Value_0 and l_Value_0:IsA("ModuleScript"), ("Failed to find a ModuleScript: %s"):format(v97));
                v99 = l_Value_0;
            end;
        end;
    end;
    if not v99 and v98 then
        return v98;
    else
        assert(v99 and v99:IsA("ModuleScript"), ("Failed to find a ModuleScript: %s"):format(v97));
        return (require(v99));
    end;
end;
v5.hasProperty = function(v102, v103) --[[ Line: 541 ]] --[[ Name: hasProperty ]]
    if v102:FindFirstChild(v103) then
        v102 = v102:Clone();
        v102:ClearAllChildren();
    end;
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 547 ]]
        -- upvalues: v102 (ref), v103 (copy)
        return v102[v103];
    end);
    return l_status_1, l_result_1;
end;
v5.playTween = function(v106, v107, v108) --[[ Line: 571 ]] --[[ Name: playTween ]]
    -- upvalues: l_TweenService_0 (copy), v3 (copy)
    if typeof(v106) == "Instance" and not v106:IsA("TweenBase") then
        v106 = l_TweenService_0:Create(v106, v107, v108);
    end;
    assert(v106:IsA("Tween"));
    local v110 = v3.fromEvent(v106.Completed):andThen(function(v109) --[[ Line: 580 ]]
        -- upvalues: v3 (ref)
        if v109 == Enum.PlaybackState.Cancelled then
            return v3.reject(v109);
        else
            return v3.resolve(v109);
        end;
    end);
    v106:Play();
    return v110;
end;
v5.playTracksAsync = function(v111, v112, v113) --[[ Line: 611 ]] --[[ Name: playTracksAsync ]]
    -- upvalues: v3 (copy), v2 (copy)
    v112 = v112 or {};
    if typeof(v111) ~= "table" then
        v111 = {
            v111
        };
    end;
    assert(typeof(v111) == "table", "Tracks must be an array of AnimationTracks.");
    assert(typeof(v112) == "table", "AnimInfo must be a table.");
    return v3.all(v2.Map(v111, function(v114) --[[ Line: 622 ]]
        -- upvalues: v112 (ref), v113 (copy), v3 (ref)
        v114:Play(v112.FadeInTime, v112.Weight, v112.Speed);
        local _ = nil;
        return (if v113 then v3.race({
            v3.fromEvent(v114:GetMarkerReachedSignal(v113)), 
            v3.fromEvent(v114.Stopped)
        }) else v3.fromEvent(v114.Stopped)):finally(function(v116) --[[ Line: 634 ]]
            -- upvalues: v3 (ref), v114 (copy), v112 (ref)
            if v116 == v3.Status.Cancelled then
                v114:Stop(v112.FadeOutTime);
            end;
        end);
    end));
end;
v5.emitParticles = function(v117, v118) --[[ Line: 659 ]] --[[ Name: emitParticles ]]
    -- upvalues: v5 (copy)
    if v117:IsA("ParticleEmitter") then
        local function v120() --[[ Line: 662 ]] --[[ Name: Emit ]]
            -- upvalues: v117 (copy), v118 (copy)
            v117:Emit(v118 or v117:GetAttribute("EmitCount") or 10);
            local l_v117_Attribute_0 = v117:GetAttribute("EmitDuration");
            if typeof(l_v117_Attribute_0) == "number" then
                v117.Enabled = true;
                task.delay(l_v117_Attribute_0, function() --[[ Line: 667 ]]
                    -- upvalues: v117 (ref)
                    v117.Enabled = false;
                end);
            end;
        end;
        local l_v117_Attribute_1 = v117:GetAttribute("EmitDelay");
        if typeof(l_v117_Attribute_1) == "number" then
            task.delay(l_v117_Attribute_1, v120);
        else
            v120();
        end;
    end;
    for _, v123 in pairs(v117:GetChildren()) do
        v5.emitParticles(v123);
    end;
end;
v5.guaranteeAnchoringToAnimate = function(v124) --[[ Line: 694 ]] --[[ Name: guaranteeAnchoringToAnimate ]]
    -- upvalues: v5 (copy)
    local v125 = v5.getDescendantsWhichAre(v124, "BasePart");
    for _, v127 in ipairs(v125) do
        if v127.Name ~= "HumanoidRootPart" then
            v127.Anchored = false;
        end;
    end;
end;
v5.ensureAnimator = function(v128) --[[ Line: 710 ]] --[[ Name: ensureAnimator ]]
    local v129 = v128:FindFirstChildOfClass("AnimationController") or v128:FindFirstChildOfClass("Humanoid");
    if not v129 then
        warn("No Humanoid or AnimationController found in Parent", v128:GetFullName(), "; Consider setting one up at Edit Time.");
        local l_AnimationController_0 = Instance.new("AnimationController");
        l_AnimationController_0.Parent = v128;
        v129 = l_AnimationController_0;
    end;
    local l_Animator_0 = v129:FindFirstChildOfClass("Animator");
    if not l_Animator_0 then
        warn("Failed to Find Animator in Parent", v129, "; Consider setting one up at Edit Time.");
        l_Animator_0 = Instance.new("Animator");
        l_Animator_0.Parent = v129;
    end;
    return l_Animator_0;
end;
v5.loadAnimAsync = function(v132, v133) --[[ Line: 741 ]] --[[ Name: loadAnimAsync ]]
    -- upvalues: v3 (copy)
    local function v138() --[[ Line: 742 ]] --[[ Name: AttemptLoad ]]
        -- upvalues: v3 (ref), v132 (copy), v133 (copy)
        return v3.new(function(v134, v135) --[[ Line: 743 ]]
            -- upvalues: v132 (ref), v133 (ref)
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 744 ]]
                -- upvalues: v132 (ref), v133 (ref)
                return v132:LoadAnimation(v133);
            end);
            if l_status_2 then
                l_result_2.Name = v133.Name;
                v134(l_result_2);
                return;
            else
                warn("Failed to Load Animation:", v132:GetFullName(), v133.Name);
                v135(l_result_2);
                return;
            end;
        end);
    end;
    return v3.retryWithDelay(v138, 50, 0.1);
end;
v5.getMass = function(v139) --[[ Line: 766 ]] --[[ Name: getMass ]]
    assert(v139 and typeof(v139) == "Instance", "Model argument of getMass must be an Instance.");
    local v140 = 0;
    for _, v142 in pairs(v139:GetDescendants()) do
        if v142:IsA("BasePart") and not v142.Massless then
            v140 = v140 + v142.AssemblyMass;
        end;
    end;
    return v140;
end;
v5.getFirstAncestorWithPredicate = function(v143, v144, v145) --[[ Line: 784 ]] --[[ Name: getFirstAncestorWithPredicate ]]
    local v146 = if v145 then v143 else v143.Parent;
    while true do
        if v146 then
            if v144(v146) then
                return v146;
            else
                v146 = v146.Parent;
            end;
        else
            return nil;
        end;
    end;
end;
return v5;