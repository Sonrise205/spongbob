local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Logging.parseError);
local v4 = require(l_Parent_0.Utility.isSimilar);
local v5 = require(l_Parent_0.Graph.depend);
local v6 = require(l_Parent_0.State.castToState);
local v7 = require(l_Parent_0.Memory.doCleanup);
local v8 = require(l_Parent_0.Memory.deriveScope);
local v9 = require(l_Parent_0.Memory.checkLifetime);
local v10 = require(l_Parent_0.Utility.nicknames);
local v11 = {
    type = "State", 
    kind = "Computed", 
    timeliness = "lazy"
};
local v12 = table.freeze({
    __index = v11
});
local function v19(v13, v14, _) --[[ Line: 43 ]] --[[ Name: Computed ]]
    -- upvalues: v12 (copy), v7 (copy), v10 (copy)
    local v16 = setmetatable({
        createdAt = os.clock(), 
        dependencySet = {}, 
        dependentSet = {}, 
        lastChange = nil, 
        scope = v13, 
        validity = "invalid", 
        _EXTREMELY_DANGEROUS_usedAsValue = nil, 
        _innerScope = nil, 
        _processor = v14
    }, v12);
    local function v18() --[[ Line: 63 ]]
        -- upvalues: v16 (copy), v7 (ref)
        v16.scope = nil;
        for v17 in pairs(v16.dependencySet) do
            v17.dependentSet[v16] = nil;
        end;
        if v16._innerScope ~= nil then
            v7(v16._innerScope);
        end;
    end;
    v16.oldestChore = v18;
    v10[v16.oldestChore] = "Computed";
    table.insert(v13, v18);
    return v16;
end;
v11._evaluate = function(v20) --[[ Line: 78 ]] --[[ Name: _evaluate ]]
    -- upvalues: v8 (copy), v6 (copy), v9 (copy), v5 (copy), v3 (copy), v4 (copy), v7 (copy), v2 (copy)
    if v20.scope == nil then
        return false;
    else
        local l_scope_0 = v20.scope;
        local v22 = v8(l_scope_0);
        local function v25(v23) --[[ Line: 86 ]] --[[ Name: use ]]
            -- upvalues: v6 (ref), v9 (ref), l_scope_0 (copy), v20 (copy), v5 (ref)
            local v24 = v6(v23);
            if v24 ~= nil then
                v9.bOutlivesA(l_scope_0, v20.oldestChore, v24.scope, v24.oldestChore, v9.formatters.useFunction);
                return (v5(v20, v24));
            else
                return v23;
            end;
        end;
        local v26, v27 = xpcall(v20._processor, v3, v25, v22);
        if v26 then
            local v28 = v4(v20._EXTREMELY_DANGEROUS_usedAsValue, v27);
            if v20._innerScope ~= nil then
                v7(v20._innerScope);
                v20._innerScope = nil;
            end;
            v20._innerScope = v22;
            v20._EXTREMELY_DANGEROUS_usedAsValue = v27;
            return not v28;
        else
            if v22 then
                v7(v22);
            end;
            v2.logErrorNonFatal("callbackError", v27);
            return false;
        end;
    end;
end;
table.freeze(v11);
return v19;