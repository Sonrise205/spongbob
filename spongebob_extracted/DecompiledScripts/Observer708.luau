local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.Dependencies.initDependency);
local v4 = {};
local v5 = {
    __index = v4
};
local v6 = {};
v4.update = function(v7) --[[ Line: 26 ]] --[[ Name: update ]]
    for _, v9 in pairs(v7._changeListeners) do
        task.spawn(v9);
    end;
    return false;
end;
v4.onChange = function(v10, v11) --[[ Line: 41 ]] --[[ Name: onChange ]]
    -- upvalues: v6 (copy)
    local v12 = {};
    v10._numChangeListeners = v10._numChangeListeners + 1;
    v10._changeListeners[v12] = v11;
    v6[v10] = true;
    local v13 = false;
    return function() --[[ Line: 51 ]]
        -- upvalues: v13 (ref), v10 (copy), v12 (copy), v6 (ref)
        if v13 then
            return;
        else
            v13 = true;
            v10._changeListeners[v12] = nil;
            local l_v10_0 = v10;
            l_v10_0._numChangeListeners = l_v10_0._numChangeListeners - 1;
            if v10._numChangeListeners == 0 then
                v6[v10] = nil;
            end;
            return;
        end;
    end;
end;
return function(v15) --[[ Line: 66 ]] --[[ Name: Observer ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v16 = setmetatable({
        type = "State", 
        kind = "Observer", 
        dependencySet = {
            [v15] = true
        }, 
        dependentSet = {}, 
        _changeListeners = {}, 
        _numChangeListeners = 0
    }, v5);
    v3(v16);
    v15.dependentSet[v16] = true;
    return v16;
end;