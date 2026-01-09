local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v3 = newproxy();
local v4 = newproxy();
local v5 = newproxy();
local v6 = {};
v6.__index = v6;
v6.new = function() --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        suppressWarnings = false, 
        suppressErrors = false, 
        _objects = {}, 
        _identifierObjects = {}, 
        _bindedNames = {}, 
        _attributes = {}
    }, v6));
end;
v6.Add = function(v7, v8, v9, v10) --[[ Line: 47 ]] --[[ Name: Add ]]
    if v7._isCleaning then
        v7:_sendWarn("Cannot add item for cleanup when dumpster is being cleaned up/destroyed");
        return;
    else
        local v11 = v7:_getCleanUpMethod(v8, v10);
        if not v11 then
            if typeof(v8) == "table" and v7:_isAPromise(v8) then
                return v7:AddPromise(v8, v9);
            else
                v7:_sendWarn(v8, "was not added for cleanup, could not find a cleanup method!");
                return;
            end;
        elseif v9 then
            if not v7:_cleanUpIdentifierAvailable(v9) then
                return;
            else
                v7._identifierObjects[v9] = {
                    object = v8, 
                    method = v11
                };
                return v8;
            end;
        else
            table.insert(v7._objects, {
                object = v8, 
                method = v11
            });
            return v8;
        end;
    end;
end;
v6.AddPromise = function(v12, v13, v14) --[[ Line: 89 ]] --[[ Name: AddPromise ]]
    -- upvalues: l_HttpService_0 (copy)
    if not v12:_isAPromise(v13) then
        v12:_sendWarn("This is not a promise!");
        return;
    else
        v14 = v14 or l_HttpService_0:GenerateGUID();
        if v14 then
            if not v12:_cleanUpIdentifierAvailable(v14) then
                return;
            else
                v12._identifierObjects[v14] = {
                    object = v13, 
                    method = "cancel"
                };
                v12:_initPromise(v13, v14);
                return v13;
            end;
        else
            table.insert(v12._objects, {
                object = v13, 
                method = "cancel"
            });
            v12:_initPromise(v13, v14);
            return v13;
        end;
    end;
end;
v6.SetAttribute = function(v15, v16, v17) --[[ Line: 119 ]] --[[ Name: SetAttribute ]]
    v15._attributes[v16] = v17;
end;
v6.GetAttribute = function(v18, v19) --[[ Line: 127 ]] --[[ Name: GetAttribute ]]
    return v18._attributes[v19];
end;
v6.Extend = function(v20) --[[ Line: 136 ]] --[[ Name: Extend ]]
    -- upvalues: v5 (copy)
    local v21 = v20.new();
    v21._dumpsterProxy = v5;
    v20:Add(v21);
    return v21;
end;
v6.Construct = function(v22, v23, ...) --[[ Line: 153 ]] --[[ Name: Construct ]]
    if type(v23) == "string" then
        local v24 = Instance.new(v23);
        v22:Add(v24, ...);
        return v24;
    elseif type(v23) == "table" then
        local v25 = v23.new(...);
        v22:Add(v25);
        return v25;
    elseif type(v23) == "function" then
        local v26 = v23(...);
        v22:Add(v26);
        return v26;
    else
        v22:_sendWarn("Object could not be constructed!");
        return;
    end;
end;
v6.Clone = function(v27, v28) --[[ Line: 180 ]] --[[ Name: Clone ]]
    if typeof(v28) ~= "Instance" then
        v27:_sendWarn("Only instances can be cloned");
        return;
    else
        local v29 = v28:Clone();
        v27:Add(v29);
        return v29;
    end;
