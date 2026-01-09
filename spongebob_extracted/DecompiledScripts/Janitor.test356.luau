_G.__IS_UNIT_TESTING__ = true;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Workspace_0 = game:GetService("Workspace");
local v2 = require(script.Parent.Parent.Parent.DevPackages.JestGlobals);
local v3 = require(script.Parent.Parent);
local v4 = require(script.Parent.Parent.Promise);
local l_describe_0 = v2.describe;
local l_expect_0 = v2.expect;
local l_it_0 = v2.it;
local v10 = (function() --[[ Line: 17 ]]
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v9 = false;
    l_BindableEvent_0.Event:Once(function() --[[ Line: 20 ]]
        -- upvalues: v9 (ref)
        v9 = true;
    end);
    l_BindableEvent_0:Fire();
    l_BindableEvent_0:Destroy();
    return not v9;
end)();
local function v15(v11, v12) --[[ Line: 28 ]] --[[ Name: AwaitCondition ]]
    local v13 = v12 or 10;
    local v14 = os.clock();
    while true do
        if v11() then
            return true;
        elseif v13 < os.clock() - v14 then
            return false;
        else
            task.wait();
        end;
    end;
end;
local v16 = {
    ClassName = "BasicClass"
};
v16.__index = v16;
v16.new = function() --[[ Line: 57 ]] --[[ Name: new ]]
    -- upvalues: v16 (copy)
    return (setmetatable({
        CleanupFunction = nil
    }, v16));
end;
v16.AddCleanupFunction = function(v17, v18) --[[ Line: 62 ]] --[[ Name: AddCleanupFunction ]]
    v17.CleanupFunction = v18;
    return v17;
end;
v16.Destroy = function(v19) --[[ Line: 66 ]] --[[ Name: Destroy ]]
    local l_CleanupFunction_0 = v19.CleanupFunction;
    if l_CleanupFunction_0 then
        l_CleanupFunction_0();
    end;
    table.clear(v19);
    setmetatable(v19, nil);
end;
local function v21() --[[ Line: 75 ]] --[[ Name: NoOperation ]]

