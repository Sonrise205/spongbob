local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Symbol);
local v2 = require(l_Parent_0.RailUtil);
local v3 = require(l_Parent_0.Fusion);
local v4 = v1("PropertyConnections");
local v5 = v1("PropertyValues");
local v6 = v1("PropertyFusionScope");
local function v11(v7, v8, v9) --[[ Line: 53 ]] --[[ Name: ObserveProperty ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v10 = v7.Instance:GetPropertyChangedSignal(v8):Connect(function() --[[ Line: 55 ]]
        -- upvalues: v9 (copy), v7 (copy), v8 (copy)
        v9(v7.Instance[v8]);
    end);
    table.insert(v7[v4], v10);
    task.spawn(v9, v7.Instance[v8]);
    return function() --[[ Line: 60 ]]
        -- upvalues: v10 (copy), v2 (ref), v7 (copy), v4 (ref)
        if not v10.Connected then
            return;
        else
            v2.Table.SwapRemoveFirstValue(v7[v4], v10);
            v10:Disconnect();
            return;
        end;
    end;
end;
local v22 = {
    OutProperty = function(v12, v13) --[[ Line: 80 ]] --[[ Name: OutProperty ]]
        -- upvalues: v5 (copy), v3 (copy), v6 (copy), v11 (copy), v4 (copy)
        if not v12[v5][v13] then
            local v14 = v3.Value(v12[v6], v12.Instance[v13]);
            v11(v12, v13, function(v15) --[[ Line: 84 ]]
                -- upvalues: v14 (copy)
                v14:set(v15);
            end);
            table.insert(v12[v4], v3.Observer(v12[v6], v14):onChange(function() --[[ Line: 88 ]]
                -- upvalues: v12 (copy), v13 (copy), v3 (ref), v14 (copy)
                v12.Instance[v13] = v3.peek(v14);
            end));
            v12[v5][v13] = v14;
        end;
        return v12[v5][v13];
    end, 
    ObserveProperty = v11, 
    PropertyChanged = function(v16, v17, v18, v19) --[[ Line: 110 ]] --[[ Name: PropertyChanged ]]
        -- upvalues: v4 (copy)
        local l_PropertyChangedSignal_0 = v16.Instance:GetPropertyChangedSignal(v17);
        if v18 then
            local v21 = nil;
            v21 = if v19 then l_PropertyChangedSignal_0:Once(v18) else l_PropertyChangedSignal_0:Connect(v18);
            table.insert(v16[v4], v21);
            return v21;
        else
            return l_PropertyChangedSignal_0;
        end;
    end
};
return {
    ClassName = "ComponentPropertyUtil", 
    Methods = v22, 
    Constructing = function(v23) --[[ Line: 145 ]] --[[ Name: Constructing ]]
        -- upvalues: v4 (copy), v5 (copy), v6 (copy), v3 (copy)
        v23[v4] = {};
        v23[v5] = {};
        v23[v6] = v3.scoped();
    end, 
    Stopped = function(v24) --[[ Line: 156 ]] --[[ Name: Stopped ]]
        -- upvalues: v4 (copy), v3 (copy), v6 (copy), v5 (copy)
        for _, v26 in v24[v4] do
            if typeof(v26) == "function" then
                v26();
            elseif v26.Connected then
                v26:Disconnect();
            end;
        end;
        v3.doCleanup(v24[v6]);
        v24[v5] = nil;
        v24[v4] = nil;
        v24[v6] = nil;
    end
};