end;
v6.BindToRenderStep = function(v30, v31, v32, v33) --[[ Line: 201 ]] --[[ Name: BindToRenderStep ]]
    -- upvalues: l_RunService_0 (copy)
    local v34 = false;
    if v31 ~= nil then
        v34 = typeof(v31) == "string";
    end;
    assert(v34, "Name must be a string!");
    v34 = false;
    if v32 ~= nil then
        v34 = typeof(v32) == "number";
    end;
    assert(v34, "Priority must be a number!");
    v34 = false;
    if v33 ~= nil then
        v34 = typeof(v33) == "function";
    end;
    assert(v34, "Must have a callback function!");
    if v30._isCleaning then
        v30:_sendWarn("Cannot bind function to render step when dumpster is being cleaned up/destroyed");
        return;
    elseif table.find(v30._bindedNames, v31) then
        v30:_sendWarn("The name you're trying to bind the function to render stepped to already exists, please use a unique name!");
        return;
    else
        l_RunService_0:BindToRenderStep(v31, v32, v33);
        table.insert(v30._bindedNames, v31);
        return;
    end;
end;
v6.UnbindFromRenderStep = function(v35, v36) --[[ Line: 228 ]] --[[ Name: UnbindFromRenderStep ]]
    -- upvalues: l_RunService_0 (copy)
    local v37 = table.find(v35._bindedNames, v36);
    if not v37 then
        v35:_sendWarn("No Bind to render step was found with name:", v36);
        return;
    else
        table.remove(v35._bindedNames, v37);
        l_RunService_0:UnbindFromRenderStep(v36);
        return;
    end;
end;
v6.Connect = function(v38, v39, v40, v41) --[[ Line: 249 ]] --[[ Name: Connect ]]
    if typeof(v39) ~= "RBXScriptSignal" then
        v38:_sendWarn("Attempted to Connect with object not being of type RBXScriptSignal");
        return;
    elseif typeof(v40) ~= "function" then
        v38:_sendWarn("attempted to Connect, argument 2 expects function but got", (typeof(v40)));
        return;
    elseif v38._isCleaning then
        v38:_sendWarn("Cannot call method when dumpster is being cleaned up/destroyed");
        return;
    else
        return v38:Add(v39:Connect(v40), v41);
    end;
