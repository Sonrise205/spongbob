local l_Symbol_0 = require(script:WaitForChild("Symbol"));
local v1 = require(script:WaitForChild("Registry.global"));
local v4 = setmetatable({}, {
    __call = function(_, v3) --[[ Line: 15 ]] --[[ Name: __call ]]
        -- upvalues: l_Symbol_0 (copy)
        return l_Symbol_0.new(v3);
    end
});
v4.for_ = v1.getOrInit;
return v4;