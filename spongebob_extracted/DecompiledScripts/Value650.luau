local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Graph.change);
local v3 = require(l_Parent_0.Utility.isSimilar);
local v4 = require(l_Parent_0.Utility.nicknames);
local v5 = {
    type = "State", 
    kind = "Value", 
    timeliness = "lazy", 
    dependencySet = table.freeze({})
};
local v6 = table.freeze({
    __index = v5
});
local function v11(v7, v8) --[[ Line: 30 ]] --[[ Name: Value ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v9 = setmetatable({
        createdAt = os.clock(), 
        dependentSet = {}, 
        lastChange = os.clock(), 
        scope = v7, 
        validity = "valid", 
        _EXTREMELY_DANGEROUS_usedAsValue = v8
    }, v6);
    local function v10() --[[ Line: 47 ]]
        -- upvalues: v9 (copy)
        v9.scope = nil;
    end;
    v9.oldestChore = v10;
    v4[v9.oldestChore] = "Value";
    table.insert(v7, v10);
    return v9;
end;
v5.set = function(v12, v13, v14) --[[ Line: 56 ]] --[[ Name: set ]]
    -- upvalues: v3 (copy), v2 (copy)
    local l__EXTREMELY_DANGEROUS_usedAsValue_0 = v12._EXTREMELY_DANGEROUS_usedAsValue;
    if not v3(l__EXTREMELY_DANGEROUS_usedAsValue_0, v13) or v14 then
        v12._EXTREMELY_DANGEROUS_usedAsValue = v13;
        v2(v12);
    end;
    return v13;
end;
v5._evaluate = function(_) --[[ Line: 72 ]] --[[ Name: _evaluate ]]
    return true;
end;
table.freeze(v5);
return v11;