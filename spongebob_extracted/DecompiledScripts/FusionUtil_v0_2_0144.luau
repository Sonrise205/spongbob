local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Promise);
local v2 = require(l_Parent_0.Parent.Fusion_v0_2_0);
local _ = v2.Value;
local _ = v2.Observer;
local l_Computed_0 = v2.Computed;
local function v8(v6) --[[ Line: 46 ]] --[[ Name: isState ]]
    local v7 = false;
    if typeof(v6) == "table" then
        v7 = v6.type == "State";
    end;
    return v7;
end;
local function v11(v9) --[[ Line: 65 ]] --[[ Name: isValue ]]
    local v10 = false;
    if typeof(v9) == "table" then
        v10 = v9.type == "State";
    end;
    if v10 then
        v10 = v9.set;
    end;
    return v10;
end;
local function v14(v12) --[[ Line: 88 ]] --[[ Name: use ]]
    local v13 = false;
    if typeof(v12) == "table" then
        v13 = v12.type == "State";
    end;
    if v13 then
        return (v12:get());
    else
        return v12;
    end;
end;
local v48 = {
    use = v14, 
    isState = v8, 
    isValue = v11, 
    promiseStateChange = function(v15, v16) --[[ Line: 131 ]] --[[ Name: promiseStateChange ]]
        -- upvalues: v1 (copy), v2 (copy)
        local v17 = true;
        if v16 ~= nil then
            v17 = typeof(v16) == "function";
        end;
        assert(v17, "FusionUtil.promiseStateChange: Expected callback to be a function or nil");
        local v18 = nil;
        return v1.new(function(v19, _, _) --[[ Line: 134 ]]
            -- upvalues: v18 (ref), v2 (ref), v15 (copy), v16 (copy)
            v18 = v2.Observer(v15):onChange(function() --[[ Line: 135 ]]
                -- upvalues: v16 (ref), v15 (ref), v19 (copy)
                local v22 = false;
                local v23, v24, v25;
                if v16 ~= nil then
                    v23 = v16;
                    v24 = v15;
                    v25 = false;
                    if typeof(v24) == "table" then
                        v25 = v24.type == "State";
                    end;
                    v22 = not v23(if v25 then v24:get() else v24);
                end;
                if not v22 then
                    v23 = v19;
                    v24 = v15;
                    v25 = false;
                    if typeof(v24) == "table" then
                        v25 = v24.type == "State";
                    end;
                    v23(if v25 then v24:get() else v24);
                end;
                v22 = false;
            end);
        end):finallyCall(v18);
    end, 
    formatAssetId = function(v26, v27) --[[ Line: 162 ]] --[[ Name: formatAssetId ]]
        -- upvalues: v14 (copy), l_Computed_0 (copy)
        local function v30(v28) --[[ Line: 163 ]] --[[ Name: Tranform ]]
            -- upvalues: v14 (ref), v26 (copy), v27 (copy)
            local v29 = (v28 or v14)(v26) or v27;
            if v29 and typeof(v29) ~= "string" then
                assert(typeof(v29) == "number", "AssetId must be a string or number");
                return "rbxassetid://" .. v29;
            else
                if v29 and typeof(v29) == "string" and tonumber(v29) then
                    v29 = "rbxassetid://" .. v29;
                end;
                return v29 or "";
            end;
        end;
        local v31 = false;
        if typeof(v26) == "table" then
            v31 = v26.type == "State";
        end;
        if v31 then
            return (l_Computed_0(v30));
        else
            local v32 = (v14 or v14)(v26) or v27;
            if v32 and typeof(v32) ~= "string" then
                assert(typeof(v32) == "number", "AssetId must be a string or number");
                return "rbxassetid://" .. v32;
            else
                if v32 and typeof(v32) == "string" and tonumber(v32) then
                    v32 = "rbxassetid://" .. v32;
                end;
                return v32 or "";
            end;
        end;
    end, 
    ratio = function(v33, v34, v35) --[[ Line: 196 ]] --[[ Name: ratio ]]
        -- upvalues: l_Computed_0 (copy)
        return l_Computed_0(function() --[[ Line: 201 ]]
            -- upvalues: v33 (copy), v34 (copy), v35 (ref)
            local l_v33_0 = v33;
            local v37 = false;
            if typeof(l_v33_0) == "table" then
                v37 = l_v33_0.type == "State";
            end;
            local v38 = if v37 then l_v33_0:get() else l_v33_0;
            v37 = v34;
            local v39 = false;
            if typeof(v37) == "table" then
                v39 = v37.type == "State";
            end;
            v37 = v38 / if v39 then v37:get() else v37;
            local l_v35_0 = v35;
            local v41 = false;
            if typeof(l_v35_0) == "table" then
                v41 = l_v35_0.type == "State";
            end;
            v35 = if v41 then l_v35_0:get() else l_v35_0;
            if v35 then
                if typeof(v35) == "function" then
                    return v35(v37);
                else
                    return v35 * v37;
                end;
            else
                return v37;
            end;
        end);
    end, 
    eq = function(v42, v43) --[[ Line: 235 ]] --[[ Name: eq ]]
        -- upvalues: l_Computed_0 (copy)
        return l_Computed_0(function() --[[ Line: 236 ]]
            -- upvalues: v42 (copy), v43 (copy)
            local l_v42_0 = v42;
            local v45 = false;
            if typeof(l_v42_0) == "table" then
                v45 = l_v42_0.type == "State";
            end;
            local v46 = if v45 then l_v42_0:get() else l_v42_0;
            v45 = v43;
            local v47 = false;
            if typeof(v45) == "table" then
                v47 = v45.type == "State";
            end;
            return v46 == if v47 then v45:get() else v45;
        end);
    end
};
return table.freeze(v48);