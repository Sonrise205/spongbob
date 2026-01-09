local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Graph.depend);
local _ = require(l_Parent_0.State.For.ForTypes);
local v4 = require(l_Parent_0.Utility.nicknames);
local v5 = require(l_Parent_0.State.For.Disassembly);
local v6 = {
    type = "State", 
    kind = "For", 
    timeliness = "lazy"
};
local v7 = table.freeze({
    __index = v6
});
local function v14(v8, v9, v10) --[[ Line: 32 ]] --[[ Name: For ]]
    -- upvalues: v5 (copy), v7 (copy), v4 (copy)
    local v11 = setmetatable({
        createdAt = os.clock(), 
        dependencySet = {}, 
        dependentSet = {}, 
        scope = v8, 
        validity = "invalid", 
        _EXTREMELY_DANGEROUS_usedAsValue = {}, 
        _disassembly = v5(v8, v9, v10)
    }, v7);
    local function v13() --[[ Line: 59 ]]
        -- upvalues: v11 (copy)
        v11.scope = nil;
        for v12 in pairs(v11.dependencySet) do
            v12.dependentSet[v11] = nil;
        end;
    end;
    v11.oldestChore = v13;
    v4[v11.oldestChore] = "For";
    table.insert(v8, v13);
    return v11;
end;
v6._evaluate = function(v15) --[[ Line: 72 ]] --[[ Name: _evaluate ]]
    -- upvalues: v2 (copy)
    if v15.scope == nil then
        return false;
    else
        v2(v15, v15._disassembly);
        table.clear(v15._EXTREMELY_DANGEROUS_usedAsValue);
        v15._disassembly:populate(function(v16) --[[ Line: 82 ]]
            -- upvalues: v2 (ref), v15 (copy)
            return v2(v15, v16);
        end, v15._EXTREMELY_DANGEROUS_usedAsValue);
        return true;
    end;
end;
table.freeze(v6);
return v14;