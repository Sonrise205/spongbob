local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Graph.change);
local v4 = require(l_Parent_0.Utility.nicknames);
local v5 = {
    type = "State", 
    kind = "ExternalTime", 
    timeliness = "lazy", 
    dependencySet = table.freeze({}), 
    _EXTREMELY_DANGEROUS_usedAsValue = v2.lastUpdateStep()
};
local v6 = table.freeze({
    __index = v5
});
local v7 = {};
local function v12(v8) --[[ Line: 33 ]] --[[ Name: ExternalTime ]]
    -- upvalues: v6 (copy), v7 (copy), v4 (copy)
    local v9 = setmetatable({
        createdAt = os.clock(), 
        dependentSet = {}, 
        lastChange = nil, 
        scope = v8, 
        validity = "invalid"
    }, v6);
    local function v11() --[[ Line: 47 ]]
        -- upvalues: v9 (copy), v7 (ref)
        v9.scope = nil;
        local v10 = table.find(v7, v9);
        if v10 ~= nil then
            table.remove(v7, v10);
        end;
    end;
    v9.oldestTask = v11;
    v4[v9.oldestTask] = "ExternalTime";
    table.insert(v8, v11);
    table.insert(v7, v9);
    return v9;
end;
v5._evaluate = function(_) --[[ Line: 61 ]] --[[ Name: _evaluate ]]
    return true;
end;
v2.bindToUpdateStep(function(_) --[[ Line: 72 ]]
    -- upvalues: v5 (copy), v2 (copy), v7 (copy), v3 (copy)
    v5._EXTREMELY_DANGEROUS_usedAsValue = v2.lastUpdateStep();
    for _, v16 in v7 do
        v3(v16);
    end;
end);
return v12;