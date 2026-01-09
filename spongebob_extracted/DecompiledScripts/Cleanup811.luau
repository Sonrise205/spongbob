local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
return {
    type = "SpecialKey", 
    kind = "Cleanup", 
    stage = "observer", 
    apply = function(_, v3, _, v5) --[[ Line: 16 ]] --[[ Name: apply ]]
        table.insert(v5, v3);
    end
};