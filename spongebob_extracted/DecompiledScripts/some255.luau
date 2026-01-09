local _ = require(script.Parent.Parent.Parent:WaitForChild("es7-types"));
return function(v1, v2, v3) --[[ Line: 11 ]]
    if typeof(v1) ~= "table" then
        error(string.format("Array.some called on %s", (typeof(v1))));
    end;
    if typeof(v2) ~= "function" then
        error("callback is not a function");
    end;
    for v4, v5 in v1 do
        if v3 ~= nil then
            if v5 ~= nil and v2(v3, v5, v4, v1) then
                return true;
            end;
        elseif v5 ~= nil and v2(v5, v4, v1) then
            return true;
        end;
    end;
    return false;
end;