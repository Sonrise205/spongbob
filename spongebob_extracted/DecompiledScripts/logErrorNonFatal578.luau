local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Logging.messages);
return function(v3, v4, ...) --[[ Line: 11 ]] --[[ Name: logErrorNonFatal ]]
    -- upvalues: v2 (copy)
    local v5 = nil;
    if v2[v3] ~= nil then
        v5 = v2[v3];
    else
        v3 = "unknownMessage";
        v5 = v2[v3];
    end;
    local v6 = nil;
    if v4 == nil then
        v6 = string.format("[Fusion] " .. v5 .. "\n(ID: " .. v3 .. ")", ...);
    else
        v5 = v5:gsub("ERROR_MESSAGE", v4.message);
        v6 = string.format("[Fusion] " .. v5 .. "\n(ID: " .. v3 .. ")\n---- Stack trace ----\n" .. v4.trace, ...);
    end;
    task.spawn(function(...) --[[ Line: 29 ]]
        -- upvalues: v6 (ref)
        error(v6:gsub("\n", "\n    "), 0);
    end, ...);
end;