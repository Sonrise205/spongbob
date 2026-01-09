local l_CollectionService_0 = game:GetService("CollectionService");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Parent.Promise);
local v3 = require(script.Parent.Signal);
local v4 = require(script.Parent.Symbol);
local v5 = require(script.Parent.Trove);
local v6 = l_RunService_0:IsServer();
local v7 = {
    workspace, 
    game:GetService("Players")
};
local v8 = v4("Ancestors");
local v9 = v4("InstancesToComponents");
local v10 = v4("LockConstruct");
local v11 = v4("Components");
local v12 = v4("Trove");
local v13 = v4("Extensions");
local v14 = v4("ActiveExtensions");
local v15 = v4("Starting");
local v16 = v4("Started");
local v17 = 0;
local function _() --[[ Line: 193 ]] --[[ Name: NextRenderName ]]
    -- upvalues: v17 (ref)
    v17 = v17 + 1;
    return "ComponentRender" .. tostring(v17);
end;
local function v24(v19, v20) --[[ Line: 198 ]] --[[ Name: InvokeExtensionFn ]]
    -- upvalues: v14 (copy)
    for _, v22 in ipairs(v19[v14]) do
        local v23 = v22[v20];
        if type(v23) == "function" then
            v23(v19);
        end;
    end;
end;
local function v29(v25) --[[ Line: 207 ]] --[[ Name: ShouldConstruct ]]
    -- upvalues: v14 (copy)
    for _, v27 in ipairs(v25[v14]) do
        local l_ShouldConstruct_0 = v27.ShouldConstruct;
        if type(l_ShouldConstruct_0) == "function" and not l_ShouldConstruct_0(v25) then
            return false;
        end;
    end;
    return true;
