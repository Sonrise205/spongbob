local l_objectIs_0 = require(script.Parent:WaitForChild("objectIs"));
return function(v1, v2) --[[ Line: 18 ]] --[[ Name: shallowEqual ]]
    -- upvalues: l_objectIs_0 (copy)
    if l_objectIs_0(v1, v2) then
        return true;
    elseif typeof(v1) ~= "table" or v1 == nil or typeof(v2) ~= "table" or v2 == nil then
        return false;
    else
        for v3, v4 in v1 do
            if not l_objectIs_0(v2[v3], v4) then
                return false;
            end;
        end;
        for v5, v6 in v2 do
            if not l_objectIs_0(v1[v5], v6) then
                return false;
            end;
        end;
        return true;
    end;
end;