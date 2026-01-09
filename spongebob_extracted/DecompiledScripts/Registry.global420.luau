local l_Symbol_0 = require(script.Parent:WaitForChild("Symbol"));
local v1 = {};
return {
    getOrInit = function(v2) --[[ Line: 6 ]] --[[ Name: getOrInit ]]
        -- upvalues: v1 (ref), l_Symbol_0 (copy)
        if v1[v2] == nil then
            v1[v2] = l_Symbol_0.new(v2);
        end;
        return v1[v2];
    end, 
    __clear = function() --[[ Line: 14 ]] --[[ Name: __clear ]]
        -- upvalues: v1 (ref)
        v1 = {};
    end
};