end;
v6.AttachTo = function(v42, v43) --[[ Line: 275 ]] --[[ Name: AttachTo ]]
    -- upvalues: l_Players_0 (copy)
    local v44 = typeof(v43);
    if v42._isCleaning then
        v42:_sendWarn("Cannot called AttachTo when dumpster is being cleaned up/destroyed");
        return;
    elseif v44 == "Instance" and (v43:IsA("Tween") or v43:IsA("TweenBase")) then
        if v43.TweenInfo.RepeatCount < 0 then
            v42:_sendWarn(("Tried to attach Dumpster to Tween with RepeatCount < 0\n" .. "This tween will loop infinitely until Destroy() is called\n") .. "THEREFORE, it is attached to .Destroying instead of .Completed");
            v42:Add(v43.Destroying:Connect(function() --[[ Line: 291 ]]
                -- upvalues: v42 (copy)
                v42:Destroy();
            end));
            return;
        else
            v42:Add(v43.Completed:Connect(function() --[[ Line: 295 ]]
                -- upvalues: v42 (copy)
                v42:Destroy();
            end));
            return;
        end;
    elseif v44 == "Instance" and v43:IsA("AnimationTrack") then
        if v43.Looped then
            v42:_sendWarn(("Tried to attach Dumpster to AnimationTrack with Looped set to true\n" .. "This animation will loop infinitely until Destroy() is called\n") .. "THEREFORE, it is attached to .Destroying instead of .Stopped");
            v42:Add(v43.Destroying:Connect(function() --[[ Line: 309 ]]
                -- upvalues: v42 (copy)
                v42:Destroy();
            end));
            return;
        else
            v42:Add(v43.Stopped:Connect(function() --[[ Line: 313 ]]
                -- upvalues: v42 (copy)
                v42:Destroy();
            end));
            return;
        end;
    else
        if v44 == "Instance" and v43:IsA("Player") then
            if not v43:IsDescendantOf(game) then
                v42:Destroy();
                return;
            else
                v42:Add(l_Players_0.PlayerRemoving:Connect(function(v45) --[[ Line: 325 ]]
                    -- upvalues: v43 (copy), v42 (copy)
                    if v45 == v43 then
                        v42:Destroy();
                    end;
                end));
            end;
        elseif v44 == "Instance" and v43:IsA("Sound") then
            if v43.Looped then
                v42:_sendWarn(v43, "is looped, therefore attaching to .Destroying event instead of .Ended event");
                v42:Add(v43.Destroying:Connect(function() --[[ Line: 334 ]]
                    -- upvalues: v42 (copy)
                    v42:Destroy();
                end));
                return;
            else
                v42:Add(v43.Ended:Connect(function() --[[ Line: 341 ]]
                    -- upvalues: v42 (copy)
                    v42:Destroy();
                end));
                v42:Add(v43.Destroying:Connect(function() --[[ Line: 345 ]]
                    -- upvalues: v42 (copy)
                    v42:Destroy();
                end));
            end;
        elseif v44 == "RBXScriptSignal" then
            v42:Connect(v43, function() --[[ Line: 349 ]]
                -- upvalues: v42 (copy)
                v42:Destroy();
            end);
            return;
        elseif v44 == "table" and typeof(v43.Connect) == "function" then
            v42:Add(v43:Connect(function() --[[ Line: 355 ]]
                -- upvalues: v42 (copy)
                v42:Destroy();
            end));
            return;
        elseif v44 == "Instance" and v43.ClassName == "Model" and l_Players_0:GetPlayerFromCharacter(v43) then
            local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v43);
            if l_l_Players_0_PlayerFromCharacter_0 then
                v42:AttachTo(l_l_Players_0_PlayerFromCharacter_0);
                v42:AttachTo(l_l_Players_0_PlayerFromCharacter_0.CharacterAdded);
            end;
            v42:_streamWithUID(v43, "Humanoid", function(v47) --[[ Line: 368 ]]
                -- upvalues: v42 (copy)
                v42:Add(v47.Died:Connect(function() --[[ Line: 369 ]]
                    -- upvalues: v42 (ref)
                    v42:Destroy();
                end));
                v42:Add(v47.StateChanged:Connect(function(_, v49) --[[ Line: 375 ]]
                    -- upvalues: v42 (ref)
                    if v49 == Enum.HumanoidStateType.Dead then
                        v42:Destroy();
                    end;
                end));
            end);
        end;
        if v44 == "Instance" then
            v42:AttachTo(v43.Destroying);
            return;
        else
            v42:_sendWarn("Item was not attached to Dumpster, allowed objects: Instance | Tween | TweenBase | AnimationTrack | Sound | RBXScriptSignal");
            return;
        end;
    end;
end;
v6.Remove = function(v50, v51, v52) --[[ Line: 403 ]] --[[ Name: Remove ]]
    if v50._isCleaning then
        v50:_sendWarn("Cannot remove item when dumpster is being cleaned up/destroyed");
        return;
    elseif typeof(v51) == "string" then
        if not v50._identifierObjects[v51] then
            if table.find(v50._bindedNames, v51) then
                v50:UnbindFromRenderStep(v51);
                v50._identifierObjects[v51] = nil;
                return;
            else
                v50:_sendWarn("Could find an object to clean with ID:", v51);
                return;
            end;
        else
            local l_object_0 = v50._identifierObjects[v51].object;
            local l_method_0 = v50._identifierObjects[v51].method;
            v50._identifierObjects[v51] = nil;
            if v52 then
                return l_object_0;
            else
                v50:_cleanObject(l_object_0, l_method_0, true);
                return;
            end;
        end;
    else
        return v50:_removeObject(v51, v52);
    end;
end;
v6.Get = function(v55, v56) --[[ Line: 438 ]] --[[ Name: Get ]]
    return v55._identifierObjects[v56];
