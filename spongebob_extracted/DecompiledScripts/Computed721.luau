local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Logging.parseError);
local v4 = require(l_Parent_0.Utility.isSimilar);
local v5 = require(l_Parent_0.Utility.never);
local v6 = require(l_Parent_0.Graph.depend);
local v7 = require(l_Parent_0.State.castToState);
local v8 = require(l_Parent_0.State.peek);
local v9 = require(l_Parent_0.Memory.doCleanup);
local v10 = require(l_Parent_0.Memory.deriveScope);
local v11 = require(l_Parent_0.Memory.checkLifetime);
local v12 = require(l_Parent_0.Memory.scopePool);
local v13 = require(l_Parent_0.Utility.nicknames);
local v14 = {
    type = "State", 
    kind = "Computed", 
    timeliness = "lazy"
};
local v15 = table.freeze({
    __index = v14
});
local function v23(v16, v17, v18) --[[ Line: 46 ]] --[[ Name: Computed ]]
    -- upvalues: v2 (copy), v15 (copy), v9 (copy), v13 (copy)
    local v19 = os.clock();
    if typeof(v16) == "function" then
        v2.logError("scopeMissing", nil, "Computeds", "myScope:Computed(function(use, scope) ... end)");
    elseif v18 ~= nil then
        v2.logWarn("destructorRedundant", "Computed");
    end;
    local v20 = setmetatable({
        createdAt = v19, 
        dependencySet = {}, 
        dependentSet = {}, 
        lastChange = nil, 
        scope = v16, 
        validity = "invalid", 
        _EXTREMELY_DANGEROUS_usedAsValue = nil, 
        _innerScope = nil, 
        _processor = v17
    }, v15);
    local function v22() --[[ Line: 71 ]]
        -- upvalues: v20 (copy), v9 (ref)
        v20.scope = nil;
        for v21 in pairs(v20.dependencySet) do
            v21.dependentSet[v20] = nil;
        end;
        if v20._innerScope ~= nil then
            v9(v20._innerScope);
        end;
    end;
    v20.oldestTask = v22;
    v13[v20.oldestTask] = "Computed";
    table.insert(v16, v22);
    return v20;
end;
v14.get = function(_) --[[ Line: 86 ]] --[[ Name: get ]]
    -- upvalues: v2 (copy), v5 (copy)
    v2.logError("stateGetWasRemoved");
    return v5();
end;
v14._evaluate = function(v25) --[[ Line: 93 ]] --[[ Name: _evaluate ]]
    -- upvalues: v10 (copy), v7 (copy), v11 (copy), v6 (copy), v8 (copy), v3 (copy), v12 (copy), v4 (copy), v9 (copy), v2 (copy)
    if v25.scope == nil then
        return false;
    else
        local l_scope_0 = v25.scope;
        local v27 = v10(l_scope_0);
        local function v30(v28) --[[ Line: 101 ]] --[[ Name: use ]]
            -- upvalues: v7 (ref), v11 (ref), l_scope_0 (copy), v25 (copy), v6 (ref), v8 (ref)
            local v29 = v7(v28);
            if v29 ~= nil then
                v11.bOutlivesA(l_scope_0, v25.oldestTask, v29.scope, v29.oldestTask, v11.formatters.useFunction);
                v6(v25, v29);
            end;
            return v8(v28);
        end;
        local v31, v32 = xpcall(v25._processor, v3, v30, v27);
        local v33 = v12.giveIfEmpty(v27);
        if v31 then
            local v34 = v4(v25._EXTREMELY_DANGEROUS_usedAsValue, v32);
            if v25._innerScope ~= nil then
                v9(v25._innerScope);
            end;
            v25._innerScope = v33;
            v25._EXTREMELY_DANGEROUS_usedAsValue = v32;
            return not v34;
        else
            if v33 ~= nil then
                v9(v33);
            end;
            v33 = nil;
            v2.logErrorNonFatal("callbackError", v32);
            return false;
        end;
    end;
end;
table.freeze(v14);
return v23;