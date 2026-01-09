local v0 = require(script.FastDefer);
local v1 = require(script.Promise);
local v2 = setmetatable({}, {
    __tostring = function() --[[ Line: 17 ]] --[[ Name: __tostring ]]
        return "LinkToInstanceIndex";
    end
});
local v3 = {
    ClassName = "Janitor", 
    CurrentlyCleaning = true, 
    SuppressInstanceReDestroy = false, 
    UnsafeThreadCleanup = false
};
v3.__index = v3;
local v4 = setmetatable({}, {
    __mode = "ks"
});
local v5 = {
    ["function"] = true, 
    thread = true, 
    RBXScriptConnection = "Disconnect"
};
v3.new = function() --[[ Line: 162 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        CurrentlyCleaning = false
    }, v3));
end;
v3.Is = function(v6) --[[ Line: 175 ]] --[[ Name: Is ]]
    -- upvalues: v3 (copy)
    local v7 = false;
    if type(v6) == "table" then
        v7 = getmetatable(v6) == v3;
    end;
    return v7;
end;
v3.instanceof = v3.Is;
local l_Destroy_0 = game.Destroy;
local function v18(v9, v10) --[[ Line: 193 ]] --[[ Name: Remove ]]
    -- upvalues: v4 (copy), v0 (copy), l_Destroy_0 (copy)
    local v11 = v4[v9];
    if v11 then
        local v12 = v11[v10];
        if not v12 then
            return v9;
        else
            local v13 = v9[v12];
            if v13 then
                if v13 == true then
                    if type(v12) == "function" then
                        v12();
                    else
                        local v14 = nil;
                        if coroutine.running() ~= v12 then
                            v14 = pcall(function() --[[ Line: 210 ]]
                                -- upvalues: v12 (copy)
                                task.cancel(v12);
                            end);
                        end;
                        if not v14 then
                            if v9.UnsafeThreadCleanup then
                                v0(function() --[[ Line: 218 ]]
                                    -- upvalues: v12 (copy)
                                    task.cancel(v12);
                                end);
                            else
                                task.defer(function() --[[ Line: 222 ]]
                                    -- upvalues: v12 (copy)
                                    task.cancel(v12);
                                end);
                            end;
                        end;
                    end;
                elseif v13 == "Destroy" then
                    if v9.SuppressInstanceReDestroy and typeof(v12) == "Instance" then
                        pcall(l_Destroy_0, v12);
                    else
                        local l_Destroy_1 = v12.Destroy;
                        if l_Destroy_1 then
                            l_Destroy_1(v12);
                        end;
                    end;
                elseif v13 == "Disconnect" then
                    local l_Disconnect_0 = v12.Disconnect;
                    if l_Disconnect_0 then
                        l_Disconnect_0(v12);
                    end;
                else
                    local v17 = v12[v13];
                    if v17 then
                        v17(v12);
                    end;
                end;
                v9[v12] = nil;
            end;
            v11[v10] = nil;
        end;
    end;
    return v9;
end;
local function v26(v19, v20, v21, v22) --[[ Line: 262 ]] --[[ Name: Add ]]
    -- upvalues: v18 (copy), v4 (copy), v5 (copy)
    if v22 then
        v18(v19, v22);
        local v23 = v4[v19];
        if not v23 then
            v23 = {};
            v4[v19] = v23;
        end;
        v23[v22] = v20;
    end;
    local v24 = typeof(v20);
    local v25 = v21 or v5[v24] or "Destroy";
    if v24 == "function" or v24 == "thread" then
        if v25 ~= true then
            warn(string.format("Object is a %* and as such expected `true?` for the method name and instead got %*. Traceback: %*", v24, tostring(v25), debug.traceback(nil, 2)));
        end;
    elseif not v20[v25] then
        warn(string.format("Object %* doesn't have method %*, are you sure you want to add it? Traceback: %*", tostring(v20), tostring(v25), debug.traceback(nil, 2)));
    end;
    v19[v20] = v25;
    return v20;
end;
v3.Add = v26;
v3.AddObject = function(v27, v28, v29, v30, ...) --[[ Line: 415 ]] --[[ Name: AddObject ]]
    -- upvalues: v26 (copy)
    return (v26(v27, v28.new(...), v29, v30));
end;
v3.Get = function(v31, v32) --[[ Line: 419 ]] --[[ Name: Get ]]
    -- upvalues: v4 (copy)
    local v33 = v4[v31];
    if v33 then
        return v33[v32];
    else
        return nil;
    end;
