local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Logging.parseError);
local v4 = {
    type = "Contextual"
};
local v5 = table.freeze({
    __index = v4
});
local v6 = table.freeze({
    __mode = "k"
});
local function v8(v7) --[[ Line: 28 ]] --[[ Name: Contextual ]]
    -- upvalues: v6 (copy), v5 (copy)
    return (setmetatable({
        _valuesNow = setmetatable({}, v6), 
        _defaultValue = v7
    }, v5));
end;
v4.now = function(v9) --[[ Line: 48 ]] --[[ Name: now ]]
    local v10 = coroutine.running();
    local v11 = v9._valuesNow[v10];
    if typeof(v11) ~= "table" then
        return v9._defaultValue;
    else
        return v11.value;
    end;
end;
v4.is = function(v12, v13) --[[ Line: 63 ]] --[[ Name: is ]]
    -- upvalues: v3 (copy), v2 (copy)
    return {
        during = function(_, v15, ...) --[[ Line: 69 ]] --[[ Name: during ]]
            -- upvalues: v12 (copy), v13 (copy), v3 (ref), v2 (ref)
            local v16 = coroutine.running();
            local v17 = v12._valuesNow[v16];
            v12._valuesNow[v16] = {
                value = v13
            };
            local v18, v19 = xpcall(v15, v3, ...);
            v12._valuesNow[v16] = v17;
            if not v18 then
                v2.logError("callbackError", v19);
            end;
            return v19;
        end
    };
end;
table.freeze(v4);
return v8;