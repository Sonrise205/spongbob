local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Logging.logError);
local v3 = require(l_Parent_0.Utility.xtypeof);
return {
    type = "SpecialKey", 
    kind = "Ref", 
    stage = "observer", 
    apply = function(_, v5, v6, v7) --[[ Line: 18 ]] --[[ Name: apply ]]
        -- upvalues: v3 (copy), v2 (copy)
        if v3(v5) ~= "State" or v5.kind ~= "Value" then
            v2("invalidRefType");
            return;
        else
            v5:set(v6);
            table.insert(v7, function() --[[ Line: 23 ]]
                -- upvalues: v5 (copy)
                v5:set(nil);
            end);
            return;
        end;
    end
};