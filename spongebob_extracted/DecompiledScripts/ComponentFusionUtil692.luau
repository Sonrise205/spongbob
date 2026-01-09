local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.RailUtil);
local v2 = require(l_Parent_0.Symbol);
local _ = require(l_Parent_0.Fusion);
local v4 = v2("Fusion Scope");
local v6 = {
    GetScope = function(v5) --[[ Line: 46 ]] --[[ Name: GetScope ]]
        -- upvalues: v4 (copy)
        return v5[v4];
    end
};
return {
    ClassName = "ComponentFusionUtil", 
    Methods = v6, 
    Constructing = function(v7) --[[ Line: 68 ]] --[[ Name: Constructing ]]
        -- upvalues: v4 (copy), v1 (copy)
        v7[v4] = v1.Fusion.scoped();
        v7.Scope = v7[v4];
    end, 
    Stopped = function(v8) --[[ Line: 78 ]] --[[ Name: Stopped ]]
        -- upvalues: v4 (copy)
        v8[v4]:doCleanup();
        v8[v4] = nil;
    end
};