end;
v3.AddPromise = function(v34, v35, v36) --[[ Line: 486 ]] --[[ Name: AddPromise ]]
    -- upvalues: v1 (copy), v26 (copy), v4 (copy), v18 (copy)
    if not v1 then
        return v35;
    else
        if not v1.is(v35) then
            error(string.format("Invalid argument #1 to 'Janitor:AddPromise' (Promise expected, got %* (%*)) Traceback: %*", typeof(v35), tostring(v35), debug.traceback(nil, 2)));
        end;
        if v35:getStatus() ~= v1.Status.Started then
            return v35;
        else
            local l_v36_0 = v36;
            if l_v36_0 == nil then
                l_v36_0 = newproxy(false);
            end;
            local v41 = v26(v34, v1.new(function(v38, _, v40) --[[ Line: 504 ]]
                -- upvalues: v35 (copy)
                if v40(function() --[[ Line: 505 ]]
                    -- upvalues: v35 (ref)
                    v35:cancel();
                end) then
                    return;
                else
                    v38(v35);
                    return;
                end;
            end), "cancel", l_v36_0);
            v41:finally(function() --[[ Line: 514 ]]
                -- upvalues: v34 (copy), l_v36_0 (ref), v4 (ref), v41 (copy), v18 (ref)
                local l_v34_0 = v34;
                local l_l_v36_0_0 = l_v36_0;
                local v44 = v4[l_v34_0];
                if (if v44 then v44[l_l_v36_0_0] else nil) == v41 then
                    v18(v34, l_v36_0);
                end;
            end);
            return v41;
        end;
    end;
end;
v3.Remove = v18;
v3.RemoveNoClean = function(v45, v46) --[[ Line: 585 ]] --[[ Name: RemoveNoClean ]]
    -- upvalues: v4 (copy)
    local v47 = v4[v45];
    if v47 then
        local v48 = v47[v46];
        if v48 then
            v45[v48] = nil;
            v47[v46] = nil;
        end;
    end;
    return v45;
end;
v3.RemoveList = function(v49, ...) --[[ Line: 640 ]] --[[ Name: RemoveList ]]
    -- upvalues: v4 (copy), v18 (copy)
    if v4[v49] then
        local v50 = select("#", ...);
        if v50 == 1 then
            return (v18(v49, ...));
        elseif v50 == 2 then
            local v51, v52 = ...;
            v18(v49, v51);
            v18(v49, v52);
            return v49;
        elseif v50 == 3 then
            local v53, v54, v55 = ...;
            v18(v49, v53);
            v18(v49, v54);
            v18(v49, v55);
            return v49;
        else
            for v56 = 1, v50 do
                local v57 = select(v56, ...);
                v18(v49, v57);
            end;
        end;
    end;
    return v49;
end;
v3.RemoveListNoClean = function(v58, ...) --[[ Line: 711 ]] --[[ Name: RemoveListNoClean ]]
    -- upvalues: v4 (copy)
    local v59 = v4[v58];
    if v59 then
        local v60 = select("#", ...);
        if v60 == 1 then
            local v61 = ...;
            local v62 = v59[v61];
            if v62 then
                v58[v62] = nil;
                v59[v61] = nil;
            end;
            return v58;
        elseif v60 == 2 then
            local v63, v64 = ...;
            local v65 = v59[v63];
            if v65 then
                v58[v65] = nil;
                v59[v63] = nil;
            end;
            local v66 = v59[v64];
            if v66 then
                v58[v66] = nil;
                v59[v64] = nil;
            end;
            return v58;
        elseif v60 == 3 then
            local v67, v68, v69 = ...;
            local v70 = v59[v67];
            if v70 then
                v58[v70] = nil;
                v59[v67] = nil;
            end;
            local v71 = v59[v68];
            if v71 then
                v58[v71] = nil;
                v59[v68] = nil;
            end;
            local v72 = v59[v69];
            if v72 then
                v58[v72] = nil;
                v59[v69] = nil;
            end;
            return v58;
        else
            for v73 = 1, v60 do
                local v74 = select(v73, ...);
                local v75 = v59[v74];
                if v75 then
                    v58[v75] = nil;
                    v59[v74] = nil;
                end;
            end;
        end;
    end;
    return v58;
end;
v3.GetAll = function(v76) --[[ Line: 796 ]] --[[ Name: GetAll ]]
    -- upvalues: v4 (copy)
    local v77 = v4[v76];
    if v77 then
        return (table.freeze(table.clone(v77)));
    else
        return {};
    end;
