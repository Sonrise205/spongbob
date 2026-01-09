local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.MathUtil);
local v2 = require(l_Parent_0.Parent.Janitor);
local v3 = require(l_Parent_0.Parent.Promise);
local v4 = require(l_Parent_0.Parent.Fusion_v0_2_5);
local l_peek_0 = v4.peek;
local l_Value_0 = v4.Value;
local l_Observer_0 = v4.Observer;
local l_Computed_0 = v4.Computed;
local v52 = {
    isState = function(v9) --[[ Line: 39 ]] --[[ Name: isState ]]
        local v10 = false;
        if typeof(v9) == "table" then
            v10 = v9.type == "State";
        end;
        return v10;
    end, 
    isValue = function(v11) --[[ Line: 43 ]] --[[ Name: isValue ]]
        local v12 = false;
        if typeof(v11) == "table" then
            v12 = v11.type == "State";
        end;
        if v12 then
            v12 = v11.set;
        end;
        return v12;
    end, 
    promiseStateChange = function(v13, v14) --[[ Line: 80 ]] --[[ Name: promiseStateChange ]]
        -- upvalues: v3 (copy), v4 (copy), l_peek_0 (copy)
        local v15 = true;
        if v14 ~= nil then
            v15 = typeof(v14) == "function";
        end;
        assert(v15, "FusionUtil.promiseStateChange: Expected callback to be a function or nil");
        local v16 = nil;
        return v3.new(function(v17, _, _) --[[ Line: 83 ]]
            -- upvalues: v16 (ref), v4 (ref), v13 (copy), v14 (copy), l_peek_0 (ref)
            v16 = v4.Observer(v13):onChange(function() --[[ Line: 84 ]]
                -- upvalues: v14 (ref), l_peek_0 (ref), v13 (ref), v17 (copy)
                if v14 == nil or v14(l_peek_0(v13)) then
                    v17(l_peek_0(v13));
                end;
            end);
        end):finallyCall(v16);
    end, 
    defaultProps = function(v20, v21) --[[ Line: 102 ]] --[[ Name: defaultProps ]]
        local v22 = table.clone(v21);
        for v23, v24 in v20 do
            if typeof(v23) == "number" then
                table.insert(v22, v24);
            else
                v22[v23] = if v24 ~= nil then v24 else v22[v23];
            end;
        end;
        return v22;
    end, 
    ensureIsState = function(v25, v26, v27) --[[ Line: 125 ]] --[[ Name: ensureIsState ]]
        -- upvalues: l_peek_0 (copy), l_Value_0 (copy)
        if v25 ~= nil then
            if v27 then
                local v28 = typeof(l_peek_0(v25));
                if typeof(v27) == "string" then
                    v27 = {
                        v27
                    };
                end;
                if not table.find(v27, v28) then
                    warn("FusionUtil.ensureIsState: Expected data to be of type", v27, ", got " .. v28 .. ". Defaulting to", v26);
                    return l_Value_0(v25);
                end;
            end;
            local v29 = false;
            if typeof(v25) == "table" then
                v29 = v25.type == "State";
            end;
            if v29 then
                return v25;
            else
                return l_Value_0(v25);
            end;
        else
            return l_Value_0(v26);
        end;
    end, 
    ensureIsValue = function(v30, v31, v32) --[[ Line: 162 ]] --[[ Name: ensureIsValue ]]
        -- upvalues: l_peek_0 (copy), l_Value_0 (copy)
        if v32 then
            local v33 = typeof(l_peek_0(v30));
            if typeof(v32) == "string" then
                v32 = {
                    v32
                };
            end;
            if not table.find(v32, v33) then
                warn("FusionUtil.ensureIsValue: Expected data to be of type", v32, ", got " .. v33 .. ". Defaulting to", v31);
                local l_v30_0 = v30;
                local v35 = false;
                if typeof(l_v30_0) == "table" then
                    v35 = l_v30_0.type == "State";
                end;
                if v35 then
                    v35 = l_v30_0.set;
                end;
                if v35 then
                    v30:set(v31);
                else
                    v30 = v31;
                end;
            end;
        end;
        local l_v30_1 = v30;
        local v37 = false;
        if typeof(l_v30_1) == "table" then
            v37 = l_v30_1.type == "State";
        end;
        if v37 then
            v37 = l_v30_1.set;
        end;
        if v37 then
            return v30;
        else
            l_v30_1 = v30;
            v37 = false;
            if typeof(l_v30_1) == "table" then
                v37 = l_v30_1.type == "State";
            end;
            if v37 then
                warn("FusionUtil.ensureIsValue: Expected data to be a Value, got a State.");
                return v30;
            else
                return l_Value_0(v30 or v31);
            end;
        end;
    end, 
    syncValues = function(v38, v39) --[[ Line: 213 ]] --[[ Name: syncValues ]]
        -- upvalues: l_peek_0 (copy), l_Observer_0 (copy)
        v39:set(l_peek_0(v38));
        return l_Observer_0(v38):onChange(function() --[[ Line: 215 ]]
            -- upvalues: v39 (copy), l_peek_0 (ref), v38 (copy)
            v39:set(l_peek_0(v38));
        end);
    end, 
    ensureAssetId = function(v40, v41) --[[ Line: 238 ]] --[[ Name: ensureAssetId ]]
        -- upvalues: l_Computed_0 (copy), l_peek_0 (copy)
        local function v44(v42) --[[ Line: 239 ]] --[[ Name: Tranform ]]
            -- upvalues: v40 (copy), v41 (copy)
            local v43 = v42(v40) or v41;
            if v43 and typeof(v43) ~= "string" then
                assert(typeof(v43) == "number", "AssetId must be a string or number");
                return "rbxassetid://" .. v43;
            else
                if v43 and typeof(v43) == "string" and tonumber(v43) then
                    v43 = "rbxassetid://" .. v43;
                end;
                return v43 or "";
            end;
        end;
        local v45 = false;
        if typeof(v40) == "table" then
            v45 = v40.type == "State";
        end;
        if v45 then
            return (l_Computed_0(v44));
        else
            local v46 = l_peek_0(v40) or v41;
            if v46 and typeof(v46) ~= "string" then
                assert(typeof(v46) == "number", "AssetId must be a string or number");
                return "rbxassetid://" .. v46;
            else
                if v46 and typeof(v46) == "string" and tonumber(v46) then
                    v46 = "rbxassetid://" .. v46;
                end;
                return v46 or "";
            end;
        end;
    end, 
    ratio = function(v47, v48, v49) --[[ Line: 270 ]] --[[ Name: ratio ]]
        -- upvalues: l_Computed_0 (copy)
        return l_Computed_0(function(v50) --[[ Line: 275 ]]
            -- upvalues: v47 (copy), v48 (copy), v49 (copy)
            local v51 = v50(v47) / v50(v48);
            if v49 then
                if typeof(v49) == "function" then
                    return v49(v51, v50);
                else
                    return v50(v49) * v51;
                end;
            else
                return v51;
            end;
        end);
    end
};
v52.ratioUDim2 = function(v53, v54, v55) --[[ Line: 308 ]] --[[ Name: ratioUDim2 ]]
    -- upvalues: v52 (copy)
    return (v52.ratio(v53, v54, function(v56, v57) --[[ Line: 313 ]]
        -- upvalues: v55 (ref)
        v55 = v57(v55);
        return UDim2.new(v55.X.Scale * v56, v55.X.Offset * v56, v55.Y.Scale * v56, v55.Y.Offset * v56);
    end));
