local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Promise);
local v2 = {
    Error = {
        Unparented = "Unparented", 
        ParentChanged = "ParentChanged"
    }
};
local function v7(v3, v4) --[[ Line: 40 ]] --[[ Name: PromiseWatchAncestry ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.race({
        v4, 
        v1.fromEvent(v3.AncestryChanged, function(_, v6) --[[ Line: 43 ]]
            return v6 == nil;
        end):andThen(function() --[[ Line: 45 ]]
            -- upvalues: v1 (ref), v2 (ref)
            return v1.reject(v2.Error.Unparented);
        end)
    });
end;
v2.Child = function(v8, v9, v10) --[[ Line: 61 ]] --[[ Name: Child ]]
    -- upvalues: v1 (copy), v7 (copy)
    local l_v8_FirstChild_0 = v8:FindFirstChild(v9);
    if l_v8_FirstChild_0 then
        return v1.resolve(l_v8_FirstChild_0);
    else
        return v7(v8, v1.fromEvent(v8.ChildAdded, function(v12) --[[ Line: 68 ]]
            -- upvalues: v9 (copy)
            return v12.Name == v9;
        end):timeout(v10 or 60));
    end;
end;
v2.Children = function(v13, v14, v15) --[[ Line: 92 ]] --[[ Name: Children ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v16 = table.create(#v14);
    for v17, v18 in ipairs(v14) do
        v16[v17] = v2.Child(v13, v18, v15);
    end;
    return v1.all(v16):andThen(function(v19) --[[ Line: 97 ]]
        -- upvalues: v13 (copy), v1 (ref), v2 (ref)
        for _, v21 in ipairs(v19) do
            if v21.Parent ~= v13 then
                return v1.reject(v2.Error.ParentChanged);
            end;
        end;
        return v19;
    end);
end;
v2.Descendant = function(v22, v23, v24) --[[ Line: 120 ]] --[[ Name: Descendant ]]
    -- upvalues: v1 (copy), v7 (copy)
    local l_v22_FirstChild_0 = v22:FindFirstChild(v23, true);
    if l_v22_FirstChild_0 then
        return v1.resolve(l_v22_FirstChild_0);
    else
        return v7(v22, v1.fromEvent(v22.DescendantAdded, function(v26) --[[ Line: 127 ]]
            -- upvalues: v23 (copy)
            return v26.Name == v23;
        end):timeout(v24 or 60));
    end;
end;
v2.Descendants = function(v27, v28, v29) --[[ Line: 151 ]] --[[ Name: Descendants ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v30 = table.create(#v28);
    for v31, v32 in ipairs(v28) do
        v30[v31] = v2.Descendant(v27, v32, v29);
    end;
    return v1.all(v30):andThen(function(v33) --[[ Line: 156 ]]
        -- upvalues: v27 (copy), v1 (ref), v2 (ref)
        for _, v35 in ipairs(v33) do
            if not v35:IsDescendantOf(v27) then
                return v1.reject(v2.Error.ParentChanged);
            end;
        end;
        return v33;
    end);
end;
v2.PrimaryPart = function(v36, v37) --[[ Line: 177 ]] --[[ Name: PrimaryPart ]]
    -- upvalues: v1 (copy), v7 (copy)
    local l_PrimaryPart_0 = v36.PrimaryPart;
    if l_PrimaryPart_0 then
        return v1.resolve(l_PrimaryPart_0);
    else
        return v7(v36, v1.fromEvent(v36:GetPropertyChangedSignal("PrimaryPart"), function() --[[ Line: 184 ]]
            -- upvalues: l_PrimaryPart_0 (ref), v36 (copy)
            l_PrimaryPart_0 = v36.PrimaryPart;
            return l_PrimaryPart_0 ~= nil;
        end):andThen(function() --[[ Line: 188 ]]
            -- upvalues: l_PrimaryPart_0 (ref)
            return l_PrimaryPart_0;
        end):timeout(v37 or 60));
    end;
end;
v2.ObjectValue = function(v39, v40) --[[ Line: 205 ]] --[[ Name: ObjectValue ]]
    -- upvalues: v1 (copy), v7 (copy)
    local l_Value_0 = v39.Value;
    if l_Value_0 then
        return v1.resolve(l_Value_0);
    else
        return v7(v39, v1.fromEvent(v39.Changed, function(v42) --[[ Line: 212 ]]
            -- upvalues: l_Value_0 (ref)
            l_Value_0 = v42;
            return l_Value_0 ~= nil;
        end):andThen(function() --[[ Line: 216 ]]
            -- upvalues: l_Value_0 (ref)
            return l_Value_0;
        end):timeout(v40 or 60));
    end;
end;
v2.Custom = function(v43, v44) --[[ Line: 235 ]] --[[ Name: Custom ]]
    -- upvalues: v1 (copy), l_RunService_0 (copy)
    local v45 = v43();
    if v45 ~= nil then
        return v1.resolve(v45);
    else
        return v1.new(function(v46, _, v48) --[[ Line: 240 ]]
            -- upvalues: v43 (copy), l_RunService_0 (ref)
            local v49 = nil;
            local function v50() --[[ Line: 242 ]] --[[ Name: OnDone ]]
                -- upvalues: v49 (ref)
                v49:Disconnect();
            end;
            local function v52() --[[ Line: 245 ]] --[[ Name: Update ]]
                -- upvalues: v43 (ref), v49 (ref), v46 (copy)
                local v51 = v43();
                if v51 ~= nil then
                    v49:Disconnect();
                    v46(v51);
                end;
            end;
            v49 = l_RunService_0.Heartbeat:Connect(v52);
            v48(v50);
        end):timeout(v44 or 60);
    end;
end;
return v2;