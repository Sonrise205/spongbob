local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.PubTypes);
local v2 = require(l_Parent_0.Utility.xtypeof);
return function(v3, v4) --[[ Line: 11 ]] --[[ Name: unwrap ]]
    -- upvalues: v2 (copy)
    if v2(v3) == "State" then
        return (v3:get(v4));
    else
        return v3;
    end;
end;