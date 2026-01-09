local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.External);
local v3 = require(l_Parent_0.Memory.whichLivesLonger);
local v4 = require(l_Parent_0.Utility.nameOf);
local v5 = {
    formatters = {}
};
v5.formatters.useFunction = function(v6, v7) --[[ Line: 22 ]] --[[ Name: useFunction ]]
    -- upvalues: v4 (copy)
    local v8 = v4(v6, "object");
    return ("The use()-d %*"):format((v4(v7, "object"))), (("the %*"):format(v8));
end;
v5.formatters.boundProperty = function(v9, v10, v11) --[[ Line: 31 ]] --[[ Name: boundProperty ]]
    -- upvalues: v4 (copy)
    local l_Name_0 = v9.Name;
    return ("The %* (bound to the %* property)"):format(v4(v10, "value"), v11), (("the %* instance"):format(l_Name_0));
end;
v5.formatters.boundAttribute = function(v13, v14, v15) --[[ Line: 41 ]] --[[ Name: boundAttribute ]]
    -- upvalues: v4 (copy)
    local l_Name_1 = v13.Name;
    return ("The %* (bound to the %* attribute)"):format(v4(v14, "value"), v15), (("the %* instance"):format(l_Name_1));
end;
v5.formatters.propertyOutputsTo = function(v17, v18, v19) --[[ Line: 51 ]] --[[ Name: propertyOutputsTo ]]
    -- upvalues: v4 (copy)
    local l_Name_2 = v17.Name;
    return ("The %* (which the %* property outputs to)"):format(v4(v18, "object"), v19), (("the %* instance"):format(l_Name_2));
end;
v5.formatters.attributeOutputsTo = function(v21, v22, v23) --[[ Line: 61 ]] --[[ Name: attributeOutputsTo ]]
    -- upvalues: v4 (copy)
    local l_Name_3 = v21.Name;
    return ("The %* (which the %* attribute outputs to)"):format(v4(v22, "object"), v23), (("the %* instance"):format(l_Name_3));
end;
v5.formatters.refOutputsTo = function(v25, v26) --[[ Line: 71 ]] --[[ Name: refOutputsTo ]]
    -- upvalues: v4 (copy)
    local l_Name_4 = v25.Name;
    return ("The %* (which the Ref key outputs to)"):format((v4(v26, "object"))), (("the %* instance"):format(l_Name_4));
end;
v5.formatters.animationGoal = function(v28, v29) --[[ Line: 80 ]] --[[ Name: animationGoal ]]
    -- upvalues: v4 (copy)
    local v30 = v4(v28, "object");
    return ("The goal %*"):format((v4(v29, "object"))), (("the %* that is following it"):format(v30));
end;
v5.formatters.parameter = function(v31, v32, v33) --[[ Line: 89 ]] --[[ Name: parameter ]]
    -- upvalues: v4 (copy)
    local v34 = v4(v31, "object");
    local v35 = v4(v32, "object");
    if v33 == false then
        return ("The %* parameter"):format(v35), (("the %* that it was used for"):format(v34));
    else
        return ("The %* representing the %* parameter"):format(v35, v33), (("the %* that it was used for"):format(v34));
    end;
end;
v5.formatters.observer = function(v36, v37) --[[ Line: 103 ]] --[[ Name: observer ]]
    -- upvalues: v4 (copy)
    local v38 = v4(v36, "object");
    return ("The watched %*"):format((v4(v37, "object"))), (("the %* that's observing it for changes"):format(v38));
end;
v5.bOutlivesA = function(v39, v40, v41, v42, v43, ...) --[[ Line: 112 ]] --[[ Name: bOutlivesA ]]
    -- upvalues: v2 (copy), v3 (copy)
    if v41 == nil then
        v2.logError("useAfterDestroy", nil, v43(v40, v42, ...));
        return;
    else
        if v3(v39, v40, v41, v42) == "definitely-a" then
            local v44, v45 = v43(v40, v42, ...);
            v2.logWarn("possiblyOutlives", v44, v45, v39 == v41 and "they're in the same scope, but the latter is destroyed too quickly" or "the latter is in a different scope that gets destroyed too quickly");
        end;
        return;
    end;
end;
return v5;