local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Graph.change);
local v4 = require(l_Parent_0.Utility.nicknames);
local v5 = {
    type = "State", 
    kind = "ExternalTime", 
    timeliness = "lazy", 
    dependencySet = table.freeze({})
};
local v6 = table.freeze({
    __index = v5
});
local v7 = {};
local function v12(v8) --[[ Line: 32 ]] --[[ Name: ExternalTime ]]
    -- upvalues: v2 (copy), v6 (copy), v7 (copy), v4 (copy)
    local v9 = setmetatable({
        createdAt = os.clock(), 
        dependentSet = {}, 
        lastChange = nil, 
        scope = v8, 
        validity = "invalid", 
        _EXTREMELY_DANGEROUS_usedAsValue = v2.lastUpdateStep()
    }, v6);
    local function v11() --[[ Line: 47 ]]
        -- upvalues: v9 (copy), v7 (ref)
        v9.scope = nil;
        local v10 = table.find(v7, v9);
        if v10 ~= nil then
            table.remove(v7, v10);
        end;
    end;
    v9.oldestChore = v11;
    v4[v9.oldestChore] = "ExternalTime";
    table.insert(v8, v11);
    table.insert(v7, v9);
    return v9;
end;
v5._evaluate = function(v13) --[[ Line: 61 ]] --[[ Name: _evaluate ]]
    -- upvalues: v2 (copy)
    v13._EXTREMELY_DANGEROUS_usedAsValue = v2.lastUpdateStep();
    return true;
end;
v2.bindToUpdateStep(function(_) --[[ Line: 73 ]]
    -- upvalues: v7 (copy), v3 (copy)
    for _, v16 in v7 do
        v3(v16);
    end;
end);
return v12;