end;
v52.screenRatio = function(v58, v59) --[[ Line: 346 ]] --[[ Name: screenRatio ]]
    -- upvalues: v52 (copy)
    return (v59 or v52.ratio)(require(Util.CameraUtil).ViewportSizeY, 1080, v58);
end;
v52.lerpNumber = function(v60, v61, v62, v63) --[[ Line: 371 ]] --[[ Name: lerpNumber ]]
    -- upvalues: v1 (copy), l_Computed_0 (copy)
    if v63 then
        return v1.lerp(v63(v60), v63(v61), v63(v62));
    else
        return l_Computed_0(function(v64) --[[ Line: 375 ]]
            -- upvalues: v1 (ref), v60 (copy), v61 (copy), v62 (copy)
            return v1.lerp(v64(v60), v64(v61), v64(v62));
        end);
    end;
end;
v52.ifThenElse = function(v65, v66, v67) --[[ Line: 403 ]] --[[ Name: ifThenElse ]]
    -- upvalues: l_Computed_0 (copy)
    return l_Computed_0(function(v68) --[[ Line: 404 ]]
        -- upvalues: v65 (copy), v66 (copy), v67 (copy)
        if v68(v65) then
            return (v68(v66));
        else
            return (v68(v67));
        end;
    end);
end;
v52.eq = function(v69, v70) --[[ Line: 427 ]] --[[ Name: eq ]]
    -- upvalues: l_Computed_0 (copy)
    return l_Computed_0(function(v71) --[[ Line: 428 ]]
        -- upvalues: v69 (copy), v70 (copy)
        return v71(v69) == v71(v70);
    end);
