local v0 = require(script.Parent.Parent:WaitForChild("luau-polyfill"));
local l_ReactSymbols_0 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols;
local _ = require(script.Parent.Parent:WaitForChild("shared"));
local l_Symbol_0 = v0.Symbol;
local v4 = require(script.Parent:WaitForChild("createSignal.roblox"));
local v5 = l_Symbol_0("BindingImpl");
local v6 = {};
local v11 = {
    __index = {
        getValue = function(v7) --[[ Line: 45 ]] --[[ Name: getValue ]]
            -- upvalues: v6 (copy)
            return v6.getValue(v7);
        end, 
        map = function(v8, v9) --[[ Line: 49 ]] --[[ Name: map ]]
            -- upvalues: v6 (copy)
            return v6.map(v8, v9);
        end
    }, 
    __tostring = function(v10) --[[ Line: 58 ]] --[[ Name: __tostring ]]
        return string.format("RoactBinding(%s)", (tostring(v10:getValue())));
    end
};
v6.update = function(v12, v13) --[[ Line: 63 ]] --[[ Name: update ]]
    -- upvalues: v5 (copy)
    return v12[v5].update(v13);
end;
v6.subscribe = function(v14, v15) --[[ Line: 67 ]] --[[ Name: subscribe ]]
    -- upvalues: v5 (copy)
    return v14[v5].subscribe(v15);
end;
v6.getValue = function(v16) --[[ Line: 71 ]] --[[ Name: getValue ]]
    -- upvalues: v5 (copy)
    return v16[v5]:getValue();
end;
v6.create = function(v17) --[[ Line: 75 ]] --[[ Name: create ]]
    -- upvalues: v4 (copy), l_ReactSymbols_0 (copy), v5 (copy), v11 (copy)
    local v18, v19 = v4();
    local v20 = {
        value = v17, 
        subscribe = v18
    };
    v20.update = function(v21) --[[ Line: 82 ]] --[[ Name: update ]]
        -- upvalues: v20 (copy), v19 (copy)
        v20.value = v21;
        v19(v21);
    end;
    v20.getValue = function() --[[ Line: 87 ]] --[[ Name: getValue ]]
        -- upvalues: v20 (copy)
        return v20.value;
    end;
    local v22 = nil;
    if _G.__DEV__ then
        v22 = debug.traceback("Binding created at:", 3);
    end;
    return setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v5] = v20, 
        _source = v22
    }, v11), v20.update;
end;
v6.map = function(v23, v24) --[[ Line: 105 ]] --[[ Name: map ]]
    -- upvalues: l_ReactSymbols_0 (copy), v6 (copy), v5 (copy), v11 (copy)
    if _G.__DEV__ then
        local v25 = false;
        if typeof(v23) == "table" then
            v25 = v23["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
        end;
        assert(v25, "Expected `self` to be a binding");
        assert(typeof(v24) == "function", "Expected arg #1 to be a function");
    end;
    local v29 = {
        subscribe = function(v26) --[[ Line: 121 ]] --[[ Name: subscribe ]]
            -- upvalues: v6 (ref), v23 (copy), v24 (copy)
            return v6.subscribe(v23, function(v27) --[[ Line: 122 ]]
                -- upvalues: v26 (copy), v24 (ref)
                v26(v24(v27));
            end);
        end, 
        update = function(_) --[[ Line: 127 ]] --[[ Name: update ]]
            error("Bindings created by Binding:map(fn) cannot be updated directly", 2);
        end, 
        getValue = function() --[[ Line: 131 ]] --[[ Name: getValue ]]
            -- upvalues: v24 (copy), v23 (copy)
            return v24(v23:getValue());
        end
    };
    local v30 = nil;
    if _G.__DEV__ then
        v30 = debug.traceback("Mapped binding created at:", 3);
    end;
    return (setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v5] = v29, 
        _source = v30
    }, v11));
end;
v6.join = function(v31) --[[ Line: 152 ]] --[[ Name: join ]]
    -- upvalues: l_ReactSymbols_0 (copy), v6 (copy), v5 (copy), v11 (copy)
    if _G.__DEV__ then
        assert(typeof(v31) == "table", "Expected arg #1 to be of type table");
        for v32, v33 in v31 do
            if typeof(v33) ~= "table" or v33["$$typeof"] ~= l_ReactSymbols_0.REACT_BINDING_TYPE then
                local v34 = ("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(v32)));
                error(v34, 2);
            end;
        end;
    end;
    local v35 = {};
    local function v39() --[[ Line: 173 ]] --[[ Name: getValue ]]
        -- upvalues: v31 (copy)
        local v36 = {};
        for v37, v38 in pairs(v31) do
            v36[v37] = v38:getValue();
        end;
        return v36;
    end;
    v35.subscribe = function(v40) --[[ Line: 184 ]] --[[ Name: subscribe ]]
        -- upvalues: v31 (copy), v6 (ref), v39 (copy)
        local v41 = {};
        for v42, v43 in v31 do
            v41[v42] = v6.subscribe(v43, function(_) --[[ Line: 189 ]]
                -- upvalues: v40 (copy), v39 (ref)
                v40((v39()));
            end);
        end;
        return function() --[[ Line: 194 ]]
            -- upvalues: v41 (ref)
            if v41 == nil then
                return;
            else
                for _, v46 in v41 do
                    v46();
                end;
                v41 = nil;
                return;
            end;
        end;
    end;
    v35.update = function(_) --[[ Line: 207 ]] --[[ Name: update ]]
        error("Bindings created by joinBindings(...) cannot be updated directly", 2);
    end;
    v35.getValue = function() --[[ Line: 211 ]] --[[ Name: getValue ]]
        -- upvalues: v39 (copy)
        return (v39());
    end;
    local v48 = nil;
    if _G.__DEV__ then
        v48 = debug.traceback("Joined binding created at:", 2);
    end;
    return (setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v5] = v35, 
        _source = v48
    }, v11));
end;
return v6;