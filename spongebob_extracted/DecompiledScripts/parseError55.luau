local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2) --[[ Line: 13 ]] --[[ Name: parseError ]]
    return {
        type = "Error", 
        raw = v2, 
        message = v2:gsub("^.+:%d+:%s*", ""), 
        trace = debug.traceback(nil, 2)
    };
end;