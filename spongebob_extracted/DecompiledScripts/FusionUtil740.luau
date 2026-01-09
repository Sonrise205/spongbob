local v0 = {
    ["0.2.0"] = "0_2_0", 
    ["0.2.5"] = "0_2_5", 
    ["0.3.0"] = "0_3_0", 
    ["0_2_0"] = "0_2_0", 
    ["0_2_5"] = "0_2_5", 
    ["0_3_0"] = "0_3_0"
};
local v1 = {
    ["0.2.0"] = nil, 
    ["0.2.5"] = nil, 
    ["0.3.0"] = nil
};
setmetatable(v1, {
    __index = v1["0.3.0"]
});
setmetatable(v1, {
    __index = function(v2, v3) --[[ Line: 40 ]] --[[ Name: __index ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v4 = v0[v3];
        if v4 then
            local v5 = require(script["FusionUtil_v" .. v4]);
            rawset(v2, v3, v5);
            return v5;
        else
            return v1["0.3.0"][v3];
        end;
    end
});
return v1;