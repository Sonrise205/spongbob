local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Logging.parseError);
local v4 = require(l_Parent_0.Memory.checkLifetime);
local v5 = require(l_Parent_0.Graph.Observer);
local v6 = require(l_Parent_0.State.castToState);
local v7 = require(l_Parent_0.State.peek);
local v8 = require(l_Parent_0.Utility.xtypeof);
local function v12(v9, v10, v11) --[[ Line: 34 ]] --[[ Name: setProperty_unsafe ]]
    v9[v10] = v11;
end;
local function v15(v13, v14) --[[ Line: 42 ]] --[[ Name: testPropertyAssignable ]]
    v13[v14] = v13[v14];
end;
local function v23(v16, v17, v18) --[[ Line: 49 ]] --[[ Name: setProperty ]]
    -- upvalues: v12 (copy), v3 (copy), v15 (copy), v2 (copy)
    local v19, v20 = xpcall(v12, v3, v16, v17, v18);
    if not v19 then
        if not pcall(v15, v16, v17) then
            v2.logErrorNonFatal("cannotAssignProperty", nil, v16.ClassName, v17);
            return;
        else
            local v21 = typeof(v18);
            local v22 = typeof(v16[v17]);
            if v21 == v22 then
                v2.logErrorNonFatal("propertySetError", v20);
                return;
            else
                v2.logErrorNonFatal("invalidPropertyType", nil, v16.ClassName, v17, v22, v21);
            end;
        end;
    end;
end;
local function v28(v24, v25, v26, v27) --[[ Line: 74 ]] --[[ Name: bindProperty ]]
    -- upvalues: v6 (copy), v4 (copy), v5 (copy), v23 (copy), v7 (copy)
    if v6(v27) then
        v4.bOutlivesA(v24, v25, v27.scope, v27.oldestChore, v4.formatters.boundProperty, v26);
        v5(v24, v27):onBind(function() --[[ Line: 88 ]]
            -- upvalues: v23 (ref), v25 (copy), v26 (copy), v7 (ref), v27 (copy)
            v23(v25, v26, v7(v27));
        end);
        return;
    else
        v23(v25, v26, v27);
        return;
    end;
end;
return function(v29, v30, v31) --[[ Line: 97 ]] --[[ Name: applyInstanceProps ]]
    -- upvalues: v8 (copy), v28 (copy), v2 (copy)
    local v32 = {
        self = {}, 
        descendants = {}, 
        ancestor = {}, 
        observer = {}
    };
    for v33, v34 in pairs(v30) do
        local v35 = v8(v33);
        if v35 == "string" then
            if v33 ~= "Parent" then
                v28(v29, v31, v33, v34);
            end;
        elseif v35 == "SpecialKey" then
            local l_stage_0 = v33.stage;
            local v37 = v32[l_stage_0];
            if v37 == nil then
                v2.logError("unrecognisedPropertyStage", nil, l_stage_0);
            else
                v37[v33] = v34;
            end;
        else
            v2.logError("unrecognisedPropertyKey", nil, v35);
        end;
    end;
    for v38, v39 in pairs(v32.self) do
        v38:apply(v29, v39, v31);
    end;
    for v40, v41 in pairs(v32.descendants) do
        v40:apply(v29, v41, v31);
    end;
    if v30.Parent ~= nil then
        v28(v29, v31, "Parent", v30.Parent);
    end;
    for v42, v43 in pairs(v32.ancestor) do
        v42:apply(v29, v43, v31);
    end;
    for v44, v45 in pairs(v32.observer) do
        v44:apply(v29, v45, v31);
    end;
end;