end;
v52.ifExists = function(v72, v73, ...) --[[ Line: 443 ]] --[[ Name: ifExists ]]
    if v72 then
        return (v73(...));
    else
        return nil;
    end;
end;
v52.ifIsState = function(v74, v75, ...) --[[ Line: 457 ]] --[[ Name: ifIsState ]]
    local v76 = false;
    if typeof(v74) == "table" then
        v76 = v74.type == "State";
    end;
    if v76 then
        return (v75(...));
    else
        return nil;
    end;
end;
v52.observeState = function(v77, v78) --[[ Line: 470 ]] --[[ Name: observeState ]]
    -- upvalues: l_peek_0 (copy), l_Observer_0 (copy)
    local function v79() --[[ Line: 471 ]] --[[ Name: onStateChange ]]
        -- upvalues: v78 (copy), l_peek_0 (ref), v77 (copy)
        v78(l_peek_0(v77));
    end;
    v78(l_peek_0(v77));
    return l_Observer_0(v77):onChange(v79);
end;
v52.watchAttribute = function(v80, v81, v82) --[[ Line: 492 ]] --[[ Name: watchAttribute ]]
    -- upvalues: v2 (copy), l_Value_0 (copy)
    assert(typeof(v80) == "Instance", "parent must be an instance");
    assert(typeof(v81) == "string", "attribute must be a string");
    local v83 = v2.new();
    local v84 = l_Value_0();
    local function v86() --[[ Line: 499 ]] --[[ Name: updateState ]]
        -- upvalues: v80 (copy), v81 (copy), v82 (copy), v84 (copy)
        local l_v80_Attribute_0 = v80:GetAttribute(v81);
        if l_v80_Attribute_0 == nil and v82 ~= nil then
            l_v80_Attribute_0 = v82;
        end;
        v84:set(l_v80_Attribute_0);
    end;
    local l_v80_Attribute_1 = v80:GetAttribute(v81);
    if l_v80_Attribute_1 == nil and v82 ~= nil then
        l_v80_Attribute_1 = v82;
    end;
    v84:set(l_v80_Attribute_1);
    v83:Add(v80:GetAttributeChangedSignal(v81):Connect(v86));
    v83:LinkToInstance(v80);
    return v84, function() --[[ Line: 511 ]] --[[ Name: cleanup ]]
        -- upvalues: v83 (copy)
        v83:Destroy();
    end;
end;
return table.freeze(v52);