end;
v6.Clean = function(v57) --[[ Line: 447 ]] --[[ Name: Clean ]]
    v57:Destroy();
end;
v6.Cleanup = function(v58) --[[ Line: 452 ]] --[[ Name: Cleanup ]]
    v58:Destroy();
end;
v6.Destroy = function(v59) --[[ Line: 461 ]] --[[ Name: Destroy ]]
    if v59._isCleaning then
        v59:_sendWarn("Tried to Destroy dumpster when its currently being cleaned up!");
        return;
    else
        v59:_destroy();
        return;
    end;
end;
v6._streamWithUID = function(v60, v61, v62, v63) --[[ Line: 473 ]] --[[ Name: _streamWithUID ]]
    -- upvalues: l_HttpService_0 (copy), l_RunService_0 (copy)
    local l_v61_FirstChild_0 = v61:FindFirstChild(v62);
    if l_v61_FirstChild_0 then
        v63(l_v61_FirstChild_0);
        return;
    else
        local v65 = ("STREAM_UID_%*"):format((l_HttpService_0:GenerateGUID()));
        local v66 = 0;
        v60:Add(l_RunService_0.Heartbeat:Connect(function(v67) --[[ Line: 485 ]]
            -- upvalues: v66 (ref), v61 (copy), v62 (copy), v63 (copy), v60 (copy), v65 (copy)
            v66 = v66 + v67;
            local l_v61_FirstChild_1 = v61:FindFirstChild(v62);
            if l_v61_FirstChild_1 or v66 >= 5 then
                if l_v61_FirstChild_1 then
                    v63(l_v61_FirstChild_1);
                else
                    v60:_sendWarn("Attempt on streaming for", v62, "resulted in a timeout.");
                end;
                v60:Remove(v65);
                v66 = nil;
            end;
        end), v65);
        return v65;
    end;