end;
local function v38(v30, v31) --[[ Line: 220 ]] --[[ Name: GetActiveExtensions ]]
    local v32 = table.create(#v31);
    local v33 = true;
    for _, v35 in ipairs(v31) do
        local l_ShouldExtend_0 = v35.ShouldExtend;
        local v37 = true;
        if type(l_ShouldExtend_0) == "function" then
            v37 = not not l_ShouldExtend_0(v30);
        end;
        if v37 then
            table.insert(v32, v35);
        else
            v33 = false;
        end;
    end;
    if v33 then
        return v31;
    else
        return v32;
    end;
end;
local v39 = {};
v39.__index = v39;
v39.new = function(v40) --[[ Line: 299 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v7 (copy), v9 (copy), v11 (copy), v10 (copy), v12 (copy), v5 (copy), v13 (copy), v16 (copy), v3 (copy), v39 (copy)
    local v41 = {};
    v41.__index = v41;
    v41.__tostring = function() --[[ Line: 302 ]]
        -- upvalues: v40 (copy)
        return "Component<" .. v40.Tag .. ">";
    end;
    v41[v8] = v40.Ancestors or v7;
    v41[v9] = {};
    v41[v11] = {};
    v41[v10] = {};
    v41[v12] = v5.new();
    v41[v13] = v40.Extensions or {};
    v41[v16] = false;
    v41.Tag = v40.Tag;
    v41.Started = v41[v12]:Construct(v3);
    v41.Stopped = v41[v12]:Construct(v3);
    setmetatable(v41, v39);
    v41:_setup();
    return v41;
end;
v39._instantiate = function(v42, v43) --[[ Line: 320 ]] --[[ Name: _instantiate ]]
    -- upvalues: v14 (copy), v38 (copy), v13 (copy), v29 (copy), v24 (copy)
    local v44 = setmetatable({}, v42);
    v44.Instance = v43;
    v44[v14] = v38(v44, v42[v13]);
    if not v29(v44) then
        return nil;
    else
        v24(v44, "Constructing");
        if type(v44.Construct) == "function" then
            v44:Construct();
        end;
        v24(v44, "Constructed");
        return v44;
    end;
end;
v39._setup = function(v45) --[[ Line: 335 ]] --[[ Name: _setup ]]
    -- upvalues: v15 (copy), v24 (copy), l_RunService_0 (copy), v6 (copy), v17 (ref), v16 (copy), v10 (copy), v9 (copy), v11 (copy), v8 (copy), v12 (copy), l_CollectionService_0 (copy)
    local v46 = {};
    local function v56(v47) --[[ Line: 338 ]] --[[ Name: StartComponent ]]
        -- upvalues: v15 (ref), v24 (ref), l_RunService_0 (ref), v6 (ref), v17 (ref), v16 (ref), v45 (copy)
        v47[v15] = coroutine.running();
        v24(v47, "Starting");
        v47:Start();
        if v47[v15] == nil then
            return;
        else
            v24(v47, "Started");
            local v48 = typeof(v47.HeartbeatUpdate) == "function";
            local v49 = typeof(v47.SteppedUpdate) == "function";
            local v50 = typeof(v47.RenderSteppedUpdate) == "function";
            if v48 then
                v47._heartbeatUpdate = l_RunService_0.Heartbeat:Connect(function(v51) --[[ Line: 356 ]]
                    -- upvalues: v47 (copy)
                    v47:HeartbeatUpdate(v51);
                end);
            end;
            if v49 then
                v47._steppedUpdate = l_RunService_0.Stepped:Connect(function(_, v53) --[[ Line: 362 ]]
                    -- upvalues: v47 (copy)
                    v47:SteppedUpdate(v53);
                end);
            end;
            if v50 and not v6 then
                if v47.RenderPriority then
                    v17 = v17 + 1;
                    v47._renderName = "ComponentRender" .. tostring(v17);
                    l_RunService_0:BindToRenderStep(v47._renderName, v47.RenderPriority, function(v54) --[[ Line: 370 ]]
                        -- upvalues: v47 (copy)
                        v47:RenderSteppedUpdate(v54);
                    end);
                else
                    v47._renderSteppedUpdate = l_RunService_0.RenderStepped:Connect(function(v55) --[[ Line: 374 ]]
                        -- upvalues: v47 (copy)
                        v47:RenderSteppedUpdate(v55);
                    end);
                end;
            end;
            v47[v16] = true;
            v47[v15] = nil;
            v45.Started:Fire(v47);
            return;
        end;
    end;
    local function v59(v57) --[[ Line: 386 ]] --[[ Name: StopComponent ]]
        -- upvalues: v15 (ref), l_RunService_0 (ref), v24 (ref), v45 (copy)
        if v57[v15] then
            local v58 = v57[v15];
            if coroutine.status(v58) ~= "normal" then
                pcall(function() --[[ Line: 391 ]]
                    -- upvalues: v58 (copy)
                    task.cancel(v58);
                end);
            else
                task.defer(function() --[[ Line: 395 ]]
                    -- upvalues: v58 (copy)
                    pcall(function() --[[ Line: 396 ]]
                        -- upvalues: v58 (ref)
                        task.cancel(v58);
                    end);
                end);
            end;
            v57[v15] = nil;
        end;
        if v57._heartbeatUpdate then
            v57._heartbeatUpdate:Disconnect();
        end;
        if v57._steppedUpdate then
            v57._steppedUpdate:Disconnect();
        end;
        if v57._renderSteppedUpdate then
            v57._renderSteppedUpdate:Disconnect();
        elseif v57._renderName then
            l_RunService_0:UnbindFromRenderStep(v57._renderName);
        end;
        v24(v57, "Stopping");
        v57:Stop();
        v24(v57, "Stopped");
        v45.Stopped:Fire(v57);
    end;
    local function _(v60, v61) --[[ Line: 424 ]] --[[ Name: SafeConstruct ]]
        -- upvalues: v45 (copy), v10 (ref)
        if v45[v10][v60] ~= v61 then
            return nil;
        else
            local v62 = v45:_instantiate(v60);
            if v45[v10][v60] ~= v61 then
                return nil;
            else
                return v62;
            end;
        end;
    end;
    local function _(v64) --[[ Line: 435 ]] --[[ Name: TryConstructComponent ]]
        -- upvalues: v45 (copy), v9 (ref), v10 (ref), v11 (ref), v56 (copy)
        if v45[v9][v64] then
            return;
        else
            local v65 = (v45[v10][v64] or 0) + 1;
            v45[v10][v64] = v65;
            task.defer(function() --[[ Line: 442 ]]
                -- upvalues: v64 (copy), v65 (ref), v45 (ref), v10 (ref), v9 (ref), v11 (ref), v56 (ref)
                local l_v64_0 = v64;
                local l_v65_0 = v65;
                local v68;
                if v45[v10][l_v64_0] ~= l_v65_0 then
                    v68 = nil;
                else
                    local v69 = v45:_instantiate(l_v64_0);
                    v68 = if v45[v10][l_v64_0] ~= l_v65_0 then nil else v69;
                end;
                if not v68 then
                    return;
                else
                    v45[v9][v64] = v68;
                    table.insert(v45[v11], v68);
                    task.defer(function() --[[ Line: 449 ]]
                        -- upvalues: v45 (ref), v9 (ref), v64 (ref), v68 (copy), v56 (ref)
                        if v45[v9][v64] == v68 then
                            v56(v68);
                        end;
                    end);
                    return;
                end;
            end);
            return;
        end;
    end;
    local function v76(v71) --[[ Line: 457 ]] --[[ Name: TryDeconstructComponent ]]
        -- upvalues: v45 (copy), v9 (ref), v10 (ref), v11 (ref), v16 (ref), v15 (ref), v59 (copy)
        local v72 = v45[v9][v71];
        if not v72 then
            return;
        else
            v45[v9][v71] = nil;
            v45[v10][v71] = nil;
            local v73 = v45[v11];
            local v74 = table.find(v73, v72);
            if v74 then
                local v75 = #v73;
                v73[v74] = v73[v75];
                v73[v75] = nil;
            end;
            if v72[v16] or v72[v15] then
                task.spawn(v59, v72);
            end;
            return;
        end;
    end;
    local function v101(v77) --[[ Line: 476 ]] --[[ Name: StartWatchingInstance ]]
        -- upvalues: v46 (copy), v45 (copy), v8 (ref), v12 (ref), v9 (ref), v10 (ref), v11 (ref), v56 (copy), v76 (copy)
        local v78 = false;
        if v46[v77] then
            return;
        else
            local _ = function() --[[ Line: 480 ]] --[[ Name: IsInAncestorList ]]
                -- upvalues: v45 (ref), v8 (ref), v77 (copy)
                for _, v80 in ipairs(v45[v8]) do
                    if v77:IsDescendantOf(v80) then
                        return true;
                    end;
                end;
                return false;
            end;
            v46[v77] = v45[v12]:Connect(v77.AncestryChanged, function(_, v83) --[[ Line: 488 ]]
                -- upvalues: v45 (ref), v8 (ref), v77 (copy), v9 (ref), v10 (ref), v11 (ref), v56 (ref), v76 (ref)
                local v84 = false;
                if v83 then
                    local v85;
                    for _, v87 in ipairs(v45[v8]) do
                        if v77:IsDescendantOf(v87) then
                            v85 = true;
                            v84 = true;
                        end;
                        if v84 then
                            break;
                        end;
                    end;
                    if not v84 then
                        v85 = false;
                    end;
                    v84 = false;
                    if v85 then
                        v85 = v77;
                        if v45[v9][v85] then
                            return;
                        else
                            local v88 = (v45[v10][v85] or 0) + 1;
                            v45[v10][v85] = v88;
                            task.defer(function() --[[ Line: 442 ]]
                                -- upvalues: v85 (copy), v88 (ref), v45 (ref), v10 (ref), v9 (ref), v11 (ref), v56 (ref)
                                local l_v85_0 = v85;
                                local l_v88_0 = v88;
                                local v91;
                                if v45[v10][l_v85_0] ~= l_v88_0 then
                                    v91 = nil;
                                else
                                    local v92 = v45:_instantiate(l_v85_0);
                                    v91 = if v45[v10][l_v85_0] ~= l_v88_0 then nil else v92;
                                end;
                                if not v91 then
                                    return;
                                else
                                    v45[v9][v85] = v91;
                                    table.insert(v45[v11], v91);
                                    task.defer(function() --[[ Line: 449 ]]
                                        -- upvalues: v45 (ref), v9 (ref), v85 (ref), v91 (copy), v56 (ref)
                                        if v45[v9][v85] == v91 then
                                            v56(v91);
                                        end;
                                    end);
                                    return;
                                end;
                            end);
                            return;
                        end;
                    end;
                end;
                v76(v77);
            end);
            local v93;
            for _, v95 in ipairs(v45[v8]) do
                if v77:IsDescendantOf(v95) then
                    v93 = true;
                    v78 = true;
                end;
                if v78 then
                    break;
                end;
            end;
            if not v78 then
                v93 = false;
            end;
            v78 = false;
            if v93 then
                if v45[v9][v77] then
                    return;
                else
                    v93 = (v45[v10][v77] or 0) + 1;
                    v45[v10][v77] = v93;
                    if true then
                        local l_v93_0 = v93;
                        task.defer(function() --[[ Line: 442 ]]
                            -- upvalues: v77 (copy), l_v93_0 (ref), v45 (ref), v10 (ref), v9 (ref), v11 (ref), v56 (ref)
                            local l_v77_0 = v77;
                            local l_l_v93_0_0 = l_v93_0;
                            local v99;
                            if v45[v10][l_v77_0] ~= l_l_v93_0_0 then
                                v99 = nil;
                            else
                                local v100 = v45:_instantiate(l_v77_0);
                                v99 = if v45[v10][l_v77_0] ~= l_l_v93_0_0 then nil else v100;
                            end;
                            if not v99 then
                                return;
                            else
                                v45[v9][v77] = v99;
                                table.insert(v45[v11], v99);
                                task.defer(function() --[[ Line: 449 ]]
                                    -- upvalues: v45 (ref), v9 (ref), v77 (ref), v99 (copy), v56 (ref)
                                    if v45[v9][v77] == v99 then
                                        v56(v99);
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
    local function v103(v102) --[[ Line: 501 ]] --[[ Name: InstanceTagged ]]
        -- upvalues: v101 (copy)
        v101(v102);
    end;
    local function v106(v104) --[[ Line: 505 ]] --[[ Name: InstanceUntagged ]]
        -- upvalues: v46 (copy), v45 (copy), v12 (ref), v76 (copy)
        local v105 = v46[v104];
        if v105 then
            v46[v104] = nil;
            v45[v12]:Remove(v105);
        end;
        v76(v104);
    end;
    v45[v12]:Connect(l_CollectionService_0:GetInstanceAddedSignal(v45.Tag), v103);
    v45[v12]:Connect(l_CollectionService_0:GetInstanceRemovedSignal(v45.Tag), v106);
    local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged(v45.Tag);
    for _, v109 in ipairs(l_l_CollectionService_0_Tagged_0) do
        task.defer(v103, v109);
    end;
end;
v39.GetAll = function(v110) --[[ Line: 542 ]] --[[ Name: GetAll ]]
    -- upvalues: v11 (copy)
    return v110[v11];
end;
v39.FromInstance = function(v111, v112) --[[ Line: 559 ]] --[[ Name: FromInstance ]]
    -- upvalues: v9 (copy)
    return v111[v9][v112];
end;
v39.WaitForInstance = function(v113, v114, v115) --[[ Line: 582 ]] --[[ Name: WaitForInstance ]]
    -- upvalues: v16 (copy), v2 (copy)
    local v116 = v113:FromInstance(v114);
    if v116 and v116[v16] then
        return v2.resolve(v116);
    else
        return v2.fromEvent(v113.Started, function(v117) --[[ Line: 587 ]]
            -- upvalues: v114 (copy), v116 (ref)
            local v118 = v117.Instance == v114;
            if v118 then
                v116 = v117;
            end;
            return v118;
        end):andThen(function() --[[ Line: 594 ]]
            -- upvalues: v116 (ref)
            return v116;
        end):timeout(if type(v115) == "number" then v115 else 60);
    end;
end;
v39.Construct = function(_) --[[ Line: 614 ]] --[[ Name: Construct ]]

end;
v39.Start = function(_) --[[ Line: 631 ]] --[[ Name: Start ]]

end;
v39.Stop = function(_) --[[ Line: 651 ]] --[[ Name: Stop ]]

end;
v39.GetComponent = function(v122, v123) --[[ Line: 670 ]] --[[ Name: GetComponent ]]
    -- upvalues: v9 (copy)
    return v123[v9][v122.Instance];
end;
v39.Destroy = function(v124) --[[ Line: 755 ]] --[[ Name: Destroy ]]
    -- upvalues: v12 (copy)
    v124[v12]:Destroy();
end;
return v39;