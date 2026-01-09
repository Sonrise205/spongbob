local l_CollectionService_0 = game:GetService("CollectionService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.Janitor);
local v5 = require(l_Parent_0.RailUtil);
local v6 = require(l_Parent_0.Symbol);
local v7 = require(l_Parent_0.Signal);
local v8 = require(l_Parent_0.Trove);
local v9 = l_RunService_0:IsServer();
local v10 = {
    workspace, 
    game:GetService("Players")
};
local v11 = {};
local v12 = v6("Ancestors");
local v13 = v6("InstancesToComponents");
local v14 = v6("LockConstruct");
local v15 = v6("Components");
local v16 = v6("Trove");
local v17 = v6("Extensions");
local v18 = v6("ActiveExtensions");
local v19 = v6("Starting");
local v20 = v6("Started");
local v21 = v6("ClassActiveExtensions");
local v22 = 0;
local function _() --[[ Line: 250 ]] --[[ Name: NextRenderName ]]
    -- upvalues: v22 (ref)
    v22 = v22 + 1;
    return "ComponentRender" .. tostring(v22);
end;
local function v29(v24, v25) --[[ Line: 255 ]] --[[ Name: InvokeExtensionFn ]]
    -- upvalues: v18 (copy)
    for _, v27 in ipairs(v24[v18]) do
        local v28 = v27[v25];
        if type(v28) == "function" then
            v28(v24);
        end;
    end;
end;
local function v34(v30) --[[ Line: 264 ]] --[[ Name: ShouldConstruct ]]
    -- upvalues: v18 (copy)
    for _, v32 in ipairs(v30[v18]) do
        local l_ShouldConstruct_0 = v32.ShouldConstruct;
        if type(l_ShouldConstruct_0) == "function" and not l_ShouldConstruct_0(v30) then
            return false;
        end;
    end;
    return true;
end;
local function v35(v36, v37, v38, v39) --[[ Line: 278 ]] --[[ Name: GetActiveExtensions ]]
    -- upvalues: v35 (copy)
    v38 = v38 or {};
    local v40 = v37 or {};
    for _, v42 in ipairs(v40) do
        local v43 = table.find(v38, v42);
        local v44 = false;
        if not v43 then
            local l_ShouldExtend_0 = v42.ShouldExtend;
            if not l_ShouldExtend_0 then
                v44 = true;
            elseif not v39 and type(l_ShouldExtend_0) == "function" then
                v44 = l_ShouldExtend_0(v36);
            end;
        end;
        if v43 or v44 then
            if v43 then
                table.remove(v38, v43);
                table.insert(v38, 1, v42);
            else
                table.insert(v38, v42);
            end;
            v35(v36, v42.Extensions, v38, v39);
        end;
    end;
    if not v39 then
        for v46 = #v38, 1, -1 do
            local l_ShouldExtend_1 = v38[v46].ShouldExtend;
            if type(l_ShouldExtend_1) == "function" and not l_ShouldExtend_1(v36) then
                table.remove(v38, v46);
            end;
        end;
    end;
    return v38;
end;
local function v52(v48, v49) --[[ Line: 321 ]] --[[ Name: BindExtensionMethod ]]
    if v49.Methods then
        for v50, v51 in v49.Methods do
            if type(v51) == "function" then
                v48[v50] = v51;
            else
                error("Invalid extension method: " .. tostring(v50));
            end;
        end;
    end;
end;
local _ = function(v53, v54) --[[ Line: 333 ]] --[[ Name: BindExtensionMethods ]]
    -- upvalues: v52 (copy)
    for _, v56 in ipairs(v54) do
        v52(v53, v56);
    end;
end;
local v58 = {};
v58.__index = v58;
v58.DelaySetup = script:GetAttribute("DelaySetup") or false;
v58.new = function(v59) --[[ Line: 441 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), v10 (copy), v13 (copy), v15 (copy), v14 (copy), v16 (copy), v8 (copy), v17 (copy), v20 (copy), v7 (copy), v58 (copy), v11 (copy)
    local v60 = {};
    v60.__index = v60;
    v60[v12] = v59.Ancestors or v10;
    v60[v13] = {};
    v60[v15] = {};
    v60[v14] = {};
    v60[v16] = v8.new();
    v60[v17] = v59.Extensions or {};
    v60[v20] = false;
    v60.Tag = v59.Tag;
    v60.AncestorsChanged = v60[v16]:Construct(v7);
    v60.Started = v60[v16]:Construct(v7);
    v60.Stopped = v60[v16]:Construct(v7);
    setmetatable(v60, v58);
    table.insert(v11, v60);
    if not if v59.DelaySetup then v59.DelaySetup else v60.DelaySetup then
        v58._setup(v60);
        return v60;
    else
        task.delay(30, function() --[[ Line: 465 ]]
            -- upvalues: v11 (ref), v60 (copy)
            if table.find(v11, v60) then
                warn(v60, "Component:_setup() was not called within 30 seconds of instantiation.");
            end;
        end);
        return v60;
    end;
end;
v58.getUnsetupComponents = function() --[[ Line: 487 ]] --[[ Name: getUnsetupComponents ]]
    -- upvalues: v11 (copy)
    return (table.clone(v11));
end;
v58._instantiate = function(v61, v62) --[[ Line: 492 ]] --[[ Name: _instantiate ]]
    -- upvalues: v18 (copy), v35 (copy), v17 (copy), v21 (copy), v52 (copy), v34 (copy), v29 (copy)
    local v63 = setmetatable({}, v61);
    v63.Instance = v62;
    v63[v18] = v35(v63, v61[v17], table.clone(v61[v21]));
    for _, v65 in ipairs(v63[v18]) do
        if not table.find(v61[v21], v65) then
            v52(v63, v65);
        end;
    end;
    if not v34(v63) then
        return nil;
    else
        v29(v63, "Constructing");
        if type(v63.Construct) == "function" then
            v63:Construct();
        end;
        v29(v63, "Constructed");
        return v63;
    end;
end;
v58._setup = function(v66) --[[ Line: 524 ]] --[[ Name: _setup ]]
    -- upvalues: v11 (copy), v21 (copy), v35 (copy), v17 (copy), v52 (copy), v19 (copy), v29 (copy), l_RunService_0 (copy), v9 (copy), v22 (ref), v20 (copy), v14 (copy), v13 (copy), v15 (copy), v12 (copy), v16 (copy), v5 (copy), l_CollectionService_0 (copy)
    local v67 = table.find(v11, v66);
    if v67 then
        table.remove(v11, v67);
    else
        warn(v66, ":_setup was already called for this component.");
    end;
    local v68 = {};
    v66[v21] = v35(v66, v66[v17], {}, true);
    local v69 = v66[v21];
    for _, v71 in ipairs(v69) do
        v52(v66, v71);
    end;
    v69 = function(v72) --[[ Line: 537 ]] --[[ Name: StartComponent ]]
        -- upvalues: v19 (ref), v29 (ref), l_RunService_0 (ref), v9 (ref), v22 (ref), v20 (ref), v66 (copy)
        v72[v19] = coroutine.running();
        v29(v72, "Starting");
        v72:Start();
        if v72[v19] == nil then
            return;
        else
            v29(v72, "Started");
            local v73 = typeof(v72.HeartbeatUpdate) == "function";
            local v74 = typeof(v72.SteppedUpdate) == "function";
            local v75 = typeof(v72.RenderSteppedUpdate) == "function";
            if v73 then
                v72._heartbeatUpdate = l_RunService_0.Heartbeat:Connect(function(v76) --[[ Line: 555 ]]
                    -- upvalues: v72 (copy)
                    v72:HeartbeatUpdate(v76);
                end);
            end;
            if v74 then
                v72._steppedUpdate = l_RunService_0.Stepped:Connect(function(_, v78) --[[ Line: 561 ]]
                    -- upvalues: v72 (copy)
                    v72:SteppedUpdate(v78);
                end);
            end;
            if v75 and not v9 then
                if v72.RenderPriority then
                    v22 = v22 + 1;
                    v72._renderName = "ComponentRender" .. tostring(v22);
                    l_RunService_0:BindToRenderStep(v72._renderName, v72.RenderPriority, function(v79) --[[ Line: 569 ]]
                        -- upvalues: v72 (copy)
                        v72:RenderSteppedUpdate(v79);
                    end);
                else
                    v72._renderSteppedUpdate = l_RunService_0.RenderStepped:Connect(function(v80) --[[ Line: 573 ]]
                        -- upvalues: v72 (copy)
                        v72:RenderSteppedUpdate(v80);
                    end);
                end;
            end;
            v72[v20] = true;
            v72[v19] = nil;
            v66.Started:Fire(v72);
            return;
        end;
    end;
    local function v83(v81) --[[ Line: 585 ]] --[[ Name: StopComponent ]]
        -- upvalues: v19 (ref), l_RunService_0 (ref), v29 (ref), v66 (copy)
        if v81[v19] then
            local v82 = v81[v19];
            if coroutine.status(v82) ~= "normal" then
                pcall(function() --[[ Line: 590 ]]
                    -- upvalues: v82 (copy)
                    task.cancel(v82);
                end);
            else
                task.defer(function() --[[ Line: 594 ]]
                    -- upvalues: v82 (copy)
                    pcall(function() --[[ Line: 595 ]]
                        -- upvalues: v82 (ref)
                        task.cancel(v82);
                    end);
                end);
            end;
            v81[v19] = nil;
        end;
        if v81._heartbeatUpdate then
            v81._heartbeatUpdate:Disconnect();
        end;
        if v81._steppedUpdate then
            v81._steppedUpdate:Disconnect();
        end;
        if v81._renderSteppedUpdate then
            v81._renderSteppedUpdate:Disconnect();
        elseif v81._renderName then
            l_RunService_0:UnbindFromRenderStep(v81._renderName);
        end;
        v29(v81, "Stopping");
        v81:Stop();
        v29(v81, "Stopped");
        v66.Stopped:Fire(v81);
    end;
    local function _(v84, v85) --[[ Line: 623 ]] --[[ Name: SafeConstruct ]]
        -- upvalues: v66 (copy), v14 (ref)
        if v66[v14][v84] ~= v85 then
            return nil;
        else
            local v86 = v66:_instantiate(v84);
            if v66[v14][v84] ~= v85 then
                return nil;
            else
                return v86;
            end;
        end;
    end;
    local function _(v88) --[[ Line: 634 ]] --[[ Name: TryConstructComponent ]]
        -- upvalues: v66 (copy), v13 (ref), v14 (ref), v15 (ref), v69 (copy)
        if v66[v13][v88] then
            return;
        else
            local v89 = (v66[v14][v88] or 0) + 1;
            v66[v14][v88] = v89;
            task.defer(function() --[[ Line: 641 ]]
                -- upvalues: v88 (copy), v89 (ref), v66 (ref), v14 (ref), v13 (ref), v15 (ref), v69 (ref)
                local l_v88_0 = v88;
                local l_v89_0 = v89;
                local v92;
                if v66[v14][l_v88_0] ~= l_v89_0 then
                    v92 = nil;
                else
                    local v93 = v66:_instantiate(l_v88_0);
                    v92 = if v66[v14][l_v88_0] ~= l_v89_0 then nil else v93;
                end;
                if not v92 then
                    return;
                else
                    v66[v13][v88] = v92;
                    table.insert(v66[v15], v92);
                    task.defer(function() --[[ Line: 648 ]]
                        -- upvalues: v66 (ref), v13 (ref), v88 (ref), v92 (copy), v69 (ref)
                        if v66[v13][v88] == v92 then
                            v69(v92);
                        end;
                    end);
                    return;
                end;
            end);
            return;
        end;
    end;
    local function v100(v95) --[[ Line: 656 ]] --[[ Name: TryDeconstructComponent ]]
        -- upvalues: v66 (copy), v13 (ref), v14 (ref), v15 (ref), v20 (ref), v19 (ref), v83 (copy)
        local v96 = v66[v13][v95];
        if not v96 then
            return;
        else
            v66[v13][v95] = nil;
            v66[v14][v95] = nil;
            local v97 = v66[v15];
            local v98 = table.find(v97, v96);
            if v98 then
                local v99 = #v97;
                v97[v98] = v97[v99];
                v97[v99] = nil;
            end;
            if v96[v20] or v96[v19] then
                task.spawn(v83, v96);
            end;
            return;
        end;
    end;
    local function v125(v101) --[[ Line: 675 ]] --[[ Name: StartWatchingInstance ]]
        -- upvalues: v68 (copy), v66 (copy), v12 (ref), v16 (ref), v5 (ref), v13 (ref), v14 (ref), v15 (ref), v69 (copy), v100 (copy)
        local v102 = false;
        if v68[v101] then
            return;
        else
            local _ = function() --[[ Line: 679 ]] --[[ Name: IsInAncestorList ]]
                -- upvalues: v66 (ref), v12 (ref), v101 (copy)
                for _, v104 in ipairs(v66[v12]) do
                    if v101:IsDescendantOf(v104) then
                        return true;
                    end;
                end;
                return false;
            end;
            v68[v101] = v66[v16]:Connect(v5.Signal.combine({
                v101.AncestryChanged, 
                v66.AncestorsChanged
            }), function(_, v107) --[[ Line: 690 ]]
                -- upvalues: v66 (ref), v12 (ref), v101 (copy), v13 (ref), v14 (ref), v15 (ref), v69 (ref), v100 (ref)
                local v108 = false;
                if v107 then
                    local v109;
                    for _, v111 in ipairs(v66[v12]) do
                        if v101:IsDescendantOf(v111) then
                            v109 = true;
                            v108 = true;
                        end;
                        if v108 then
                            break;
                        end;
                    end;
                    if not v108 then
                        v109 = false;
                    end;
                    v108 = false;
                    if v109 then
                        v109 = v101;
                        if v66[v13][v109] then
                            return;
                        else
                            local v112 = (v66[v14][v109] or 0) + 1;
                            v66[v14][v109] = v112;
                            task.defer(function() --[[ Line: 641 ]]
                                -- upvalues: v109 (copy), v112 (ref), v66 (ref), v14 (ref), v13 (ref), v15 (ref), v69 (ref)
                                local l_v109_0 = v109;
                                local l_v112_0 = v112;
                                local v115;
                                if v66[v14][l_v109_0] ~= l_v112_0 then
                                    v115 = nil;
                                else
                                    local v116 = v66:_instantiate(l_v109_0);
                                    v115 = if v66[v14][l_v109_0] ~= l_v112_0 then nil else v116;
                                end;
                                if not v115 then
                                    return;
                                else
                                    v66[v13][v109] = v115;
                                    table.insert(v66[v15], v115);
                                    task.defer(function() --[[ Line: 648 ]]
                                        -- upvalues: v66 (ref), v13 (ref), v109 (ref), v115 (copy), v69 (ref)
                                        if v66[v13][v109] == v115 then
                                            v69(v115);
                                        end;
                                    end);
                                    return;
                                end;
                            end);
                            return;
                        end;
                    end;
                end;
                v100(v101);
            end);
            local v117;
            for _, v119 in ipairs(v66[v12]) do
                if v101:IsDescendantOf(v119) then
                    v117 = true;
                    v102 = true;
                end;
                if v102 then
                    break;
                end;
            end;
            if not v102 then
                v117 = false;
            end;
            v102 = false;
            if v117 then
                if v66[v13][v101] then
                    return;
                else
                    v117 = (v66[v14][v101] or 0) + 1;
                    v66[v14][v101] = v117;
                    if true then
                        local l_v117_0 = v117;
                        task.defer(function() --[[ Line: 641 ]]
                            -- upvalues: v101 (copy), l_v117_0 (ref), v66 (ref), v14 (ref), v13 (ref), v15 (ref), v69 (ref)
                            local l_v101_0 = v101;
                            local l_l_v117_0_0 = l_v117_0;
                            local v123;
                            if v66[v14][l_v101_0] ~= l_l_v117_0_0 then
                                v123 = nil;
                            else
                                local v124 = v66:_instantiate(l_v101_0);
                                v123 = if v66[v14][l_v101_0] ~= l_l_v117_0_0 then nil else v124;
                            end;
                            if not v123 then
                                return;
                            else
                                v66[v13][v101] = v123;
                                table.insert(v66[v15], v123);
                                task.defer(function() --[[ Line: 648 ]]
                                    -- upvalues: v66 (ref), v13 (ref), v101 (ref), v123 (copy), v69 (ref)
                                    if v66[v13][v101] == v123 then
                                        v69(v123);
                                    end;
                                end);
                                return;
                            end;
                        end);
                    end;
                end;
            end;
            return;
        end;
    end;
    local function v127(v126) --[[ Line: 703 ]] --[[ Name: InstanceTagged ]]
        -- upvalues: v125 (copy)
        v125(v126);
    end;
    local function v130(v128) --[[ Line: 707 ]] --[[ Name: InstanceUntagged ]]
        -- upvalues: v68 (copy), v66 (copy), v16 (ref), v100 (copy)
        local v129 = v68[v128];
        if v129 then
            v68[v128] = nil;
            v66[v16]:Remove(v129);
        end;
        v100(v128);
    end;
    v66[v16]:Connect(l_CollectionService_0:GetInstanceAddedSignal(v66.Tag), v127);
    v66[v16]:Connect(l_CollectionService_0:GetInstanceRemovedSignal(v66.Tag), v130);
    local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged(v66.Tag);
    for _, v133 in ipairs(l_l_CollectionService_0_Tagged_0) do
        task.defer(v127, v133);
    end;
end;
v58.GetAll = function(v134) --[[ Line: 744 ]] --[[ Name: GetAll ]]
    -- upvalues: v15 (copy)
    return v134[v15];
end;
v58.FromInstance = function(v135, v136) --[[ Line: 761 ]] --[[ Name: FromInstance ]]
    -- upvalues: v13 (copy)
    return v135[v13][v136];
end;
v58.WaitForInstance = function(v137, v138, v139) --[[ Line: 784 ]] --[[ Name: WaitForInstance ]]
    -- upvalues: v20 (copy), v3 (copy)
    local v140 = v137:FromInstance(v138);
    if v140 and v140[v20] then
        return v3.resolve(v140);
    else
        return v3.fromEvent(v137.Started, function(v141) --[[ Line: 789 ]]
            -- upvalues: v138 (copy), v140 (ref)
            local v142 = v141.Instance == v138;
            if v142 then
                v140 = v141;
            end;
            return v142;
        end):andThen(function() --[[ Line: 796 ]]
            -- upvalues: v140 (ref)
            return v140;
        end):timeout(if type(v139) == "number" then v139 else 60);
    end;
end;
v58.UpdateAncestors = function(v143, v144) --[[ Line: 820 ]] --[[ Name: UpdateAncestors ]]
    -- upvalues: v12 (copy)
    local v145 = v143[v12];
    v143[v12] = v144;
    v143.AncestorsChanged:Fire(v144, v145);
end;
v58.GetAncestors = function(v146) --[[ Line: 831 ]] --[[ Name: GetAncestors ]]
    -- upvalues: v12 (copy)
    return table.clone(v146[v12]);
end;
v58.Construct = function(_) --[[ Line: 849 ]] --[[ Name: Construct ]]

end;
v58.Start = function(_) --[[ Line: 866 ]] --[[ Name: Start ]]

end;
v58.Stop = function(_) --[[ Line: 886 ]] --[[ Name: Stop ]]

end;
v58.GetComponent = function(v150, v151) --[[ Line: 905 ]] --[[ Name: GetComponent ]]
    -- upvalues: v13 (copy)
    return v151[v13][v150.Instance];
end;
v58.WhileHasComponent = function(v152, v153, v154) --[[ Line: 935 ]] --[[ Name: WhileHasComponent ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v155 = v4.new();
    local v156 = {
        IsConnected = true
    };
    v156.Disconnect = function() --[[ Line: 940 ]]
        -- upvalues: v156 (copy), v155 (copy)
        if v156.IsConnected then
            v156.IsConnected = false;
            v155:Destroy();
        end;
    end;
    v156.Destroy = v156.Disconnect;
    setmetatable(v156, {
        __call = function(v157, ...) --[[ Line: 948 ]] --[[ Name: __call ]]
            return v157.Destroy(...);
        end
    });
    v155:Add(v156);
    v155:AddPromise(v3.fromEvent(v152.Stopped, function(v158) --[[ Line: 954 ]]
        -- upvalues: v152 (copy)
        return v158.Instance == v152.Instance;
    end):andThen(v156.Destroy));
    assert(typeof(v153) == "table", "Component:WhileHasComponent() expects a component class or an array of component classes.");
    local v159 = v153.Tag == nil;
    local v160 = if v159 then v153 else {
        v153
    };
    local function v165() --[[ Line: 964 ]] --[[ Name: getAllComponents ]]
        -- upvalues: v160 (copy), v152 (copy)
        local v161 = {};
        for v162, v163 in ipairs(v160) do
            local l_v152_Component_0 = v152:GetComponent(v163);
            if not l_v152_Component_0 then
                return nil;
            else
                v161[v162] = l_v152_Component_0;
            end;
        end;
        return v161;
    end;
    local v166 = {};
    local function v172() --[[ Line: 979 ]] --[[ Name: SetupIfAllPresent ]]
        -- upvalues: v165 (copy), v166 (copy), v152 (copy), v155 (copy), v4 (ref), v159 (copy), v154 (copy), v160 (copy), v3 (ref)
        local v167 = v165();
        if not v167 then
            return;
        elseif v166[v152.Instance] then
            return;
        else
            local v168 = v155:Add(v4.new(), "Destroy", v152.Instance);
            v166[v152.Instance] = v168;
            if v159 then
                v167 = table.unpack(v167);
            end;
            v168:Add(task.spawn(v154, v167, v168));
            for _, v170 in ipairs(v160) do
                v168:AddPromise(v3.fromEvent(v170.Stopped, function(v171) --[[ Line: 995 ]]
                    -- upvalues: v152 (ref)
                    return v171.Instance == v152.Instance;
                end):andThen(function() --[[ Line: 997 ]]
                    -- upvalues: v168 (copy), v166 (ref), v152 (ref)
                    v168:Destroy();
                    v166[v152.Instance] = nil;
                end));
            end;
            return;
        end;
    end;
    for _, v174 in ipairs(v160) do
        v155:Add(v174.Started:Connect(function(v175) --[[ Line: 1006 ]]
            -- upvalues: v152 (copy), v172 (copy)
            if v175.Instance == v152.Instance then
                v172();
            end;
        end));
    end;
    v172();
    return v156;
end;
v58.ForEachSibling = function(v176, ...) --[[ Line: 1020 ]] --[[ Name: ForEachSibling ]]
    warn("ForEachSibling is deprecated. Use WhileHasComponent instead.");
    return v176:WhileHasComponent(...);
end;
v58.Destroy = function(v177) --[[ Line: 1107 ]] --[[ Name: Destroy ]]
    -- upvalues: v11 (copy), v16 (copy)
    local v178 = table.find(v11, v177);
    if v178 then
        table.remove(v11, v178);
    end;
    v177[v16]:Destroy();
end;
return v58;