end;
v6._getCleanUpMethod = function(_, v70, v71) --[[ Line: 504 ]] --[[ Name: _getCleanUpMethod ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v72 = typeof(v70);
    if v72 ~= "thread" and v72 ~= "function" and v71 then
        return v71;
    elseif v72 == "thread" then
        return v4;
    elseif v72 == "function" then
        return v3;
    elseif v72 == "Instance" then
        return "Destroy";
    elseif v72 == "table" then
        if typeof(v70.Destroy) == "function" then
            return "Destroy";
        elseif typeof(v70.Clean) == "function" then
            return "Clean";
        elseif typeof(v70.Disconnect) == "function" then
            return "Disconnect";
        else
            return;
        end;
    elseif v72 == "RBXScriptConnection" then
        return "Disconnect";
    else
        return;
    end;
end;
v6._cleanUpIdentifierAvailable = function(v73, v74) --[[ Line: 534 ]] --[[ Name: _cleanUpIdentifierAvailable ]]
    if v73._identifierObjects[v74] then
        v73:_sendError("A cleanup identifier with ID: " .. v74 .. "already exists");
        return false;
    else
        return true;
    end;
end;
v6._removeObject = function(v75, v76, v77) --[[ Line: 543 ]] --[[ Name: _removeObject ]]
    local v78 = nil;
    local v79 = nil;
    for v80, v81 in ipairs(v75._objects) do
        if v81.object == v76 then
            v78 = v75._objects;
            v79 = v80;
            break;
        end;
    end;
    if not v78 then
        for v82, v83 in pairs(v75._identifierObjects) do
            if v83.object == v76 then
                v78 = v75._identifierObjects;
                v79 = v82;
                break;
            end;
        end;
    end;
    if not v78 then
        v75:_sendWarn("Could not find object to remove!");
        return;
    else
        local l_object_1 = v78[v79].object;
        local l_method_1 = v78[v79].method;
        if v77 then
            v78[v79] = nil;
            v75._identifierObjects[v79] = nil;
            return l_object_1;
        else
            if v75:_cleanObject(l_object_1, l_method_1, true) then
                v78[v79] = nil;
                v75._identifierObjects[v79] = nil;
            end;
            return;
        end;
    end;
end;
v6._destroy = function(v86) --[[ Line: 588 ]] --[[ Name: _destroy ]]
    -- upvalues: v3 (copy), l_RunService_0 (copy)
    v86._isCleaning = true;
    local v87 = {};
    local function _(v88, v89) --[[ Line: 593 ]] --[[ Name: cleanObject ]]
        -- upvalues: v3 (ref), v87 (copy), v86 (copy)
        if v89 == v3 then
            table.insert(v87, v88);
            return;
        else
            v86:_cleanObject(v88, v89);
            return;
        end;
    end;
    for _, v92 in ipairs(v86._objects) do
        local l_object_2 = v92.object;
        local l_method_2 = v92.method;
        if l_method_2 == v3 then
            table.insert(v87, l_object_2);
        else
            v86:_cleanObject(l_object_2, l_method_2);
        end;
    end;
    for _, v96 in pairs(v86._identifierObjects) do
        local l_object_3 = v96.object;
        local l_method_3 = v96.method;
        if l_method_3 == v3 then
            table.insert(v87, l_object_3);
        else
            v86:_cleanObject(l_object_3, l_method_3);
        end;
    end;
    for _, v100 in ipairs(v86._bindedNames) do
        l_RunService_0:UnbindFromRenderStep(v100);
    end;
    table.clear(v86._objects);
    table.clear(v86._identifierObjects);
    table.clear(v86._bindedNames);
    table.clear(v86._attributes);
    for _, v102 in ipairs(v87) do
        task.spawn(v102);
    end;
    v86._isCleaning = false;
end;
v6._cleanObject = function(v103, v104, v105, v106) --[[ Line: 630 ]] --[[ Name: _cleanObject ]]
    -- upvalues: v4 (copy), v3 (copy)
    if v105 == v4 then
        if coroutine.status(v104) ~= "dead" then
            coroutine.close(v104);
        end;
        return;
    elseif v105 == v3 and v106 then
        v104();
        return;
    elseif not v104 then
        return;
    elseif v103._isAPromise(v104) then
        pcall(function() --[[ Line: 648 ]]
            -- upvalues: v104 (copy), v105 (copy)
            v104[v105](v104);
        end);
        return true;
    else
        v104[v105](v104);
        return true;
    end;
end;
v6._sendError = function(v107, v108) --[[ Line: 660 ]] --[[ Name: _sendError ]]
    if v107.suppressErrors then
        return;
    else
        error(v108 .. "\n" .. debug.traceback());
        return;
    end;
end;
v6._sendWarn = function(v109, ...) --[[ Line: 668 ]] --[[ Name: _sendWarn ]]
    if v109.suppressWarnings then
        return;
    else
        warn(...);
        warn(debug.traceback());
        return;
    end;
end;
v6._isAPromise = function(_, v111) --[[ Line: 677 ]] --[[ Name: _isAPromise ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 678 ]]
        -- upvalues: v111 (copy)
        local v112 = typeof(v111.cancel) == "function";
        local v113 = typeof(v111.getStatus) == "function";
        local v114 = typeof(v111.finally) == "function";
        local v115 = typeof(v111.andThen) == "function";
        return v112 and v113 and v114 and v115;
    end);
    if not l_status_0 then
        return false;
    else
        return l_result_0;
    end;
end;
v6._initPromise = function(v118, v119, v120) --[[ Line: 695 ]] --[[ Name: _initPromise ]]
    if v119:getStatus() == "Started" then
        v119:finally(function() --[[ Line: 697 ]]
            -- upvalues: v118 (copy), v120 (copy)
            if v118._isCleaning then
                return;
            else
                v118:Remove(v120, true);
                return;
            end;
        end);
    end;
    return true;
end;
return v6;