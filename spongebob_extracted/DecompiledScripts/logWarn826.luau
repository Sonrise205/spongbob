local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Logging.messages);
return function(v2, ...) --[[ Line: 10 ]] --[[ Name: logWarn ]]
    -- upvalues: v1 (copy)
    local v3 = nil;
    if v1[v2] ~= nil then
        v3 = v1[v2];
    else
        v2 = "unknownMessage";
        v3 = v1[v2];
    end;
    warn(string.format("[Fusion] " .. v3 .. "\n(ID: " .. v2 .. ")", ...));
end;