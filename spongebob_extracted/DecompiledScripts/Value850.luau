local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Dependencies.useDependency);
local v3 = require(l_Parent_0.Dependencies.initDependency);
local v4 = require(l_Parent_0.Dependencies.updateAll);
local v5 = require(l_Parent_0.Utility.isSimilar);
local v6 = {};
local v7 = {
    __index = v6
};
local v8 = {
    __mode = "k"
};
v6.get = function(v9, v10) --[[ Line: 25 ]] --[[ Name: get ]]
    -- upvalues: v2 (copy)
    if v10 ~= false then
        v2(v9);
    end;
    return v9._value;
end;
v6.set = function(v11, v12, v13) --[[ Line: 39 ]] --[[ Name: set ]]
    -- upvalues: v5 (copy), v4 (copy)
    local l__value_0 = v11._value;
    if v13 or not v5(l__value_0, v12) then
        v11._value = v12;
        v4(v11);
    end;
end;
return function(v15) --[[ Line: 47 ]] --[[ Name: Value ]]
    -- upvalues: v8 (copy), v7 (copy), v3 (copy)
    local v16 = setmetatable({
        type = "State", 
        kind = "Value", 
        dependentSet = setmetatable({}, v8), 
        _value = v15
    }, v7);
    v3(v16);
    return v16;
end;