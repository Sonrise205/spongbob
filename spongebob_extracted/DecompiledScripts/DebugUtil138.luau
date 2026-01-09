local l_RunService_0 = game:GetService("RunService");
local l_Fusion_v0_3_0_0 = require(script.Parent.Parent:FindFirstChild("Fusion_v0_3_0"));
local l_peek_0 = l_Fusion_v0_3_0_0.peek;
local v3 = l_Fusion_v0_3_0_0:scoped();
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("[RAILUTIL DEBUG CONTROL]");
if not l_l_ReplicatedStorage_0_FirstChild_0 and l_RunService_0:IsServer() then
    l_l_ReplicatedStorage_0_FirstChild_0 = Instance.new("Configuration");
    l_l_ReplicatedStorage_0_FirstChild_0.Name = "[RAILUTIL DEBUG CONTROL]";
    l_l_ReplicatedStorage_0_FirstChild_0.Parent = l_ReplicatedStorage_0;
end;
local v6 = {};
local function _(v7) --[[ Line: 41 ]] --[[ Name: upsertFlagState ]]
    -- upvalues: v6 (copy), v3 (copy), l_l_ReplicatedStorage_0_FirstChild_0 (ref), l_ReplicatedStorage_0 (copy), l_peek_0 (copy), l_Fusion_v0_3_0_0 (copy)
    if not v6[v7] then
        local v8 = v3:Value(false);
        v6[v7] = v8;
        task.defer(function() --[[ Line: 46 ]]
            -- upvalues: l_l_ReplicatedStorage_0_FirstChild_0 (ref), l_ReplicatedStorage_0 (ref), v7 (copy), l_peek_0 (ref), v8 (copy), v3 (ref), l_Fusion_v0_3_0_0 (ref)
            local v9 = l_l_ReplicatedStorage_0_FirstChild_0 or l_ReplicatedStorage_0:WaitForChild("[RAILUTIL DEBUG CONTROL]");
            if v9:GetAttribute(v7) == nil then
                v9:SetAttribute(v7, l_peek_0(v8));
            else
                v8:set(v9:GetAttribute(v7));
            end;
            v3:Hydrate(v9)({
                [l_Fusion_v0_3_0_0.Attribute(v7)] = v8, 
                [l_Fusion_v0_3_0_0.AttributeOut(v7)] = v8
            });
        end);
    end;
    return v6[v7];
