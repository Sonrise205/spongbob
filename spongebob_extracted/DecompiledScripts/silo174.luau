local v0 = require(script.TableWatcher);
local v1 = require(script.Util);
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4) --[[ Line: 86 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v1 (copy), v0 (copy)
    local v5 = setmetatable({}, v2);
    v5._DefaultState = v1.DeepFreeze(v1.DeepCopy(v3));
    v5._State = v1.DeepFreeze(v1.DeepCopy(v3));
    v5._Modifiers = {};
    v5._Dispatching = false;
    v5._Parent = v5;
    v5._Subscribers = {};
    v5.Actions = {};
    if v4 then
        for v6, v7 in v4 do
            v5._Modifiers[v6] = function(v8, v9) --[[ Line: 101 ]]
                -- upvalues: v0 (ref), v7 (copy)
                local v10 = v0(v8);
                v7(v10, v9);
                return v10();
            end;
            v5.Actions[v6] = function(v11) --[[ Line: 109 ]]
                -- upvalues: v6 (copy)
                return {
                    Name = v6, 
                    Payload = v11
                };
            end;
        end;
    end;
    return v5;
end;
v2.combine = function(v12, v13) --[[ Line: 126 ]] --[[ Name: combine ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v14 = {};
    for v15, v16 in v12 do
        if v16._Dispatching then
            error("cannot combine silos from a modifier", 2);
        end;
        v14[v15] = v16:GetState();
    end;
    local v17 = v2.new(v1.Extend(v14, v13 or {}));
    for v18, v19 in v12 do
        v19._Parent = v17;
        for v20, v21 in v19._Modifiers do
            local v22 = ("%*/%*"):format(v18, v20);
            v17._Modifiers[v22] = function(v23, v24) --[[ Line: 144 ]]
                -- upvalues: v1 (ref), v18 (copy), v21 (copy)
                return v1.Extend(v23, {
                    [v18] = v21(v23[v18], v24)
                });
            end;
        end;
        for v25 in v19.Actions do
            if v17.Actions[v25] ~= nil then
                error(("duplicate action name %* found when combining silos"):format(v25), 2);
            end;
            local v26 = ("%*/%*"):format(v18, v25);
            v19.Actions[v25] = function(v27) --[[ Line: 157 ]]
                -- upvalues: v26 (copy)
                return {
                    Name = v26, 
                    Payload = v27
                };
            end;
            v17.Actions[v25] = v19.Actions[v25];
        end;
    end;
    return v17;
end;
v2.GetState = function(v28) --[[ Line: 177 ]] --[[ Name: GetState ]]
    if v28._Parent ~= v28 then
        error("can only get state from top-level silo", 2);
    end;
    return v28._State;
end;
v2.Dispatch = function(v29, v30) --[[ Line: 191 ]] --[[ Name: Dispatch ]]
    -- upvalues: v1 (copy)
    if v29._Dispatching then
        error("cannot dispatch from a modifier", 2);
    end;
    if v29._Parent ~= v29 then
        error("can only dispatch from top-level silo", 2);
    end;
    v29._Dispatching = true;
    local l__State_0 = v29._State;
    local l_l__State_0_0 = l__State_0;
    local v33 = v29._Modifiers[v30.Name];
    if v33 then
        l_l__State_0_0 = v33(l_l__State_0_0, v30.Payload);
    end;
    v29._Dispatching = false;
    if l_l__State_0_0 ~= l__State_0 then
        v29._State = v1.DeepFreeze(l_l__State_0_0);
        for _, v35 in v29._Subscribers do
            v35(l_l__State_0_0, l__State_0);
        end;
    end;
end;
v2.Subscribe = function(v36, v37) --[[ Line: 235 ]] --[[ Name: Subscribe ]]
    if v36._Dispatching then
        error("cannot subscribe from within a modifier", 2);
    end;
    if v36._Parent ~= v36 then
        error("can only subscribe on top-level silo", 2);
    end;
    if table.find(v36._Subscribers, v37) then
        error("cannot subscribe same function more than once", 2);
    end;
    table.insert(v36._Subscribers, v37);
    return function() --[[ Line: 249 ]]
        -- upvalues: v36 (copy), v37 (copy)
        local v38 = table.find(v36._Subscribers, v37);
        if not v38 then
            return;
        else
            table.remove(v36._Subscribers, v38);
            return;
        end;
    end;
end;
v2.Watch = function(v39, v40, v41) --[[ Line: 276 ]] --[[ Name: Watch ]]
    local v42 = v40(v39:GetState());
    local v45 = v39:Subscribe(function(v43) --[[ Line: 279 ]]
        -- upvalues: v40 (copy), v42 (ref), v41 (copy)
        local v44 = v40(v43);
        if v44 == v42 then
            return;
        else
            v42 = v44;
            v41(v42);
            return;
        end;
    end);
    v41(v42);
    return v45;
end;
v2.ResetToDefaultState = function(v46) --[[ Line: 315 ]] --[[ Name: ResetToDefaultState ]]
    -- upvalues: v1 (copy)
    if v46._Dispatching then
        error("cannot reset state from within a modifier", 2);
    end;
    if v46._Parent ~= v46 then
        error("can only reset state on top-level silo", 2);
    end;
    local l__State_1 = v46._State;
    if v46._DefaultState ~= l__State_1 then
        v46._State = v1.DeepFreeze(v1.DeepCopy(v46._DefaultState));
        for _, v49 in v46._Subscribers do
            v49(v46._State, l__State_1);
        end;
    end;
end;
return {
    new = v2.new, 
    combine = v2.combine
};