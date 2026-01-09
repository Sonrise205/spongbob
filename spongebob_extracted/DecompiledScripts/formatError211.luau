local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Logging.messages);
return function(v3, v4, v5, ...) --[[ Line: 16 ]] --[[ Name: formatError ]]
    -- upvalues: v2 (copy)
    local l_v4_0 = v4;
    local v7 = if typeof(v5) == "table" then v5 else nil;
    local v8 = if typeof(v5) == "table" then v5.trace else v5;
    local v9 = v2[v4];
    if v9 == nil then
        v4 = "unknownMessage";
        v9 = v2[v4];
    end;
    v9 = v9:format(...);
    if v7 ~= nil then
        v9 = v9:gsub("ERROR_MESSAGE", v7.message);
        if v7.context ~= nil then
            v9 = v9 .. (" (%*)"):format(v7.context);
        end;
    else
        v9 = v9:gsub("ERROR_MESSAGE", l_v4_0);
    end;
    v9 = ("[Fusion] %* \nID: %*"):format(v9, v4);
    if v3 ~= nil and v3.policies.allowWebLinks then
        v9 = v9 .. ("\nLearn more: https://elttob.uk/Fusion/0.3/api-reference/general/errors/#%*"):format((v4:lower()));
    end;
    if v8 ~= nil then
        v9 = v9 .. (" \n---- Stack trace ----\n%*"):format(v8);
    end;
    return v9:gsub("\n", "\n    ");
end;