local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Utility.cleanup);
local v3 = require(l_Parent_0.Utility.xtypeof);
local v4 = require(l_Parent_0.Logging.logError);
local v5 = require(l_Parent_0.State.Observer);
local function v9(v6, v7, v8) --[[ Line: 23 ]] --[[ Name: setProperty_unsafe ]]
    v6[v7] = v8;
end;
local function v12(v10, v11) --[[ Line: 27 ]] --[[ Name: testPropertyAssignable ]]
    v10[v11] = v10[v11];
end;
local function v18(v13, v14, v15) --[[ Line: 31 ]] --[[ Name: setProperty ]]
    -- upvalues: v9 (copy), v12 (copy), v4 (copy)
    if not pcall(v9, v13, v14, v15) then
        if not pcall(v12, v13, v14) then
            if v13 == nil then
                v4("setPropertyNilRef", nil, v14, (tostring(v15)));
                return;
            else
                v4("cannotAssignProperty", nil, v13.ClassName, v14);
                return;
            end;
        else
            local v16 = typeof(v15);
            local v17 = typeof(v13[v14]);
            v4("invalidPropertyType", nil, v13.ClassName, v14, v17, v16);
        end;
    end;
end;
local function v25(v19, v20, v21, v22) --[[ Line: 51 ]] --[[ Name: bindProperty ]]
    -- upvalues: v3 (copy), v18 (copy), v5 (copy)
    if v3(v21) == "State" then
        local v23 = false;
        local function v24() --[[ Line: 55 ]] --[[ Name: updateLater ]]
            -- upvalues: v23 (ref), v18 (ref), v19 (copy), v20 (copy), v21 (copy)
            if not v23 then
                v23 = true;
                task.defer(function() --[[ Line: 58 ]]
                    -- upvalues: v23 (ref), v18 (ref), v19 (ref), v20 (ref), v21 (ref)
                    v23 = false;
                    v18(v19, v20, v21:get(false));
                end);
            end;
        end;
        v18(v19, v20, v21:get(false));
        table.insert(v22, v5(v21):onChange(v24));
        return;
    else
        v18(v19, v20, v21);
        return;
    end;
end;
return function(v26, v27) --[[ Line: 73 ]] --[[ Name: applyInstanceProps ]]
    -- upvalues: v3 (copy), v25 (copy), v4 (copy), v2 (copy)
    local v28 = {
        self = {}, 
        descendants = {}, 
        ancestor = {}, 
        observer = {}
    };
    local v29 = {};
    for v30, v31 in pairs(v26) do
        local v32 = v3(v30);
        if v32 == "string" then
            if v30 ~= "Parent" then
                v25(v27, v30, v31, v29);
            end;
        elseif v32 == "SpecialKey" then
            local l_stage_0 = v30.stage;
            local v34 = v28[l_stage_0];
            if v34 == nil then
                v4("unrecognisedPropertyStage", nil, l_stage_0);
            else
                v34[v30] = v31;
            end;
        else
            v4("unrecognisedPropertyKey", nil, v3(v30));
        end;
    end;
    for v35, v36 in pairs(v28.self) do
        v35:apply(v36, v27, v29);
    end;
    for v37, v38 in pairs(v28.descendants) do
        v37:apply(v38, v27, v29);
    end;
    if v26.Parent ~= nil then
        v25(v27, "Parent", v26.Parent, v29);
    end;
    for v39, v40 in pairs(v28.ancestor) do
        v39:apply(v40, v27, v29);
    end;
    for v41, v42 in pairs(v28.observer) do
        v41:apply(v42, v27, v29);
    end;
    v27.Destroying:Connect(function() --[[ Line: 121 ]]
        -- upvalues: v2 (ref), v29 (copy)
        v2(v29);
    end);
end;