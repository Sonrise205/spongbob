local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Graph.depend);
local v4 = require(l_Parent_0.State.peek);
local v5 = require(l_Parent_0.State.castToState);
local _ = require(l_Parent_0.State.For.ForTypes);
local v7 = require(l_Parent_0.Utility.never);
local v8 = require(l_Parent_0.Utility.nicknames);
local v9 = require(l_Parent_0.State.For.Disassembly);
local v10 = {
    type = "State", 
    kind = "For", 
    timeliness = "lazy"
};
local v11 = table.freeze({
    __index = v10
});
local function v18(v12, v13, v14) --[[ Line: 36 ]] --[[ Name: For ]]
    -- upvalues: v9 (copy), v11 (copy), v8 (copy)
    local v15 = setmetatable({
        createdAt = os.clock(), 
        dependencySet = {}, 
        dependentSet = {}, 
        scope = v12, 
        validity = "invalid", 
        _EXTREMELY_DANGEROUS_usedAsValue = {}, 
        _disassembly = v9(v12, v13, v14)
    }, v11);
    local function v17() --[[ Line: 63 ]]
        -- upvalues: v15 (copy)
        v15.scope = nil;
        for v16 in pairs(v15.dependencySet) do
            v16.dependentSet[v15] = nil;
        end;
    end;
    v15.oldestTask = v17;
    v8[v15.oldestTask] = "For";
    table.insert(v12, v17);
    return v15;
end;
v10.get = function(_) --[[ Line: 76 ]] --[[ Name: get ]]
    -- upvalues: v2 (copy), v7 (copy)
    v2.logError("stateGetWasRemoved");
    return v7();
end;
v10._evaluate = function(v20) --[[ Line: 83 ]] --[[ Name: _evaluate ]]
    -- upvalues: v3 (copy), v5 (copy), v4 (copy)
    if v20.scope == nil then
        return false;
    else
        local _ = v20.scope;
        v3(v20, v20._disassembly);
        table.clear(v20._EXTREMELY_DANGEROUS_usedAsValue);
        v20._disassembly:populate(function(v22) --[[ Line: 94 ]]
            -- upvalues: v5 (ref), v3 (ref), v20 (copy), v4 (ref)
            local v23 = v5(v22);
            if v23 ~= nil then
                v3(v20, v23);
            end;
            return v4(v22);
        end, v20._EXTREMELY_DANGEROUS_usedAsValue);
        return true;
    end;
end;
table.freeze(v10);
return v18;