end;
l_describe_0("Janitor.Is", function() --[[ Line: 77 ]]
    -- upvalues: l_it_0 (copy), v3 (copy), l_expect_0 (copy), v21 (copy), v16 (copy)
    l_it_0("should return true iff the passed value is a Janitor", function() --[[ Line: 78 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref)
        local v22 = v3.new();
        l_expect_0(v3.Is(v22)).toBe(true);
        v22:Destroy();
    end);
    l_it_0("should return false iff the passed value is anything else", function() --[[ Line: 84 ]]
        -- upvalues: l_expect_0 (ref), v3 (ref), v21 (ref), v16 (ref)
        l_expect_0(v3.Is(v21)).toBe(false);
        l_expect_0(v3.Is({})).toBe(false);
        l_expect_0(v3.Is(v16.new())).toBe(false);
    end);
end);
l_describe_0("Janitor.new", function() --[[ Line: 91 ]]
    -- upvalues: l_it_0 (copy), v3 (copy), l_expect_0 (copy)
    l_it_0("should create a new Janitor", function() --[[ Line: 92 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref)
        local v23 = v3.new();
        l_expect_0(v23).toBeDefined();
        l_expect_0(v3.Is(v23)).toBe(true);
        v23:Destroy();
    end);
end);
l_describe_0("Janitor.Add", function() --[[ Line: 100 ]]
    -- upvalues: l_it_0 (copy), v3 (copy), l_expect_0 (copy), v21 (copy), l_ReplicatedStorage_0 (copy), v16 (copy), v10 (copy)
    l_it_0("should add things", function() --[[ Line: 101 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref), v21 (ref)
        local v24 = v3.new();
        l_expect_0(function() --[[ Line: 103 ]]
            -- upvalues: v24 (copy), v21 (ref)
            v24:Add(v21, true);
        end).never.toThrow();
        v24:Destroy();
    end);
    l_it_0("should add things with the given index", function() --[[ Line: 110 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref), v21 (ref)
        local v25 = v3.new();
        l_expect_0(function() --[[ Line: 112 ]]
            -- upvalues: v25 (copy), v21 (ref)
            v25:Add(v21, true, "Function");
        end).never.toThrow();
        l_expect_0(v25:Get("Function")).toEqual(l_expect_0.any("function"));
        v25:Destroy();
    end);
    l_it_0("should overwrite indexes", function() --[[ Line: 120 ]]
        -- upvalues: v3 (ref), v21 (ref), l_expect_0 (ref)
        local v26 = v3.new();
        local v27 = false;
        v26:Add(function() --[[ Line: 123 ]]
            -- upvalues: v27 (ref)
            v27 = true;
        end, true, "Function");
        v26:Add(v21, true, "Function");
        l_expect_0(v27).toBe(true);
        v26:Destroy();
    end);
    l_it_0("should return the passed object", function() --[[ Line: 133 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref)
        local v28 = v3.new();
        local v29 = v28:Add(Instance.new("Part"), "Destroy");
        l_expect_0(v29).toBeDefined();
        l_expect_0(v29).toEqual(l_expect_0.any("Instance"));
        l_expect_0(v29.ClassName).toBe("Part");
        v28:Destroy();
    end);
    l_it_0("should clean up instances, objects, functions, connections, and threads", function() --[[ Line: 143 ]]
        -- upvalues: v3 (ref), l_ReplicatedStorage_0 (ref), v21 (ref), v16 (ref), l_expect_0 (ref)
        local v30 = false;
        local v31 = false;
        local v32 = false;
        local v33 = false;
        local v34 = v3.new();
        local v35 = v34:Add(Instance.new("Part"), "Destroy");
        v35.Parent = l_ReplicatedStorage_0;
        local v36 = v34:Add(v35.ChildRemoved:Connect(v21), "Disconnect");
        v34:Add(function() --[[ Line: 155 ]]
            -- upvalues: v30 (ref)
            v30 = true;
        end, true);
        v34:Add(v3.new(), "Destroy"):Add(function() --[[ Line: 159 ]]
            -- upvalues: v31 (ref)
            v31 = true;
        end, true);
        v34:Add(v16.new(), "Destroy"):AddCleanupFunction(function() --[[ Line: 163 ]]
            -- upvalues: v32 (ref)
            v32 = true;
        end);
        v34:Add(task.delay(1, function() --[[ Line: 167 ]]
            -- upvalues: v33 (ref)
            v33 = true;
        end), true);
        v34:Destroy();
        l_expect_0(v35.Parent).toBeUndefined();
        l_expect_0(v36.Connected).toBe(false);
        l_expect_0(v30).toBe(true);
        l_expect_0(v31).toBe(true);
        l_expect_0(v32).toBe(true);
        l_expect_0(v33).toBe(false);
    end);
    l_it_0("should clean up everything correctly", function() --[[ Line: 180 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref)
        local v37 = v3.new();
        local v38 = 0;
        for v39 = 1, 5000 do
            v37:Add(function() --[[ Line: 186 ]]
                -- upvalues: v38 (ref)
                v38 = v38 + 1;
            end, true, v39);
        end;
        for v40 = 5000, 1, -1 do
            v37:Remove(v40);
        end;
        v37:Destroy();
        l_expect_0(v38).toBe(5000);
    end);
    l_it_0("should infer types if not given", function() --[[ Line: 199 ]]
        -- upvalues: v3 (ref), l_ReplicatedStorage_0 (ref), v21 (ref), v10 (ref), l_expect_0 (ref)
        local v41 = v3.new();
        local v42 = v41:Add(l_ReplicatedStorage_0.AncestryChanged:Connect(v21));
        v41:Destroy();
        if v10 then
            task.wait();
        end;
        l_expect_0(v42.Connected).toBe(false);
    end);
end);
l_describe_0("Janitor.AddPromise", function() --[[ Line: 211 ]]
    -- upvalues: v4 (copy), l_it_0 (copy), v3 (copy), l_expect_0 (copy), v16 (copy)
    if not v4 then
        return;
    else
        l_it_0("should add a Promise", function() --[[ Line: 216 ]]
            -- upvalues: v3 (ref), v4 (ref), l_expect_0 (ref)
            local v43 = v3.new();
            local v44 = v43:AddPromise(v4.delay(60));
            l_expect_0(v4.is(v44)).toBe(true);
            v43:Destroy();
        end);
        l_it_0("should cancel the Promise when destroyed", function() --[[ Line: 224 ]]
            -- upvalues: v3 (ref), v4 (ref), l_expect_0 (ref)
            local v45 = v3.new();
            local v46 = false;
            v45:AddPromise(v4.new(function(v47, _, v49) --[[ Line: 228 ]]
                -- upvalues: v46 (ref), v4 (ref)
                if v49(function() --[[ Line: 229 ]]
                    -- upvalues: v46 (ref)
                    v46 = true;
                end) then
                    return;
                else
                    return v4.delay(60):andThen(v47);
                end;
            end));
            v45:Destroy();
            l_expect_0(v46).toBe(true);
        end);
        l_it_0("should not remove any values from the return", function() --[[ Line: 242 ]]
            -- upvalues: v3 (ref), v4 (ref), l_expect_0 (ref)
            local v50 = v3.new();
            local _, v53 = v50:AddPromise(v4.new(function(v51) --[[ Line: 245 ]]
                v51(true);
            end)):await();
            l_expect_0(v53).toBe(true);
            v50:Destroy();
        end);
        l_it_0("should throw if the passed value isn't a Promise", function() --[[ Line: 254 ]]
            -- upvalues: v3 (ref), l_expect_0 (ref), v16 (ref)
            local v54 = v3.new();
            l_expect_0(function() --[[ Line: 256 ]]
                -- upvalues: v54 (copy), v16 (ref)
                v54:AddPromise((v16.new()));
            end).toThrow();
            v54:Destroy();
        end);
        return;
    end;
end);
l_describe_0("Janitor.Remove", function() --[[ Line: 264 ]]
    -- upvalues: l_it_0 (copy), v3 (copy), v21 (copy), l_expect_0 (copy), v15 (copy), v16 (copy)
    l_it_0("should always return the Janitor", function() --[[ Line: 265 ]]
        -- upvalues: v3 (ref), v21 (ref), l_expect_0 (ref)
        local v55 = v3.new();
        v55:Add(v21, true, "Function");
        l_expect_0(v55:Remove("Function")).toBe(v55);
        l_expect_0(v55:Remove("Function")).toBe(v55);
        v55:Destroy();
    end);
    l_it_0("should always remove the value", function() --[[ Line: 274 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref), v15 (ref)
        local v56 = v3.new();
        local v57 = false;
        v56:Add(function() --[[ Line: 278 ]]
            -- upvalues: v57 (ref)
            v57 = true;
        end, true, "Function");
        v56:Remove("Function");
        l_expect_0(v15(function() --[[ Line: 284 ]]
            -- upvalues: v57 (ref)
            return v57;
        end, 1)).toBe(true);
        v56:Destroy();
    end);
    l_it_0("should properly remove values that are already destroyed", function() --[[ Line: 290 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref)
        local v58 = v3.new();
        local v59 = 0;
        local v60 = v3.new();
        v60:Add(function() --[[ Line: 296 ]]
            -- upvalues: v59 (ref)
            v59 = v59 + 1;
        end, true);
        v58:Add(v60, "Destroy");
        v60:Destroy();
        l_expect_0(function() --[[ Line: 302 ]]
            -- upvalues: v58 (copy)
            v58:Destroy();
        end).never.toThrow();
        l_expect_0(v59).toBe(1);
    end);
    l_it_0("should clean up everything efficiently", function() --[[ Line: 309 ]]
        -- upvalues: v3 (ref), v21 (ref), v16 (ref)
        local v61 = v3.new();
        local v62 = 0;
        for _ = 1, 1000000 do
            v62 = v62 + 1;
            v61:Add(v21, true, v62);
        end;
        for _ = 1, 200000 do
            v62 = v62 + 1;
            v61:Add(task.delay(5, v21), true, v62);
        end;
        for _ = 1, 1000000 do
            v62 = v62 + 1;
            v61:Add(v16.new(), "Destroy", v62);
        end;
        for _ = 1, 100000 do
            v62 = v62 + 1;
            v61:Add(Instance.new("Part"), "Destroy", v62);
        end;
        for v67 = 1, v62 do
            v61:Remove(v67);
        end;
        v61:Destroy();
    end);
end);
l_describe_0("Janitor.RemoveList", function() --[[ Line: 343 ]]
    -- upvalues: l_it_0 (copy), v3 (copy), v21 (copy), l_expect_0 (copy)
    l_it_0("should always return the Janitor", function() --[[ Line: 344 ]]
        -- upvalues: v3 (ref), v21 (ref), l_expect_0 (ref)
        local v68 = v3.new();
        v68:Add(v21, true, "Function");
        l_expect_0(v68:RemoveList("Function")).toBe(v68);
        l_expect_0(v68:RemoveList("Function")).toBe(v68);
        v68:Destroy();
    end);
    l_it_0("should always remove the value", function() --[[ Line: 353 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref)
        local v69 = v3.new();
        local v70 = false;
        v69:Add(function() --[[ Line: 357 ]]
            -- upvalues: v70 (ref)
            v70 = true;
        end, true, "Function");
        v69:RemoveList("Function");
        l_expect_0(v70).toBe(true);
        v69:Destroy();
    end);
    l_it_0("should properly remove multiple values", function() --[[ Line: 367 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref)
        local v71 = v3.new();
        local v72 = false;
        local v73 = false;
        local v74 = false;
        v71:Add(function() --[[ Line: 373 ]]
            -- upvalues: v72 (ref)
            v72 = true;
        end, true, 1);
        v71:Add(function() --[[ Line: 377 ]]
            -- upvalues: v73 (ref)
            v73 = true;
        end, true, 2);
        v71:Add(function() --[[ Line: 381 ]]
            -- upvalues: v74 (ref)
            v74 = true;
        end, true, 3);
        v71:RemoveList(1, 2, 3);
        l_expect_0(v72).toBe(true);
        l_expect_0(v73).toBe(true);
        l_expect_0(v74).toBe(true);
    end);
end);
l_describe_0("Janitor.Get", function() --[[ Line: 392 ]]
    -- upvalues: l_it_0 (copy), v3 (copy), v21 (copy), l_expect_0 (copy)
    l_it_0("should return the value iff it exists", function() --[[ Line: 393 ]]
        -- upvalues: v3 (ref), v21 (ref), l_expect_0 (ref)
        local v75 = v3.new();
        v75:Add(v21, true, "Function");
        l_expect_0(v75:Get("Function")).toBe(v21);
        v75:Destroy();
    end);
    l_it_0("should return void iff the value doesn't exist", function() --[[ Line: 400 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref)
        local v76 = v3.new();
        l_expect_0(v76:Get("Function")).toBeUndefined();
        v76:Destroy();
    end);
end);
l_describe_0("Janitor.Cleanup", function() --[[ Line: 407 ]]
    -- upvalues: l_it_0 (copy), v3 (copy), l_expect_0 (copy), v15 (copy)
    l_it_0("should cleanup everything", function() --[[ Line: 408 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref)
        local v77 = v3.new();
        local v78 = 0;
        for _ = 1, 500 do
            v77:Add(function() --[[ Line: 414 ]]
                -- upvalues: v78 (ref)
                v78 = v78 + 1;
            end, true);
        end;
        v77:Cleanup();
        l_expect_0(v78).toBe(500);
        for _ = 1, 500 do
            v77:Add(function() --[[ Line: 423 ]]
                -- upvalues: v78 (ref)
                v78 = v78 + 1;
            end, true);
        end;
        v77:Cleanup();
        l_expect_0(v78).toBe(1000);
    end);
    l_it_0("should be unique", function() --[[ Line: 432 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref), v15 (ref)
        local v81 = v3.new();
        local v82 = v3.new();
        local v83 = 0;
        l_expect_0(v81.CurrentlyCleaning).toBe(false);
        l_expect_0(v82.CurrentlyCleaning).toBe(false);
        local v84 = false;
        for v85 = 1, 500 do
            if v85 == 500 then
                v81:Add(function() --[[ Line: 445 ]]
                    -- upvalues: v83 (ref), v84 (ref)
                    v83 = v83 + 1;
                    task.wait(1);
                    v84 = true;
                end, true);
            else
                v81:Add(function() --[[ Line: 451 ]]
                    -- upvalues: v83 (ref)
                    v83 = v83 + 1;
                end, true);
            end;
        end;
        task.spawn(function() --[[ Line: 457 ]]
            -- upvalues: v81 (copy)
            v81:Cleanup();
        end);
        task.wait();
        l_expect_0(v81.CurrentlyCleaning).toBe(true);
        l_expect_0(v82.CurrentlyCleaning).toBe(false);
        l_expect_0(v15(function() --[[ Line: 465 ]]
            -- upvalues: v84 (ref)
            return v84;
        end, 5)).toBe(true);
        l_expect_0(v83).toBe(500);
    end);
end);
l_describe_0("Janitor.Destroy", function() --[[ Line: 472 ]]
    -- upvalues: l_it_0 (copy), v3 (copy), l_expect_0 (copy), v21 (copy)
    l_it_0("should cleanup everything", function() --[[ Line: 473 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref)
        local v86 = v3.new();
        local v87 = 0;
        for _ = 1, 500 do
            v86:Add(function() --[[ Line: 479 ]]
                -- upvalues: v87 (ref)
                v87 = v87 + 1;
            end, true);
        end;
        v86:Destroy();
        l_expect_0(v87).toBe(500);
    end);
    l_it_0("should render the Janitor unusable", function() --[[ Line: 488 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref), v21 (ref)
        local v89 = v3.new();
        v89:Destroy();
        l_expect_0(function() --[[ Line: 491 ]]
            -- upvalues: v89 (copy), v21 (ref)
            v89:Add(v21, true);
        end).toBeTruthy();
    end);
end);
l_describe_0("Janitor.LinkToInstance", function() --[[ Line: 497 ]]
    -- upvalues: l_it_0 (copy), v3 (copy), l_ReplicatedStorage_0 (copy), l_expect_0 (copy), l_Workspace_0 (copy), v15 (copy), v21 (copy)
    l_it_0("should link to an Instance", function() --[[ Line: 498 ]]
        -- upvalues: v3 (ref), l_ReplicatedStorage_0 (ref), l_expect_0 (ref)
        local v90 = v3.new();
        local v91 = v90:Add(Instance.new("Part"), "Destroy");
        v91.Parent = l_ReplicatedStorage_0;
        l_expect_0(function() --[[ Line: 503 ]]
            -- upvalues: v90 (copy), v91 (copy)
            v90:LinkToInstance(v91);
        end).never.toThrow();
        v90:Destroy();
    end);
    l_it_0("should cleanup once the Instance is destroyed", function() --[[ Line: 510 ]]
        -- upvalues: v3 (ref), l_Workspace_0 (ref), l_expect_0 (ref)
        local v92 = v3.new();
        local v93 = false;
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Parent = l_Workspace_0;
        v92:Add(function() --[[ Line: 517 ]]
            -- upvalues: v93 (ref)
            v93 = true;
        end, true);
        v92:LinkToInstance(l_Part_0);
        l_Part_0:Destroy();
        task.wait(0.1);
        l_expect_0(v93).toBe(true);
        v92:Destroy();
    end);
    l_it_0("should work if the Instance is parented to nil when started", function() --[[ Line: 530 ]]
        -- upvalues: v3 (ref), l_Workspace_0 (ref), l_expect_0 (ref), v15 (ref)
        local v95 = v3.new();
        local v96 = false;
        local l_Part_1 = Instance.new("Part");
        v95:Add(function() --[[ Line: 535 ]]
            -- upvalues: v96 (ref)
            v96 = true;
        end, true);
        v95:LinkToInstance(l_Part_1);
        l_Part_1.Parent = l_Workspace_0;
        l_Part_1:Destroy();
        l_expect_0(v15(function() --[[ Line: 543 ]]
            -- upvalues: v96 (ref)
            return v96;
        end, 1)).toBe(true);
        v95:Destroy();
    end);
    l_it_0("should work if the Instance is parented to nil", function() --[[ Line: 549 ]]
        -- upvalues: v3 (ref), l_expect_0 (ref), v15 (ref)
        local v98 = v3.new();
        local v99 = false;
        local l_Part_2 = Instance.new("Part");
        v98:Add(function() --[[ Line: 554 ]]
            -- upvalues: v99 (ref)
            v99 = true;
        end, true);
        v98:LinkToInstance(l_Part_2);
        l_Part_2:Destroy();
        l_expect_0(v15(function() --[[ Line: 561 ]]
            -- upvalues: v99 (ref)
            return v99;
        end, 1)).toBe(true);
        v98:Destroy();
    end);
    l_it_0("shouldn't run if the Instance is removed or parented to nil", function() --[[ Line: 567 ]]
        -- upvalues: v3 (ref), l_ReplicatedStorage_0 (ref), v21 (ref), l_expect_0 (ref)
        local v101 = v3.new();
        local l_Part_3 = Instance.new("Part");
        l_Part_3.Parent = l_ReplicatedStorage_0;
        v101:Add(v21, true, "Function");
        v101:LinkToInstance(l_Part_3);
        l_Part_3.Parent = nil;
        l_expect_0(v101:Get("Function")).toBe(v21);
        l_Part_3.Parent = l_ReplicatedStorage_0;
        l_expect_0(v101:Get("Function")).toBe(v21);
        l_Part_3:Destroy();
        task.wait(0.1);
        l_expect_0(function() --[[ Line: 582 ]]
            -- upvalues: v101 (copy)
            v101:Destroy();
        end).never.toThrow();
    end);
end);
return false;