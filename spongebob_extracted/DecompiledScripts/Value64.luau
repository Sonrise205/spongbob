local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Graph.change);
local v4 = require(l_Parent_0.Utility.isSimilar);
local v5 = require(l_Parent_0.Utility.never);
local v6 = require(l_Parent_0.Utility.nicknames);
local v7 = {
    type = "State", 
    kind = "Value", 
    timeliness = "lazy", 
    dependencySet = table.freeze({})
};
local v8 = table.freeze({
    __index = v7
});
local function v14(v9, v10) --[[ Line: 32 ]] --[[ Name: Value ]]
    -- upvalues: v2 (copy), v8 (copy), v6 (copy)
    local v11 = os.clock();
    if v10 == nil and (typeof(v9) ~= "table" or v9[1] == nil and next(v9) ~= nil) then
        v2.logError("scopeMissing", nil, "Value", "myScope:Value(initialValue)");
    end;
    local v12 = setmetatable({
        createdAt = v11, 
        dependentSet = {}, 
        lastChange = os.clock(), 
        scope = v9, 
        validity = "valid", 
        _EXTREMELY_DANGEROUS_usedAsValue = v10
    }, v8);
    local function v13() --[[ Line: 51 ]]
        -- upvalues: v12 (copy)
        v12.scope = nil;
    end;
    v12.oldestTask = v13;
    v6[v12.oldestTask] = "Value";
    table.insert(v9, v13);
    return v12;
end;
v7.get = function(_, _) --[[ Line: 60 ]] --[[ Name: get ]]
    -- upvalues: v2 (copy), v5 (copy)
    v2.logError("stateGetWasRemoved");
    return v5();
end;
v7.set = function(v17, v18) --[[ Line: 67 ]] --[[ Name: set ]]
    -- upvalues: v4 (copy), v3 (copy)
    local l__EXTREMELY_DANGEROUS_usedAsValue_0 = v17._EXTREMELY_DANGEROUS_usedAsValue;
    if not v4(l__EXTREMELY_DANGEROUS_usedAsValue_0, v18) then
        v17._EXTREMELY_DANGEROUS_usedAsValue = v18;
        v3(v17);
    end;
    return v18;
end;
v7._evaluate = function(_) --[[ Line: 79 ]] --[[ Name: _evaluate ]]
    return true;
end;
table.freeze(v7);
return v14;