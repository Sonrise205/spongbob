local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Fusion);
local v2 = require(l_Parent_0.RailUtil);
local v3 = require(l_Parent_0.Symbol);
local v4 = v3("AttributeConnections");
local v5 = v3("AttributeValues");
local v6 = v3("AttributeFusionScope");
local function v10(v7, v8) --[[ Line: 61 ]] --[[ Name: GetAttribute ]]
    local l_Attribute_0 = v7.Instance:GetAttribute(v8);
    if l_Attribute_0 ~= nil then
        return l_Attribute_0;
    else
        return nil;
    end;
end;
local function v14(v11, v12, v13) --[[ Line: 75 ]] --[[ Name: SetAttribute ]]
    v11.Instance:SetAttribute(v12, v13);
end;
local function v21(v15, v16, v17) --[[ Line: 89 ]] --[[ Name: IncrementAttribute ]]
    local l_Attribute_1 = v15.Instance:GetAttribute(v16);
    local v19 = (if l_Attribute_1 ~= nil then l_Attribute_1 else nil) or 0;
    assert(typeof(v19) == "number", "Attempted to increment a non-number attribute");
    local v20 = v19 + (v17 or 1);
    v15.Instance:SetAttribute(v16, v20);
    return v20;
end;
local function v26(v22, v23, v24) --[[ Line: 107 ]] --[[ Name: UpdateAttribute ]]
    local l_Attribute_2 = v22.Instance:GetAttribute(v23);
    l_Attribute_2 = v24(if l_Attribute_2 ~= nil then l_Attribute_2 else nil);
    v22.Instance:SetAttribute(v23, l_Attribute_2);
    return l_Attribute_2;
end;
local function v37(v27, v28, v29) --[[ Line: 124 ]] --[[ Name: ObserveAttribute ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v34 = v27.Instance:GetAttributeChangedSignal(v28):Connect(function() --[[ Line: 126 ]]
        -- upvalues: v29 (copy), v27 (copy), v28 (copy)
        local l_v29_0 = v29;
        local l_v27_0 = v27;
        local l_v28_0 = v28;
        local l_Attribute_3 = l_v27_0.Instance:GetAttribute(l_v28_0);
        l_v29_0(if l_Attribute_3 ~= nil then l_Attribute_3 else nil);
    end);
    table.insert(v27[v4], v34);
    local l_v29_1 = v29;
    local l_Attribute_4 = v27.Instance:GetAttribute(v28);
    l_v29_1(if l_Attribute_4 ~= nil then l_Attribute_4 else nil);
    return function() --[[ Line: 131 ]]
        -- upvalues: v34 (copy), v2 (ref), v27 (copy), v4 (ref)
        if not v34.Connected then
            return;
        else
            v2.Table.SwapRemoveFirstValue(v27[v4], v34);
            v34:Disconnect();
            return;
        end;
    end;
end;
local v58 = {
    SetAttribute = v14, 
    GetAttribute = v10, 
    OutAttribute = function(v38, v39) --[[ Line: 150 ]] --[[ Name: OutAttribute ]]
        -- upvalues: v5 (copy), v1 (copy), v6 (copy), v37 (copy), v4 (copy)
        if not v38[v5][v39] then
            local l_Value_0 = v1.Value;
            local v41 = v38[v6];
            local l_Attribute_5 = v38.Instance:GetAttribute(v39);
            l_Value_0 = l_Value_0(v41, if l_Attribute_5 ~= nil then l_Attribute_5 else nil);
            v37(v38, v39, function(v43) --[[ Line: 154 ]]
                -- upvalues: l_Value_0 (copy)
                l_Value_0:set(v43);
            end);
            table.insert(v38[v4], v1.Observer(v38[v6], l_Value_0):onChange(function() --[[ Line: 158 ]]
                -- upvalues: v38 (copy), v39 (copy), v1 (ref), l_Value_0 (copy)
                local l_v38_0 = v38;
                local l_v39_0 = v39;
                local v46 = v1.peek(l_Value_0);
                l_v38_0.Instance:SetAttribute(l_v39_0, v46);
            end));
            v38[v5][v39] = l_Value_0;
        end;
        return v38[v5][v39];
    end, 
    IncrementAttribute = v21, 
    UpdateAttribute = v26, 
    MutateAttribute = v26, 
    ObserveAttribute = v37, 
    DefaultAttribute = function(v47, v48, v49, v50) --[[ Line: 180 ]] --[[ Name: DefaultAttribute ]]
        local l_Attribute_6 = v47.Instance:GetAttribute(v48);
        local v52 = if l_Attribute_6 ~= nil then l_Attribute_6 else nil;
        if v52 == nil then
            v47.Instance:SetAttribute(v48, v49);
            return v49;
        else
            if v50 then
                l_Attribute_6 = typeof(v52);
                assert(table.find(v50, l_Attribute_6), (("%* Attribute %* is not of a valid type. Expected [%*], got %*"):format(v47.Instance:GetFullName(), v48, table.concat(v50, ", "), l_Attribute_6)));
            end;
            return v52;
        end;
    end, 
    AttributeChanged = function(v53, v54, v55) --[[ Line: 207 ]] --[[ Name: AttributeChanged ]]
        -- upvalues: v4 (copy)
        local l_AttributeChangedSignal_0 = v53.Instance:GetAttributeChangedSignal(v54);
        if v55 then
            local v57 = l_AttributeChangedSignal_0:Connect(v55);
            table.insert(v53[v4], v57);
            return v57;
        else
            return l_AttributeChangedSignal_0;
        end;
    end
};
return {
    ClassName = "ComponentAttributeUtil", 
    Methods = v58, 
    Constructing = function(v59) --[[ Line: 243 ]] --[[ Name: Constructing ]]
        -- upvalues: v4 (copy), v5 (copy), v6 (copy), v1 (copy)
        v59[v4] = {};
        v59[v5] = {};
        v59[v6] = v1.scoped();
    end, 
    Stopped = function(v60) --[[ Line: 254 ]] --[[ Name: Stopped ]]
        -- upvalues: v4 (copy), v1 (copy), v6 (copy), v5 (copy)
        for _, v62 in v60[v4] do
            if typeof(v62) == "function" then
                v62();
            elseif v62.Connected then
                v62:Disconnect();
            end;
        end;
        v1.doCleanup(v60[v6]);
        v60[v5] = nil;
        v60[v4] = nil;
        v60[v6] = nil;
    end
};