end;
local function v94(v78) --[[ Line: 824 ]] --[[ Name: Cleanup ]]
    -- upvalues: v0 (copy), l_Destroy_0 (copy), v4 (copy)
    if not v78.CurrentlyCleaning then
        local l_SuppressInstanceReDestroy_0 = v78.SuppressInstanceReDestroy;
        local l_UnsafeThreadCleanup_0 = v78.UnsafeThreadCleanup;
        v78.CurrentlyCleaning = nil;
        v78.SuppressInstanceReDestroy = nil;
        v78.UnsafeThreadCleanup = nil;
        local v81, v82 = next(v78);
        do
            local l_v81_0 = v81;
            while l_v81_0 and v82 do
                if v82 == true then
                    if type(l_v81_0) == "function" then
                        l_v81_0();
                    else
                        local v84 = nil;
                        if coroutine.running() ~= l_v81_0 then
                            v84 = pcall(function() --[[ Line: 841 ]]
                                -- upvalues: l_v81_0 (ref)
                                task.cancel(l_v81_0);
                            end);
                        end;
                        if not v84 then
                            local l_l_v81_0_0 = l_v81_0;
                            if l_UnsafeThreadCleanup_0 then
                                local l_l_l_v81_0_0_0 = l_l_v81_0_0 --[[ copy: 6 -> 8 ]];
                                v0(function() --[[ Line: 849 ]]
                                    -- upvalues: l_l_l_v81_0_0_0 (copy)
                                    task.cancel(l_l_l_v81_0_0_0);
                                end);
                            else
                                local l_l_l_v81_0_0_1 = l_l_v81_0_0 --[[ copy: 6 -> 7 ]];
                                task.defer(function() --[[ Line: 853 ]]
                                    -- upvalues: l_l_l_v81_0_0_1 (copy)
                                    task.cancel(l_l_l_v81_0_0_1);
                                end);
                            end;
                        end;
                    end;
                elseif v82 == "Destroy" then
                    if v78.SuppressInstanceReDestroy and typeof(l_v81_0) == "Instance" then
                        pcall(l_Destroy_0, l_v81_0);
                    else
                        local l_Destroy_2 = l_v81_0.Destroy;
                        if l_Destroy_2 then
                            l_Destroy_2(l_v81_0);
                        end;
                    end;
                elseif v82 == "Disconnect" then
                    local l_Disconnect_1 = l_v81_0.Disconnect;
                    if l_Disconnect_1 then
                        l_Disconnect_1(l_v81_0);
                    end;
                else
                    local v90 = l_v81_0[v82];
                    if v90 then
                        v90(l_v81_0);
                    end;
                end;
                v78[l_v81_0] = nil;
                local v91, v92 = next(v78, l_v81_0);
                l_v81_0 = v91;
                v82 = v92;
            end;
            local v93 = v4[v78];
            if v93 then
                table.clear(v93);
                v4[v78] = nil;
            end;
            v78.CurrentlyCleaning = false;
            v78.SuppressInstanceReDestroy = l_SuppressInstanceReDestroy_0;
            v78.UnsafeThreadCleanup = l_UnsafeThreadCleanup_0;
        end;
    end;
end;
v3.Cleanup = v94;
v3.Destroy = function(v95) --[[ Line: 907 ]] --[[ Name: Destroy ]]
    -- upvalues: v94 (copy)
    v94(v95);
    table.clear(v95);
    setmetatable(v95, nil);
end;
v3.__call = v94;
local function v100(v96, v97, v98) --[[ Line: 915 ]] --[[ Name: LinkToInstance ]]
    -- upvalues: v2 (copy), v26 (copy), v94 (copy)
    local v99 = if v98 then newproxy(false) else v2;
    return (v26(v96, v97.Destroying:Connect(function() --[[ Line: 918 ]]
        -- upvalues: v94 (ref), v96 (copy)
        v94(v96);
    end), "Disconnect", v99));
end;
v3.LinkToInstance = v100;
v3.LegacyLinkToInstance = v100;
v3.LinkToInstances = function(v101, ...) --[[ Line: 981 ]] --[[ Name: LinkToInstances ]]
    -- upvalues: v3 (copy), v100 (copy)
    local v102 = v3.new();
    for v103 = 1, select("#", ...) do
        local v104 = select(v103, ...);
        if typeof(v104) == "Instance" then
            v102:Add(v100(v101, v104, true), "Disconnect");
        end;
    end;
    return v102;
end;
v3.__tostring = function(_) --[[ Line: 995 ]] --[[ Name: __tostring ]]
    return "Janitor";
end;
return v3;