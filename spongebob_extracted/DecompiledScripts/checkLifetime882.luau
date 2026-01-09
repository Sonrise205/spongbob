local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Utility.nameOf);
local v4 = {
    formatters = {}
};
v4.formatters.useFunction = function(v5, v6) --[[ Line: 19 ]] --[[ Name: useFunction ]]
    -- upvalues: v3 (copy)
    local v7 = v3(v5, "object");
    return ("The use()-d %*"):format((v3(v6, "object"))), (("the %*"):format(v7));
end;
v4.formatters.boundProperty = function(v8, v9, v10) --[[ Line: 28 ]] --[[ Name: boundProperty ]]
    -- upvalues: v3 (copy)
    local l_Name_0 = v8.Name;
    return ("The %* (bound to the %* property)"):format(v3(v9, "value"), v10), (("the %* instance"):format(l_Name_0));
end;
v4.formatters.boundAttribute = function(v12, v13, v14) --[[ Line: 38 ]] --[[ Name: boundAttribute ]]
    -- upvalues: v3 (copy)
    local l_Name_1 = v12.Name;
    return ("The %* (bound to the %* attribute)"):format(v3(v13, "value"), v14), (("the %* instance"):format(l_Name_1));
end;
v4.formatters.propertyOutputsTo = function(v16, v17, v18) --[[ Line: 48 ]] --[[ Name: propertyOutputsTo ]]
    -- upvalues: v3 (copy)
    local l_Name_2 = v16.Name;
    return ("The %* (which the %* property outputs to)"):format(v3(v17, "object"), v18), (("the %* instance"):format(l_Name_2));
end;
v4.formatters.attributeOutputsTo = function(v20, v21, v22) --[[ Line: 58 ]] --[[ Name: attributeOutputsTo ]]
    -- upvalues: v3 (copy)
    local l_Name_3 = v20.Name;
    return ("The %* (which the %* attribute outputs to)"):format(v3(v21, "object"), v22), (("the %* instance"):format(l_Name_3));
end;
v4.formatters.refOutputsTo = function(v24, v25) --[[ Line: 68 ]] --[[ Name: refOutputsTo ]]
    -- upvalues: v3 (copy)
    local l_Name_4 = v24.Name;
    return ("The %* (which the Ref key outputs to)"):format((v3(v25, "object"))), (("the %* instance"):format(l_Name_4));
end;
v4.formatters.animationGoal = function(v27, v28) --[[ Line: 77 ]] --[[ Name: animationGoal ]]
    -- upvalues: v3 (copy)
    local v29 = v3(v27, "object");
    return ("The goal %*"):format((v3(v28, "object"))), (("the %* that is following it"):format(v29));
end;
v4.formatters.parameter = function(v30, v31, v32) --[[ Line: 86 ]] --[[ Name: parameter ]]
    -- upvalues: v3 (copy)
    local v33 = v3(v30, "object");
    local v34 = v3(v31, "object");
    if v32 == false then
        return ("The %* parameter"):format(v34), (("the %* that it was used for"):format(v33));
    else
        return ("The %* representing the %* parameter"):format(v34, v32), (("the %* that it was used for"):format(v33));
    end;
end;
v4.formatters.observer = function(v35, v36) --[[ Line: 100 ]] --[[ Name: observer ]]
    -- upvalues: v3 (copy)
    local v37 = v3(v35, "object");
    return ("The watched %*"):format((v3(v36, "object"))), (("the %* that's observing it for changes"):format(v37));
end;
v4.bOutlivesA = function(_, v39, v40, v41, v42, ...) --[[ Line: 109 ]] --[[ Name: bOutlivesA ]]
    -- upvalues: v2 (copy)
    if v40 == nil then
        v2.logError("useAfterDestroy", nil, v42(v39, v41, ...));
    end;
end;
return v4;