end;
local v40 = {
    measureAvgRuntime = function(v11, v12, ...) --[[ Line: 70 ]] --[[ Name: measureAvgRuntime ]]
        local v13 = v12 or 1000;
        local v14 = 0;
        for _ = 1, v13 do
            local v16 = os.clock();
            v11(...);
            v14 = v14 + (os.clock() - v16);
        end;
        return v14 / v13;
    end, 
    getDebugFlag = function(v17, v18) --[[ Line: 90 ]] --[[ Name: getDebugFlag ]]
        -- upvalues: v6 (copy), v3 (copy), l_l_ReplicatedStorage_0_FirstChild_0 (ref), l_ReplicatedStorage_0 (copy), l_peek_0 (copy), l_Fusion_v0_3_0_0 (copy)
        if not v6[v17] then
            local v19 = v3:Value(false);
            v6[v17] = v19;
            task.defer(function() --[[ Line: 46 ]]
                -- upvalues: l_l_ReplicatedStorage_0_FirstChild_0 (ref), l_ReplicatedStorage_0 (ref), v17 (copy), l_peek_0 (ref), v19 (copy), v3 (ref), l_Fusion_v0_3_0_0 (ref)
                local v20 = l_l_ReplicatedStorage_0_FirstChild_0 or l_ReplicatedStorage_0:WaitForChild("[RAILUTIL DEBUG CONTROL]");
                if v20:GetAttribute(v17) == nil then
                    v20:SetAttribute(v17, l_peek_0(v19));
                else
                    v19:set(v20:GetAttribute(v17));
                end;
                v3:Hydrate(v20)({
                    [l_Fusion_v0_3_0_0.Attribute(v17)] = v19, 
                    [l_Fusion_v0_3_0_0.AttributeOut(v17)] = v19
                });
            end);
        end;
        local v21 = v6[v17];
        if v18 then
            return v21;
        else
            return (l_Fusion_v0_3_0_0.peek(v21));
        end;
    end, 
    toggleDebugFlag = function(v22) --[[ Line: 101 ]] --[[ Name: toggleDebugFlag ]]
        -- upvalues: v6 (copy), v3 (copy), l_l_ReplicatedStorage_0_FirstChild_0 (ref), l_ReplicatedStorage_0 (copy), l_peek_0 (copy), l_Fusion_v0_3_0_0 (copy)
        if not v6[v22] then
            local v23 = v3:Value(false);
            v6[v22] = v23;
            task.defer(function() --[[ Line: 46 ]]
                -- upvalues: l_l_ReplicatedStorage_0_FirstChild_0 (ref), l_ReplicatedStorage_0 (ref), v22 (copy), l_peek_0 (ref), v23 (copy), v3 (ref), l_Fusion_v0_3_0_0 (ref)
                local v24 = l_l_ReplicatedStorage_0_FirstChild_0 or l_ReplicatedStorage_0:WaitForChild("[RAILUTIL DEBUG CONTROL]");
                if v24:GetAttribute(v22) == nil then
                    v24:SetAttribute(v22, l_peek_0(v23));
                else
                    v23:set(v24:GetAttribute(v22));
                end;
                v3:Hydrate(v24)({
                    [l_Fusion_v0_3_0_0.Attribute(v22)] = v23, 
                    [l_Fusion_v0_3_0_0.AttributeOut(v22)] = v23
                });
            end);
        end;
        local v25 = v6[v22];
        v25:set(not l_peek_0(v25));
        return l_peek_0(v25);
    end, 
    setDebugFlag = function(v26, v27) --[[ Line: 114 ]] --[[ Name: setDebugFlag ]]
        -- upvalues: v6 (copy), v3 (copy), l_l_ReplicatedStorage_0_FirstChild_0 (ref), l_ReplicatedStorage_0 (copy), l_peek_0 (copy), l_Fusion_v0_3_0_0 (copy)
        assert(typeof(v27) == "boolean", "Value must be a boolean");
        if not v6[v26] then
            local v28 = v3:Value(false);
            v6[v26] = v28;
            task.defer(function() --[[ Line: 46 ]]
                -- upvalues: l_l_ReplicatedStorage_0_FirstChild_0 (ref), l_ReplicatedStorage_0 (ref), v26 (copy), l_peek_0 (ref), v28 (copy), v3 (ref), l_Fusion_v0_3_0_0 (ref)
                local v29 = l_l_ReplicatedStorage_0_FirstChild_0 or l_ReplicatedStorage_0:WaitForChild("[RAILUTIL DEBUG CONTROL]");
                if v29:GetAttribute(v26) == nil then
                    v29:SetAttribute(v26, l_peek_0(v28));
                else
                    v28:set(v29:GetAttribute(v26));
                end;
                v3:Hydrate(v29)({
                    [l_Fusion_v0_3_0_0.Attribute(v26)] = v28, 
                    [l_Fusion_v0_3_0_0.AttributeOut(v26)] = v28
                });
            end);
        end;
        local v30 = v6[v26];
        v30:set(v27);
        return v30;
    end, 
    observeDebugFlag = function(v31, v32, v33) --[[ Line: 129 ]] --[[ Name: observeDebugFlag ]]
        -- upvalues: v6 (copy), v3 (copy), l_l_ReplicatedStorage_0_FirstChild_0 (ref), l_ReplicatedStorage_0 (copy), l_peek_0 (copy), l_Fusion_v0_3_0_0 (copy)
        if not v6[v31] then
            local v34 = v3:Value(false);
            v6[v31] = v34;
            local l_v34_0 = v34 --[[ copy: 4 -> 6 ]];
            task.defer(function() --[[ Line: 46 ]]
                -- upvalues: l_l_ReplicatedStorage_0_FirstChild_0 (ref), l_ReplicatedStorage_0 (ref), v31 (copy), l_peek_0 (ref), l_v34_0 (copy), v3 (ref), l_Fusion_v0_3_0_0 (ref)
                local v36 = l_l_ReplicatedStorage_0_FirstChild_0 or l_ReplicatedStorage_0:WaitForChild("[RAILUTIL DEBUG CONTROL]");
                if v36:GetAttribute(v31) == nil then
                    v36:SetAttribute(v31, l_peek_0(l_v34_0));
                else
                    l_v34_0:set(v36:GetAttribute(v31));
                end;
                v3:Hydrate(v36)({
                    [l_Fusion_v0_3_0_0.Attribute(v31)] = l_v34_0, 
                    [l_Fusion_v0_3_0_0.AttributeOut(v31)] = l_v34_0
                });
            end);
        end;
        local v37 = v6[v31];
        local v38 = v3:Observer(v37);
        local function v39() --[[ Line: 132 ]]
            -- upvalues: v32 (copy), l_peek_0 (ref), v37 (copy)
            v32(l_peek_0(v37));
        end;
        if v33 then
            return v38:onChange(v39);
        else
            return v38:onBind(v39);
        end;
    end, 
    setup = function() --[[ Line: 144 ]] --[[ Name: setup ]]

    end
};
return table.freeze(v40);